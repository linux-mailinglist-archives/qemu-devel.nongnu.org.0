Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28561044E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:23:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAJm-0000VD-Tb; Thu, 27 Oct 2022 17:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAJk-0000UL-CS
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:21:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAJi-0004bs-S7
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:21:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id m2so2850874pjr.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t83/Oi6HC4DM1T013Qejv3ohOBLG5XXfkGofTOjBT4I=;
 b=HKXvE8Kyet0+NnTZIElt9s+Q77nbbBGoG2s8e+DPuS6ilm51+WXLwN8q/zx1h2WKbm
 AWkMdZ5GruJ1Ltj8aWeqoTnp8C3ePoPwzjiJVx/PZHamYs4BWD3lyJYYis2ZdTgmYgRU
 lGqwPMRVbIuI2IRT6Fe6m81u37dyAPd4gYhO02f4NNZwOk+wwHOUPI7cntiS2nB/nsP3
 5WFXP3GpbANb9DHggY8A8FzkcW8HJnjy7UP20gUXleyqznH2O7tzyygN1tyOhRucYUQu
 EB2xwuuDcStOuJAYhNPZFdDnBRjLajHXFgg4kMa/3R3GfOamoXHm5PryKSAa17klCVde
 AY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t83/Oi6HC4DM1T013Qejv3ohOBLG5XXfkGofTOjBT4I=;
 b=yvVNNfehpUcQiwYCQiFUHQ3l4wyu/U8/QjGFUmtAYF/M4kMTRD6zjJuOVrSWmedJld
 qeaQAkGcPBum3B9RRenJ3anJBkLKdHTAghdFJuJU35MX2j91FS8igTD2NCEzuKWMzqoj
 HP/E2ROtp7Gzx80tb6iCcJpqhiTRE2M084MZAvS+GTVih0MllPyEaDHl8yHWJuUEJ6Pu
 cKRkvFcCBncCezq7jEwh6HGPdnmIWLfsKXjVB9Ch4QOAox6slYA8mcHb8AXi0A8woiJl
 4GwBAA+sG0M35fKM36Zw2cjUbc5twV89JUpwKerLq/YkjaLz3K0Eu97vb3heaIgPd5So
 N+AQ==
X-Gm-Message-State: ACrzQf3MH+ss18Ls9AKam2b1q6bIsaJ/KZsIXssDxoKIDHqVK3iC11Sb
 g10gi+bBgGIM7yvhADFuhNLwAA==
X-Google-Smtp-Source: AMsMyM5rMe2eRyfjfih5AkvTAlsit5PBY9WbgY62V22VIQBLRSdi0S6Mlx7T0oWXO7PmfrP/urcZ6g==
X-Received: by 2002:a17:902:8e84:b0:178:57e4:805b with SMTP id
 bg4-20020a1709028e8400b0017857e4805bmr50773192plb.144.1666905693208; 
 Thu, 27 Oct 2022 14:21:33 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b00186e34524e3sm1656178plf.136.2022.10.27.14.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:21:32 -0700 (PDT)
Message-ID: <1c92aac3-a672-86a0-8a75-c5230d629d77@linaro.org>
Date: Fri, 28 Oct 2022 07:21:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 28/30] contrib/plugins: protect execlog's last_exec
 expansion
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
 <20221027183637.2772968-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027183637.2772968-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 04:36, Alex Bennée wrote:
> We originally naively treated expansion as safe because we expected
> each new CPU/thread to appear in order. However the -M raspi2 model
> triggered a case where a new high cpu_index thread started executing
> just before a smaller one.
> 
> Clean this up by converting the GArray into the simpler GPtrArray and
> then holding a lock for the expansion.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Alexandre Iooss<erdnaxe@crans.org>
> ---
>   contrib/plugins/execlog.c | 38 ++++++++++++++++++++++++++++++--------
>   1 file changed, 30 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

