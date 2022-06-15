Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDDB54CEBA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:33:41 +0200 (CEST)
Received: from localhost ([::1]:50658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vxc-0002Y9-3H
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1Vke-0002ey-Rb
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1VkY-0000M5-5Q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655310008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xtZrUFmx8MSp1Dmj5SflfLJjOf+9cOLWuIlsjH8aEqs=;
 b=ZY0a0mxa2bH188F+P04XgKbseQJSVQR+Pz5EuD3M2AwFqWKNDdZ0XKKeXekw14d56QGLkj
 gv5kGqY9bF5Xg01TkdVmuWTXMgNwQyEpH5C+bsy6mEXh+v/LmvvRnodQ6itSPOTutzlsH0
 CASZoTGvxeoxjgywTR5qfzpMGG5Zw9U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-vLZMuEPBMIa4ZM8NuY78iA-1; Wed, 15 Jun 2022 12:20:07 -0400
X-MC-Unique: vLZMuEPBMIa4ZM8NuY78iA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020a5d610e000000b00213b51a0234so1990339wrt.11
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 09:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtZrUFmx8MSp1Dmj5SflfLJjOf+9cOLWuIlsjH8aEqs=;
 b=3i3PTZF9iTASKWmPWjlLz+I6VmE22DgkNcwXjceEWsdvDcqhGTTeEf3+Llnwu8MtWr
 yOQ+XlYoba9VMBxM2TdNWZtnPOVF//4pPKhNfancSs+Ng849kCLHTFTr+zhmUAe/VF37
 yPlzbxsfP8usJsZR6PFUk3XbUAa0+Z/TS0GursgWHtilquIeTs/4pKLBZEs67Yr4osQB
 DxzVpT7BXCZQKY/qXM+VbfK4DVOGgRz2axa/Hb2/aJNIEwR4jq8JRJYkv3UcKVcaRIDB
 XtbkpibvMITaSDLB6iuKSZAQPHpsfenp+JXdfYDBeOKcZZLjWuvLIifVuh5ananazt4L
 YBcg==
X-Gm-Message-State: AJIora8NfJ+642RzkreKdX91dDk8IiEXqXdwi0fG8q0uFlUsf2qd5Ml/
 Yt7misxKk6SRPyyceID8hYNrrmnx+OhbtwVFSYcuIUfo13he9amMNS92eZSXkt0vcTzg5KAE2dT
 2FZ8EH7LnyOO2Jqk=
X-Received: by 2002:a5d:4909:0:b0:219:f2bf:8932 with SMTP id
 x9-20020a5d4909000000b00219f2bf8932mr549034wrq.585.1655310005800; 
 Wed, 15 Jun 2022 09:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sA9YpoBbubTnzOT3qFGSvfb/ppeYEz8LRPSU1oH2i6sBhY3YixpcSA1PESieMRq4luM8Ed+g==
X-Received: by 2002:a5d:4909:0:b0:219:f2bf:8932 with SMTP id
 x9-20020a5d4909000000b00219f2bf8932mr549009wrq.585.1655310005543; 
 Wed, 15 Jun 2022 09:20:05 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b0039c5ab7167dsm2953548wmb.48.2022.06.15.09.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:20:05 -0700 (PDT)
Date: Wed, 15 Jun 2022 17:20:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 04/13] migration: Export ram_transferred_ram()
Message-ID: <YqoGsuWUEeYd7XfL@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-5-quintela@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index ded0a3a086..7b641adc55 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -65,6 +65,8 @@ int ram_load_postcopy(QEMUFile *f);
>  
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
> +void ram_transferred_add(uint64_t bytes);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index 5f5e37f64d..30b0680942 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -394,7 +394,7 @@ uint64_t ram_bytes_remaining(void)
>  
>  MigrationStats ram_counters;
>  
> -static void ram_transferred_add(uint64_t bytes)
> +void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


