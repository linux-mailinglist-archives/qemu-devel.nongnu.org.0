Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A9337018
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:35:23 +0100 (CET)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIey-0005Zj-Om
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIbt-0000w7-G3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIbr-0004wI-9B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Neu3DvZRK4wppMt07M8KhordXQzWgQBnGIG6IonsBE=;
 b=YF+OVO81mPI3pWdUc+5CE4Kqj/cUAw3oLFLF4GoLa6XsmsuL50G1/L06vHy4pBa8w2ew5X
 V2GCoS91YN17+FS+eKzv6jYJclV8pbmegFpaLOB9Xzux9qHEIbWXjG1vq48B/ZMiQ1H9S3
 3l6wgddNP6iOYgmp99eWy5qYV5CVGNg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-_3bfCGhGNH2-CMhDO5bNVQ-1; Thu, 11 Mar 2021 05:31:58 -0500
X-MC-Unique: _3bfCGhGNH2-CMhDO5bNVQ-1
Received: by mail-ed1-f72.google.com with SMTP id k8so9670885edn.19
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Neu3DvZRK4wppMt07M8KhordXQzWgQBnGIG6IonsBE=;
 b=gKZ4vFs7hG/8+7DM9uozvTOzmSRtsz5dkkgjqdErnnS+5zDDDuYLrTWJzNaS/tzTEU
 cS5dN+0KdPu9rB9OU1RQrPPRYHVVel+BBf6twmG3huKy3fwfHtVBGipg0nH3D58J7Hnr
 eXbJK4kB/3fl0D/k5c9XpfPRT4DcbaW7C4Lr0tsjmPPg6T4q1d35V7rMMGPYUI2qKCwk
 lf6UwZsv1sl46YwCOiu54+Ssg3Dl+fzFyr6xZLZSJCNLtRHlghRKsqN+g+mEBe/4EZ9v
 pnKfpgpzUsx7gNu3COdz+Bh2se4+zcQG/D5kCkhwEZcm37BzWegxQiCBnbM9qpyoQ55c
 gXSw==
X-Gm-Message-State: AOAM533bL5huv2dizkdEeA8w2lb7DuFR8gb5bvCJqSbfdLyO+kblSuWa
 ef8Kieh/2UrXWkvHM7QYfPLQuhdmifGCe2rzVUOp1WJBsQovmu7JKYvnUk1EzK28q7o9ksiYL2I
 5h4sm4wIRLKVvWbI=
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr7901557ede.271.1615458717561; 
 Thu, 11 Mar 2021 02:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNvkZXsUa08559TllB1CHUAyzbKAxPhOEHy0PsWK8BiH/fHJEsxT05QXON00kLmnh7cMjz3w==
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr7901543ede.271.1615458717429; 
 Thu, 11 Mar 2021 02:31:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i2sm1057548edy.72.2021.03.11.02.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 02:31:56 -0800 (PST)
Subject: Re: [PATCH v1] softmmu/vl: make default prealloc-threads work w/o
 -mem-prealloc
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c59f700a-3836-6121-7c4e-a811ec486808@redhat.com>
Date: Thu, 11 Mar 2021 11:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 09:59, Denis Plotnikov wrote:
> Preallocation in memory backends can be specified with either global
> QEMU option "-mem-prealloc", or with per-backend property
> "prealloc=true".  In the latter case, however, the default for the
> number of preallocation threads is not set to the number of vcpus, but
> remains at 1 instead.
> 
> Fix it by setting the "prealloc-threads" sugar property of
> "memory-backend" to the number of vcpus unconditionally.
> 
> Fixes: ffac16fab3 ("hostmem: introduce "prealloc-threads" property")
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>   softmmu/vl.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7db..e392e226a2d3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2300,14 +2300,17 @@ static void qemu_validate_options(void)
>   
>   static void qemu_process_sugar_options(void)
>   {
> -    if (mem_prealloc) {
> -        char *val;
> +    char *val;
>   
> -        val = g_strdup_printf("%d",
> -                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> -        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> -                                   false);
> -        g_free(val);
> +    val = g_strdup_printf("%d",
> +              (uint32_t) qemu_opt_get_number(
> +                             qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> +
> +    object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> +                                false);
> +    g_free(val);
> +
> +    if (mem_prealloc) {
>           object_register_sugar_prop("memory-backend", "prealloc", "on", false);
>       }
>   
> 

Queued, thanks.

Paolo


