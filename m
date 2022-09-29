Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A45EEDF1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 08:34:05 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odn7T-0005q6-5H
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 02:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odmww-0000xc-B5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odmws-0004hb-R8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664432584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfBnOEJkyAEmbSmjfJKkRj4biMCajXPkc7fP42nBfWg=;
 b=ViKWEVl4RfTrhRlb79Oew25WirT7Px4Mpd9+6vKzYn/mgDMsUkSYlp/pbLxcjl1/1SHky6
 jv0C4nd1cQVfkXEUgiBpBcAiZwLfkKmwh0qNwMTIj2jfuPdyziehhwYr7VBDari+zLyQlM
 30cHK4Ww0qlqji7oIZfOg8xVE3O5Xkk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-oKppohgRNlSKkLuNp9K3ww-1; Thu, 29 Sep 2022 02:23:02 -0400
X-MC-Unique: oKppohgRNlSKkLuNp9K3ww-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA1BC1C05141;
 Thu, 29 Sep 2022 06:23:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18AB3492CA2;
 Thu, 29 Sep 2022 06:23:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 307DA21E691D; Thu, 29 Sep 2022 08:22:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>,  qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Dmitry Fomichev
 <Dmitry.Fomichev@wdc.com>,  Hannes Reinecke <hare@suse.de>,  qemu block
 <qemu-block@nongnu.org>,  Hanna Reitz <hreitz@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Fam Zheng <fam@euphon.net>,  Kevin Wolf
 <kwolf@redhat.com>
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
 <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
 <87fshcdd4x.fsf@pond.sub.org>
 <CAAAx-8LN6tK+VkPVDNHM-hCkbpNE2iHZojCK1aO5GKtme1iRNQ@mail.gmail.com>
 <87r10vywg3.fsf@pond.sub.org>
 <2537ba13-e915-1378-4414-ed999dc93a9e@opensource.wdc.com>
Date: Thu, 29 Sep 2022 08:22:58 +0200
In-Reply-To: <2537ba13-e915-1378-4414-ed999dc93a9e@opensource.wdc.com> (Damien
 Le Moal's message of "Fri, 2 Sep 2022 11:13:11 +0900")
Message-ID: <87bkqyvgvx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Le Moal <damien.lemoal@opensource.wdc.com> writes:

> On 9/1/22 23:57, Markus Armbruster wrote:
>> Sam Li <faithilikerun@gmail.com> writes:
>>=20
>>> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=883=
1=E6=97=A5=E5=91=A8=E4=B8=89 16:35=E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>> Sam Li <faithilikerun@gmail.com> writes:
>>>>
>>>>> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=
=8830=E6=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A

[...]

>>>>> Zoned_host_device is basically host_device + zone operations. It
>>>>> serves for a simple purpose: if the host device is zoned, register
>>>>> zoned_host_device driver; else, register host_device.
>>>>
>>>> Why would I ever want to use host_device instead of zoned_host_device?
>>>>
>>>> To answer this question, we need to understand how their behavior
>>>> differs.
>>>>
>>>> We can ignore the legacy protocol prefix / string filename part.
>>>>
>>>> All that's left seems to be "if the host device is zoned, then using t=
he
>>>> zoned_host_device driver gets you the zoned features, whereas using the
>>>> host_device driver doesn't".  What am I missing?
>>>
>>> I think that's basically what users need to know about.
>>=20
>> Now answer my previous question, please: why would I ever want to use
>> host_device instead of zoned_host_device?
>>=20
>> Or in other words, why would I ever want to present a zoned host device
>> to a guest as non-zoned device?
>>=20
>>>>>> Notably common is .bdrv_file_open =3D hdev_open.  What happens when =
you
>>>>>> try to create a zoned_host_device where the @filename argument is no=
t in
>>>>>> fact a zoned device?
>>>>>
>>>>> If the device is a regular block device, QEMU will still open the
>>>>> device. For instance, I use a loopback device to test zone_report in
>>>>> qemu-io. It returns ENOTTY which indicates Inappropriate ioctl for the
>>>>> device. Meanwhile, if using a regular block device when emulation a
>>>>> zoned device on a guest os, the best case is that the guest can boot
>>>>> but has no emulated block device. In some cases, QEMU just terminates
>>>>> because the block device has not met the alignment requirements.
>>>>
>>>> I'm not sure I understand all of this.  I'm also not sure I have to :)
>>>
>>> Maybe I didn't explain it very well. Which part would you like to know
>>> more about?
>>=20
>> Let's try more specific questions.  Say I configure a zoned_host_device
>> backed by a host device that isn't zoned.
>>=20
>> 1. Is this configuration accepted?
>
> If we assume we have the special zoned_host_device driver, with the
> associated command line zoned_host_device option explicitly calling for
> it, then no, I do not think this should be allowed at all and an error
> should be returned on startup. That would be consistent with the fact that
> the options zoned_host_device and host_device are different to make sure
> we can check that the user knows what he/she/them is doing.
>
> If we have only host_device as a setup option and driver, the driver
> methods can be trivially adjusted to do the right thing based on the
> device type (i.e. zoned vs regular/not zoned). However, that would prevent
> an interesting future extension of this work to implement a full zone
> emulation on top of a regular (not zoned) host block device.
>
> With this in mind, we currently have the following:
>
> 1) host_device option -> accept only regular non-zoned host block devices
> 2) zoned_host_device option -> accept only zoned host block devices

2) matches my intuitive expectations for this driver name.

However, if host_device works even with a zoned host device before the
patch presenting it as non-zoned to the guest, then it needs to continue
to do so.

> And in the future, we can have:
>
> 1) host_device option -> accept only regular non-zoned host block devices
> 2) zoned_host_device option -> accept any host block device type
> 	a) Use native zone kernel API for zoned host block devices
> 	b) Use full zone emulation for regular host block devices

Understood.

> But sure, internally, we could have a single driver structure with methods
> adjusted to do the correct thing based on the device type and option
> specified. Having a 1:1 mapping between the driver name and driver
> structure does clarify things I think (even though there are indeed a lot
> of methods that are identical).

I think this is basically a matter of user interface design.  Let's
review what we have: host_device and host_cdrom.  I'm only passingly
familiar with them, so please correct my misunderstandings, if any.

host_device and host_cdrom let you "pass through" a host device to a
guest.

host_cdrom presents a removable device to the guest.  I appears to
accept any host block device, even a non-removable one.  What happens
when you try to use a non-removable host device as removable guest
device I don't know.

host_device presents a non-removable device to the guest.  It accepts
any host block device, even a removable one (as long as it has a
medium).

host_device detects whether the host device is a SCSI generic device.
Guest devices scsi-hd and scsi-cd reject a SCSI generic host device.
Guest device scsi-block requires one (I think).

On the one hand, there is precedence for using different driver types
for different kinds of host devices: host_cdrom for removable ones,
host_device for non-removable ones.

On the other hand, there is precedence for using a single driver type
for different kinds of host devices, with dynamic detection: host_device
both for SCSI generic and for others.

On the third hand, the "different driver type" story is complicated by
us accepting the "wrong" kind of host device at least in some scenarios.

Kevin, do you have an opinion on how the user interface should be?

Next, do you have one on how it can be, given what we have?

[...]


