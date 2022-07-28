Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A9583A70
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:39:03 +0200 (CEST)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGz2r-0005In-4K
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oGypZ-0006hH-0a
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oGypU-0004oY-TB
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658996711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IC4LUHTrLpcYQYkZhy5aIQO4x13tAtRHpNlVFyvZjIM=;
 b=GA9iQFKtILXM5BgR6QbERkPM+tZ9tDqPhitv0p32eP//2Q+tSxDPfhjPe1LVFiI7nClGrx
 HrSWR9tUecrsmtjSVtM5v9tAUWOdyKyaJ2YXJJUHWGrNJ8QyyGWaHgzNuukt3UrA7wXXVq
 BrJtjPFVPQW3Z8JtQhx2Mg7h+LsVZ/Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-dtqzooJ-N_S7u3WUC9ytwA-1; Thu, 28 Jul 2022 04:25:09 -0400
X-MC-Unique: dtqzooJ-N_S7u3WUC9ytwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so247121wmb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 01:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IC4LUHTrLpcYQYkZhy5aIQO4x13tAtRHpNlVFyvZjIM=;
 b=yIOHSMu9PQSrmlWZ/aTYsCcHD2CIk71Cyc3mw1hjmITAFrh29WENhMm3Wp/hpYXroZ
 H3U7iQC9Z6lPFw8y5BuT0FfXT0z6v8etF1yEACWTXohsvVdzdYDHEIr1ZqdKQhbaKrLd
 b4v3icXHK8PWM7qZq2n+qk5LMOFcik9fm69gUt5II2jo8gVf0r8gJM5A/LfMeF2UQ12N
 XOlksHG49ifz3SoWVc8jLTiARWhrJ5uHevOHJXMl9WlevP8zuOjmAhWvL53qkR3az/E5
 IDT0cIji9dSwHFoEqZev/9qVfXoaGJcTpifv9i816OfedRTE8aJ+73oQdopsi+rUmjt7
 5GFw==
X-Gm-Message-State: AJIora+aqSVMzIkMiMzFgeY0lUgR6e0HdRaIWCS24zE5cYPxrzSjPV/T
 W81Ww50VArKlj0SYvSOE3H73Z+22XJBtf7mCmtSeCnmox5uIP6NUgWIwIt+K2oGM1kWe6NCrCN1
 v1KYUKtyrlk1mYtM=
X-Received: by 2002:a5d:624e:0:b0:21e:bd15:3e11 with SMTP id
 m14-20020a5d624e000000b0021ebd153e11mr6171562wrv.431.1658996707659; 
 Thu, 28 Jul 2022 01:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9wavR/akWlW12ho112Q418SU7K142EYpV4sVW5UkkPGmP0qFIvXuG+pXXXPqyrlBI+M9z6g==
X-Received: by 2002:a5d:624e:0:b0:21e:bd15:3e11 with SMTP id
 m14-20020a5d624e000000b0021ebd153e11mr6171543wrv.431.1658996707318; 
 Thu, 28 Jul 2022 01:25:07 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c354300b003a2e92edeccsm5361277wmq.46.2022.07.28.01.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 01:25:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
