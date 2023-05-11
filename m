Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA126FEDD0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:24:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1aq-0000Ol-DI; Thu, 11 May 2023 04:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px1ao-0000Od-KK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px1am-0004x3-L6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683793442;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUQ47S83EngAN1/ZK5miIcdGfoFAqajry3J4B8oUIXw=;
 b=GhHpudunwaEMP0Vy4u0z1O66PJiLVeDSUwo2CCRQU+SCepbb/j8OWLCV51s3hjmVIzMOwF
 CCvrtowhaW4VIDXSOHM5Palc3eZ0Tyt40mF2PN2X/9CK2rCZg76xSV9kHe8j/s8Q0Nkywh
 LuptIUsRY0/5+T8pqz4kwlXnzVYiOM4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-KwPuQuJcOGOL1uUtQ9Uhmw-1; Thu, 11 May 2023 04:24:01 -0400
X-MC-Unique: KwPuQuJcOGOL1uUtQ9Uhmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so5073672f8f.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683793440; x=1686385440;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUQ47S83EngAN1/ZK5miIcdGfoFAqajry3J4B8oUIXw=;
 b=fvf2fiInUwHw1hBkZg9bmXu7/6zbzCgzbYYtezJZsJGzP8DwcV5JABGUQ6/qcNpqL9
 luTwoGtsDbmITYjBeo7Ve3q6fuLNByZTxQjxZ4AU81wEz15V99E55/D1XLHbUdDsaypC
 zFijjs3EHr24hJtsTZBhhQUtjzplBXZpKtcAJow+XoP0Y6c2mv92CWa+cqC2QfT4Fcey
 tQBaYKCKtOFzZdTNzqJmHYLR8xxg+lqljb7T5wqXdKDF/e0xkHLiNxy63CLz1K9s3O/V
 WA43neOsBPcc2zUKzXQQAaxVqFfUAIEohnZB6XwfdZgnib61812oUKUsg1B8Yjv6SkWq
 +dIA==
X-Gm-Message-State: AC+VfDwYlFWnglpgFbGKX478yKSu7WvbW0jCQJHvbRTBgUszzRIwWxjm
 Momq/ZrOK6uQ7LZE2UfnQRh1FoXAA4eTLPohSFLR/ivPNUsrWWT7TTejvAt5ZvsrRG1cMho2eXq
 wKPdTVNxN3KKlvcQ=
X-Received: by 2002:a5d:5960:0:b0:2ef:b4a9:202f with SMTP id
 e32-20020a5d5960000000b002efb4a9202fmr14431210wri.69.1683793439853; 
 Thu, 11 May 2023 01:23:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55S/7SxNdYXwVYiakA+9MxHUgOywuPDTrqxkbT0Z6doRm8JPemDfUuGpgQBWMHIJRXJK8Crw==
X-Received: by 2002:a5d:5960:0:b0:2ef:b4a9:202f with SMTP id
 e32-20020a5d5960000000b002efb4a9202fmr14431185wri.69.1683793439494; 
 Thu, 11 May 2023 01:23:59 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b002cea9d931e6sm19632275wrp.78.2023.05.11.01.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:23:58 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Lukas Straub <lukasstraub2@web.de>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Avihai Horon
 <avihaih@nvidia.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Leonardo
 Bras <leobras@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] migration: Add documentation for backwards compatiblity
In-Reply-To: <ZFyi73w855EsDmEy@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 11 May 2023 09:10:23 +0100")
References: <20230510195341.7591-1-quintela@redhat.com>
 <ZFyi73w855EsDmEy@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 10:23:57 +0200
