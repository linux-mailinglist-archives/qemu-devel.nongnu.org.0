Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47F2BA734
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:19:48 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3W7-0007xT-Gn
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3Ue-0007WJ-3N
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:18:16 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3Uc-0007uH-J7
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:18:15 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so9300117wmb.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KyHL3JFu86Rq2iqH2+ZlcY8AdQocYV718rpWgYpAVGU=;
 b=Wv7gaASLRPN9gxrLqXao7MD5tdcO9N+RgGyffynfure7R1v4nCiLfjYyirdfMuyh3A
 1v6RBO0V83cehNorNx3bjyku5pMpkCaLyvm829KKGA0G7pzvoZIAPqh382poTskAnAbc
 7Fs4Lf8XrImc2VXU+0fXlpY0mhK/EUaChqNEisgLX0/qYZnzVjhy8GQDx/wiGmxvzdK9
 b+wynBp1Hp0/xcZnM3fAuOlPd5caH+KhPPSa1HEvSLKPstNkZcKj4HmgO12eAEjzcdKl
 3/zYtKClB8vXka3dQu/jSRdHAo61w/IkDsyTPLc5efJxy5XUE64rl2Vrcb/eb5ZejXyk
 sBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KyHL3JFu86Rq2iqH2+ZlcY8AdQocYV718rpWgYpAVGU=;
 b=Y/A5/V6CggiZeXbktLhrtuEpXsFFcN6FzIMDR9R4BUS3hCvlq6ILgGh/xfHIuA56sE
 Niib1FOwr+zGiP3gja0xvwUvZBrICd7p0Z0narYbEKu+0PkwpZZmgngKILoT+grjpiSd
 rhwSvh4+ltLe5xvNXgMIJ/Jlp1TJBVDu2WLhrAWGwUB7LiqJc/BfCsRMg4FX5SEB05oh
 K6hD4MhhqhepsBOFmkFr1zIbhDW2Jz8HOj6l7oIYThO7TC9BJZeLMMZTfyoFN5VSS1UF
 f33QZzLPx363c0sN7x1Fh3viyL+bR3vmjfDbwqLPNHFCj+WfSyf3k7PeOUNvqRusZGhY
 mDOQ==
X-Gm-Message-State: AOAM530iL2xPaFwH+Z3a9/OQi20y53IGpyVr71zqxQ3FmH9WM9vrbvLF
 24HbvXikiBk2ngFoQCG79ijWZhM6aNM=
X-Google-Smtp-Source: ABdhPJy7NySAfAjRhEraSRx5M4yGPvll27ZK0/htBqo74ZJa6ZyAAEgqyIWxR8PXaoQFkKm465nz4w==
X-Received: by 2002:a1c:c343:: with SMTP id t64mr9430559wmf.140.1605867492905; 
 Fri, 20 Nov 2020 02:18:12 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z6sm4034060wmi.1.2020.11.20.02.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:18:12 -0800 (PST)
Subject: Re: [PATCH for-5.2] hw/display/tcx: add missing 64-bit access for
 framebuffer blitter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, gson@gson.org,
 1892540@bugs.launchpad.net, qemu-devel@nongnu.org
References: <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32bc8779-3b8b-6107-0b43-6faf207cbeaa@amsat.org>
Date: Fri, 20 Nov 2020 11:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 9:17 AM, Mark Cave-Ayland wrote:
> Commit ae5643ecc6 "hw/display/tcx: Allow 64-bit accesses to framebuffer stippler
> and blitter" enabled 64-bit access for the TCX framebuffer stippler and blitter
> but missed applying the change to one of the blitter MemoryRegions.
> 
> Whilst the original change works for me on my local NetBSD test image, the latest
> NetBSD ISO panics on startup without this fix.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: ae5643ecc6 ("hw/display/tcx: Allow 64-bit accesses to framebuffer stippler and blitter")
> Buglink: https://bugs.launchpad.net/bugs/1892540
> ---
>  hw/display/tcx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

