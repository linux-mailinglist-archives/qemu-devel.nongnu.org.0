Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD26CCAAD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:35:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phF4y-0007W7-Fc; Tue, 28 Mar 2023 15:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phF4m-0007Tx-Rn
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:33:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phF4k-00050u-FP
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:33:48 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o2so12739042plg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680032024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKP2GCRKol3CPItbqM3xQ3CW0d2VmOhoR7+lWYB5jIU=;
 b=ebBS3onSOZ0EBVWjeh4o7Ac+L35GGlA13ir8HSSFOERM14ZXgnK8g056u8HaclWdIx
 Kcepw7oISzZgPZORGWke8scSp963sKS+YVFkzIAoQf9es/3yKSnnVx/gMfcdUGSjm8Rf
 WskM/g37VTiNELEMfU60hUK4lyR1zpi1a8AGO7MiFA+TgPF3yT8FHm3q2F/XASix7fTU
 mHXCjqEd2EL+6kUZKuEOT7aV3wPklRIPGUvF/+HBiRjBEpb4mJsz58XBFyWlShpvw5zd
 aBBSD0Wwu8n6A9u6EqPhytGFQNwnJCqrZzBA729dYVxJ/z6lJuyuZT3mgrRoLI7t9VGW
 cbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680032024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKP2GCRKol3CPItbqM3xQ3CW0d2VmOhoR7+lWYB5jIU=;
 b=NrkKoJt2A5QIHi2xz4ZN/Agyvx5tTfYuIixH+CGvBz4KpOfrybFfUToM+7aJg5lpEF
 aTEWdxUdi0+REZPavnlbrq6EdNYFzrxTHfRBVC3FfhpnIoUDVJHIWdM/6IkdSCY2FoLT
 LoOrT1KRvmadwiFiQgeTx1t5d9KODG3EFD1m+GZ66A2g+3TWavNu9UmgVMW+RWz7aMJN
 87zdZHkMlhRN5m/n8QS6pZsrm0369zkATdJHOyOqnhF/o0QG7l4D2rSHGBXA9MseZahl
 1i8OPQXwT50XBvHLK5HMYkdiYtO1RFJvnFQ39Y8cX1GCS6IFbTFcwLXBzl3C5ffKX//6
 ATqQ==
X-Gm-Message-State: AAQBX9cvI6GnX/KxHEmNqi7Bf+0/WYo3pSl1A9TBfq44BDRNQoM88uk1
 LZkeGUeIVakyPFE+L4mrDcuykzjMu7s1ZYXxU1o=
X-Google-Smtp-Source: AKy350aQhu0ofPWcsIjvBC4bVDDeIenB05o6Cki4W4jmub6SNccpnNHNasWdOPt0fZ0NQC2TZenP+g==
X-Received: by 2002:a17:902:e744:b0:19d:1fce:c9ec with SMTP id
 p4-20020a170902e74400b0019d1fcec9ecmr20287924plf.37.1680032024224; 
 Tue, 28 Mar 2023 12:33:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902ab8c00b001a1a9a5e53fsm4894588plr.136.2023.03.28.12.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:33:43 -0700 (PDT)
Message-ID: <2ee648c3-b8d9-ee53-32ea-5aabeeeb0168@linaro.org>
Date: Tue, 28 Mar 2023 12:33:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 02/44] target/loongarch: CPUCFG support LSX
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:05, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c | 1 +
>   1 file changed, 1 insertion(+)

This patch should be sorted last, once the entire extension is present.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



