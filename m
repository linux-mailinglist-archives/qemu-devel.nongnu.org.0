Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5E6606F4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsAN-00072G-KD; Fri, 06 Jan 2023 14:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsAM-00071t-1i
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:14:10 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsAK-0005X2-JG
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:14:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id w203so1736484pfc.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fw9MGL2DNo7qoQwAjTHcW4DVUOnJ1zlJsSO2n8Xb878=;
 b=gScaM83dftoBicL+BYeEnPo7e7I25KwS7lbhbtomaCS45B2/1Kpu7ZMhpCDA3yAoPy
 eHUaMAfTl/wIBvgWmlVR+m2Pdf+2b+XD0SlG13EOuOQwlETFGfDt7vYDpspCqw/dgpqQ
 FIs4W7bczYhG68PbEoEGOCGxF/VvliqqcUjzGD7A/FNmwg9GyhcB38f7gW6cw3cnfxmZ
 NIwNxWjlMUY3qdXrFcGtccLxLGeaUl2lQFHVGcqhFocC3ZP2bV9sGXTTJnPRA3+tU7/s
 rDJelPhanEF4oiSAGW9BYuRQC+JQKX4uOXP/z8GlN3wudQCT41tKG/bWngaYVe6k0kwx
 +n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fw9MGL2DNo7qoQwAjTHcW4DVUOnJ1zlJsSO2n8Xb878=;
 b=vhfoWFfXL1jVmUVHVVtxz98x27dpNVzc9fVseAQsKjaY776LiFhoGupGvGDlhPBZ84
 /vk5+21pVBsfi205bZZIla3mVnRGGJm9eW0c1C/o8cORfVQk0NLzCsXF9ktV/SS34+sG
 iYdZ5DZ1T6yjg9ABPn4ZXfMuvw+vBt1XKBFEh6UUCq/U0UOkLhLIFnlv8LprJI3P8AiP
 onkhifyDjZ+uCroThV9OeWjf1hn47MKW1YRR26EmkUr06Xx2OuMx4URbSg1ayiBmdLZt
 TD1ta+03HYeTNe9HRGQFki9HgmoWm861GlYKbFdeSj5+GKWRRfy3QQgNdeDD094+pRLq
 bDjg==
X-Gm-Message-State: AFqh2krjWO+8aiNj+KaLWe3DrwW9K6lvi5yqLIvcNwEv0MyLui2wyd+L
 h+BuIO9BdmSCDlfEXdpRYgosAQ==
X-Google-Smtp-Source: AMrXdXt0up5oDKQ8WY0gbPNVw2n7y2WrAQUK/fM+kXPu7dUeYKGgMbUz8FdmKlJUqDCbMnLT5r6nug==
X-Received: by 2002:a62:ed06:0:b0:583:3e7f:a038 with SMTP id
 u6-20020a62ed06000000b005833e7fa038mr3956550pfh.5.1673032447099; 
 Fri, 06 Jan 2023 11:14:07 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 a13-20020aa7970d000000b00582197fa7b4sm1469776pfg.7.2023.01.06.11.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 11:14:06 -0800 (PST)
Message-ID: <cd6b980e-2671-2d9a-4508-73dcf106e415@linaro.org>
Date: Fri, 6 Jan 2023 11:14:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/8] hw/pci-host/bonito: Sysbus'ify outgoing IRQ
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> Since TYPE_BONITO_PCI_HOST_BRIDGE inherits the TYPE_SYSBUS
> interface, use its API the manage the outgoing IRQ.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

