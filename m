Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE982C6C00
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:33:45 +0100 (CET)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijV1-00064Y-Pi
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kijTc-0005Y9-HN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:32:16 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kijTa-0002Wr-SX
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:32:16 -0500
Received: by mail-wr1-x443.google.com with SMTP id t4so6630718wrr.12
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=azR1khD8IglxMs6p7L1hF+CyJCEfCj9k19A4xfO7yqU=;
 b=alXr4awaiWDlVohMKanIFem6Vv7RmoNyDNy4BCGuPPeHloE7jmB3SWEP7wiDryRXJ4
 o83vCfbwxNdHV8PKCnCmW3MebTjIrgzDcMwknP9/2fKtby/cySFHZHP0kX/YrIKT3JLa
 QEssrbVl9d4bo5BRkqjioGd8x7AvuHWGVFnkA2K7c/JezZEgSPoBZ0aTSqhZd57Yd2DV
 eLz1W9MqmaN+4+qnwul824ERgEs4PT3IOORuNCpQL0JMuCaaoxYGOmjQ2MUKbCinGwr3
 +1Bq5ctI8xbpFny+q7V/5CSnxNgTu9vfYBWfs8IFSN6T6oaPGtwzD7L3/iIj/O6x+qVG
 7+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=azR1khD8IglxMs6p7L1hF+CyJCEfCj9k19A4xfO7yqU=;
 b=tNbR+2zrPD1E2iPwyuvO1lXrNFbJXed+BFmLvfiLCSNd2iGchMYYddw/EtkorHtfCy
 TkdNVylxW+hXUmD2cbP+z5UZbA//e/ElAXymMwZMqRKtug+k4VWWjOFK04gyKW06jFuv
 INrxFJUR5vss9+LNVoKN6AKnwHUq7hN+ybzImdyt/YQGo+unYfMIRjz9Drgw93e0Eejq
 4Qq9+oLfNWhUc+FgwLKsybfaT40ZlWLk2h8ObRicpE1puSRhDjIYTQxJpFflyFhag3td
 r3+GIV/p1e/LD7tpQMMvV0vOyxcyEmboguhWPcZG9BcEdNxRQhwFMmNtyMbtQ724t1vg
 JOkg==
X-Gm-Message-State: AOAM532R+qvZN2+4DTPJzcAXgs/uVXdjnCGhWCFWweZD7NqH6DNYRJ3h
 DRT2IT+bAD1iCo0dv+XjTWs=
X-Google-Smtp-Source: ABdhPJygrchhRDWrjTUjfLwcrBKE/oMuc5GalKvkkbbRrFTQGSJGsCR8ckVmzYQs/FnJu6gHy2UN1Q==
X-Received: by 2002:adf:fc8c:: with SMTP id g12mr12787428wrr.355.1606505532628; 
 Fri, 27 Nov 2020 11:32:12 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a21sm13990443wmb.38.2020.11.27.11.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 11:32:11 -0800 (PST)
Subject: Re: [PATCH 2/2] target/nios2: Move nios2_check_interrupts() into
 target/nios2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201127191233.11200-1-peter.maydell@linaro.org>
 <20201127191233.11200-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4f3b92ad-2682-2d33-8771-dea564841d8c@amsat.org>
Date: Fri, 27 Nov 2020 20:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127191233.11200-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 8:12 PM, Peter Maydell wrote:
> The function nios2_check_interrupts)() looks only at CPU-internal
> state; it belongs in target/nios2, not hw/nios2.  Move it into the
> same file as its only caller, so it can just be local to that file.
> 
> This removes the only remaining code from cpu_pic.c, so we can delete
> that file entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/nios2/cpu.h       |  2 --
>  hw/nios2/cpu_pic.c       | 36 ------------------------------------
>  target/nios2/op_helper.c |  9 +++++++++
>  hw/nios2/meson.build     |  2 +-
>  4 files changed, 10 insertions(+), 39 deletions(-)
>  delete mode 100644 hw/nios2/cpu_pic.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

