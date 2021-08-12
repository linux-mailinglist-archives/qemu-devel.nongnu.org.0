Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6D3EA558
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:17:37 +0200 (CEST)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAaW-0000kx-Tb
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEAZE-0008TT-CU
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:16:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEAZC-0002o8-Ni
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:16:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x10so1961673wrt.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S/7GPIiTqNb62w098ChsxRW1QSeC1VBiTE7/K6c7W/I=;
 b=PPpULSKOzW2ZEa+iBfgzzZLTo4j9EjjKUpZeasmgFPu92RUeNdRp0h+32aC35Onhky
 Ce7aCVTkGR4x5/4yxJfrVJie+/B+o1h2wUUVYH4ZK8+Wk7uB7k+Gn639GVM0Gitxi/nc
 d/c5mt0Uh7i8RC7mbx55N29A7NScFCTy8Tkb33sx2X7THlNDncAoBhQvZ2VaZQBuKLPE
 9yr2BmWUtk0Z9itVSRVebw1HyRS1D7GbOnoE0qptDnSQSTsvL8GpzpdwZ3xlDqAD1eST
 lJ6PlHH85kCtiKt9K0ISN++bqH/sAxIQa9NkK1vIw7YNcRxkZKXJLOMGNm/8GPTEbDP3
 PO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S/7GPIiTqNb62w098ChsxRW1QSeC1VBiTE7/K6c7W/I=;
 b=ez2eRBeCVhwl8AfISuTTa/0vSoi7gcuOv8wDbwk16OeO9E8eEFVVP0bpcxoCMCx2pg
 QBvkNINkCKc/7q73ScDpaeKm0gDbaBpsfzIfQGbuBtH3iUXsuSGZ+GyFUwscrK+3TPWD
 5cEgGavK4SqW8v4w86Tt2jBPhh6dsXUdV/G+Lxe8VHElm0p1rYa+xFSLt/VkJF1Amd5c
 PA75SDhu1LKneO2wmfk9uuNiZ69GrgDtYVCqrkKLPSo53M0gK2hPidnSuDXSZbIYT6Bu
 tY7Vcnv0WD68/IGBjyQaYhM15L9Znap8nE1d1g2dvziZGRbMXjZ8TpTjYAA+o26ZsdVm
 b/CQ==
X-Gm-Message-State: AOAM532WuNlrDA2kO+5rFuuUtkaNF8asHMiJFSx3Yeqlf7H7YugSxJno
 mwTdIjRvCWXPAVtk7O4EU58=
X-Google-Smtp-Source: ABdhPJwMsbhFZp5hw5VcV/GgMA7xZoejX3Rkg7gVRMKa2LshA3mVWzEWRONq1RycpfjF0/LmRl/DDw==
X-Received: by 2002:a5d:664b:: with SMTP id f11mr3931989wrw.39.1628774172929; 
 Thu, 12 Aug 2021 06:16:12 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k17sm2996199wrw.53.2021.08.12.06.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 06:16:12 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (disas/hexagon.c) fix memory leak for early exit
 cases
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1628773760-870-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <826ee7f4-0212-bec3-f804-466286c699e7@amsat.org>
Date: Thu, 12 Aug 2021 15:16:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1628773760-870-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 3:09 PM, Taylor Simpson wrote:
> Don't allocate the string until error conditions have been checked
> 
> Fixes: a00cfed0e ("Hexagon (disas) disassembler")
> Eliminate Coverity CID 1460121 (Resource leak)
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  disas/hexagon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

