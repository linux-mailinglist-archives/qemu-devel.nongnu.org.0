Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7D3C824E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:00:30 +0200 (CEST)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bgr-0002ej-GD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3bQ9-00053s-Sg
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3bQ7-00007b-VT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626255790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn/GrbcW47J9RGNMF1QezaQJqgA+5n9MpSyKw/XN/sY=;
 b=SyMcZsRR4MdOLbk/2u8zPB5CjWkqhV05dy6kD/i+8CJgAJskGJgsMCNPT3ZWj/z8MZwDIy
 yoqkXKr/yhVe/VkUYpOFb11r76qjUqVMrJf9RxdhB4JEB+SE+AWrppt9XqC9SfUg3ceH0b
 sUEQsmoXyo9AUc+Ti/qhe4mUR8B/FdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-cEXEO37lMiyadFbXJYuUMg-1; Wed, 14 Jul 2021 05:43:06 -0400
X-MC-Unique: cEXEO37lMiyadFbXJYuUMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F02B801107;
 Wed, 14 Jul 2021 09:43:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0151000324;
 Wed, 14 Jul 2021 09:43:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D30CC113865F; Wed, 14 Jul 2021 11:42:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v3 1/3] msix/hmp: add hmp interface to dump MSI-X info
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
 <20210714004754.22243-2-dongli.zhang@oracle.com>
 <8735shmorf.fsf@dusky.pond.sub.org>
 <ae859cde-5d56-01f8-4ef8-bffce9303ff1@oracle.com>
Date: Wed, 14 Jul 2021 11:42:59 +0200
In-Reply-To: <ae859cde-5d56-01f8-4ef8-bffce9303ff1@oracle.com> (Dongli Zhang's
 message of "Tue, 13 Jul 2021 23:17:14 -0700")
Message-ID: <87pmvljknw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dongli Zhang <dongli.zhang@oracle.com> writes:

> Hi Markus,
>
> On 7/13/21 10:46 PM, Markus Armbruster wrote:
>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>> 
>>> This patch is to add the HMP interface to dump MSI-X table and PBA, in
>>> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
>>> vector is erroneously masked permanently). Here is the example with
>>> vhost-scsi:
>>>
>>> (qemu) info msix /machine/peripheral/vscsi0
>>> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
>>> 0xfee00000 0x00000000 0x00004041 0x00000000
>>> 0xfee00000 0x00000000 0x00004051 0x00000000
>>> 0xfee00000 0x00000000 0x00004061 0x00000000
>>> 0xfee00000 0x00000000 0x00004071 0x00000000
>>> 0xfee01000 0x00000000 0x000040b1 0x00000000
>>> 0xfee02000 0x00000000 0x000040c1 0x00000000
>>> 0xfee03000 0x00000000 0x000040d1 0x00000000
>>>
>>> MSI-X PBA
>>> 0 0 0 0 0 0 0
>>>
>>> Since the number of MSI-X entries is not determined and might be very
>>> large, it is sometimes inappropriate to dump via QMP.
>> 
>> Why?  What makes HMP different?
>
> Here are two reasons.
>
> 1. The size of MSI-X table is nondeterministic and might be very large, e.g.,
> the PCI_MSIX_FLAGS_QSIZE is 0x07FF. The "info tlb" (which is a table and similar
> to MSI-X) and "info lapic" also only support hmp.
>
> 2. The [PATCH 3/3] of this patchset support device specific data, the
> definitional of which varies depending on each device type (so far only
> virtio-pci supports the interface).
>
> Thank you very much!
>
> Dongli Zhang
>
>>
>>> Therefore, this patch dumps MSI-X information only via HMP, which is
>>> similar to the implementation of hmp_info_mem().

I think you're mixing up valid and invalid arguments :)  Let me try to
pick them apart.

1a. "Command output may be too large for QMP, therefore provide only the
HMP command" makes no sense.

Both QMP and HMP are not meant for bulk data transfer.  They are control
plane, not data plane.  To illustrate what that means, consider a backup
feature.  The commands to control the backup task are QMP (and HMP, if
desired), but the actual data transfer uses some other channel, so it
doesn't clog the QMP pipes.

If the data is too bulky for QMP, then it's too bulky for HMP, too.

1b. "info tlb" and "info lapic" are HMP only because they are debugging
commands for humans.  Debugging is not necessarily done by humans only.
Sometimes, humans use programs to help them debug, and these programs
would be better off with QMP commands.  For the HMP-only debugging
commands, we decided providing for (largely hypothetical) debugging
scripts wasn't worthwhile.  A similar argument could probably be made
for "info msix".

2. "Output is in part specific to Devices, therefore provide only the
HMP command" is also iffy.  Yes, hacking up a bunch of monitor_printf()s
is probably easier than specifying a QAPI schema.   "It's work" is no
excuse.  "It's more work than it's worth" can be one.  But then we're
back at argument 1b.

Your commit message's first sentence suggests this is indeed just for
debugging.  If this is the case, consider replacing

    Since the number of MSI-X entries is not determined and might be very
    large, it is sometimes inappropriate to dump via QMP.

    Therefore, this patch dumps MSI-X information only via HMP, which is
    similar to the implementation of hmp_info_mem().

by

    Since this is just for debugging by humans, provide the command only
    in HMP, not in QMP.