In-Reply-To: <YsRy0VtnZvhIGiDd@work-vm> (David Alan Gilbert's message of "Tue, 
 5 Jul 2022 18:20:17 +0100")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com> <YsRDEyA0mjUD4DSB@work-vm>
 <8735ff1tn1.fsf@secure.mitica> <YsRsYiouIb8+GRua@redhat.com>
 <YsRxRCgSkQx6Ruqv@work-vm> <YsRx6sXGos52Nhar@redhat.com>
 <YsRy0VtnZvhIGiDd@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Thu, 28 Jul 2022 10:25:05 +0200
Message-ID: <87fsild4pq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
>> On Tue, Jul 05, 2022 at 06:13:40PM +0100, Dr. David Alan Gilbert wrote:
>> > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
>> > > On Tue, Jul 05, 2022 at 05:11:46PM +0200, Juan Quintela wrote:
>> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> > > > > * Juan Quintela (quintela@redhat.com) wrote:
>> > > > >> We need to add a new flag to mean to sync at that point.
>> > > > >> Notice that we still synchronize at the end of setup and at the=
 end of
>> > > > >> complete stages.
>> > > > >>=20
>> > > > >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> > > > >> ---
>> > > > >>  migration/migration.c |  2 +-
>> > > > >>  migration/ram.c       | 42 ++++++++++++++++++++++++++++++-----=
-------
>> > > > >>  2 files changed, 31 insertions(+), 13 deletions(-)
>> > > > >>=20
>> > > > >> diff --git a/migration/migration.c b/migration/migration.c
>> > > > >> index 3f79df0b70..6627787fc2 100644
>> > > > >> --- a/migration/migration.c
>> > > > >> +++ b/migration/migration.c
>> > > > >> @@ -4283,7 +4283,7 @@ static Property migration_properties[] =
=3D {
>> > > > >>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>> > > > >>      /* We will change to false when we introduce the new mecha=
nism */
>> > > > >>      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationS=
tate,
>> > > > >> -                      multifd_sync_each_iteration, true),
>> > > > >> +                      multifd_sync_each_iteration, false),
>> > > > >>=20=20
>> > > > >>      /* Migration capabilities */
>> > > > >>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRL=
E),
>> > > > >> diff --git a/migration/ram.c b/migration/ram.c
>> > > > >> index 2c7289edad..6792986565 100644
>> > > > >> --- a/migration/ram.c
>> > > > >> +++ b/migration/ram.c
>> > > > >> @@ -81,6 +81,7 @@
>> > > > >>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>> > > > >>  /* 0x80 is reserved in migration.h start with 0x100 next */
>> > > > >>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>> > > > >> +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
>> > > > >
>> > > > > Note this is the very last usable flag!
>> > > >=20
>> > > > We can recover two flags right now:
>> > > >=20
>> > > > RAM_SAVE_FLAG_FULL is not used anymore.
>> > > > 0x80 is free since years ago.
>> > > >=20
>> > > > Once multifd is default, there are some other that could go.
>> >=20
>> > I have suggested that a few times in the past.
>> >=20
>> > > Non-multifd migration isn't likely to go away any time soon, given
>> > > distros desire to support migration between QEMU's with quite
>> > > significantly different versions. So feels like quite a long time
>> > > before we might reclaim more flags.
>> > >=20
>> > > > > We could do with avoiding using them as flags where we dont need=
 to.
>> > > >=20
>> > > > I can't really think on another way to do it.  The other thing tha=
t I
>> > > > can do is just reuse one of the flags that don't make sense for mu=
ltifd
>> > > > (RAM_SAVE_FLAG_ZERO after zero pages patch,
>> > > > RAM_SAVE_FLAG_XBZRLE/COMPRESS_PAGE).
>> > >=20
>> > > Re-using flags based on use context differences feels like a recipe
>> > > to confuse people.
>> >=20
>> > Note that most of these things aren't really 'flags'; in the sense that
>> > only a few of them are actually combinable; so we should start using
>> > combinations to mean things new.
>>=20
>> IOW, treat the field as an enum of valid values instead, and just
>> define enum entries for the few valid combinations, giving us many
>> more values to play with ?
>
> Right; some care needs to be taken with the ones that were interpreted
> as flags; but since you're not going to send the new values to an old
> qemu, you've got quite a bit of flexibility.

Rigth now no combinations are allowed, so we are free to play with that
combination thing.  Reception side code is:

        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
        case RAM_SAVE_FLAG_MEM_SIZE:
        ....
        break;

        case RAM_SAVE_FLAG_ZERO:
            ...
            break;

        case RAM_SAVE_FLAG_PAGE:
            ....
            break;

        case RAM_SAVE_FLAG_COMPRESS_PAGE:
            ....
            break;

        case RAM_SAVE_FLAG_XBZRLE:
            ....
            break;
        case RAM_SAVE_FLAG_MULTIFD_SYNC:
            ...
            break;
        case RAM_SAVE_FLAG_EOS:
            ....
            break;
        default:
            if (flags & RAM_SAVE_FLAG_HOOK) {
                   .....
            }
        }

So the only value that is a flag is the CONTINUE one, there are not
other combinations with other flags.

Yes, the RAM_SAVE_FLAG_HOOK is as weird as it can be.

Later, Juan.


