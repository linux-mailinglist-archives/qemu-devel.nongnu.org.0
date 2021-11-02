Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF74431ED
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:41:25 +0100 (CET)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvud-0000D0-N3
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhvsg-0006F9-OK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhvsc-0000at-Mn
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635867556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qQnhIRslxfdIgJRZ89rx6HzbRqC4dvozWfRRfJmzTWI=;
 b=ZEOawykjcwhD8mqTwCrg987DhpVBm2kUsbmIYU1DpxofFXE/MHmRkn1q0+neveMQftRysM
 JR2ZsUxxmxLIKTVOVrPa0E/CwocEwDSiD2NUIyHhBTGD7wQHhz7p9S2dHjWiYlS+UGpgEH
 z/dfIviUSBqr6/x1NEAB5VGr+Poy8qY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-5bo_NL3_OjqO9IVvGPfY1Q-1; Tue, 02 Nov 2021 11:39:15 -0400
X-MC-Unique: 5bo_NL3_OjqO9IVvGPfY1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 v13-20020adfe28d000000b00186c47ee9e3so284270wri.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qQnhIRslxfdIgJRZ89rx6HzbRqC4dvozWfRRfJmzTWI=;
 b=hPWm8fwU/fKTCT526F0NWMn740y2gejsgowUo2+mBV7II1WAFxMz0VF4r/3a1svY/u
 O3JCPYu/7wEaGWNS681Rn6v1SzDDlBDR2wxDeQ35cAG2doIfukllutyzaFvJrGFXEied
 xQUwbWl14quVkAonW0jFRIOa1TE0Zux3cx6syJdzTSvETiK6kOUCYTAW1yR7FmrCI/Wo
 joDXJJ5w57ROIE+Y88urv975vkJ8HP0EFZFsYE10ujG330XCiCxO16oV95eX29hUM4Fl
 fCM01ceQc+m/0kjC2ALapIXbnOlBDZNSM2BoaRHI8oqhZHn70VDU9VOuiPjrBoROz+RP
 qeUQ==
X-Gm-Message-State: AOAM532GTOt76ZIn1zIsMELtyAh3sp0ZPk8VUXzmxCYnpGQySYfmx/r7
 98hbWlZPsKp+o+YOsFwMom92d1+fSpTbt+BKkwvdTYdGhm5wqq4UKMxh2QsVtXLUkby8JzJL9+Q
 Kq0geqbEDnwc7Cd4=
X-Received: by 2002:adf:e292:: with SMTP id v18mr46627851wri.369.1635867554480; 
 Tue, 02 Nov 2021 08:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoxVFDRW8bxHmBEtHB6gtID7qG7S7PJHY4ckR3jRO1csz4bVz3E/bbBRFdhNdzNCuuIxtFGw==
X-Received: by 2002:adf:e292:: with SMTP id v18mr46627828wri.369.1635867554328; 
 Tue, 02 Nov 2021 08:39:14 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id n13sm12684427wrt.44.2021.11.02.08.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 08:39:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: yuxiating <yuxiating@huawei.com>
Subject: Re: [PATCH] migration: initialise compression_counters for a new
 migration
In-Reply-To: <20210902115117.5633-1-yuxiating@huawei.com>
 (yuxiating@huawei.com's message of "Thu, 2 Sep 2021 19:51:17 +0800")
References: <20210902115117.5633-1-yuxiating@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 16:39:12 +0100
Message-ID: <87ee7yin33.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: eric.fangyi@huawei.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

yuxiating <yuxiating@huawei.com> wrote:
> If the compression migration fails or is canceled, the query for the value of
> compression_counters during the next compression migration is wrong.
>
> Signed-off-by: yuxiating <yuxiating@huawei.com>
> ---
>  migration/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index bb909781b7..f20bc560e5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2252,10 +2252,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>  
>      migrate_init(s);
>      /*
> -     * set ram_counters memory to zero for a
> +     * set ram_counters compression_counters memory to zero for a
>       * new migration
>       */
>      memset(&ram_counters, 0, sizeof(ram_counters));
> +    memset(&compression_counters, 0, sizeof(compression_counters));
>  
>      return true;
>  }

Once here, we are not initializing them on qemu_savevm_state() either.

Reviewed-by: Juan Quintela <quintela@redhat.com>

queue.


