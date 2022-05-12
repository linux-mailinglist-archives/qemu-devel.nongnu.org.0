Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32D525507
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:40:53 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDk4-0002DY-Eh
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCq7-0008TZ-GH
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCq4-0007ir-Ae
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652377379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKzkRhifEA6iK6H3sYNMZkdI9kqwV4dePRbBEHLwwHQ=;
 b=SMaAN9avCW5Bzf1N6dCK3pWCLnpdacqIuco79bx6VFHQVAqNJNrhIezrTxixxCdyQGDqPq
 E/+BEEQx60gMVw0HBhIXunTLd9MSUwhsf284Jf9B+4OjgVmf9ruqAjJnXaaV467GHarDmC
 bwJBJ7rgjNC3Ov1ckLRMm9IfCsgMezc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-gIp4T1ADPKuYUE9mIrhtSg-1; Thu, 12 May 2022 13:42:58 -0400
X-MC-Unique: gIp4T1ADPKuYUE9mIrhtSg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso4680441wma.6
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OKzkRhifEA6iK6H3sYNMZkdI9kqwV4dePRbBEHLwwHQ=;
 b=R6JyK7/40fUBFrq921onXd3N8yaEcNbXwc5flx+gl7h9ybWzkEbq0UW4doTM/RL0IB
 44A7pn7hrASOD17pS06/GI7SixobpXr5P6UcoDO2t6+MnlY0DCS2bN9gsfyM815luVEi
 vathCEpgAwRsGizCJvHH8E4da3oItE7Jlxm/nonGH+DNFK2sysO01Ppo/GF8scNGFehq
 m7gBaSYtrJWIEEbC4VhdfZem5Mpl05Dz2twXUw+V+m9kjK0igDXrv5D7qqpVc5+/ua60
 lZvQWlryR1gQWpK5IrKa7Z/uIyLluLMEqGuXJ+qX+PS83PNsWbb4x5vyzpyk8IA/hwIt
 OH/g==
X-Gm-Message-State: AOAM533ymDNiTDQ/Os+NRRtBBVtBtKxdORaHART9aSIy+iC6mhszvDpq
 u/Admsa/RNsuF5NwlkJcro4lZrjRYZgK8tJm+uCL2nuNrw8sDLJu8oKCxUG8GvBxpfakEmAQ/Mk
 jDdCNdSvISS1pTQA=
X-Received: by 2002:a5d:564c:0:b0:20a:d53c:70e3 with SMTP id
 j12-20020a5d564c000000b0020ad53c70e3mr716862wrw.0.1652377376884; 
 Thu, 12 May 2022 10:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/EEDuhHRonZfoE6ntDYm9JMEEaiapLCuG2X8EdnRIJLB130sBke5bWfiClqj50CVJEodZag==
X-Received: by 2002:a5d:564c:0:b0:20a:d53c:70e3 with SMTP id
 j12-20020a5d564c000000b0020ad53c70e3mr716839wrw.0.1652377376684; 
 Thu, 12 May 2022 10:42:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h1-20020adfaa81000000b0020c66310845sm144266wrc.55.2022.05.12.10.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:42:55 -0700 (PDT)
Date: Thu, 12 May 2022 18:42:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 15/21] migration: Parameter
 x-postcopy-preempt-break-huge
Message-ID: <Yn1HHp+4+Bm8bSEX@work-vm>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-16-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425233847.10393-16-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Add a parameter that can conditionally disable the "break sending huge
> page" behavior in postcopy preemption.  By default it's enabled.
> 
> It should only be used for debugging purposes, and we should never remove
> the "x-" prefix.

This is actually a 'property' and not a 'Parameter' isn't it?

> Signed-off-by: Peter Xu <peterx@redhat.com>

Other than the title,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 2 ++
>  migration/migration.h | 7 +++++++
>  migration/ram.c       | 7 +++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index cce741e20e..cd9650f2e2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4329,6 +4329,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_SIZE("announce-step", MigrationState,
>                        parameters.announce_step,
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> +    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
> +                      postcopy_preempt_break_huge, true),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> diff --git a/migration/migration.h b/migration/migration.h
> index f898b8547a..6ee520642f 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -340,6 +340,13 @@ struct MigrationState {
>      bool send_configuration;
>      /* Whether we send section footer during migration */
>      bool send_section_footer;
> +    /*
> +     * Whether we allow break sending huge pages when postcopy preempt is
> +     * enabled.  When disabled, we won't interrupt precopy within sending a
> +     * host huge page, which is the old behavior of vanilla postcopy.
> +     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
> +     */
> +    bool postcopy_preempt_break_huge;
>  
>      /* Needed by postcopy-pause state */
>      QemuSemaphore postcopy_pause_sem;
> diff --git a/migration/ram.c b/migration/ram.c
> index a4b39e3675..f3a79c8556 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2266,11 +2266,18 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>  
>  static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
>  {
> +    MigrationState *ms = migrate_get_current();
> +
>      /* Not enabled eager preempt?  Then never do that. */
>      if (!migrate_postcopy_preempt()) {
>          return false;
>      }
>  
> +    /* If the user explicitly disabled breaking of huge page, skip */
> +    if (!ms->postcopy_preempt_break_huge) {
> +        return false;
> +    }
> +
>      /* If the ramblock we're sending is a small page?  Never bother. */
>      if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
>          return false;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


