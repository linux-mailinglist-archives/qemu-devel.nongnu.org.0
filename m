Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E95E6A1D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:58:56 +0200 (CEST)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQTP-0001qT-On
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obQE7-0001s7-Jn
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:43:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obQE4-0000T3-6O
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663868580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gmgT3yAuWbBUK6F8N2CMLvjrjUZKwaateJh/tU8dhB0=;
 b=XwH5p8ye0bwxO3qS9jfFe/oJTuLvtfGzB94weaeoB/gbm/7V+YKEwMF+Th921/66nwO0PX
 279G20L6QpnPwmm3+h2MJlRxBPF/hwtT2adH62ANQomZToB+ZR8Q+npyWZ50suZZkB9oZ2
 zEvGavwh41Yz9aZmajHPyCiJtnGQ1Wc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-w2xb8p-kM06KRhsh1_LjmA-1; Thu, 22 Sep 2022 13:42:58 -0400
X-MC-Unique: w2xb8p-kM06KRhsh1_LjmA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u27-20020adfa19b000000b0022863c08ac4so3513914wru.11
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 10:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gmgT3yAuWbBUK6F8N2CMLvjrjUZKwaateJh/tU8dhB0=;
 b=I3X/aNBOEX/T45HyJNNLffmWb9SyRy1HBujthev/HncaDcErJZvMUjqqwlASuKvXpP
 DMsCW7rbMZrqog9+9QrhwOqIeX2YvpvI0oD5yYOgI6VSt02AuuFu35f/LUZwBARCME7V
 2BHy3OFmzRVTjgv7Wx7lgqxa7qTNKg6xaPW2nmxFySULFdreqfM37/fkfuKRE7oumQLj
 a/l06GcHD+DQu3vhPa+8f9PZKJe/pYOhZWp/8HPWnoT7F9K8QlGVOolxvDM7hEpTjWTt
 GLt8E4v8fqwTN6rLyam2sAlPpsImU0iPVyg8Egxqjg6yCt73EdvErTjgMF/JVvSKgJ3G
 JoDQ==
X-Gm-Message-State: ACrzQf3PVQnby34DeV1ALcWGOng/ftcu8WLMtims8jNaiukTXazrrqaQ
 cgkPpRi0PxGncEzhGBoOWvylUtM4LJCG5Sj8fVvet75ztWz1xlEyPWRni3hD5fE2c3aMp9bJVPj
 1eBk7FqYZyTPHhBg=
X-Received: by 2002:a05:600c:2949:b0:3b4:85b2:c1d7 with SMTP id
 n9-20020a05600c294900b003b485b2c1d7mr10223437wmd.183.1663868576962; 
 Thu, 22 Sep 2022 10:42:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FLwxetdCZyft33feA+NRHfWE+nOpX/JAX0/bJw8BttYRe6BTID+jytu1bfKpjKPfCM9WnAg==
X-Received: by 2002:a05:600c:2949:b0:3b4:85b2:c1d7 with SMTP id
 n9-20020a05600c294900b003b485b2c1d7mr10223423wmd.183.1663868576763; 
 Thu, 22 Sep 2022 10:42:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003b340f00f10sm156331wms.31.2022.09.22.10.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 10:42:56 -0700 (PDT)
Date: Thu, 22 Sep 2022 18:42:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] migration/ram: Fix memory leak when using x-ignore-shared
Message-ID: <Yyyenk4Qu6nWMsJD@work-vm>
References: <20220916084442.1349996-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916084442.1349996-1-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

* Nikolay Borisov (nborisov@suse.com) wrote:
> During ram initialization for migration dirty/clear bitmaps are
> allocated for all migratable blocks, irrespective of their shared
> status. However, during ram migration cleanup those bitmaps are freed
> only for those blocks which aren't shared, in case x-ignore-shared
> capability is used. This leads to a situation where the bitmaps aren't
> freed for such blocks.

Can you show me where you're seeing the allocation based on MIGRATABLE?
I'm looking at ram_list_init_bitmaps:


        RAMBLOCK_FOREACH_NOT_IGNORED(block) {
            block->bmap = bitmap_new(pages);
....
            block->clear_bmap = bitmap_new(clear_bmap_size(pages, shift));


So that's based on NOT_IGNORED.

Dave

> Fix this by switching the cleanup code to also free bitmaps for all
> migratable blocks.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc68..2e40166d2f9e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2678,7 +2678,7 @@ static void ram_save_cleanup(void *opaque)
>          }
>      }
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> +    RAMBLOCK_FOREACH_MIGRATABLE(block) {
>          g_free(block->clear_bmap);
>          block->clear_bmap = NULL;
>          g_free(block->bmap);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


