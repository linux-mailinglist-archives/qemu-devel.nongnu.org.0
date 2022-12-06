Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B8644852
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:50:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aCS-00011h-0J; Tue, 06 Dec 2022 10:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2aCQ-0000zf-D5
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:49:38 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2aCO-0004ks-IM
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:49:38 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1447c7aa004so9737856fac.11
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FVA1HNkyQPXZj6hsT2L4dugKZjtxPXtQ/2GSecKzXfQ=;
 b=T337VO/otrv4xoijpZmj7fHVYE6+bpNgTwPBnKoK3IySYsNtv5c2G6tP8+ibps3ZRJ
 a6xDoxSGyTSo1iLVTHMHfOkaudwPVff77zezhYn2bmgkh7pPX8gI046T3lMTdpfxURfs
 JhViJq46AnNoR1XBmM8uaK8wvUofHtHAEYfzNC3RXfmS9E+k7LJwqsAAzaJJ2WvNd9l7
 xuQsWnt1HEW629GZMYown6nfW/gyk7GYm/Z97tlUjOmwWmSlQeBObdS6N5134HRWfLfD
 zkdunsoQP2fGf15et8BYlzy3HDVgvFNbjBv9CnS4vI4uLrXfQWGR00qNlp8U1JYR8Zoy
 aTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FVA1HNkyQPXZj6hsT2L4dugKZjtxPXtQ/2GSecKzXfQ=;
 b=xtJSY0Co0w7I9kJ+rYvEyElvsgflD4+5KvXW1UVDprr7BeP7/jyecZ7C+ueWfNtSnu
 vvDIh2HLjBUVoKv85NS2NqtYLLwB8h8MqT/E8VmzsYi6TAMHinEumrZhyy8Ij3BM9mkI
 iv/z/SCDdTRj0rlGXGqRoX2BhFw8Xj4clHlQDPKFPd7nEmOq/fTlZNUVfvV5kmCNAAni
 PCPS8Jxtt9vPa1PE8PAO7v/CzIHnvkDnuNe2VJi0J+dbcoDpoKIaN5buwVafx3ULdvm4
 CWqthP+gnw7SoAv+pOZ+Rp8GG4KvCMxJJO+4LlVhNRLRfOGsGAyX/7ghZSn5fkeQ4Ijh
 gu6A==
X-Gm-Message-State: ANoB5pnuW1HrnybwIqNo1I6R6mOoAg5FI2x0GwyEs0ANDa3AkSyB1zBs
 se5JnTXng+ip7fOV9OIvDba2Ufb5Cp01xHuIAts=
X-Google-Smtp-Source: AA0mqf46CqZWkRZeHatIG8EAw9aZR4g6xi+62KEETgb3jF0VAKeAgnbiFs0Tfj/J1fP3XYuC5b02rQ==
X-Received: by 2002:a05:6870:e99f:b0:142:dd10:b688 with SMTP id
 r31-20020a056870e99f00b00142dd10b688mr41453340oao.236.1670341775003; 
 Tue, 06 Dec 2022 07:49:35 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e319:9475:a359:f17a?
 ([2806:102e:18:70b5:e319:9475:a359:f17a])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a544d86000000b00359af7ea8fdsm8379051oix.34.2022.12.06.07.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:49:34 -0800 (PST)
Message-ID: <1dbf75a3-a4b5-2f2d-5dfe-417dafb13b8d@linaro.org>
Date: Tue, 6 Dec 2022 09:49:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 29/34] tcg: Reorg function calls
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
References: <20221202053958.223890-1-richard.henderson@linaro.org>
 <20221202053958.223890-30-richard.henderson@linaro.org>
 <20221206152815.okaikikteop3cduk@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221206152815.okaikikteop3cduk@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 09:28, Ilya Leoshkevich wrote:
>> +            switch (TCG_TARGET_CALL_ARG_I64) {
>> +            case TCG_CALL_ARG_EVEN:
> 
> On a s390x host with gcc-11.0.1-0.3.1.ibm.fc34.s390x I get:
> 
> FAILED: libqemu-aarch64-softmmu.fa.p/tcg_tcg.c.o
> ../tcg/tcg.c: In function ‘init_call_layout’:
> ../tcg/tcg.c:739:13: error: case value ‘1’ not in enumerated type [-Werror=switch]
>    739 |             case TCG_CALL_ARG_EVEN:
>        |             ^~~~
> 
> The following helps:

Yes, I found and fixed this since.

> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -735,7 +735,7 @@ static void init_call_layout(TCGHelperInfo *info)
>               break;
>   
>           case TCG_TYPE_I64:
> -            switch (TCG_TARGET_CALL_ARG_I64) {
> +            switch ((TCGCallArgumentKind)TCG_TARGET_CALL_ARG_I64) {
>               case TCG_CALL_ARG_EVEN:
>                   layout_arg_even(&cum);
>                   /* fall through */
> 
> This looks like a gcc bug to me.

The gcc "bug" is only in not being sufficiently verbose.  It should say something about 
*differing* enumerated types, and perhaps name them.

Back in patch 20, tcg/s390x/tcg-target.h,

-#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL


r~

