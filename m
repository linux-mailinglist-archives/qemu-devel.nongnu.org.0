Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43553FB318
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:24:52 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdX4-0000ah-PM
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdVU-0007Dy-Hg
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:23:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdVS-0005AN-RP
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:23:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d26so21523135wrc.0
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bMZaC/N19W1A4nRtYofoq8PkEDtOryJf928ArtFa+EQ=;
 b=WsLHWaIcj6clgxuEMoPG5L2G98yn/oSJk6zZMzlFaAOVw/OhVuJdBuBK5AdLZQlgLW
 NGSJW3KdSIoWZrpaG4snfdr55MarzRBOnFF5vVQDCtklf6Y96Go1I+cAcY8pkQ/s3MCy
 18qWvSQSwmIHAWZZLHx+6VZ1mzePGWSfUUu/2OVIvMe1ekvw5tQGR2ThLEwX6WWqwo0B
 2JobFSF2rUs39FJnJjpY36eQR1MzNF+YTc/0JnkKnh0JuBGE9skz6KdZiBCtXSEfIAf0
 uDOX4St+dHQ9AgeOY2gjHKJUgzZquoJ4Q6s3YBNES3ljOPo8cQsWdGJaPktoBkr073hh
 AQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bMZaC/N19W1A4nRtYofoq8PkEDtOryJf928ArtFa+EQ=;
 b=eDwVItMEvU/IBKIkFF47hu/V4D9KtMXNDnKYGso1X77EAO+wOxjzDBhvSFmjxJusBu
 2bFq/f6/gIlitg5eqkbNhRPaKPwBnU8NFbKzTUy0sbEd1Kz0ElGyXg2rEUWnFbVmZbIQ
 l5OzATLSAO9Xjze75B/3Pg2ALMGxjLwzNO64ipxVaAR5N0zYAu80Hu1p0ycs6CkORyeu
 FS/Me/xgW4wrmCf/I7B8drTc0t8Wwwmkdycif9AO/7vMJvARgHGkZYJca1GdK1ThIJj6
 2II1yaCNCKOv3OmjU3icoR5K8SdjajQG9884S+W7OKpK6YMKoZ1BBWHInjTI6iRkwmnS
 hUJg==
X-Gm-Message-State: AOAM533+YAh5JDBU69hfETbKTPxpVfYrk2NQQKN1d5lWxzV9nWofcdID
 pLkLZAG2l5P73E1HoMJjJOCH5PRhKvU=
X-Google-Smtp-Source: ABdhPJyV/2neaFB38sOmVnywzIsiVjscF7mliGMa8dzbLzGgQ85X0EKaKM//zYbKjCP+l9MfMvgY6A==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr24877041wrn.122.1630315384603; 
 Mon, 30 Aug 2021 02:23:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t14sm14780507wrw.59.2021.08.30.02.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:23:04 -0700 (PDT)
Subject: Re: [PATCH 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4332c8c-1ea8-038c-1b39-62d7fbda00f9@amsat.org>
Date: Mon, 30 Aug 2021 11:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.58,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Can we order patches 12 11 13 instead?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

