Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDF2D3691
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:58:35 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlwI-0000QE-F5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlrC-0004vs-NV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:53:19 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlr7-0003Bd-KL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:53:18 -0500
Received: by mail-ot1-x344.google.com with SMTP id a109so395141otc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SFXsQ+ZL8smNF6MNBjq1JJdyJ4Nb7UXN76z2bTOG1U8=;
 b=QnMlTkuF6/WYt/hgzZVCUjDYQZQwTJhKKdFXCR7+n9hTKAo+F2AEjWM0wUoW/ezzcA
 oUwIgtDt67Hc6DlIF/z2M04PNXOcWZ+26GZ+2hchx40/zBtq0BXNRJaJsnptDR6UO+0+
 f1IkoG2tlYJuCIRm9UPI4OiBtlc3omNRaRiRJMAHMLwRaFt7CTVytXOdjq/sXnSj+hFJ
 DsMXayBAPY2Icy8JtDc6x2zp8h0aCSbkmPMtFlIvhXhLcR3gbP+SdWTughzgiFx65g6/
 I2/2gKcSU819Hf9BJ74oLORso/TdAog1oNPthRC5k++Qbymh7A3lVW28FYCM4KegTJ5k
 3L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SFXsQ+ZL8smNF6MNBjq1JJdyJ4Nb7UXN76z2bTOG1U8=;
 b=cEY98kiZEm5S/XgfElqk4g0Ya/VVBRdbtBJdLpbyZA2Hs5a1x8g7X2TV5D/Z//jiF2
 t2sNKVcyPGVKgGl0VORqXnabslGUfphx34QXfY/UwT1XIuri+NlTa7U7RH1ufUvSP4Pt
 wUbfn2ZHtkuTedg9NIoaOyYUOtpi928RCUcMJmM0GBTPZsWdVgFSuDAVC9zSTeNaOyeJ
 JiltDeEYfsCADZBGS95v+HzGAFqvMZoNnofU3RMP26cadATtnD6e88AZwpHVvdU/6KLN
 LsgIKrPLYk3i8JA2hN+8gw6jPrNS0PutcpbT1DXHp7VMgqHI/5MHrDeYBhAiTnpphWQs
 mRCQ==
X-Gm-Message-State: AOAM533sYdJsblAV7tGrWKqguatebIapeV96zi2FYZvQoIyGis1rQz3B
 0v36jb6zn6vJml8rz779ZZX8eQ==
X-Google-Smtp-Source: ABdhPJzkRgh3xjn5OOZwFA+d+SVbrXddo4DcMH4bvBElqVZEudzwmZ2fOoE+obKd9dv3PXL4s0KoOw==
X-Received: by 2002:a9d:6414:: with SMTP id h20mr328025otl.28.1607467992432;
 Tue, 08 Dec 2020 14:53:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q18sm88770ood.35.2020.12.08.14.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:53:11 -0800 (PST)
Subject: Re: [PATCH 1/7] target/mips/translate: Extract DisasContext structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201207235539.4070364-1-f4bug@amsat.org>
 <20201207235539.4070364-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <030912c0-ec70-9b24-5466-e2d3e8f62dab@linaro.org>
Date: Tue, 8 Dec 2020 16:53:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207235539.4070364-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> Extract DisasContext to a new 'translate.h' header so
> different translation files (ISA, ASE, extensions)
> can use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 50 +++++++++++++++++++++++++++++++++++++++++
>  target/mips/translate.c | 38 +------------------------------
>  2 files changed, 51 insertions(+), 37 deletions(-)
>  create mode 100644 target/mips/translate.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


