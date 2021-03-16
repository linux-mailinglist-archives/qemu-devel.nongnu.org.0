Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD033E23E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:39:22 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJHV-0002Jq-K9
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJC5-0004s1-BZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:33:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJC2-0008N5-Tx
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:33:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id v4so8299924wrp.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hgPJRON4K+mvlHkqfXlG7Y7G3tvCh5bRqRX5/VU7dqQ=;
 b=uQe+NSWVTHOekWSa6e7Y74FgYya8AEjBiJIXLwnf2N/hDyIIMbBQdz5Je2+h+HGQw/
 G1XKahM6+MaFe4QSsRvJBsU5H9nmlUq7h9Qe2diGoVBpNmx0cRrT7h08XHlWralmG+4z
 FwlVJXSZ5BV3dosNqCR4uOu7TLLESMlhXFMfozlJdGZmF8dOBbgX6i9fqcOR/R2KcEhO
 Y3lqrOZNIpkKk5tGrNJOzSrpIWSSajrzGmHg7rmvYrZQkyEh0UFpREJDD8iP8coLIW3d
 b8Dc4VeEDH5MHs4AZN2OCiKul45z6WXdikTJ2jcKeYNzRUQC51QCjiF2wggRwCBR38bI
 FwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hgPJRON4K+mvlHkqfXlG7Y7G3tvCh5bRqRX5/VU7dqQ=;
 b=rsgJVNGC9WdBVlybyDGCdyLyw6oxgKFGhoQR6ImZkQYDWWbhPJ4RJYuSW6Fb/O7UQP
 3f1Mh9RmTOhbPPGsZe4vjgdpF15wYIplmCQJC5du3imOO/10g0KN4ZuDG2UkzAC2w0P1
 CHdx2+d6E8zZeQ5UZEwAhw71Np5TpWtGtYaYdSHz3GnvWXRT4CSnSc0jZhUwn4B8vsw2
 apPmgAUFKgQMI92cSmgAvij2L90WSs4AD6kpSx84nNWvFCkqpq6QFjcIkjmIvukYmHLo
 uGebsFXB50fObKGAeMHcN8XBGAW1QbS7muo43ZeEGWVz773fba40P8VfgZPNKcxzU2qu
 t44A==
X-Gm-Message-State: AOAM532FflhqIl2rKDDhSlbJPl8KPlsAZ1i0cFsCVha23vZz575VPQKv
 9uNOUghayj53fDYtovzYHzM=
X-Google-Smtp-Source: ABdhPJxrmOmsFG6wKPiZcBM/fmnDfg7j8Vb4ggAck/aWXsO2PEGDePi56ue8CBdk20FlA5XJrNZZig==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr1275118wrm.321.1615937621093; 
 Tue, 16 Mar 2021 16:33:41 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x8sm23576198wru.46.2021.03.16.16.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:33:40 -0700 (PDT)
Subject: Re: [PATCH v5 41/57] tcg/tci: Split out tcg_out_op_np
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-42-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05c362fc-a71a-9f3c-6958-7967d1274ff4@amsat.org>
Date: Wed, 17 Mar 2021 00:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

