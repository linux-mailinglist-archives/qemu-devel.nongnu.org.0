Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910F2DAE96
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:12:19 +0100 (CET)
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB3q-0008PY-Lf
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB1c-0006oE-8e
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:10:00 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB1a-0006Ao-G3
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:10:00 -0500
Received: by mail-oi1-x242.google.com with SMTP id s75so23436423oih.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ecayntQDo1x+F25YKQ63YC5+lE3CV+QHl2rJeTtz5lw=;
 b=My2UM26pw7sgEoSCvu/ocU340lzzf/6arnVKIdQS8grRSw2Pm8uaiXRj3dvpzHex1Z
 sXwRZJBdgNdtBhG/9vi6t+X6PWg0CAct+eY6ws5B4dx0flJaFSZ/1bnzTQ3gSmME1r1G
 Ic5uf75mmUh9LvjsUWo54Tr/ZG3Qf7Ui/9OT5KX5+Jy+zFLlHLdaSK9Egg1L28WACbLc
 gdTbKz3qMbhxEwkMyJOPmTpj66mg+7vaITFpgoQrH0a5sVA3ep99cIt4uPEcf5SbqU8Z
 idHtqjK9W54UwiC7XQ4AoFhAYTSJubwnvN6rSpfUFOX/7InBBDb+xjVbKdhbiGVo947/
 sG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ecayntQDo1x+F25YKQ63YC5+lE3CV+QHl2rJeTtz5lw=;
 b=Ix6ILBPHHf4KtjcltQ0XQWe3Hw97EK2ZlvXT8fuGs/su9OVD69y5lojpdlNIRhBMEk
 zLhSTxm6wysVnl3JHhv4/HZInlX9Mgchvix0lKggINeOo1u7IIsSE8sSlJPnCshK6627
 KM5bcNHKM24lEVvhdINA6y5UJ0WsDs/b86Zku1pWfQM5nkAOKrmFWAn4GxqbP89oOUh7
 +M8bwtdUYFd9bzAclmCaZepHmr7E2WJh3N6g5VwzkpDq7ilrMJdA/zSYLSUerfxbRw5S
 azp4D1qMU7NZaWPHAZwqgGnNTgcidVegyabM18XNbEPrLiWpVRMBhRXR1VSwjddWk1oe
 wxcQ==
X-Gm-Message-State: AOAM530DE7p2JQZqhHfiLWSEUp4CAc7Sbijasi6iPCn+2lyB/r9oj6Gt
 z04F5fHQXs03nRrdGz3W2RkFxg==
X-Google-Smtp-Source: ABdhPJyg4XreSkxXZJCpdyoXSX9GadX58IVReFW1lxN1UArO8sNj8lB81tYJL2K2fau9Ur5op87UDQ==
X-Received: by 2002:aca:eb44:: with SMTP id j65mr21577458oih.19.1608041397269; 
 Tue, 15 Dec 2020 06:09:57 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y35sm431688otb.5.2020.12.15.06.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:09:56 -0800 (PST)
Subject: Re: [PATCH v2 11/16] target/mips: Replace gen_exception_end(EXCP_RI)
 by gen_rsvd_instruction
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c64072d-4999-1af6-bbe2-eeaea3553af4@linaro.org>
Date: Tue, 15 Dec 2020 08:09:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> gen_reserved_instruction() is easier to read than
> generate_exception_end(ctx, EXCP_RI), replace it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 724 ++++++++++++++++++++--------------------
>  1 file changed, 362 insertions(+), 362 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


