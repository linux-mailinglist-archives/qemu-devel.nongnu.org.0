Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0163CBA8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 00:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09qp-00045s-0X; Tue, 29 Nov 2022 18:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09qm-00042C-RY
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09qk-0005aJ-Iu
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669763833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6Wc38twuSzB7Na07azNngleHND9KS83RYgWn7rlDRs=;
 b=KLl1RcYFW59qmVWmvncUSe2TXHxxlgovza/9sVEmjG/tMaEmtMpSCO76wYqkR0+ZONtCIs
 hgko6Kb4xdD9nvIqjYYMf/iN7zX2vo8w+dBMghTPwynLWwufU7z2ye6GOMu0R7V8ggLxLK
 GiwmmE7NC1LW/vTJaXEA3+tfaapF2ec=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-ALpAHDEdOhO4ptKU_ONu0w-1; Tue, 29 Nov 2022 18:17:11 -0500
X-MC-Unique: ALpAHDEdOhO4ptKU_ONu0w-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp11-20020a05620a458b00b006fc8fa99f8eso8873527qkb.11
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 15:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6Wc38twuSzB7Na07azNngleHND9KS83RYgWn7rlDRs=;
 b=7qnJrDFOsX01cdTryfCVJPlzZjbkPOpjht9+Jj1Gpr5LFWCNdsfF58+4xV8mRROUgk
 S8aYWmc7dlHmzeBAiez0W5/Dy4X/qPxMuAwWclJmn3xFXSMVU69ZyKe31oWpNyJXLS63
 Pjt/Ed71tuXAZFH+I8Ko8wuUAepg49Nw76K03uqkdRa2Dgy/tAyrVpJ1DSCQi4A1/Q5c
 X3XFVFZGU6t6H7j7qlHy2D2DJjYJNFwLV11dK4Jo6w3oBgqbjPJ35tE2qX/idM+5o0Tz
 gfmWFrkrUHPFe2hjEGAHHZmPlOj5ncsGQqd1KdBVinA1+CWp0bRwrpRNOKtuzgwDMlk5
 m/pg==
X-Gm-Message-State: ANoB5pkO4qo/rgDMWtwz4nCvAZ3DlY5O0AFXEIURphwkx3xP7OTXlEZa
 idpfif/WWxYRom/1Rix2rqUgd+Z3evyq8t1OsbMTRCz89Rl4qbVM1CJyjCyyKTHPI8T99PxZIBX
 YoFTFZxZEVvK/sjk=
X-Received: by 2002:ae9:eb83:0:b0:6fa:346e:f4bc with SMTP id
 b125-20020ae9eb83000000b006fa346ef4bcmr38623064qkg.416.1669763831087; 
 Tue, 29 Nov 2022 15:17:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4GoH+rmRleVshmsQdhGqdFV4qb1pTY208iNx9UJN33VeNkDvQ87VyMaBJ3fTIEw4tCFhKBbw==
X-Received: by 2002:ae9:eb83:0:b0:6fa:346e:f4bc with SMTP id
 b125-20020ae9eb83000000b006fa346ef4bcmr38623046qkg.416.1669763830835; 
 Tue, 29 Nov 2022 15:17:10 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 k23-20020ac86057000000b00399b73d06f0sm9292352qtm.38.2022.11.29.15.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 15:17:10 -0800 (PST)
Date: Tue, 29 Nov 2022 18:17:09 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/11] migration: Implement dirty-limit convergence algo
Message-ID: <Y4aS9UjwNabKMAHN@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <5727cd0876e1a8d3db451feb46afb3281875cca3.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5727cd0876e1a8d3db451feb46afb3281875cca3.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21, 2022 at 11:26:39AM -0500, huangy81@chinatelecom.cn wrote:
> diff --git a/migration/migration.c b/migration/migration.c
> index 86950a1..096b61a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -240,6 +240,7 @@ void migration_cancel(const Error *error)
>      if (error) {
>          migrate_set_error(current_migration, error);
>      }
> +    qmp_cancel_vcpu_dirty_limit(false, -1, NULL);

Disable it only if migrate_dirty_limit() is true?  It seems okay if the
admin wants to use dirtylimit separately from migration.

>      migrate_fd_cancel(current_migration);
>  }

[...]

> @@ -1148,22 +1175,31 @@ static void migration_trigger_throttle(RAMState *rs)
>      uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
>      uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
>  
> -    /* During block migration the auto-converge logic incorrectly detects
> -     * that ram migration makes no progress. Avoid this by disabling the
> -     * throttling logic during the bulk phase of block migration. */
> -    if (migrate_auto_converge() && !blk_mig_bulk_active()) {
> -        /* The following detection logic can be refined later. For now:
> -           Check to see if the ratio between dirtied bytes and the approx.
> -           amount of bytes that just got transferred since the last time
> -           we were in this routine reaches the threshold. If that happens
> -           twice, start or increase throttling. */
> -
> -        if ((bytes_dirty_period > bytes_dirty_threshold) &&
> -            (++rs->dirty_rate_high_cnt >= 2)) {
> +    /*
> +     * The following detection logic can be refined later. For now:
> +     * Check to see if the ratio between dirtied bytes and the approx.
> +     * amount of bytes that just got transferred since the last time
> +     * we were in this routine reaches the threshold. If that happens
> +     * twice, start or increase throttling.
> +     */
> +
> +    if ((bytes_dirty_period > bytes_dirty_threshold) &&
> +        (++rs->dirty_rate_high_cnt >= 2)) {
> +        rs->dirty_rate_high_cnt = 0;
> +        /*
> +         * During block migration the auto-converge logic incorrectly detects
> +         * that ram migration makes no progress. Avoid this by disabling the
> +         * throttling logic during the bulk phase of block migration
> +         */
> +
> +        if (migrate_auto_converge() && !blk_mig_bulk_active()) {

Does dirtylimit cap needs to check blk_mig_bulk_active() too?  I assume
that check was used to ignore the bulk block migration phase where major
bandwidth will be consumed by block migrations so the measured bandwidth is
not accurate.  IIUC it applies to dirtylimit too.

>              trace_migration_throttle();
> -            rs->dirty_rate_high_cnt = 0;
>              mig_throttle_guest_down(bytes_dirty_period,
>                                      bytes_dirty_threshold);
> +        } else if (migrate_dirty_limit() &&
> +                   kvm_dirty_ring_enabled() &&
> +                   migration_is_active(s)) {

Is "kvm_dirty_ring_enabled()" and "migration_is_active(s)" check helpful?
Can we only rely on migrate_dirty_limit() alone?

-- 
Peter Xu


