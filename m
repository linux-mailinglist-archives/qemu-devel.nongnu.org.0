Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFB3CF949
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:00:56 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oQh-0003RH-PW
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oIg-000321-FX
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:52:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oIf-0005oj-6S
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:52:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1312998wmh.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Y6FON5dtbZQ3YX4cswzMvTqMVBAlfhXSw5U352oLUI=;
 b=fYTL8yY0bT7TEetwM7FN2+duG7KEraLEwkd9KLw8HipiRwnQiISi5TQt421bJAO5l0
 BZqBmoDn/wAcU1JG4MjSN+CJMl/IEZeA8O29pzd4ikwAUkekYgK2jQw0N8toRk14mEOa
 1PEbUBJhuuOOEA3Q9A7n3hr2tlm2iUuosx77mbkPNqSc/sNtireR91Ht7kiHT6bCgclp
 vLheT7ehzrfm/SBM9QiIK6GoKg2HXbiymlApw1GWG/UmLbuXP2z0O5P2bglgsqlscFub
 Ogf0HIVELbcOwEKRaD/gHYqpYFQ+VRODZQ9ia89xpQRu7zGhTt2sJMkcDU0kiTIzpJ8j
 ZRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Y6FON5dtbZQ3YX4cswzMvTqMVBAlfhXSw5U352oLUI=;
 b=FSf0G6MlCA9ROqzn0wh7ijtRZbz/lw5ZdzWeZdojKLgkHi7D3Zbdo2UgF0KNl7nyH6
 8joYJwYOrO2hG89Durrd0CJ5uVDaXbd5ZwnQ0izXZ8Ly9kzn3KUHCqEM3jZL2je19m4R
 c6Q6GIms14pu6jlGNPAKCmHFtMOJVSepttlOoVzsgJGPtzjrKh075AGkAlc1TEaDF6w5
 1gOnWz9N3d/0Oqapd61vneXkuaGez1poog+Z39oerUA+teHih/15H4EvY9BBucevkQCH
 3J958usfOHugxxTMj/EmDSrqyHx24lOzvK5qcmgJrsuzef11UJMx7lvU9dQIrRsl02Uk
 S94Q==
X-Gm-Message-State: AOAM531IOWikVzj5SD6aLn7oM+FF2n9Cp6OOZN3r4H448Je7pK1a+nQA
 QEWRUOpk8TvgYw/b0m4XsAM=
X-Google-Smtp-Source: ABdhPJy2yUdUEEGYrlUaq+L+5vWe122BE102EiTu2YLYdOllrwjQnFy1QsQGUzSAQO9iSJQ7UQV5Zw==
X-Received: by 2002:a05:600c:4f91:: with SMTP id
 n17mr36909178wmq.44.1626781955704; 
 Tue, 20 Jul 2021 04:52:35 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id v15sm20204688wmj.11.2021.07.20.04.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:52:34 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v5 08/15] hw/core: Introduce
 TCGCPUOps.debug_check_breakpoint
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <62d60386-11e0-5cb5-7aec-e8cedbc4ee52@amsat.org>
Date: Tue, 20 Jul 2021 13:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720011800.483966-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:17 AM, Richard Henderson wrote:
> New hook to return true when an architectural breakpoint is
> to be recognized and false when it should be suppressed.
> 
> First use must wait until other pieces are in place.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

