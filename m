Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBC6EC1B9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqexE-0000I9-Lw; Sun, 23 Apr 2023 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex3-0008WN-2M
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0004Qo-46
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so3304693f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=Ntx4jM99/Q9ONKMBmHdhFE5ygF+oAKqV3517Oca+osndxlYFDD5O5sTbO86P9BZ+9U
 PwW2fexBGdy8Upataf0wb2FDaQK9L5hhyjU64HDsxKFnqai7+sdsawNZwzfxYpnDrY0C
 CZpW7QfnG2VE0DHR350HmmFSbVRrVXwYq2yDwKT0NOPTCPVJzYHPesLryNwRQ6ML7p4H
 fxBflApFTYaTDLx6bRb/YqhVLt3aiiyu6tg0//eSPs0vyxasbhnN9YHONL9V/za6AYYu
 Jab0d9gG9moheQbZ2+HU96cn0kO/vU4rKiLCwvx0vxWLUMoj9Zq/Wmxm1uyRlTfB3Cf/
 t8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=F9D6cEgFMoNCIi2HFIOmusO0ZI3ilBYs5tCDMPwmwxaqJk7AdzRg+aKYX8RMjCpdyJ
 FtD1QQ+hC2X/6LScrC7HaMenfVG0MmfjwdFVp+W1O/oEx+42P7FFQcAzy1i9xZ4Nnj5o
 /y3IBXfSV+ppHNwBcJvylhF1q8Tr0/m/ndGXMXlM9zXmTH7w/OqSle1BP3wnpVRE4IPC
 LO7AAUfsjrn8Ck9BRVF/TdkrVduBH1RDGVFg5qoEQUrPNj0WNpNi5Rhs1JvifLtVHAlQ
 gha0z3i4wT6igvsE3v2QoFeI/M1VLK5L92yBg/46F3szSOABgZ7zeiGxRJh2vJIJ2xP8
 0umg==
X-Gm-Message-State: AAQBX9eTtN+mHhtYl6gmD+waZ+jb6mr9FibhzYrwfKlHQkfJXnUdgmIu
 BK/pd32BSgXvS2sPhQxdskwB6g==
X-Google-Smtp-Source: AKy350ayMjqV5/OBjzCho3zLEsIYb5RwJu/U/xECxnU6KX1JmwfHNxr6JZG3PHBTcBoj+YuBKfdwlw==
X-Received: by 2002:adf:fe02:0:b0:2f4:de63:a0b4 with SMTP id
 n2-20020adffe02000000b002f4de63a0b4mr7956320wrr.64.1682276436949; 
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 s3-20020a5d6a83000000b002fe13ec49fasm9113641wru.98.2023.04.23.12.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Message-ID: <0538aac6-8510-6ed5-c5f0-627b90a09bd7@linaro.org>
Date: Sun, 23 Apr 2023 20:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 25/54] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.  This requires a bit of local
> variable renaming, because addrlo was being modified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 164 +++++++++++++++++++++------------------
>   1 file changed, 89 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


