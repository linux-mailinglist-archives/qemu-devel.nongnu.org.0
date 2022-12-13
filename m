Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E587864B92D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57iT-00023M-As; Tue, 13 Dec 2022 11:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57i7-00021J-LB
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:00:51 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57i5-00049s-Jb
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:00:51 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso90808oto.11
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7IOsuMhzoCHld82UpaeRyQHLz3UTagxJq6tw21H1iDg=;
 b=c5CPrq0VefkMEHAgwwFXimhe7g148saM0ufiMW7+gVlGAFLhbQKVHFYrRGqAeEuzME
 N7gDwMAJUXMM0t4n3vUOtmPz50B6Tw77bZ4gcffDnMMASNNwWhEOeHNqtJQY96uSZao1
 b7xMPQEySRr7272mcUWQq4dRMxr4VG/IeZ+dkM0hMAJMqUlpDzlM9A9DuKaawXqtJNS8
 9m5LDDcXJFWAnGCwvWWVcfSEMu3EGKmfpzNqKsxvTjJBViz5q5zSpXYvM3sXaSxxXAML
 pAd8aSdKVuqkg8TzY3U/n7BN1kmDtJZKk9FYIRwz2+QP/4V1+rWQDV+YfUvqNzXA7fnL
 tJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7IOsuMhzoCHld82UpaeRyQHLz3UTagxJq6tw21H1iDg=;
 b=T+e+FWnsw5gZutq4l5qFnJ13UybxLcewYMGN2wK7XnmhUkMm0eVGv/ciooWunNZ7Gl
 DvgB/zHNV9b0wzAftFfwj+3bBhL1MyiY45i5jbOX1rkSJ0aZ7zZuRXmPn/L6DXg8qAvl
 e9rm5JGrFR22YbPSCH/Tb4tl0qivm5CZaD0XzbMKzELppD/xm3SvaGg0cV+lLX/qx9nJ
 1dO9o9AhnBXRzMZ9ktBeCQl2NqvgXyTxbGd4kIgEdAzfSdpDTF1hkH9wzTnFQ2Xyyp75
 IQ4akXaeiN7JPpKKEeV23Enum51wT7WutWZZ2E/5+yyweecgc0Hukq6s7sPXoEHli75r
 Hr4A==
X-Gm-Message-State: ANoB5pn2cdsQgLyOKIWCKfJGNklTVpiJmzQl1FuWfXb38CbXtlxma7S1
 X0FsKHEmc5loeoUFp47agzaCew==
X-Google-Smtp-Source: AA0mqf7W4lo/eOQ9HEif1IQ5r7hqHR1tmlqz2PO2eE0ssQ+irHomhXiwe/0jZVSo6ALKBZzU8JmcOA==
X-Received: by 2002:a9d:730c:0:b0:670:9684:404c with SMTP id
 e12-20020a9d730c000000b006709684404cmr4243556otk.28.1670947247647; 
 Tue, 13 Dec 2022 08:00:47 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a9d6c99000000b006704589eb54sm1292173otr.74.2022.12.13.08.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:00:47 -0800 (PST)
Message-ID: <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
Date: Tue, 13 Dec 2022 10:00:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221213125218.39868-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
> Assuming the developers of commits 2c50e26efd ("powerpc: Add
> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
> aCube Sam460ex board") were testing on a little-endian setup,
> they meant to use const_le32() instead of tswap32() here,
> since tswap32() depends on the host endianness.

tswap depends on target endianness.


> @@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
>   
>           /* Create a mapping for the kernel.  */
>           mmubooke_create_initial_mapping(env, 0, 0);
> -        env->gpr[6] = tswap32(EPAPR_MAGIC);
> +        env->gpr[6] = const_le32(EPAPR_MAGIC);

I think this is probably wrong.


r~

