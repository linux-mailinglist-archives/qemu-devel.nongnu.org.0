Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDAE497722
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 03:02:01 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBogC-0007C4-1e
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 21:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBocZ-0006FS-DC
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:58:15 -0500
Received: from [2607:f8b0:4864:20::634] (port=37724
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBocK-0005d0-Ae
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:58:06 -0500
Received: by mail-pl1-x634.google.com with SMTP id j16so3526934plx.4
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dd75SkuqdUSfnHrE4mnMkEEHM+gdBPEmNAJiMegJTHo=;
 b=HotYUeDCM2XUDv2M3dfnpUc23Oqhs41MjMNj2Wp+bKBOAews1ZyfHR7Hw+7qXjlVV9
 FeolhF6ClMUTiKrRBwdDwn36uAW9az9/vpNqyLcwlsiTBWRdjsBDlntcPsdnLp3Y4gzp
 soJn2lZFwcxRazbmUaf74DJXL0tpDB6mXaNDmRXVEWKZupMKmQmo379Qsqqr3oaNPyQg
 JyJq16HyAYCoAKFLjW2qZqp6Wh5TAf0hG4nKd7Eug4y22WmG4zL9Q3HwutCcko4MHQZ3
 8/049F+T5zNkyxy/oPMtQthFnW4xC7zhfmgRjWEsdVw5MdKWuG0yWXBM4vZDUQygVFpf
 y9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dd75SkuqdUSfnHrE4mnMkEEHM+gdBPEmNAJiMegJTHo=;
 b=5qDNRNwqe4Noqb0XbhXza7cUiAGuaBk+bRkOfy51q32VtoZ1igfRnbGoljjopdMrBf
 ZkM+vpPSFL2F7tDPelz9/8XzoeoIsO+7VuMRF8jUWoWF4RFrisC5Cll5m1lRGPMd2L0y
 GZYuogYLg3wPstIhSOSK2fSPECa3z8sCO2Wle3HSkOvKEW8g0WttM5Jqk+ae7y1nqX+k
 yYaJ3Wk0/atrGyCoAYFPu9XsZxBkAHRtc0Hyeu8O8MkxDhpaN1n2MhJie5hqfsNEITVL
 7huQ1d/C9Xpw/hgOXuGtMt/Uj6xgWuoFjduTeMB2P/MdqRVyaxRdOFwgEmC8exvFozJK
 HvHQ==
X-Gm-Message-State: AOAM533DEYL7PqXvQ+KWjkn9Fiwd50wwSNtSrXGKTTueHEM+albwWpp/
 UnGqftL55QnWcG87p4l/Uo7GtQnqW4tbmOFe
X-Google-Smtp-Source: ABdhPJwqlZSI3t8uT5L271uOOYg5uH8ui+D1HQp6zM8lkBWe+OtvYvZ0gkZZMa8LqUi0N2xy6BUknA==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id
 kb17mr3119248pjb.1.1642989479011; 
 Sun, 23 Jan 2022 17:57:59 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id p64sm10215183pga.13.2022.01.23.17.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:57:58 -0800 (PST)
Subject: Re: [PATCH 15/30] bsd-user: Add trace events for bsd-usr
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f2e7ce3-8e64-c704-a3fe-5b1d3c05f64e@linaro.org>
Date: Mon, 24 Jan 2022 12:57:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Add the bsd-user specific events and infrastructure. Only include the
> linux-user trace events for linux-user, not bsd-user.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c     |  1 +
>   bsd-user/trace-events | 11 +++++++++++
>   bsd-user/trace.h      |  1 +
>   meson.build           |  5 ++++-
>   4 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 bsd-user/trace-events
>   create mode 100644 bsd-user/trace.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

