Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCC33E190
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:41:17 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMINI-0002Vw-CH
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMILa-0001t2-9U
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:39:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMILW-0000pb-1K
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:39:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v4so8254180wrp.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fl5JsFwH2WzaarsjTT9fIyI5dbTsJuGye18LooJuM7M=;
 b=Yqhu+DFEfQpOCu5Oa2hQBV4SNoNzeTr2G+2xPJnYPJPdCN7h+XFUkpB7bspUnmtVoF
 /Q7Eza5a5LJjsYlW0v+adgEtv2eLE8dTq0AIXBcTJxZEV31ZWpqHYm1+8gx2doCmB7VZ
 yDvP3I6q2AG75d45rpLA9vdJQngHJQmHHH6WwN0/DaL3/KnMSNTfmGBet4oXOYrPx+0F
 Oe//ZYVT7xqKDCv4fAubz3kqnqBM3Q+dQqtXljfoqFImxkJ3zvklFnCaVcAwl2hysCWf
 2df9a6zWbcV8+MpveJTXZlcexgX4PRwmx7f5Q+Qch1dgjlEwkROELv6Au/hksA7wQGPT
 rS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fl5JsFwH2WzaarsjTT9fIyI5dbTsJuGye18LooJuM7M=;
 b=FNWPzrLNFCEhWUmPuejqDDOlZGPbu3f5ZWoHxQZh682I7nBJfUEeSM/+NFQBew+7h3
 Y+Xo4erR5iiYXRN33c6sq6B+UlNsZytn8vdc81IpLbGq9XCMqhsyRohusTzlSDTBqkEv
 ngDqt3N2Rtu7u2jahV28Rgx4/u/YPhkMKdBIZ+ZYVQBXlPlrK4XSksx/2TzH+59ZO2TD
 0xt9gUpFMzLtMkYuSzeqXncrBMXLDbxRKBnTTPYk3uf1lum6XFyhSIm5aUoIPA5C2qtK
 +RrIMkOV831LuQvn0Mht6fG01VP/a03675nLUyshptA1FgsdUncZMBL0Z+jW9QqEi3AV
 GE1g==
X-Gm-Message-State: AOAM530OluioJ/ciQvnJVBam+ZTfLV3IPBVjFMG3304Tkmc06eIA4KfW
 EMt/Bec4VdhWNj8FCfXtEfE=
X-Google-Smtp-Source: ABdhPJy7+sWk3ZatxvP8bRVHTiv/ipysHlNKZ4ZvgyZWiczUIqVp8VAV9rXU1qFGRYK5zkqlWt7PfA==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr1251242wrr.336.1615934362825; 
 Tue, 16 Mar 2021 15:39:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u23sm646237wmn.26.2021.03.16.15.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:39:22 -0700 (PDT)
Subject: Re: [PATCH v5 26/57] tcg/tci: Push opcode emit into each case
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13a9cb69-97b6-8bb4-2d98-164f72d21ac7@amsat.org>
Date: Tue, 16 Mar 2021 23:39:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> We're about to split out bytecode output into helpers, but
> we can't do that one at a time if tcg_out_op_t is being done
> outside of the switch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

