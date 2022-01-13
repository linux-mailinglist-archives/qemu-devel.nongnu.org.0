Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD148DC8F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:05:16 +0100 (CET)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83XG-000333-BV
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83T4-0007aV-1v
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:00:55 -0500
Received: from [2a00:1450:4864:20::42c] (port=35437
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83T2-0005ZY-7Z
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:00:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e9so11329651wra.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QlOVLEvrson+S1Bz+s+BfQNxMnsQxzx/WVbSThmpeoI=;
 b=vfRfwHhKFCWPGR1a9bbfU3Olqb4qVtLTRYBDIPLtRn9kt/V7vEqk46TKMBEXl0aNU5
 MjOw8O3Y3jjQs2ZkahJrh7SdwjnMhaqKpJRODDRPEovsOICu+AfFICfiFtGo+UQ49FP+
 gfy0EkQJN73ioXxSFlDjrRrA6mWc8pjassd35x/UVfROU2NeHJEjNOT49Qf77UmihRIr
 V/GlTI+oSu1ZaL297XzYbUOrRgywn5txhCb3qto7brX76QxVMF7alfq8boUXg48gApGV
 dH1eDiiZ5RYEyiQ8NeEyIj/j+1eb6G9cOwD+rU3vRfHAOxjiJ85/A+T0WOT75bIfOQYu
 iTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlOVLEvrson+S1Bz+s+BfQNxMnsQxzx/WVbSThmpeoI=;
 b=LQ6YO0TrjNFOFPtss0lKDLAkR3F7Y5mWnI2tB8iOYZGMnWZR+Qcf4EZofVj+PcIT+S
 6atMB0xDJP51ZAf2OnhxT5EfeWHFUujhHoDjReVU5zY+yfV972tyxdS2rHf70u910u5q
 gCZhodgZGe8Rv6In+SpjYUytt1UiX/TjneO2vNivexTCQi1G2U+e5cFRoOOOpLQqOyUq
 IPjf8FOxW+IHnIS8eZe61WOtmDc/9AKiQS59sv1RD87GiCsrBvyAh2OldNZXO/xOuHIK
 KtlAzTsEFrn3PiyXX6aQW6W5UvVz/eJaWrXVfXYbvT4GqO2BziGXSZFKzTxnQ0Rgcnjz
 E2qA==
X-Gm-Message-State: AOAM533K++T2iRSyMC9VZTcQKbDUQMJlCE0uBvZMJQui3MWYlfZs0xTZ
 zPnINuu95BeWqJjZmWE29XzfH/l5EuYUI/f8IKmt2ylKJGI=
X-Google-Smtp-Source: ABdhPJxVSBwKAYxW+5i0MqKJ1Qj5Sr1SG+fgAlKY9miO83cFNwrj0XKR4keVCsrVE/0nHF5aoIWUzfBZ4knbUuCn7pE=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr5020647wrw.2.1642093245856;
 Thu, 13 Jan 2022 09:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-4-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-4-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:00:34 +0000
Message-ID: <CAFEAcA_KPrsJYcsRRpP7JfqMtpLkU7pZgWNvUao5ELCkdoChoQ@mail.gmail.com>
Subject: Re: [PATCH 03/30] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:23, Warner Losh <imp@bsdimp.com> wrote:
>
> First attempt at implementing cpu_loop_exit_sigsegv, mostly copied from
> linux-user version of this function.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

