Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFDB3276BD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:48:19 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaTi-0000Cc-Dx
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaSC-00087b-LP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:46:46 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaSA-0001SV-3s
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:46:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id o188so3983302pfg.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6+w7diz3PGg72bmnc0epdo4uIUnXGT7+wSyyagYuwTY=;
 b=O3P6MAK25FirOCFsZisYtx6jqCl+D6Bg0J3y2rO65xC7qBBBUoJnvJ5pnTz17lL35H
 +JyJfrpwzRjNXCpYF4V7VVfHUQNCf+Yf/PWYCnQF5AEQyzIM8DLFAy8uhc/7XQ/0uG9V
 8EfNn4yvacqcGvC0hLyTHkY0UcqWk9wnQc16HL3774Zj8s3DFkvDECscE+yZ/CQfrE3x
 iK7VLivGA9LfmuwbbE2/sPlLUxGPgyJSxrV5YEDqC1Mo2Tci1gzD5Y7DGi2YB2tklUWU
 9wRwsQ2OcatCOLVtGJTbNSL2Jvwx9bxDn6j54RW2bk+sVJgpdWsB/JEGdLY26AwXXEmn
 Mlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6+w7diz3PGg72bmnc0epdo4uIUnXGT7+wSyyagYuwTY=;
 b=qkHwH64MNpYNr9kj3X2CpZ8BbETE5L4gh+A3vm/W9rImEUjOePAbX/Yp1cACTsJyIK
 c3pYXrIX1GM5sy61bNFq04MiXtTJa0m3aMHV7e0lEBFpKyV6ereUwui0S6YUZsRZd4v7
 Hu1z/JRIKO7lhHb7oKb5+Ovs64AHJMS7JNUKoyBGA7RG8+q1LuiVYmH3IupBukyajVtV
 y5d83J68F3qzgi6aSyp4vOfXHfnqFMe3tahr1sHC92+4FSZbDYegxYqNzIsIKmlw8nRa
 5Mt2tOTK4fqlxKPWSRGxJtOju9XeuQ0W00zT4AgU/lfKznqxGrEqOFj4vJA2nU443zK7
 11aQ==
X-Gm-Message-State: AOAM533t1zW3eSafpjgPpn5hLc4901mD6jgpxo4m5fG8QrG804x/J8Ws
 8qybmcgJ7RFyJftARcA9BuXniA==
X-Google-Smtp-Source: ABdhPJwAtpuompKSzzYCPU74m95iE1MZKCk160JtqtHpJ0rjkV2fqinZZo0KiN6QPmMv3Uc3CKr0Qw==
X-Received: by 2002:aa7:8a46:0:b029:1ed:cefd:7f7 with SMTP id
 n6-20020aa78a460000b02901edcefd07f7mr13505108pfa.46.1614574000381; 
 Sun, 28 Feb 2021 20:46:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o129sm14708821pgo.27.2021.02.28.20.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:46:40 -0800 (PST)
Subject: Re: [PATCH v2 18/24] hw/arm/mps2-tz: Support ROMs as well as RAMs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d2335c7-ba17-e27e-cef8-dc5baa3a2bc5@linaro.org>
Date: Sun, 28 Feb 2021 20:46:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN505 and AN521 don't have any read-only memory, but the AN524
> does; add a flag to ROMInfo to mark a region as ROM.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


