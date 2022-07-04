Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92077565B90
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:57 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Onk-0001Tg-Mu
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8Omr-0000nu-Er
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8Omo-0002xR-AP
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656951537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sd3daDZ+CnM7nR0YdNOM1skT/Ph4/zx4GDHepKyv1x8=;
 b=LVxGDME/we4QuEjoJQCCa8SEaZE4k+pyi/ILSGAO+r/F8KcFROBG1/wJIXmnwpA/zB2Pvp
 gVqu9YjQtFzlvmbR/vKI7Ak/ulVDTKBzd6hT6OrddG7KdTCdR0YeEYptSAFC055Cd368QV
 Fedb7Moc7h5OB0w1hSGouJuE3MFn0d8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-raNQbANePcKyTDVm-vQ0lA-1; Mon, 04 Jul 2022 12:18:56 -0400
X-MC-Unique: raNQbANePcKyTDVm-vQ0lA-1
Received: by mail-wr1-f69.google.com with SMTP id
 z11-20020a056000110b00b0021b9c009d09so1485728wrw.17
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 09:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sd3daDZ+CnM7nR0YdNOM1skT/Ph4/zx4GDHepKyv1x8=;
 b=rfg6W1E2lxLCDb4eQPnD9pDyMJZV+m3VOHPtnsrBAWAYmkKC027/EQj2AiUtooCqAA
 8Ag8H3GfSdyDQ1/HyFneo+peZmk3lLde7ZtmF4/F0b+hDRbQnwdtfjzZKusu2vvcO3BH
 TeyQnTSktt8aGxjeWTwonPml4BQdc2yKsDp0w9Fxf3mtKZXpr8yX5huFK2v/uFJNyvGe
 YJeebehNf5sk+eG+BNWLvNEgUBnH6+PEgKoUIbG34ajsmqdHZOKn3UEL0X6AF/DZunXQ
 YUEBEuU5b8HfQyTJt//lAGuXQbUlc5RibDqlbML2HYyurrghCvi3SgaHX1zl0yOZu0vc
 XJXw==
X-Gm-Message-State: AJIora++XF5zELhCuFPkjU/3my9e+9TZf9gnltfFVA7BU/Y2LelNQ1se
 hNx9dC1rl/8ZriUCbldyPwf/t/PoP8kYXU4bJowZybciY9JqSGK4keJY25gSPBjCDkMIU91FGQM
 CkrlftkiQ/+DC0wo=
X-Received: by 2002:a5d:6d8b:0:b0:21b:9814:793d with SMTP id
 l11-20020a5d6d8b000000b0021b9814793dmr27181533wrs.344.1656951535183; 
 Mon, 04 Jul 2022 09:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9rHYZ+Pmg5V2S15txGaDfnokGmSANWgsMaZD7NeOpLBH3dTLC6s75Wmb3nQ+F5kOlCJ8ujQ==
X-Received: by 2002:a5d:6d8b:0:b0:21b:9814:793d with SMTP id
 l11-20020a5d6d8b000000b0021b9814793dmr27181512wrs.344.1656951534919; 
 Mon, 04 Jul 2022 09:18:54 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d654b000000b0021b8c554196sm31371165wrv.29.2022.07.04.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:18:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
In-Reply-To: <d8674f5bafab57ff9aac035b99fc86814229754d.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 30 Jun 2022 23:29:28
 -0300")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com>
 <d8674f5bafab57ff9aac035b99fc86814229754d.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 04 Jul 2022 18:18:53 +0200
Message-ID: <87czek26mq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> Hello Juan,
>
> On Tue, 2022-06-21 at 16:05 +0200, Juan Quintela wrote:
>> We need to add a new flag to mean to sync at that point.
>> Notice that we still synchronize at the end of setup and at the end of
>> complete stages.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>> =C2=A0migration/migration.c |=C2=A0 2 +-
>> =C2=A0migration/ram.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 42 +++++++++=
+++++++++++++++++++++------------
>> =C2=A02 files changed, 31 insertions(+), 13 deletions(-)
>>=20




>> @@ -2943,11 +2953,13 @@ static int ram_save_setup(QEMUFile *f, void *opa=
que)
>> =C2=A0=C2=A0=C2=A0=C2=A0 ram_control_before_iterate(f, RAM_CONTROL_SETUP=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0 ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 if (migrate_multifd_sync_each_iteration()) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D=C2=A0 multifd_send_s=
ync_main(f);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> (1) IIUC, the above lines were changed in 2/5 to be reverted now.
> Is that correct? was it expected?

Yeap.  The problem here is that (withouth this patchset) we synchrconize
in three places:

- ram_save_setup()
- ram_save_iterate()
- ram_save_complete()

And we want to change it to:

- ram_save_setup()
- ram_save_complete()
- And each time that we pass through the end of memory. (much less times
  than calls to ram_save_iterate).

In the three places we send:

   RAM_SAVE_FLAG_EOS

And that is what cause the synchronization.

As we can't piggyback on RAM_SAVE_FLAG_EOS anymore, I added a new flag
to synchronize it.

The problem is that now (on setup and complete)  we need to synchronize
independently if we do the older way or the new one.  On iterate we only
synchronize on the old code, and on new code only when we reach the end
of the memory.

I *thought* it was clear this way, but I can do without the change if
people think it is easier.


>> +=C2=A0=C2=A0=C2=A0 ret =3D=C2=A0 multifd_send_sync_main(f);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!migrate_multifd_sync_each_iteration()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_put_be64(f, RAM_SAVE_FL=
AG_MULTIFD_SYNC);
>
> (2) I have done some testing with this patchset (because of MSG_ZEROCOPY)=
 and it
> seems this part here is breaking migration from this build to 'older' bui=
lds
> (same commits except for this patchset):
>
> qemu-system-x86_64: Unknown combination of migration flags: 0x200
> qemu-system-x86_64: error while loading state section id 2(ram)
> qemu-system-x86_64: load of migration failed: Invalid argument

You can't do that O:-) (TM), that is the whole point that I added the
multifd-sync-each-iteration property.  It is true for old machine types,
it is false for new machine types.  If you try to play with that
property, it is better than you know what you are doing (TM).

> Which makes sense, since there is no RAM_SAVE_FLAG_MULTIFD_SYNC in older
> versions. Is this expected / desired ?

See previous paragraph.

> Strange enough, it seems to be breaking even with this set in the sending=
 part:=20
> --global migration.multifd-sync-each-iteration=3Don
>
> Was the idea of this config to allow migration to older qemu builds?

If you set it to on, it should work against and old qemu.  By default it
is set to on for old machine types, and only to on for new machine
types.  So you should have it right if you use new machine types.  (If
you use "pc" or "q35" machine types, you should now what you are doing
for migrating machines.  We do this kind of change all the time).

>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0 qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> =C2=A0=C2=A0=C2=A0=C2=A0 qemu_fflush(f);
>> @@ -3127,13 +3139,14 @@ static int ram_save_complete(QEMUFile *f, void
>> *opaque)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 if (migrate_multifd_sync_each_iteration()) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D multifd_send_sync_ma=
in(rs->f);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D multifd_send_sync_main(rs->f);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>
> (3) Same as (1)

Yeap, this is on purpose.  If you feel that it is clearer the other way,
I can change the patchset.

Later, Juan.


