Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34486567238
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:14:01 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kFU-00009H-75
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kDW-0007DO-9r
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kDU-0003Mm-Nw
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657033915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=apGhHs1BP6QLF/b3knK87ZgUMRff76DNW19eJ7d2q7I=;
 b=MlCPKwSAWHvIGA82sBmSwGpoa5j979pWSgDxZkuOMDo6oP2R3r80emiYOFlsFo3fuHP1Sv
 4PA+kkyMuPflGLJ8eMXtKlpuBYFFK9ehYETIorPVFN+Gwr4pyiSuA/1DVUO29bUyv2HmhW
 jQ4RkpKuT1nmow+pqkfoQzfhEMGFyYQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-45TN-TMIOsSJsvZspzIh9w-1; Tue, 05 Jul 2022 11:11:52 -0400
X-MC-Unique: 45TN-TMIOsSJsvZspzIh9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so8977517wmh.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=apGhHs1BP6QLF/b3knK87ZgUMRff76DNW19eJ7d2q7I=;
 b=bhHaVd15SXxhKGz+BdNb6xGWWpsVucfqEOvjgXUHrVM5OZxKfXWivXXLXKYns0S/5Z
 TT6IG+L6BNhuUSwn2/EOA6ymJDS1Phn+dR5sE8/lNVmP2QShbL6CxUhLRXy/7IXC8614
 LTQ7Ha9OZMfBNMWqOHwEDLRh/JdeRLXK2z6vVmFTryKFRjgf+ofO/mVd489ZudnnvlPd
 Ub+bAXtN63GxvGD6mU8CCRy9DW+8EhxMMFtAzLWynmJikC1e4ZPS+KCrG0/JTvv94jhf
 EEdjvwgIOnsgD/DjuCXJHo3mOGUkNmH2hF0Oww0oogeA62s1EvzdTNehGO4Q/WlWL7N4
 55Ww==
X-Gm-Message-State: AJIora8Mr4Mk1aj0ofy0E8X76y8YR0ZPxJigD2nobMh9wL9yXfYuAM5v
 T09HvIcSVel7nI8I3rQJwNQ75V2cr/oivN50uVQCvrrkJHHP0HwgUfiK7wtWQBJ8ANZHYcLl45d
 A3GrIrodpsn5oIIE=
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr6155462wrm.285.1657033908635; 
 Tue, 05 Jul 2022 08:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upVMcZr564REV6l2aw18pnHQEl3Tf13FS8SpmE5T/twYB0FZmETpU/4FKGSX+trGF1eBOGBQ==
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr6155435wrm.285.1657033908410; 
 Tue, 05 Jul 2022 08:11:48 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 y10-20020adff6ca000000b0021d6e758752sm3833134wrp.24.2022.07.05.08.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 08:11:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
In-Reply-To: <YsRDEyA0mjUD4DSB@work-vm> (David Alan Gilbert's message of "Tue, 
 5 Jul 2022 14:56:35 +0100")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com> <YsRDEyA0mjUD4DSB@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 05 Jul 2022 17:11:46 +0200
Message-ID: <8735ff1tn1.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
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
> * Juan Quintela (quintela@redhat.com) wrote:
>> We need to add a new flag to mean to sync at that point.
>> Notice that we still synchronize at the end of setup and at the end of
>> complete stages.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/migration.c |  2 +-
>>  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
>>  2 files changed, 31 insertions(+), 13 deletions(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 3f79df0b70..6627787fc2 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
>>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>>      /* We will change to false when we introduce the new mechanism */
>>      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
>> -                      multifd_sync_each_iteration, true),
>> +                      multifd_sync_each_iteration, false),
>>  
>>      /* Migration capabilities */
>>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 2c7289edad..6792986565 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -81,6 +81,7 @@
>>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>>  /* 0x80 is reserved in migration.h start with 0x100 next */
>>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>> +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
>
> Note this is the very last usable flag!

We can recover two flags right now:

RAM_SAVE_FLAG_FULL is not used anymore.
0x80 is free since years ago.

Once multifd is default, there are some other that could go.

Later, Juan.

> We could do with avoiding using them as flags where we dont need to.

I can't really think on another way to do it.  The other thing that I
can do is just reuse one of the flags that don't make sense for multifd
(RAM_SAVE_FLAG_ZERO after zero pages patch,
RAM_SAVE_FLAG_XBZRLE/COMPRESS_PAGE).

It looks worse to me.

Later, Juan.

> It feels like you could have done that in the previous patch.
> Anyway,
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks, Juan.


