Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DB6D2E6A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:43:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piU0m-0002UD-51; Sat, 01 Apr 2023 01:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piU0f-0002Ti-Jo
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:42:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piU0d-0004Rx-Vg
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:42:41 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so27714104pjp.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680327758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E70O9EJeRkAgLb+XxZeKXikRGZyTE/3lL8TOiadUbxA=;
 b=qz5Zm1moc7/W66e1wKyM10fgR6ZF7kFrMXWvR8gDVpvu5B3TQo3VmLh9ri+s0jMMKc
 8RQUYeEZfSPQvfvnGxDxl0lUs5upFYsn7GYCIlVLa1tHQPxDTLeOe0IzomXglpDuDUAZ
 wBW0jdtFgLUGbIgX6df95zSsIbffv8fk4dW/W8HSCK/viudV43TS/qdmGimoabBC5Dei
 RxLGOukK0eFS2wn56tz8Plrr2491WQ4LhLcpuPtrlL5X3PyPrWhwaQR+SNAPcgmR0Urh
 toUqv7f99Pxh6T/7ddcQ9X917eof6UiLjiPkakHPXHYTHP3tfibYDy2oJ6t4ph0ximsi
 Ckbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680327758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E70O9EJeRkAgLb+XxZeKXikRGZyTE/3lL8TOiadUbxA=;
 b=wK25XRZSTdOTvdpahxJWjw7yjRJjZv0sTc5tgtWwxTrpwsWha7Av0/qqD7BLOmdTOi
 UQeycssZUr6ZRaNYWJmkT2xpZrze+GAivb5q38EnsGRQX0ZznKP0uCzaiACdMP+41vhs
 1VRW581xVFQdRUL21phqWmF/ckKVBe9IWlEsSmh/PB/4Ii+V5wZYCYEApAf2yQzulvB4
 ZY/zbI2Z/74+zNd5TNufBoqc5FbRgqlgjZtmV5B2cr97gfxKIQH/Yr04HCGXZe/zh9Cf
 z9qBdTpoJNo1SsAix3IsUxU10Jm7o7A1YDQ5hpKl7I7H3NdPt+2idYzPuqSFOsx4yCTX
 QgXA==
X-Gm-Message-State: AAQBX9eR6GvzGoIMw9CkugU0ugcwfqU99ZqiY3i+UyGiH56zVaxNKzrh
 e7XGEQ5r8rOhqcbms+drtYITlw==
X-Google-Smtp-Source: AKy350aig2jvu6dpduu0/9QiS3QfQg9JATHEXErH3xm+KOaAAUHPCWP/RAy4cDbt8yJSDKZpINTvEg==
X-Received: by 2002:a17:90b:3ece:b0:233:ee67:8eb3 with SMTP id
 rm14-20020a17090b3ece00b00233ee678eb3mr32859347pjb.24.1680327758111; 
 Fri, 31 Mar 2023 22:42:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a858100b0023af8a3cf6esm5827156pjn.48.2023.03.31.22.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:42:37 -0700 (PDT)
Message-ID: <bf8a4f18-b007-1353-93c7-9bf5ae933387@linaro.org>
Date: Fri, 31 Mar 2023 22:42:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 25/44] target/loongarch: Implement vsrlr vsrar
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-26-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-26-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VSRLR[I].{B/H/W/D};
> - VSRAR[I].{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  18 ++++
>   target/loongarch/helper.h                   |  18 ++++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  18 ++++
>   target/loongarch/insns.decode               |  18 ++++
>   target/loongarch/lsx_helper.c               | 104 ++++++++++++++++++++
>   5 files changed, 176 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