Message-ID: <87o7mr5l9e.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Wed, May 10, 2023 at 09:53:41PM +0200, Juan Quintela wrote:
>> State what are the requeriments to get migration working between qemu
>> versions.  And once there explain how one is supposed to implement a
>> new feature/default value and not break migration.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>=20
>> ---
>>=20
>> Hi
>>=20
>> I will really appreciate reviews:
>>=20
>> - I don't speak natively .rst format, so let me what I have done
>>   wrong.
>>=20
>> - English is not my native language either (no points if had guessed
>>   that).
>>=20
>> - This is stuff is obvious to me, so let me when I have assumed
>>   things, things that need to be claried, explained better, etc.
>>=20
>> Thanks, Juan.
>> ---
>>  docs/devel/migration.rst | 212 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 212 insertions(+)
>>=20
>> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
>> index 6f65c23b47..daa510da42 100644
>> --- a/docs/devel/migration.rst
>> +++ b/docs/devel/migration.rst
>> @@ -142,6 +142,218 @@ General advice for device developers
>>    may be different on the destination.  This can result in the
>>    device state being loaded into the wrong device.
>>=20=20
>> +How backwards compatibility work
>
> s/work/works/

Don.

>
>> +--------------------------------
>> +
>> +When we do migration, we have to qemus: source and target qemu.  There
>
> 'have two qemu process, the source and the target'

Done.

>> +are two cases, they are the same version or they are a different
>> +version.  The easy case is when they are the same version.  The
>> +difficult one is when they are different versions.
>> +
>> +There are two things that are different, but they have very similar
>> +names and sometimes get confused:
>> +- qemu version
>> +- machine version
>> +
>> +Let's start with a practical example, we start with:
>> +
>> +- qemu-system-x86_64 (v5.2), from now one qemu-5.2.
>> +- qemu-system-x86_64 (v5.1), from now one qemu-5.1.
>
> s/one/on/

I did this one right on next paragraph. Sniff.
Done.

>> +Related to this are the "latest" machine types defined on each of
>> +them:
>> +
>> +- pc-q35-5.2 (newer one in qemu-5.2) from now on pc-5.2
>> +- pc-q35-5.1 (newer one qemu-5.1) from now on pc-5.1
>> +
>> +First of all, migration is only supposed to work if you use the same
>> +machine type in both source and destination. The qemu configuration
>
> s/configuration/hardware configuration/ - most aspects of the backend
> configuration can be changed at will, except for a few cases where
> the backend features influence frontend device feature exposure.

First of all, migration is only supposed to work if you use the same
machine type in both source and destination. The qemu hardware
configuration needs to be the same also on source and destination.
Most aspects of the backend configuration can be changed at will,
except for a few cases where the backend features influence frontend
device feature exposure.  But that is not relevant for this section.



>> +
>> +If we get a device that get a new feature, or change a default value,
>
> s/get a new/has a new/

Done.

>> +we have a problem when we try to migrate between different qemu
>> +versions.
>> +
>> +So we need a way to tell qemu-5.2 than when we are using machine type
>
> s/than when/that when/

Done.

>> +pc-5.1, it needs to **not** use the feature, to be able to migrate to
>> +read qemu-5.1.
>
> s/read/real/

Done

>> +
>> +And the equivalent part when migrating from qemu-5.1 to qemu-5.2.
>> +qemu-5.2 have to expect that it is not going to get data for the new
>
> s/have/has/

Done.

>> +feature, because qemu-5.1 don't know about it.
>> +
>> +How do we tell qemu about this device feature changes?  In
>
> s/this/these/
>
>> +hw/core/machine.c:hw_compat_X_Y arrays.
>> +
>> +If we change a default value, we need to put back the old value on
>
> s/on that array/in that array/

Done.

>> +Let's see a practical example.
>> +
>> +In qemu-5.2 virtio-blk-device got multi queue support.  This is a
>> +change that is not backward compatible.  In qemu-5.1 it has one
>> +queue. In qemu-5.2 it has the same number of queues than the number of
>
> s/than the number/as the number/

Done.

>> +3 - qemu-5.2 -M pc-5.1  -> migrates to -> qemu-5.2 -M pc-5.1
>> +
>> +    Here we have the same qemu in both sides.  So it don't matter a
>
> s/don't/doesn't/

Done.

>> +    lot if we have setup the number of queues to 1 or not, because
>
> s/setup/set/

Done.

> With regards,
> Daniel

Thanks very much.

Appreciated, Juan.


