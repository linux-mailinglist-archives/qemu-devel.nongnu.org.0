Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7A4E90BA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:04:29 +0200 (CEST)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlIa-0004KH-In
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:04:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nYlFS-0002mc-6n
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:01:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nYlFQ-0005Cc-HH
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648458070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J39e8FA2XtscteLJdIcwcztYWilj7EA5WfvxF80HFyA=;
 b=UNNF90TGYvb08fetxcpRfkoseCrNJJTYElmMcWnNeJ8AN6uiUH5DuHCdnAT1gFJMmviKv/
 ZJ8ySEH2rdiAwCalftmTJKsyMX7N9deGsuGMuobPSh06yGALfhpUiYWU1EEEUAZN0QKkKq
 Dz4p4TIDnz2pAWdzT+OpFH/LGeyUCxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-gkHYF0h_NiyS-Y_IZ0D9Vg-1; Mon, 28 Mar 2022 05:01:09 -0400
X-MC-Unique: gkHYF0h_NiyS-Y_IZ0D9Vg-1
Received: by mail-wm1-f69.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso5434925wmq.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 02:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J39e8FA2XtscteLJdIcwcztYWilj7EA5WfvxF80HFyA=;
 b=rtOTrFJvhCrjYAEzOxYqJMp/ZJ4g1oHIoNyt6WwLLOnzNFBK+pnbptxiybElHM6E8X
 iDIi1cjEBJ8So1A7X1Y9w2YlgwC3bhCqgOOcGj4iSw7gQ9FuugzFjJBbWyFfXDeYFzpS
 g32XBJePfzVef6L4mjtHhKPqQ4OMJoh2FMuSQ1z3E4HxsOJhUrxvKVFT1OnoXi89adjE
 FXVqxnP4Z0S3TevivU1zbUS4DJgI/kgaHyR7qXw+rYYnFUSOcqTyMgdbqDR7SHpqmG3x
 bRvhlv3x4wYiv2P+5arNSH8CekzTnGuoNPXg4BA7JfcseyPl5KlNfiVzuHZ07Rvon/pH
 2w9w==
X-Gm-Message-State: AOAM531gErCMA13lXUM/MNdyOj0gAB8m0uoLDQDI0101rK+Mme810KCE
 Y/Bv4QYm6+9rswgk9XF1JfDgAY8OrbTifMHH+85MWxvibcKQIGGwzH3SJW6dSYzlNzwFa7F2ce3
 c4XlcqGgbMKtH350=
X-Received: by 2002:a05:600c:1c1e:b0:38c:b393:b355 with SMTP id
 j30-20020a05600c1c1e00b0038cb393b355mr24605595wms.92.1648458068045; 
 Mon, 28 Mar 2022 02:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIYMyhAytQbcRXj2ENodNFltFxcfnO8rWrPMzQqlh9oz/SKXTOETtyxNo/On8Yq+U2PExVGw==
X-Received: by 2002:a05:600c:1c1e:b0:38c:b393:b355 with SMTP id
 j30-20020a05600c1c1e00b0038cb393b355mr24605534wms.92.1648458067536; 
 Mon, 28 Mar 2022 02:01:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:2200:50d1:ff5c:5927:203a?
 (p200300cbc704220050d1ff5c5927203a.dip0.t-ipconnect.de.
 [2003:cb:c704:2200:50d1:ff5c:5927:203a])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm12350665wrg.70.2022.03.28.02.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 02:01:07 -0700 (PDT)
Message-ID: <73ff23ac-c4db-f0f1-e3fa-5041cab5b89b@redhat.com>
Date: Mon, 28 Mar 2022 11:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/5] s390x/tcg: fix format-truncation warning
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-6-marcandre.lureau@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220328084717.367993-6-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.03.22 10:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../target/s390x/tcg/translate.c: In function ‘s390x_translate_init’:
> ../target/s390x/tcg/translate.c:224:64: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
>   224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
>       |                                                                ^~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  target/s390x/tcg/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 5acfc0ff9b4e..a082342a0424 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
>  
>  void s390x_translate_init(void)
>  {
> -    int i;
> +    size_t i;
>  
>      psw_addr = tcg_global_mem_new_i64(cpu_env,
>                                        offsetof(CPUS390XState, psw.addr),
> @@ -221,7 +221,7 @@ void s390x_translate_init(void)
>                                     "cc_vr");
>  
>      for (i = 0; i < 16; i++) {
> -        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
> +        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i);
>          regs[i] = tcg_global_mem_new(cpu_env,
>                                       offsetof(CPUS390XState, regs[i]),
>                                       cpu_reg_names[i]);

Ehm, what?

How can "r0" ... "r15" ever consume more than 3 bytes + "\0"?

-- 
Thanks,

David / dhildenb


