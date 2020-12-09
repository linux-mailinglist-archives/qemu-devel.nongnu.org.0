Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DDC2D44CD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:52:58 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0pt-0000BB-5y
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0dX-0006KX-Fm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:40:11 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0dV-0007j1-Kk
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:40:11 -0500
Received: by mail-oo1-xc41.google.com with SMTP id k9so427590oop.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q/4FTBo9GbnF6Axoayo8r9BzUO9urgmSYZFIb+BLm/I=;
 b=yuD0StL+1cixATR64V69e6FfQgcik1S/G3vJtmj9742+A7ldSkgPm0WDDFmMMt+2rG
 MFMlsfypkOYn1Q+4nRMrwFvnmQ57oTKpEm4+94njagOQOXvtvDoScGolY4zjnlqAJ5wE
 Q179LxiSaBYoifvz91OaMESFBNeZlErISN6QCwI7R8bRWVOLQPDUuMeJuGg0FtlL8lGL
 pymJ3dQjpQT51eaK8TH7dRTS4yXzox/7uDhmTgtw5TosBpMJA/sAlX8aRDY/rlKsoSO5
 Cy4nbeoop31+H7O3SR4/ggB876YhXanlFopTH9Qh4ynjPMqHoc59QrBJ2XT/vMk1nCgI
 8hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q/4FTBo9GbnF6Axoayo8r9BzUO9urgmSYZFIb+BLm/I=;
 b=fUOKCdhrdP0X/T/vnUXBAhoeGhs3cy7Vdl00r1/aEUXoFpEVodyOwk5cCiN4S8arqo
 ZBfAk85KBO4VzsbGly+8oSIQ13LVgcMKu3tw/vtDmnErGu+qMRGRPtk+5wL3HA80MHtp
 +LCXskIW6TQ0UbDCvRRk1pgyo71wSGemB8fZ1jEIwqalqSTTDIOtLvQRcxrPGq4zET5B
 mBSUs0aISAG4x+llaY2XT3EN7ciU2qrMRPsphS37CI4WT7Cw/aun+iQiNMWe1omIID0T
 02TgBim2zsJMPMrqGXWm+ygQ7tY9CfvtDQerUWhNm76Cs2KLfGub9ELKjit+lk97XFnx
 UUSQ==
X-Gm-Message-State: AOAM533Mv2J3IMHWTw/uDuBJPk744J//iJVXjq4YZoqZWEVo91meA6ZU
 K7iWKJW2d6blroQrI02rvRBKRQ==
X-Google-Smtp-Source: ABdhPJz3vo0bxTyBB/qDI/AV/4cjbKPwz+JhWXrbg8ufMbPgrRugD1+9xi5Qn/nqXjS3rKpN/Ogw6A==
X-Received: by 2002:a05:6820:3d8:: with SMTP id
 s24mr2129313ooj.52.1607524808594; 
 Wed, 09 Dec 2020 06:40:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm410622otj.67.2020.12.09.06.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:40:07 -0800 (PST)
Subject: Re: [PATCH 12/13] target/mips: Convert Rel6 LLD/SCD opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce413365-8fef-8b76-9fbc-efe80c825945@linaro.org>
Date: Wed, 9 Dec 2020 08:40:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:37 PM, Philippe Mathieu-Daudé wrote:
> LLD/SCD opcodes have been removed from the Release 6.
> Add a single decodetree entry for the opcodes, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips64r6.decode | 3 +++
>  target/mips/translate.c         | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

