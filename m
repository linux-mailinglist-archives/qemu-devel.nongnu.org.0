Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976E2DB728
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:37:23 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJsg-0006JT-DZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJbW-0001Nc-Hm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:19:40 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJbS-0007k4-Ro
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:19:38 -0500
Received: by mail-ot1-x344.google.com with SMTP id h18so21129045otq.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4jKKLYnW6eM47hkIEoFIJgwOeY9tD0FuXauIYvNdRQM=;
 b=QT+aFmhuTvTXmlOS6vXlQJ0Inh41nvmR8cY6LPDr4QNwHkOz/dIgnRSVx17pZza8GO
 aPKkiS45tazm1rZfYAH0kp15EJF9t5cxgOmqQBwti5N38MJNwpGobw6etIBsNMR+oZsl
 /vVCXeFaVEINdSkQAZF8JNaqzNn5fDmnZuj2F32fmJZxYJFozqlXsSi5elNy+kgN0X6a
 qWFLEmPCwxI/jdH+jx87WRUeV8xMjYbl6RWKf+zPf6y9zOpI90nWf7uiDGoisuw779q/
 MxYVXrZGiGr29tuC67+ZASHO11FCSOnke/G9knSzRWpWjrg1iNDm5gFyJ9QALy7EUJgs
 jnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4jKKLYnW6eM47hkIEoFIJgwOeY9tD0FuXauIYvNdRQM=;
 b=Ae/rPFTA9bwbAdmGcgcpFRMKlYyFpqCwCXZg0mSKllHjJSvAVdcKtmwle2/n1sMsOY
 7H5AaQ/P4b4BHHlT49bUbJtZ7fFV3pex5nrAlWCdTGJ/cwTI9S91VP082p1ZIAfEV5tS
 l1NdnVCzyFAj3vlpBzM19BgRKEMJ8EGnEtWEnfILL7zhOrqJYXXUFHyl69FL4AmTSDWI
 eGqaMV6ItnuBtqoRNz7cVaEACWHhU6ItyKklmFMjxoIuPK8cUchjZvKKTX5xh3Ve648c
 EbR9P13DKUuGLyLvOxVZzV6ueuvnhf7auHBdjFG1kFrukk6mLF7XldyEV5JP75CzqWMV
 cX+g==
X-Gm-Message-State: AOAM53095eCSBiGesOIERqDkP9Z8FPRc40FwsaU/BRNjYp7MjnZdErel
 BNYR+amjS8QhkRafBQATk2cBOQ==
X-Google-Smtp-Source: ABdhPJzAMX9IYWAzIVmdR6ws3mXW/eii9EP8/sfhz6rcQHemp3E1iJJnjeLSbsRr8Q++COTbwkTeaw==
X-Received: by 2002:a05:6830:572:: with SMTP id
 f18mr2976078otc.109.1608074373585; 
 Tue, 15 Dec 2020 15:19:33 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v17sm48306oou.41.2020.12.15.15.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:19:33 -0800 (PST)
Subject: Re: [PATCH v2 22/24] target/mips: Introduce decodetree helpers for
 MSA LSA/DLSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <937ba112-7706-73e7-7ae1-6a07f6ef64f8@linaro.org>
Date: Tue, 15 Dec 2020 17:19:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-23-f4bug@amsat.org>
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
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Add the LSA opcode to the MSA32 decodetree config, add DLSA
> to a new config for the MSA64 ASE, and call decode_msa64()
> in the main decode_opc() loop.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mod-msa32.decode    |  4 ++++
>  target/mips/mod-msa64.decode    | 17 +++++++++++++++++
>  target/mips/mod-msa_translate.c | 14 ++++++++++++++
>  target/mips/meson.build         |  2 ++
>  4 files changed, 37 insertions(+)
>  create mode 100644 target/mips/mod-msa64.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

