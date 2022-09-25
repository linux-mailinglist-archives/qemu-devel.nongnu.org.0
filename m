Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D065E9201
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:14:26 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOeX-00068i-3b
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocObf-0002ij-SF
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:11:27 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocObe-0003Ez-4W
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:11:27 -0400
Received: by mail-qt1-x82c.google.com with SMTP id w2so2564522qtv.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Tp0j7Ir4Q/oDjgl6K6DlH5K975hmCLxVH1Tk/7AUlh0=;
 b=GxmH7jtx0oQOdgSAZKr5Xd2Haz7giNKNNPH1KmCLOncoy1QzLL3XTOf0KGgXwH4Ybn
 gkI+i6ZAZ6DIO80NhFbOG1LP7J5KOdT3fbms8T5xMAO9yJQ1gNw2HNmmCgStFyu/ROJ2
 gArL/CLR8mEl91WxHIyQy2S9RfUSHm76lxsVkXfXE1o9qaPp48PrCC0M3VKtDoEEtNbk
 wA3RajNYTxyy+IwizsQYA4FnA7KYc0x9xD0wdR8d0HLPcWO3QxKepx03q090RnHtBRLe
 piPVa8AOSd2tiob31FeiGA9d2AIbESaaNYlFM4xQRwAflckrEUk34BjxdZsetjmhIpqw
 HhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Tp0j7Ir4Q/oDjgl6K6DlH5K975hmCLxVH1Tk/7AUlh0=;
 b=aMrgX9jwX1zxy71EYyzd44ekbG/x1gg43V/Gl/4xJK/Q05zUx/pZYNOmvrJA3BrrMN
 phGFP73lbGFcT15W6nCfLQAROgpYhy5r0JQtrfGLaohOOTWoIEy6fllCBQVKZmVCF1Wd
 ygAlqgNkVzbltiTfiz494UK3NJXE9Mz/NTPuu6+4WtpqSphJqXIxUUp1zRoyEFDzyLqa
 uYK9NfBZoHpJ8QqXfTlJ/6fFn+hGAF/TncQhrySIXQoZDIQNSnShYTNnloK+W9mdDgLo
 jSjk5k8c8fjPzGKpNRnXkoOjcbrqlfpcInKBqUiyvE8WHUPiavBYvHVEQmUuJyQySdC6
 x02Q==
X-Gm-Message-State: ACrzQf04cVVs9kuPElw6xeC42qBC8OeQk6A0ju2WUnlBeMYUVpzipBoi
 DxAWc2WYJZQMftNULaHf7Mnp9g==
X-Google-Smtp-Source: AMsMyM4ZgCuTWNW+ZixIzl9I7uoWzywpjozAVSUecXg+JuO/LTJnYQBKhQvbtLrn9IU96q3kPd+aBA==
X-Received: by 2002:a05:622a:14f:b0:35c:ffc8:93b9 with SMTP id
 v15-20020a05622a014f00b0035cffc893b9mr14087247qtw.174.1664100684842; 
 Sun, 25 Sep 2022 03:11:24 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05620a441200b006bb82221013sm9771996qkp.0.2022.09.25.03.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:11:24 -0700 (PDT)
Message-ID: <b1ad6e2d-7e2b-6737-f936-32cd72c3fe6c@linaro.org>
Date: Sun, 25 Sep 2022 10:11:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/124
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

