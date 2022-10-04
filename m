Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961415F40E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:35:29 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offGq-00040y-AE
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offFF-0002eM-3m
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offFB-00017I-RR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664879624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u+pibj+VQa8kaM9aphRs4qSnJc3zubI6UP9X2GSNl+Y=;
 b=JPUiF1bACh5ylVs65bx1WNGIhmFgBqahsJEV8Gs5BFNpTALB5SD82Kgwt+vgNd170H5MpO
 zPSooihHvFmFJ/KsyDt6T4VCQ22v5Y/CU9QQ9IRpI1PmzS0YVW2eYcskMhvn6s8R7Gvkw6
 qntE+BDrDwughEWxkxkWA//OCHc4LzA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-UpL027o1Pq6gUrbNH8PUxg-1; Tue, 04 Oct 2022 06:33:42 -0400
X-MC-Unique: UpL027o1Pq6gUrbNH8PUxg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so3897270wrg.16
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 03:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u+pibj+VQa8kaM9aphRs4qSnJc3zubI6UP9X2GSNl+Y=;
 b=FgAA9yn1XcpaC7lGDnTXeIgXS2mTKBDLpThIshkx3ozO2OtdEScyH7ym704BuAORI2
 YyRsa3pwbYlPVBqts8CA3kF88uoilzxURGlKk8EVvsbp/EHrKhk+UXt0deiTE6PpAQ3G
 rm2LUZDCOyrvic1Fiql5ehcBMO72gUC+O1MKxzpbYHFg+FQTEk9LD8FMHHZC9wzyN+bF
 V0ML29EBV9/lQ/3kQidSAFthyM/SmxNvsj0qHEZcI4P0v0R/KbPWZCNvcWxYTcBGjwZQ
 eTwMJM2ODHRv40TpTIC3p4SlqQgICH9kSX9UE8UnrCN7Q9ZWWRaiehXrucBUWj8g5DcV
 kwNg==
X-Gm-Message-State: ACrzQf2/GtBTehQj12GdKdtbjIt1/Uei1/QscVG31sU5/KmoKCcrFg2c
 JWyKHB7qpHWFX1Br8px1q91SaULrFnKq5aUqu7ava8+RtQdZWJSHArD+NhpCwsvvUqk0G3Xj03N
 58yw7BAbUJ/bLvFg=
X-Received: by 2002:a05:6000:682:b0:22e:2d5f:ba9e with SMTP id
 bo2-20020a056000068200b0022e2d5fba9emr9070795wrb.226.1664879621303; 
 Tue, 04 Oct 2022 03:33:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Gl8df5FOPJAi5wigm2RJWh7+gh2FrXTXdLM9zXxNqcDWbmfdpj7XnqSxe245ZHA1+qpZCZw==
X-Received: by 2002:a05:6000:682:b0:22e:2d5f:ba9e with SMTP id
 bo2-20020a056000068200b0022e2d5fba9emr9070776wrb.226.1664879620959; 
 Tue, 04 Oct 2022 03:33:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m64-20020a1ca343000000b003a6125562e1sm14326477wme.46.2022.10.04.03.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 03:33:40 -0700 (PDT)
Date: Tue, 4 Oct 2022 11:33:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 02/14] migration: Cleanup xbzrle zero page cache update
 logic
Message-ID: <YzwMAeEW/spmeJwZ@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225106.48451-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225106.48451-3-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> The major change is to replace "!save_page_use_compression()" with
> "xbzrle_enabled" to make it clear.
> 
> Reasonings:
> 
> (1) When compression enabled, "!save_page_use_compression()" is exactly the
>     same as checking "xbzrle_enabled".
> 
> (2) When compression disabled, "!save_page_use_compression()" always return
>     true.  We used to try calling the xbzrle code, but after this change we
>     won't, and we shouldn't need to.
> 
> Since at it, drop the xbzrle_enabled check in xbzrle_cache_zero_page()
> because with this change it's not needed anymore.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, I think that's right - it took me a bit of thinking to check it.
The important thing is that once xbzrle is enaled then we must always
take in the zero pages to squash old data in the cache.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index d8cf7cc901..fc59c052cf 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -741,10 +741,6 @@ void mig_throttle_counter_reset(void)
>   */
>  static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
>  {
> -    if (!rs->xbzrle_enabled) {
> -        return;
> -    }
> -
>      /* We don't care if this fails to allocate a new cache page
>       * as long as it updated an old one */
>      cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
> @@ -2301,7 +2297,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>          /* Must let xbzrle know, otherwise a previous (now 0'd) cached
>           * page would be stale
>           */
> -        if (!save_page_use_compression(rs)) {
> +        if (rs->xbzrle_enabled) {
>              XBZRLE_cache_lock();
>              xbzrle_cache_zero_page(rs, block->offset + offset);
>              XBZRLE_cache_unlock();
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


