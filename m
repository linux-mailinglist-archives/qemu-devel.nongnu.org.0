Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECD686169
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 09:16:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN8HF-0008RZ-Sz; Wed, 01 Feb 2023 03:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8HC-0008QF-Ir
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:15:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8HB-0005yJ-0m
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:15:30 -0500
Received: by mail-wm1-x330.google.com with SMTP id l8so12015681wms.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 00:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oP9kZX1kICyLQTDEKEZ6//nF1VpBMEFgrmkqWWC3qqk=;
 b=mjKa84MaEQpoKPLz1KTv3MoYcbwR/zi12wF5wCEO4OIguVkj8UrILO803jdyuzCfHp
 l1chHz4jfmGnoZh3FWv3v7NLSsIA2+X66r+9OBxa/Tatkz/zKQWL6H6vjidwL+/XfKA7
 wbmkzZbgi03FpIMjDf9Up8EOElzocb3kHaQQ3JApIJuWleq419nlAYfcLiWivVKEDNzr
 SCDrA2nWktdMLaMd80Nv+tcWuUWm/13foUtAdJBkDRx8KlrmJJs1qkmEWbUuTCivPoX/
 Hx8vhradxqVciJCzgJb+xK1x3XbAL/8OSluDGes1nv/25RQed6tQBMrdrsUiiIEfMnje
 fcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oP9kZX1kICyLQTDEKEZ6//nF1VpBMEFgrmkqWWC3qqk=;
 b=fNLF2BnQDjNmPUWs1jlCk5Bi5X+RkZVsY+ctJBdD99vE2AQ03OMOKkyzTDLrV0WA1j
 q2Kfbs/Z2U2pn0nVnlGMfk/i23dwCRRhx4ge9dLQn5XGx87tKNyvYKA588Nw5YimPqhr
 Qr8ti7BWuTJxglZwDKTuN76hAhFGrF045/lXnHmTbrcqPISpY1mIbdcBez1+bgPBYpwY
 RrmrdfurmyOM2AjqOamAnLLHl7FWW1CRRAU+zEwY5bVCrOt05z6WcFZa1cVrOR03sM9p
 /2yYyXdA+yYD75st09cJKlLmB7cztr9tnP/8pi/oMV1rJp617J+g0bd4qaRYqY+Se0A4
 NU0Q==
X-Gm-Message-State: AO0yUKWIgWjaZT4kZfOq+pUNac+ugRF+C9O8aydlyZ7/sxq0d7O6qJ7Q
 ztQm4YYHd5qD++xnX3TAL78=
X-Google-Smtp-Source: AK7set+HyCLzXLubjcb8nQT7eucxTBk7xcdTcj02Xm/L114C4sDworlfM0TcgU2EXLB2g8Xx8WQlkw==
X-Received: by 2002:a05:600c:4fd1:b0:3dd:1ac2:989 with SMTP id
 o17-20020a05600c4fd100b003dd1ac20989mr6480850wmq.39.1675239327594; 
 Wed, 01 Feb 2023 00:15:27 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002be34f87a34sm16872031wrr.1.2023.02.01.00.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:15:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9a8b8d11-099b-0263-3283-5e49d8dd7513@xen.org>
Date: Wed, 1 Feb 2023 08:15:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 07/10] hw/xen/xen-hvm-common: Use g_new and
 error_report
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-8-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/01/2023 22:51, Vikram Garhwal wrote:
> Replace g_malloc with g_new and perror with error_report.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-hvm-common.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


