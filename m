Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202066DB6BE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkv4z-0003Rm-Fb; Fri, 07 Apr 2023 19:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv4w-0003QM-1D
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:10 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv4s-0006nJ-6s
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:09 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso44384573pjb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pwlm1lMKQRjwxkmrW2F8t3gfYFcIvBu5GbvK5p1f3qI=;
 b=WYmgbbs2HSI1ZfANhB99p0It58GikHCFHg8GiCJM3VQAfDfBj7TpC/bvTiV2pJ79UV
 KAS5g4RAW3gC6aKuL00Z27MQAUOxZbmVQcMfZCDSB1r0VuBIuxLsMFHZKi1LaGTK3hGD
 QdhxTCrlzTDRZmVjPx1eYN/x1bPBMtI6NsRmoM2cgteOFw+t/qEnW3IymFjABKUtyO2w
 8JLLbEMqf+MaY87jjDzMDFdSjZ/ZhpXDV5gbgrECBEdb7dvChp+koaU4p/FdyjA+cGPu
 Q4it2C7c8GRxrjcQrXOBMNxBTHsarpA5kw1bkpmHXyGaIy0+DjId1bO+doBUisVu8LKa
 wxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pwlm1lMKQRjwxkmrW2F8t3gfYFcIvBu5GbvK5p1f3qI=;
 b=1nfJk3UPAIHtAG1YJdDyHCR1NMsAbsC98Id8ZTPmnPRsxFuzHLXfCOPXrdyxfDsjf9
 ZOLRDIa53yTRjzfO9iP72JTyLY1Yvg3IuxCfLE3KgjqI/xaTWHjfu/ugcCHH3ZXFW/V9
 Q24t1dpqB3+Ds4EUsYZfle2xWnffY3KxAU3hZKtFVVIRGQXlwPB2PIT5EE7zdCqP3PXD
 x2ldfblP+czepGwGbbHmUI0fmJOEWsMCg1E1Zjwav7yQT5IJhNhmacjbVqbvwb8rcf8G
 Fl8xbyN3mQ4e4rjLNR/OsqpNxnLZNIMY1LL4HJNdWneUZv/R8OIKf96CY41TV92pZOS1
 OWMA==
X-Gm-Message-State: AAQBX9eWpab7a7z9mcJ9gltyjbKGWuzdijbMVsPyDVaYcd92OJpNx+Hm
 2YhxfQDZUcsaJ4gfOaLHf94+8Q==
X-Google-Smtp-Source: AKy350aJv8JM6VFQdChjoum7LkzJsp3BEooDRP1tQQsqzUK9IOYyaf2AaDi9zqTn0y042mdujiyLbw==
X-Received: by 2002:a05:6a20:cd5d:b0:d9:f539:727f with SMTP id
 hn29-20020a056a20cd5d00b000d9f539727fmr4424102pzb.28.1680908463869; 
 Fri, 07 Apr 2023 16:01:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b0062dc14ee2a7sm3505522pfm.211.2023.04.07.16.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:03 -0700 (PDT)
Message-ID: <8174dba8-3d19-58e6-9bcc-cb8b58d76c1b@linaro.org>
Date: Fri, 7 Apr 2023 16:01:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/14] accel: Document generic accelerator headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 03:17, Philippe Mathieu-Daudé wrote:
> These headers are meant to be include by any file to check
> the availability of accelerators, thus are not accelerator
> specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/hax.h  | 2 ++
>   include/sysemu/kvm.h  | 2 ++
>   include/sysemu/nvmm.h | 2 ++
>   include/sysemu/tcg.h  | 2 ++
>   include/sysemu/whpx.h | 2 ++
>   include/sysemu/xen.h  | 2 ++
>   6 files changed, 12 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

