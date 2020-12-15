Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF32DB71E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:29:55 +0100 (CET)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJlR-00060b-MT
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJdR-0003b6-OL
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:21:37 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJdL-0008Ew-Ie
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:21:37 -0500
Received: by mail-ot1-x344.google.com with SMTP id a109so21119251otc.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dI47DBQGgI2A5TAy6heUuzqewByjC3y+XRHFRtARr9I=;
 b=gk7oNcrptK8znmuIFENdnTd2PoIaAF0jpJ139NLa9vpOfYjvdtRO+/J9aV6i23Pujc
 W8WeI+LSNJnlQpyVBp5KNZTmMB4TsHfpM6f9luQ30O/r2+VvYvrSMJuZY7Id7CXFCIDu
 6ag+gsm9KPYv3QdbbkH7gV9rAvTCe2nabdPJeg03t8lOTBinnkBX+yz+D7rX9UheqhCu
 MfvydwFwV2/J0D61DwC01zcbYWwwS7oSLNA8/ht7irbAi5j7djFROGrUlolbIKd2hBKF
 q5VsC+w8lRjcn+vSv4yRhIRmWb3B5/+EUkveZdzJwgOwQyjU0on5YAJE0P7SSykNXRLM
 No0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dI47DBQGgI2A5TAy6heUuzqewByjC3y+XRHFRtARr9I=;
 b=Hrnqb3bDKB2USwOmctJtNV6TlpX5GdogvavdhfSlqZ2/Rr7NBKxhzBlf3+b5lLjLqs
 wiTIHkmmds7kpvsP0YIFxuCcc29MEV9yS6mFefqusYzL2rEd1o+F+e7GliQBwTVDUCkk
 4dWxmgIKfWWrZygu5sKar0dwasQQJPMKTvOTe/tQ/ucUMKw7/XofvkTd8zDB5CNAECZX
 w6RMBt4tOSGNzvtqBpoLPDboYC9+G9aLoGYZ+FOEJCjO+Hu4QKPEVxgS+luE2LvuUQjS
 zRgoyRyAxXZqYy0b22guivzgdQxrA0YUhnHaNqO793sKhcKXw5XG33hbR7VsDyNPvqDQ
 9nRw==
X-Gm-Message-State: AOAM5307WfVZqMcP6Peo9bpIVoWWvoFRIwG+heQL/Y7N3lDpVMdCAnaO
 pJcJ8pAx6M2oSRy6JAqyFogtMg==
X-Google-Smtp-Source: ABdhPJw31FDXeEzmj1nxbRnvp0hjIy48xla69UciM78qrekoigOv4tIJyQcvc5Dig1WjHu/7QO5E3w==
X-Received: by 2002:a9d:37c4:: with SMTP id x62mr23987807otb.87.1608074490316; 
 Tue, 15 Dec 2020 15:21:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w4sm4181otj.3.2020.12.15.15.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:21:29 -0800 (PST)
Subject: Re: [PATCH v2 23/24] target/mips: Introduce decodetree helpers for
 Release6 LSA/DLSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f57948c7-f68e-0921-42a5-f41280372096@linaro.org>
Date: Tue, 15 Dec 2020 17:21:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-24-f4bug@amsat.org>
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
> LSA and LDSA opcodes are also available with MIPS release 6.
> Introduce the decodetree config files and call the decode()
> helpers in the main decode_opc() loop.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h               |  1 +
>  target/mips/isa-mips32r6.decode       | 17 ++++++++++++
>  target/mips/isa-mips64r6.decode       | 17 ++++++++++++
>  target/mips/isa-mips_rel6_translate.c | 37 +++++++++++++++++++++++++++
>  target/mips/translate.c               |  5 ++++
>  target/mips/meson.build               |  3 +++
>  6 files changed, 80 insertions(+)
>  create mode 100644 target/mips/isa-mips32r6.decode
>  create mode 100644 target/mips/isa-mips64r6.decode
>  create mode 100644 target/mips/isa-mips_rel6_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

