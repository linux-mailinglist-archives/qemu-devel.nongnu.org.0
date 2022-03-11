Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E84D6934
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:49:37 +0100 (CET)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlGa-0008WN-Bb
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlEH-0007g5-TR
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:47:14 -0500
Received: from [2607:f8b0:4864:20::52b] (port=46752
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlEE-00006H-4a
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:47:12 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o23so8251898pgk.13
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D5FgLNX3TUKzQdNoEEHT6Yym6MDSZ7zRBDaUM3HI9GI=;
 b=IYqGi296aLWGU+qad2T1L5MpHDO5lVmEIcYfi6N1YkKhF1qqvosSifGfsN+fHh4mqc
 Quu0Uz/6Vm77wECWPAh+ht7ix5IVMH3omtYvHhmcuMGRPs9odwPYTSV7XWz6IvdfMIP3
 8PufYquSpYC4454YS+fQTGa7kTM3tCQPzTBkMpt0PodBK657DxbYBkkw+TlGGbaaMAOx
 eZxFssZV1Tq3RMgaj1hSjP+5QkHyXLtf/QNTN75jAhaDusDawQXDuWVlx5IK9kpVXmR/
 XIUfN6wrsS1MXqIUcKi4WmeDlAnDgtS4OmfMZ/KJzKgjUMUeI+yKGcvALEwJEqYRBYOs
 wWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D5FgLNX3TUKzQdNoEEHT6Yym6MDSZ7zRBDaUM3HI9GI=;
 b=z+bxlBFQfpZejBM9wReBQL9DjyqurEdy5GCTfGQ+pZkHs7w/ck574Yn6QwHe+G9V+2
 ngt9pYliNIOMvw/HQYlgJn3hQC2Tf7H0DU0c98cPELrkGIAey7rGZSDsWSiwdA5RCWQS
 ixZUty5wOa41VICEApFgfQBDBy3bmEGBpRyeuijO/aFY8wm+wFopwMxC03HmFQ6cs2lc
 jbN8/eM6Fip+wDGvmv97m8BFmNHcoeBTA6BUBfYWw8TL3GMsJq/++PuRX3kGBkjUGDbk
 IBM/48qG/mqaTU2xLpuyd8qNNYNG+/hO4BoD/KX3RnKY8TbTp4I3QoBSZdQ+iqDvRwwQ
 Y1zw==
X-Gm-Message-State: AOAM532R0ITJGx1Q1pqEvPJRqEgim6nrvwJb5oc3YfZDUqA86BWG8F+j
 PPDaFjDY+lDzIr051/aYS3V3uw==
X-Google-Smtp-Source: ABdhPJxRtiHf+JLPm79fnY1XSeDZIvGn0RD0Yf4xMY30PZFR44kqaywpT7HX+swyn4fGx2QV5WtZ+A==
X-Received: by 2002:a05:6a00:1703:b0:4f7:9d5d:800b with SMTP id
 h3-20020a056a00170300b004f79d5d800bmr2122277pfc.56.1647028028611; 
 Fri, 11 Mar 2022 11:47:08 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00084d00b004f79504ef9csm2690228pfk.3.2022.03.11.11.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:47:08 -0800 (PST)
Message-ID: <740d048c-0cd6-6730-f371-eae473d7e2b9@linaro.org>
Date: Fri, 11 Mar 2022 11:47:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/9] dump: Introduce dump_is_64bit() helper function
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-7-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-7-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> Checking d_class in dump_info leads to lengthy conditionals so let's
> shorten things a bit by introducing a helper function.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   dump/dump.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -1007,7 +1012,7 @@ out:
>   
>   static void write_dump_header(DumpState *s, Error **errp)
>   {
> -    if (s->dump_info.d_class == ELFCLASS32) {
> +    if (!dump_is_64bit(s)) {
>           create_header32(s, errp);
>       } else {
>           create_header64(s, errp);
> @@ -1697,7 +1702,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>           uint32_t size;
>           uint16_t format;
>   
> -        note_head_size = s->dump_info.d_class == ELFCLASS32 ?
> +        note_head_size = !dump_is_64bit(s) ?
>               sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);

It would be nice to standardize on positive tests, which in this case would reverse these 
two conditionals.


r~

