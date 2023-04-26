Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785796EFAA3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:09:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkVE-0001QJ-W5; Wed, 26 Apr 2023 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkV5-0001PO-6w
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkV3-0002ha-Fg
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682536100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EsUi4NGQajDlmCCoSNxbNmMW72x5j5Iw6dJcbLd5x3Y=;
 b=SemBD7lsofmV0ojT2eRZ8KIxphCvbXe1bDp46Zd12JX074+V1Isb8UP8VmPTmKN7JM616S
 QpenSPvSZKQ2Ksw55fHsarPfzsO+h/nP7WZLE7GA0dHwBVUaxzEWCBNEbgCK5yyrmjlIsE
 oCmCyGlewxVYNb+zwP0Dm/eTOiLIRyE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-No7bRHS5Nz2wRjRROYQbcQ-1; Wed, 26 Apr 2023 15:08:17 -0400
X-MC-Unique: No7bRHS5Nz2wRjRROYQbcQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb2easo2479301f8f.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682536096; x=1685128096;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EsUi4NGQajDlmCCoSNxbNmMW72x5j5Iw6dJcbLd5x3Y=;
 b=YVL102QpDXQd0OPFQ53rvOYYeR2VRIeWDAA+vSrq3qyNsvGwaLdVjhx7zftYspSr0J
 mesY3bAY8ooSuWJYtqy892FSyEP1L9k36YvFXfJGYz+hEjMWcMC/9/Ux43aJT4D660Wj
 aSptdskH4NO/2Qd/y5e74nAKTlw2TmVm/Tx0Z6+fHnBlNmnzTUSqtY1Y5BOpXRi4sGTL
 urnKNBpFpAsvPhbDFJ/l0vBy72egx6CKIxSav+sa+8ORkkadNFiLkWx7Z1ukVkr0jX/R
 o/+GGKHYuUaIzBPHD/ml0Qkq1QMuQuwlOmY4TGKYXlsH7JKy/uVeaB1DTWS/MAUay6m0
 TOxw==
X-Gm-Message-State: AAQBX9cvbv1k9lmWiwmvsPN4vRHFqEFzrGNhGmt8MBLjXIFJl9q3z9rr
 zCaGsxz5kLxukcwHZac6Tuu1zd8OpTbHVd0qHnUd5nuKL0fvBksfdSpHQ5OTadXgTZoDCXcIWcl
 Y5E3mdNGOsGeFhyE=
X-Received: by 2002:a5d:4f81:0:b0:2fe:c0ea:18b4 with SMTP id
 d1-20020a5d4f81000000b002fec0ea18b4mr15418567wru.24.1682536096759; 
 Wed, 26 Apr 2023 12:08:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350agW1sXsLOTc205wYBldZ/hwc+Bs6mwP6ZmL4+c6v27WO1jFeaQ3Pzah/scmtI7dcScp2P1tA==
X-Received: by 2002:a5d:4f81:0:b0:2fe:c0ea:18b4 with SMTP id
 d1-20020a5d4f81000000b002fec0ea18b4mr15418556wru.24.1682536096431; 
 Wed, 26 Apr 2023 12:08:16 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003f03d483966sm22258679wmi.44.2023.04.26.12.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:08:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/13] migration: Remove MigrationState from
 block_cleanup_parameters()
In-Reply-To: <6fe2c00c-d651-19f1-316b-eda65c5c2c7a@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Apr 2023 21:51:40 +0300")
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-9-quintela@redhat.com>
 <6fe2c00c-d651-19f1-316b-eda65c5c2c7a@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 21:08:13 +0200
Message-ID: <87bkjaea1u.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 24.04.23 21:32, Juan Quintela wrote:
>> This makes the function more regular with everything else.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.

>> ---
>>   migration/migration.c | 4 ++--
>>   migration/options.c   | 4 +++-
>>   migration/options.h   | 2 +-
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>> diff --git a/migration/migration.c b/migration/migration.c
>> index cefe6da2b8..ef8caa79b9 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1218,7 +1218,7 @@ static void migrate_fd_cleanup(MigrationState *s)
>>           error_report_err(error_copy(s->error));
>>       }
>>       notifier_list_notify(&migration_state_notifiers, s);
>> -    block_cleanup_parameters(s);
>> +    block_cleanup_parameters();
>>       yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>>   }
>>   @@ -1712,7 +1712,7 @@ void qmp_migrate(const char *uri, bool
>> has_blk, bool blk,
>>                      "a valid migration protocol");
>>           migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>>                             MIGRATION_STATUS_FAILED);
>> -        block_cleanup_parameters(s);
>> +        block_cleanup_parameters();
>>           return;
>>       }
>>   diff --git a/migration/options.c b/migration/options.c
>> index 26fe00799b..f65b7babef 100644
>> --- a/migration/options.c
>> +++ b/migration/options.c
>> @@ -597,8 +597,10 @@ void migrate_set_block_incremental(bool value)
>>     /* parameters helpers */
>>   -void block_cleanup_parameters(MigrationState *s)
>> +void block_cleanup_parameters(void)
>>   {
>> +    MigrationState *s = migrate_get_current();
>> +
>>       if (s->must_remove_block_options) {
>>           /* setting to false can never fail */
>>           migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
>> diff --git a/migration/options.h b/migration/options.h
>> index 1fc8d341dd..3948218dbe 100644
>> --- a/migration/options.h
>> +++ b/migration/options.h
>> @@ -90,6 +90,6 @@ void migrate_set_block_incremental(bool value);
>>     bool migrate_params_check(MigrationParameters *params, Error
>> **errp);
>>   void migrate_params_init(MigrationParameters *params);
>> -void block_cleanup_parameters(MigrationState *s);
>> +void block_cleanup_parameters(void);
>
> Don't you want to rename it to migrate_* ?

The idea is to deprecate block migration.  There are much better things
on the block layer to migrate disks.  So I think we can let it from now
there.


Later, Juan.


