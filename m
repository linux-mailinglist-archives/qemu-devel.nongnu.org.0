Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D04E2539
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:28:20 +0100 (CET)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGCx-0008OH-1y
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:28:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGAx-0007do-IW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGAv-00072C-Hr
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647861972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDzlYuvnjQEazMnQqHBt+RltLGHmVkgOciIfkrtV6Q4=;
 b=duyzis+ai5jpQkX/DeMcn6H7aL0smSJ83opY0gS1nUbMv+mPBxcj0eyB2DTEK8gmcT3ZWL
 AafgqvKa+0bzdRJkiSaEBz4qpF5Be3g7x3E9eC/54A4hhZZUr9QLLBH+HsnPqGFSTV91zM
 6WTyCTJC9EFP5T3XVA9Hig2A/IMh5So=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-gHceYrNhPEOJVmjkJvL9hA-1; Mon, 21 Mar 2022 07:26:11 -0400
X-MC-Unique: gHceYrNhPEOJVmjkJvL9hA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m123-20020a1c2681000000b0038c9e1197f6so1415945wmm.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IDzlYuvnjQEazMnQqHBt+RltLGHmVkgOciIfkrtV6Q4=;
 b=sO3Qsv8cjEM/IiBwCbKSwSVHf6anyLSeK0TjFC9hUFmy+PdVd/ZJfqSQ1Z5GJhFLe2
 W0P4/gNj1+2l63tCcHYgD+S+F1geW1j+oGhJ3hyI0o/lsFUdq7AJJ/jL1fI7AffpjOs+
 UAwmgJ7N3wtpYV7X+xenrHslfsx3sPAJXPi4EXF2pmykbY969qgl9vPFE6dJOcxGWXZh
 I+JOTbfcAO0oXMHg9raihtj14o3M06DuTa6kXvNLkOma9VmJdXpRyC5wUP4u6HaA3CQE
 Pmwp/GhviwwGVw3NYLTrCcpYWGyPlKO7SIsSJmMTrA7P/AbVWPAeR/OpHebV9zSq1usY
 15lg==
X-Gm-Message-State: AOAM531WXfkTv4BID7onqPB6yOwa12gT/gGqiuVumEOLN5pLg3OWv6LK
 xPau7qtFn/P8pweGRslWeAiBfvKWn38nNztdSZvM0Ilv8QIt+VDzVCsru8+hXcmlUXN0kgy8sc2
 hfKLVtGRAoPb3yyU=
X-Received: by 2002:a5d:59ac:0:b0:203:9ef3:b58 with SMTP id
 p12-20020a5d59ac000000b002039ef30b58mr17492565wrr.583.1647861970358; 
 Mon, 21 Mar 2022 04:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNz9t6ElA3J5BMtvNCknvwMPwGwVHrQWlqnt8GW8xR8p4lTAfig+Ra1qDeh5u/60A8sluLgw==
X-Received: by 2002:a5d:59ac:0:b0:203:9ef3:b58 with SMTP id
 p12-20020a5d59ac000000b002039ef30b58mr17492546wrr.583.1647861970126; 
 Mon, 21 Mar 2022 04:26:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a5d628c000000b00203e2fbb2absm12253280wru.113.2022.03.21.04.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:26:09 -0700 (PDT)
Message-ID: <0f8a6662-0f7b-3200-950a-def3d3b3dbf9@redhat.com>
Date: Mon, 21 Mar 2022 12:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 11/11] target/s390x: Fix writeback to v1 in helper_vstl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-12-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220308015358.188499-12-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> Copy-paste error from vector load length -- do not write
> zeros back to v1 after storing from v1.

Fixes: 0e0a5b49ad58 ("s390x/tcg: Implement VECTOR STORE WITH LENGTH")
Reviewed-by: David Hildenbrand <david@redhat.com>

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/vec_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
> index ededf13cf0..48d86722b2 100644
> --- a/target/s390x/tcg/vec_helper.c
> +++ b/target/s390x/tcg/vec_helper.c
> @@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
>          addr = wrap_address(env, addr + 8);
>          cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
>      } else {
> -        S390Vector tmp = {};
>          int i;
>  
>          for (i = 0; i < bytes; i++) {
> @@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
>              cpu_stb_data_ra(env, addr, byte, GETPC());
>              addr = wrap_address(env, addr + 1);
>          }
> -        *(S390Vector *)v1 = tmp;
>      }
>  }


-- 
Thanks,

David / dhildenb


