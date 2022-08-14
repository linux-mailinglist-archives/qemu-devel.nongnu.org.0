Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E2592665
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 22:48:16 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNKWt-0000q4-5b
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 16:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKTl-00079t-77
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:45:01 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKTj-0004wD-L2
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:45:00 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d20so5256438pfq.5
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=X7ZWeoxQsnusplR6McwcxrW7AJn5dQokMfblBL/51C8=;
 b=skWQLquaNdPcSGgNS9+j16uMunhY5bH3p8M2pVbBflfBQ1qW+JWJIUuyt5LpXErJli
 m5nNRgt32hysWXZMLnunMdHPeUPxRx0KHM1+YprMp+g9YBul701Mx1hhH3JxWnCp1OCs
 YD1vzDu/5/Rq8kpkczEtJMHkkci/taDHl0DURGgOe5auE1x8fN6DqcipftosN+3Ov+fS
 2hfMBlqzRXie+0Z61WfimaVtqXmUzFuc8YDc0gnw3MCqmn/PR0eAx1XQbDrJE9SXKF+h
 NHkrEj6hFHTRF1/uETMH3YPdQlgKYmlWtOO+MOMgDENr6LVlOEP5U59qaT3Tq1L9WyvN
 q+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=X7ZWeoxQsnusplR6McwcxrW7AJn5dQokMfblBL/51C8=;
 b=0wHnDZqgYGgvHDFspW4GBpszB4lcGyI68sgOziJaVM4oYATaBSHfiTRLv918LaB5Cj
 D5g87+phz/PQLxiF2yUQyg+OemqlHmwZmaEr2owZ3aCfPXT6AqP8+ikomt5ijY6HWEsT
 wiV3lqAzcJcRKsbGy56X8tQSV6z2jxK39Hht29LitpxuDbLS7hdSs+gm/je+AG05hyXd
 936di3+liLwweZLBNuda1CC1pOMtnzAJ1YU7+fm5ja3moeRgXIvU7dJndN6pQ9ByNDm0
 Jt9mRc6TYZpucE9Ys1q1//mpJXTvPgvht4/VRNvr17eHnjGstHs288Zw7Sc1tlBTY+nj
 8dGg==
X-Gm-Message-State: ACgBeo0DpOrPAn4DBEmeu0HijzruZ9jJ2XqAP1EHtRix4466pxqYFOI7
 ENBR968aakbzrfRUVoP66WKACQ==
X-Google-Smtp-Source: AA6agR5IUXMmWUmWorlsL9sAgN0K7AO7h0cK6puT5CBrxqGLB7bPqfJsg5tgBT/UcTSJWMhGyAywLg==
X-Received: by 2002:a63:d64e:0:b0:41a:b83d:1b2a with SMTP id
 d14-20020a63d64e000000b0041ab83d1b2amr10793321pgj.122.1660509898211; 
 Sun, 14 Aug 2022 13:44:58 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8012:29b7:7129:d9b8:d112:9475?
 ([2605:ef80:8012:29b7:7129:d9b8:d112:9475])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a1709027c1000b00170a757a22dsm5733616pll.253.2022.08.14.13.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 13:44:57 -0700 (PDT)
Message-ID: <4fc36e84-08c8-d17e-241f-59f7ec205f07@linaro.org>
Date: Sun, 14 Aug 2022 15:44:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 1/4] target/loongarch: Only allow short -cpu
 arguments without type name suffix
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 WANG Xuerui <git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-2-i.qemu@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220814145522.1474927-2-i.qemu@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/22 09:55, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> Previously both "foo" and "foo-loongarch-cpu" are accepted for the -cpu
> command-line option, the latter of which being excessively long and
> redundant, hence unwanted. Remove support for consistency with other
> targets and simpler code.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>

This breaks testing, iirc, which is why both were accepted in the last change to this 
code.  You could allow just the short name so long as you don't try to provide the long 
name in hw/loongarch/virt.c.


r~


> ---
>   target/loongarch/cpu.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 941e2772bc..dc233ee209 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -573,14 +573,11 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
>   
> -    oc = object_class_by_name(cpu_model);
> +    g_autofree char *typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"),
> +                                                cpu_model);
> +    oc = object_class_by_name(typename);
>       if (!oc) {
> -        g_autofree char *typename
> -            = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
> -        oc = object_class_by_name(typename);
> -        if (!oc) {
> -            return NULL;
> -        }
> +        return NULL;
>       }
>   
>       if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)


