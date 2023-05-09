Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3B6FCDB9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:24:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRzN-0004Ea-J8; Tue, 09 May 2023 14:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRzL-0004EN-3V
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRzJ-0004r9-6Y
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683656579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EHPGzCdmh5nXV1y49kRnKOuBM3/V65jXGl0ox/i9ws8=;
 b=SQe1BeEtnyn9k+Qd4RcpFsB2hq+YGcmedBR570YO/D3EshPMjStdLkQBvkopMwkqd7kOYJ
 7doAwUs0F68Ilsx/80JLa7gUidkCue2K7lOrueSW4azhgd6+pAkj6rw/FhOMR8UK04Vkrh
 Zm+aC6jjoRDQ0iH0qcf2Ic1LjYHN+Mg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-Hmpw9hxcMWujTyM8ss3A8A-1; Tue, 09 May 2023 14:22:58 -0400
X-MC-Unique: Hmpw9hxcMWujTyM8ss3A8A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42d18a079so4496675e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683656577; x=1686248577;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHPGzCdmh5nXV1y49kRnKOuBM3/V65jXGl0ox/i9ws8=;
 b=dGZ0kO9Go1g+jQRuoq3XvxooM58CSDGD71NoQbC7o2z788fiBIKpIvlMTVvPuXET1z
 tMczTfO3WT9ZCfqO00FKMaCsX9nYX0L8ymiu3qEz2xn+cgkPS+npnRecDgF+5x/6OIAx
 NnjJoICJAluGE5aed0uh85j02+oRyd9v6rBt0q5iLfCBEKRRw4cxM3uzxNitUzsK8rad
 QKGVYmVKemZMZcGwQDPd6icEkNhD1icya4M8CkdFwupYUdPDWLBjFAtmxWEAWTUVWc17
 oZYUnMlqtl0uxhJts43KwKHKUR1VrFWyb3pzWWlpmbgqVosJVe1/ud0PxeXIQ5tO9YJz
 UK9A==
X-Gm-Message-State: AC+VfDxmY61IOIv1VVhaJ8OGbnj8TE7hdvr23M61qMSxuwFj5StC85kX
 MXuDGt15d1NAJcpNUMcEm/p4AOxRsIYVFVkNP1vclyBxtXr/khbfwsyuZ1VIHJL83I2KyfecJch
 b9UqNPkeHDJJq3Us=
X-Received: by 2002:a5d:4c82:0:b0:307:a77c:c167 with SMTP id
 z2-20020a5d4c82000000b00307a77cc167mr2387407wrs.57.1683656577645; 
 Tue, 09 May 2023 11:22:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tsCkLzWeMmELOvsGAobiqK0/TiDEgcGkd0UMPN2J06wRiGTc+uJhu8GipxrX3g3AeXGxnbw==
X-Received: by 2002:a5d:4c82:0:b0:307:a77c:c167 with SMTP id
 z2-20020a5d4c82000000b00307a77cc167mr2387394wrs.57.1683656577355; 
 Tue, 09 May 2023 11:22:57 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4843000000b003047d5b8817sm15090396wrs.80.2023.05.09.11.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:22:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "lukasstraub2@web.de"
 <lukasstraub2@web.de>,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH v4 09/10] migration: disallow change capabilities in
 COLO state
In-Reply-To: <MWHPR11MB0031697E5E975426340909BD9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 (Chen Zhang's message of "Thu, 4 May 2023 09:03:37 +0000")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
 <MWHPR11MB003113F9302058F9BA7F20479B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <b0d9e820-6ee1-0e49-2195-f535bcc00555@yandex-team.ru>
 <MWHPR11MB0031697E5E975426340909BD9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 20:22:55 +0200
Message-ID: <87v8h1bc00.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
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

"Zhang, Chen" <chen.zhang@intel.com> wrote:
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Thursday, May 4, 2023 4:23 PM
>> To: Zhang, Chen <chen.zhang@intel.com>; qemu-devel@nongnu.org
>> Cc: lukasstraub2@web.de; quintela@redhat.com; Peter Xu
>> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
>> Subject: Re: [PATCH v4 09/10] migration: disallow change capabilities in COLO
>> state
>> 
>> On 04.05.23 11:09, Zhang, Chen wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> >> Sent: Saturday, April 29, 2023 3:49 AM
>> >> To: qemu-devel@nongnu.org
>> >> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>> >> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Peter Xu
>> >> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
>> >> Subject: [PATCH v4 09/10] migration: disallow change capabilities in
>> >> COLO state
>> >>
>> >> COLO is not listed as running state in migrate_is_running(), so, it's
>> >> theoretically possible to disable colo capability in COLO state and
>> >> the unexpected error in migration_iteration_finish() is reachable.
>> >>
>> >> Let's disallow that in qmp_migrate_set_capabilities. Than the error
>> >> becomes absolutely unreachable: we can get into COLO state only with
>> >> enabled capability and can't disable it while we are in COLO state.
>> >> So substitute the error by simple assertion.
>> >>
>> >> Signed-off-by: Vladimir Sementsov-Ogievskiy
>> >> <vsementsov@yandex-team.ru>
>> >> ---
>> >>   migration/migration.c | 5 +----
>> >>   migration/options.c   | 2 +-
>> >>   2 files changed, 2 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/migration/migration.c b/migration/migration.c index
>> >> 0d912ee0d7..8c5bbf3e94 100644
>> >> --- a/migration/migration.c
>> >> +++ b/migration/migration.c
>> >> @@ -2751,10 +2751,7 @@ static void
>> >> migration_iteration_finish(MigrationState *s)
>> >>           runstate_set(RUN_STATE_POSTMIGRATE);
>> >>           break;
>> >>       case MIGRATION_STATUS_COLO:
>> >> -        if (!migrate_colo()) {
>> >> -            error_report("%s: critical error: calling COLO code without "
>> >> -                         "COLO enabled", __func__);
>> >> -        }
>> >> +        assert(migrate_colo());
>> >>           migrate_start_colo_process(s);
>> >>           s->vm_was_running = true;
>> >>           /* Fallthrough */
>> >> diff --git a/migration/options.c b/migration/options.c index
>> >> 865a0214d8..f461d02eeb 100644
>> >> --- a/migration/options.c
>> >> +++ b/migration/options.c
>> >> @@ -598,7 +598,7 @@ void
>> >> qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>> >>       MigrationCapabilityStatusList *cap;
>> >>       bool new_caps[MIGRATION_CAPABILITY__MAX];
>> >>
>> >> -    if (migration_is_running(s->state)) {
>> >> +    if (migration_is_running(s->state) || migration_in_colo_state())
>> >> + {
>> >
>> > Make the "MIGRATION_STATUS_COLO" into the " migration_is_running()"
>> is a better way?
>> 
>> I wasn't sure that that's correct.. migration_is_running() is used in several
>> places, to do so, I'd have to analyze them all.
>
> Actually, when running in the "MIGRATION_STATUS_COLO" means QEMU can not
> do a normal migration at the same time.
> Juan have any comments here?

My understanding of colo is pretty limited, but my mind explodes just
trying to think how many things we would have to check/do to do a
migration while in colo state.

So I guess you are right that we can't be in both at the same time.

Later, Juan.


