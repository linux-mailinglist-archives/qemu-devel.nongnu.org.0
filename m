Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF505BA102
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 20:53:28 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYtzK-0004ZS-V7
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 14:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYtwn-0001zE-F5
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 14:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYtwm-000763-0A
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 14:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663267847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=602iKMcL96IaiTKV3JtaJ3KbuFw5DYpjtd5NwtB63u8=;
 b=Vcu1BP6nET9RD0yjbamPIIV63v3HRz0fQdz8X0a3viul5QW4H2p5SjTq9DMtQ3fKim74lV
 DYBuIeZFLcyhSn118HNYfNs4K2GmTsbi5clcQoHHy9gA14vVxtVMqZRrDVBsWF+TXpVxZw
 MA7DZSTsXc9/ajiVwnXef9S9/PuTYaM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-WkzutfsVMnup8Jmo2JKSxA-1; Thu, 15 Sep 2022 14:50:42 -0400
X-MC-Unique: WkzutfsVMnup8Jmo2JKSxA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so9968464wmn.2
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 11:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=602iKMcL96IaiTKV3JtaJ3KbuFw5DYpjtd5NwtB63u8=;
 b=cFH6jxrxIRz62b3PxuiRx9hZMrxBt8SAdhNg85fm/jgVetXI4fcPzbuV5hV7L6shAl
 WvpIuMj92nsmoshm7awLgJESiNBLrXPA9qui5dUWLVIAbg1PltZOXqAUdtIGlUozlxuB
 5b2OxToEpFxYMfW0ipHPR2kreGimbEo6YLM/VmJHBAu54TXBqramaFieaVOhQVUnDTQ+
 v1UsPh0HBiVc4bMVWb6iikgwByxwtya/7ZhTg8yHkk6+XXZinTgsRebj7Q59XXdtcUvO
 YbC12b9W0pJUUrYMuHsPWzUrWd/VKnTTenigQI2/SYv0EHdCTBzPM04QuNPtYYJ0qgge
 bqJw==
X-Gm-Message-State: ACrzQf02XDX5P97Uq36/c2EcvwzQp1n0JFc9jYezbfMEm5h78LkE6m0C
 3arj0HvWp4rLGhonBm/Ur42bnF2HT+TPVAI1J0NcweHv7mDLkijBZf++tsw5jpZsD59gpvXNRAc
 DJ0goXU7QBF/vo8Q=
X-Received: by 2002:a5d:4306:0:b0:228:8c9a:7daa with SMTP id
 h6-20020a5d4306000000b002288c9a7daamr656431wrq.555.1663267840739; 
 Thu, 15 Sep 2022 11:50:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62W8QIV2psQUZneW6Yv7UFYgQitRufkmEG38yCuuvV7EvCgfcOgIf1kAjsQnDHyI1+AVoQnw==
X-Received: by 2002:a5d:4306:0:b0:228:8c9a:7daa with SMTP id
 h6-20020a5d4306000000b002288c9a7daamr656425wrq.555.1663267840574; 
 Thu, 15 Sep 2022 11:50:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228de58ae2bsm3383371wrx.12.2022.09.15.11.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:50:40 -0700 (PDT)
Date: Thu, 15 Sep 2022 19:50:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 02/13] migration: Add postcopy_preempt_active()
Message-ID: <YyNz/r3mSzaWQ9eb@work-vm>
References: <20220829165659.96046-1-peterx@redhat.com>
 <20220829165659.96046-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829165659.96046-3-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> Add the helper to show that postcopy preempt enabled, meanwhile active.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..8c5d5332e8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -162,6 +162,11 @@ out:
>      return ret;
>  }
>  
> +static bool postcopy_preempt_active(void)
> +{
> +    return migrate_postcopy_preempt() && migration_in_postcopy();
> +}
> +
>  bool ramblock_is_ignored(RAMBlock *block)
>  {
>      return !qemu_ram_is_migratable(block) ||
> @@ -2434,7 +2439,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
>  /* We need to make sure rs->f always points to the default channel elsewhere */
>  static void postcopy_preempt_reset_channel(RAMState *rs)
>  {
> -    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
> +    if (postcopy_preempt_active()) {
>          rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
>          rs->f = migrate_get_current()->to_dst_file;
>          trace_postcopy_preempt_reset_channel();
> @@ -2472,7 +2477,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>          return 0;
>      }
>  
> -    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
> +    if (postcopy_preempt_active()) {
>          postcopy_preempt_choose_channel(rs, pss);
>      }
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


