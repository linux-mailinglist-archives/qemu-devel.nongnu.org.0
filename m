Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28C66CEECD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:08:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYLa-0006c0-Vi; Wed, 29 Mar 2023 12:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYLY-0006WQ-Q7
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:08:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYLX-0006j5-Ac
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:08:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so2295594wmb.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680106100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5xILgd2bLfDPvYp3VN93jtlTz2vVs3FHjm2ZU2tvAdQ=;
 b=iDAwtRjlDMeHQ598FGAMuYnLqJjY5qP4gZEagOg2I094bBP3H3ZNnoWngt9SSyhfgR
 bmDrHl5w/K0MnqwPMQsk+XksbjW2aNQ29njjNTfGKrtCoDbnQs15rIKoLjV3aFjiEoWG
 xVqQ/MGe3lEQoi2CVDY488ANM399JfZ8bBEkhJO1e2RMOF+wFNLIBN54WVNpXpfWlnTP
 J3AN3bFnyN5C6exFEuOYQf3TInJ9+g2f/GXleYEVCnDGtN6ekmvxL/bcl4KoM0A6Ei6H
 R3jiDUGNV7S6qXlYxiLMUyLyRO8qOICTUIFmghMEuZnZIF7SFlSiCqxqW2ySx/GvfAjt
 sgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680106100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xILgd2bLfDPvYp3VN93jtlTz2vVs3FHjm2ZU2tvAdQ=;
 b=VfTkug0QeHiisTQaaPD1v+IgyR/8yU0N+SM/YwgY4dKWxqo7uD19TEBf2+kWubhfd7
 rc4UootXqENuwF3rog9gtD93cAq2jm7VAldvKTsNxmkYALIewvDPHNMIdgPLR7GlIXce
 GbYJXZMyBSlqUHDgbqqr4X5te1lJevLxS6DHKWytFm2xo2F2MogEsXwJweLY2zkyHFjq
 Tf5CN7Xkg8NQUf0qBSMHV25DsBY0hyjrmvKKtg0q43sAuLiW8XBeDCxKAf7BuE2Qd9w6
 Ph19mkBQCugci91wBlBF86XN3NRw08VI2K8V6DFpNx5VockuENeua9Cf/z+48AP8zeRS
 rs7A==
X-Gm-Message-State: AAQBX9dtjKreL82qIlNoagMjplqVrbuXniWeAuHAv8y23xCIdN80uOaV
 oLZzG+MxD/0+SlutobuEtveyUOr2IPi8YqSln5W6Aw==
X-Google-Smtp-Source: AKy350ZAqi8m4ETRVKdaKICzkhI1w0PR23rVyCfWyUX5DyIphRzgeXI94GUlDFhTIqDcv3I82IrPOA==
X-Received: by 2002:a7b:cb95:0:b0:3ef:d8c6:4bc3 with SMTP id
 m21-20020a7bcb95000000b003efd8c64bc3mr2261476wmi.24.1680106100374; 
 Wed, 29 Mar 2023 09:08:20 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c470800b003ef71d7d64asm2954321wmo.6.2023.03.29.09.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:08:20 -0700 (PDT)
Message-ID: <90234e7c-1449-19de-220f-6c03e382802a@linaro.org>
Date: Wed, 29 Mar 2023 18:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3] linux-user, bsd-user: preserve incoming order of
 environment variables in the target
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org
References: <mvmlejfsivd.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <mvmlejfsivd.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 29/3/23 17:00, Andreas Schwab wrote:
> Do not reverse the order of environment variables in the target environ
> array relative to the incoming environ order.  Some testsuites depend on a
> specific order, even though it is not defined by any standard.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   bsd-user/main.c   | 10 +++++++++-
>   linux-user/main.c | 10 +++++++++-
>   2 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


