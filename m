Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15873F255F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:35:15 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGvJK-0007Ej-7N
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvIQ-0006Yq-LH
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvIN-0001Ko-B1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629430454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJgtMuqXVzmsgPkS5vuJPvyTU/ja0sEt2vPINRe0It0=;
 b=Ysi2AE5qmpLE4yB6nWEFc0tJ2XYIPjaYQkRkC6AyzpUfDhvs8Zk2XZZKTBisEWSucovirp
 BvzxLdCKioukLekU0ZiF50qPlUEPVfsfDEuFpQiGJOKDufBswIFCk/10jwjxNj4tguM2eM
 FHi6qJ6gbTtTmG/fuidHjmfibnZZIF8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-K5fYVXMVMCiQMWssU9_Rlg-1; Thu, 19 Aug 2021 23:34:12 -0400
X-MC-Unique: K5fYVXMVMCiQMWssU9_Rlg-1
Received: by mail-pj1-f70.google.com with SMTP id
 t16-20020a17090ae510b0290178bb9f2f04so4025331pjy.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sJgtMuqXVzmsgPkS5vuJPvyTU/ja0sEt2vPINRe0It0=;
 b=Q+GUhqCGWg8LqZBgbV0GtGbv8Qzq2D8gK/FW/Vh4JKFvs2P0rjCKB6BqRGeAodWBJ/
 hk7OXsh9boPg9hRUTuqvEUCIUnMMkbftUMmetdqq7ZCPB3+ZB0r7xI4N94ZFA8FjMa3Q
 oE29QKcLGys28TZdjcpHK8DVGsm65zF+etpnOIvWbDqR5f97HhKs4cA4bfIR0lt2GxC2
 BQL366gK/LV7qe6CbaXQs2dYKG4s6fD6sBgbi/R8VyZL42MlYQnCjj/PJZaxPdD6QMwJ
 27fT1wlGe6rY6qxJNLjjjF48EUoDmqVVJYIZiQqtOmskaJCSIjuzMBZM8cOjp1Bf99C8
 QqYw==
X-Gm-Message-State: AOAM531ifaPH8g4UkV5WYJMGSzE4wnA2ES0RpuGgDl15aay8JFcmy+qI
 cx5X720IO1vUXj7nd+lKQ/nHDfJ67/MGwVchzi7dEqf8JhKL4aflG36K0mBDelMFa61Q93tcMdl
 EW9Yji/+4hartQiI=
X-Received: by 2002:a17:90a:4584:: with SMTP id
 v4mr2332820pjg.169.1629430451910; 
 Thu, 19 Aug 2021 20:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQjDAZW5G41VndI2yAZjrs8NykRCTcoEJJYHh7qzVElzOq3H5VzsDtksJvlGoCAv/I7/lMVg==
X-Received: by 2002:a17:90a:4584:: with SMTP id
 v4mr2332803pjg.169.1629430451663; 
 Thu, 19 Aug 2021 20:34:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u21sm5966159pgk.57.2021.08.19.20.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:34:11 -0700 (PDT)
Subject: Re: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 yuri.benditovich@daynix.com, armbru@redhat.com, eblake@redhat.com,
 berrange@redhat.com
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-2-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0cb9e90f-0d9f-8b31-f459-578a8fa90c7e@redhat.com>
Date: Fri, 20 Aug 2021 11:34:06 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210713153758.323614-2-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/13 ÏÂÎç11:37, Andrew Melnychenko Ð´µÀ:
> -static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
> -                                            uint16_t *indirections_table,
> -                                            size_t len)
> -{
> -    uint32_t i = 0;
> +    ctx->program_fd = program_fd;
> +    ctx->map_configuration = config_fd;
>   
> -    if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
> -       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> +    ctx->mmap_configuration = mmap(NULL, qemu_real_host_page_size,
> +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> +                                   ctx->map_configuration, 0);
> +    if (ctx->mmap_configuration == MAP_FAILED) {
> +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration array");
>           return false;
>       }
>   
> -    for (; i < len; ++i) {
> -        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> -                                indirections_table + i, 0) < 0) {
> -            return false;
> -        }
> -    }
> -    return true;
> -}
> -


It looks to me you want to drop syscall path for map updating 
completely. I think we'd better keep that for backward compatibility?

Thanks


