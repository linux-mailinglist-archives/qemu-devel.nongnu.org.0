Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A2592667
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 22:49:11 +0200 (CEST)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNKXm-0001gT-M3
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 16:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKUo-00082T-Sn
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:46:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKUn-0005Ga-6S
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:46:06 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so12897456pjo.0
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RI7Y+FDkoeLoaGFNPjW6MNU68nxwI1g+HTho6Jh8TIs=;
 b=fjA6q8rrJx49wNYfO/Dld0xheaKMHSwrtlJ6ddHXbMefEDXJ7JF7aonesTN/NPKZeb
 OEtQRR02bhhVHtFFstTY2746v2NkxYP9CXyQpeShEXFKhIcFpFZM4XajKWLaFQR+MeGl
 0t0GmIS1YUjD3jldMoZwfIoweKa47SpSMFGvGGAtl6UKc10YIIqFULSjnLY1VQM04B0x
 6VP8n+1Ok5HUthPV5AOP/krT8Z4n8/beQX5Z1yypEUGudPilKLT9VT5XXRKhMusaVLBG
 QEIt908hGFaou9eDiaqspZwTJerPyTp21fOEoWUxHR5gGkVK0902im/DgQx5kiPKktad
 bANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RI7Y+FDkoeLoaGFNPjW6MNU68nxwI1g+HTho6Jh8TIs=;
 b=lkUxPg3lDONbsVxZM9WGyctmME8i4War0MYWqDHObqyEbHrKI6MZwfhB06pr5ugq2L
 4Vn6cOSZ+MtQJlymnaJWLoEREU0/0s/Jl4WPsh3aDJ/buptGzFdrvfc5KaBpHL+p9vw3
 5+nl8YzwoV1aDYZhkKY8qKImYLsIbCHME779WMGyjFCy9LKjYQLd+Eofkdq0g0z0yVAN
 QdjlVNNsKX1RwoITKhrlqE4ous7E6CF2/5F46mTXDuHzmniDOTIz0N5txwJR/lVCDDy1
 KPKObWv2Pjtu++bs/AEHIpU9QMK/0NFWx7KJ7EpohdlhwN1BXU3i297flQzsCmUEUt06
 YnbQ==
X-Gm-Message-State: ACgBeo2amOk87oFKrNalN73d4RGN42DSRXr6xQYo3/31a28ex2T0wtJj
 xHVp4E+s+R16t28WudEPelAaxw==
X-Google-Smtp-Source: AA6agR6fHFV5eUtlTnNRMWcoD3GqsR0/wi9r6GU4YjOXzJ5SwS3jihpit4T50vp7YPUo4s7O0/oNwA==
X-Received: by 2002:a17:902:f70f:b0:171:2572:4f5e with SMTP id
 h15-20020a170902f70f00b0017125724f5emr13386089plo.40.1660509963706; 
 Sun, 14 Aug 2022 13:46:03 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8012:29b7:7129:d9b8:d112:9475?
 ([2605:ef80:8012:29b7:7129:d9b8:d112:9475])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b0016eede528b4sm5755034plk.61.2022.08.14.13.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 13:46:03 -0700 (PDT)
Message-ID: <39e81d2b-794f-c088-c4e1-43e95d580970@linaro.org>
Date: Sun, 14 Aug 2022 15:45:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 2/4] target/loongarch: Trim type name suffix in
 -cpu help output
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 WANG Xuerui <git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-3-i.qemu@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220814145522.1474927-3-i.qemu@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> Also add a header and indentation for each entry, while at it.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   target/loongarch/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index dc233ee209..4663539443 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -416,13 +416,15 @@ static void loongarch_la464_initfn(Object *obj)
>   static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
>   {
>       const char *typename = object_class_get_name(OBJECT_CLASS(data));
> +    int len = strlen(typename) - strlen(LOONGARCH_CPU_TYPE_SUFFIX);
>   
> -    qemu_printf("%s\n", typename);
> +    qemu_printf("  %.*s\n", len, typename);
>   }
>   
>   void loongarch_cpu_list(void)
>   {
>       GSList *list;
> +    qemu_printf("Available CPUs:\n");
>       list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
>       g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
>       g_slist_free(list);

This should be merged with the previous patch, so that we don't have an intermediate state 
where help and loongarch_cpu_class_by_name disagree.


r~

