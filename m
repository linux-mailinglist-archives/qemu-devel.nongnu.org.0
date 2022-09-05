Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913DD5AD174
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:23:30 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVACO-00080M-1d
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA0d-0006ZJ-Sc
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:11:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA0b-0006E5-VO
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:11:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t7so5849653wrm.10
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=o04yECKpe+9hsICpfc1rS+sCAcGyL2RwPzG5QJZ6XnM=;
 b=bso8wuht6WZPrI9hUkEJALbmoc1aFhiP+W+zs4y/jrCjg9eRiB/zfttp79w+OfcGJa
 cLuw6SOtUa+p2x9Der3q3k9txctYRNVGVrKaXarHXF7O7Z+A9BTmtAfTtCuBrPz4Uu4W
 cd4+DikrV1Sunbc6h6eqLZZq26Wu4F2RFut9t2pom4TlE1OZDd9xq2U3lAW81O1mKRQc
 pX9tAhOQ8dBkrOhX51QZOquXPyTFfGNlMiPu4di2IXQ0XW2FbQQZd2LcGfVcI4UnAJqw
 SqKF/XF/fpPZp786+Y2W3m+t8XN8C3nYF+d82gMnG6WrcM80F8vQd1et4yEQRdneDwmh
 RliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=o04yECKpe+9hsICpfc1rS+sCAcGyL2RwPzG5QJZ6XnM=;
 b=ZhZFdBQKJwtuCq2LcZB9LVe+3ZjRq2ChSkWt3qzUW7a0pKKIu4GPxe0HeAaez1k0uA
 dtkZfHqOxj+03eYrVQp7/hH7qfKoeKLgyUQkGlgFsizZM7XtyAnSMY2rHJyC2w7pB1WO
 efbpJpugHM8Z3SEeF1FaoX+fjrQoGDhz/EzV6NvFpZ0f/BWKIbePyu76aOCfJMoqYZ9j
 i/cb8KTRJYgae8SMBgcj2Dtwx6OThN2ZEn4a0QmB7YlNsysFXIiyqmbiOlL2E6PP/NBd
 IxnyyfgSzcCVG8Qs9SxOxv2sv+ggIs7QGaZC3+Ee0MjBC5Nc/KfzRBrjfI03cvrxVdw3
 wFsw==
X-Gm-Message-State: ACgBeo0R19nEZDwAC7KVw7tHVZSbWU4k4PN1vMjkFK0HrQXZZdB+QYpO
 YFxZtbGrJ4WBEvf2Wnj7PYYUlA==
X-Google-Smtp-Source: AA6agR48GSUU4W1kpOSzJ19TzJRByQ7Z+MwccoufcILC4umIXByKr8oCxMiaowKVQlAHF0zg4mPVFw==
X-Received: by 2002:a5d:62cb:0:b0:228:6a13:24d9 with SMTP id
 o11-20020a5d62cb000000b002286a1324d9mr3522287wrv.497.1662376276325; 
 Mon, 05 Sep 2022 04:11:16 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600016cd00b0022762b0e2a2sm8738306wrf.6.2022.09.05.04.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:11:15 -0700 (PDT)
Message-ID: <faac9ab3-c066-4e38-faaf-bdb89727e707@linaro.org>
Date: Mon, 5 Sep 2022 12:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/20] disas/nanomips: Remove Pool tables from the class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-8-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-8-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Pool tables are no longer declared as static fields of the NMD
> class but as global static variables.
> 
> The NMD::Disassemble method is using the MAJOR Pool table variable, so
> its implementation is moved to the end of the nanomips.cpp file,
> right after the initialization of the MAJOR Pool table.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   disas/nanomips.cpp | 363 ++++++++++++++++++++++-----------------------
>   disas/nanomips.h   | 200 ++-----------------------
>   2 files changed, 193 insertions(+), 370 deletions(-)

It would be nice if all of these were const.  That might require a separate patch in order 
to add const to users, or it might not.

Either way, this patch is fine,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

