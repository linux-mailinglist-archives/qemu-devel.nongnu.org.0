Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4D2D4490
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:42:13 +0100 (CET)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0fT-0006js-Th
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Ov-00055l-0x
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:25:05 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Os-00025Y-Gu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:25:04 -0500
Received: by mail-oo1-xc41.google.com with SMTP id q20so412462oos.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1PAlMrdgfTheqYdPfQs0HeCe46hGPL7jYIRAqrC4L4g=;
 b=UKCzl26VJYEZeHB8/F4PCtHA1HTtWM91Hm2iv1OrDgMmbxme8cNf4zgdd0o2lOhQj7
 IvfbMLkAS0dHVNoYpZVP/VhYFidkkRlSiHo6gm4DHZC7IdsZLxAXb5xQlSGPm7m3uvEl
 TuUVU3yIODfioo3p2jZjBbGKLVWy5RF9fW38swOz6KqcpZ5JIDkDU5zXJeJkH/5Bxkx8
 rAt9j02UAkpqja7iUlmZ3QORPul+hZi2/FGSu1ueN42YC+UPr6an7vUfDVDa2dfwanKd
 Edn5gTSbBQQ77Lj95hoxg9gcRAldrDQkRsgubrYr14X8liATbB5cAAsILbAWk+ic+qpp
 LOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1PAlMrdgfTheqYdPfQs0HeCe46hGPL7jYIRAqrC4L4g=;
 b=afB7ZW/Oqhc96LKcI6ixm1DVjBIIQvLz1ompz9UIhuyJRi+MjQo0sFlxT5yR7ZseTy
 lOCgBm9gY7mqiYT5JGCpTW4gi49WEZk0xBDIZdb7pxhx9yeowZiBmqNhi5IqqGpw/O4n
 RWlH5BWIzyiHQkBCZwG8uUkVOdFbRpREOPl6xBuGavCOCjiR/np3MjSlk99KXq4ZzB4+
 87bg7g+POXSQ+I/voMPzd4ywv2XMvviZcpNB3hG3IL8UmnaPgGs2AxyfgJxppy36xs80
 cM9pNUyzKD5/wBkj1f7J1Q4XDm4SXzoz4U9BXvGJBtEKOEE+B4FjBcX8f54EeUmVG+At
 6r6Q==
X-Gm-Message-State: AOAM5315pxnLF795ajPG++6eJu+qswZ2JxwiC/e23sWqM8JEBNRSqmWB
 u15Klu3VEntfaVpNrf3AZDLWJi3n8CAxRZID
X-Google-Smtp-Source: ABdhPJwlkMsZWxHARaBY2kr6yANZOB2LgTBUga/Rkasxmr5u29wkx0ewQksw2AuOsN7HMot4eez1Gg==
X-Received: by 2002:a4a:2d57:: with SMTP id s23mr1987663oof.71.1607523901321; 
 Wed, 09 Dec 2020 06:25:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 9sm404876otl.52.2020.12.09.06.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:25:00 -0800 (PST)
Subject: Re: [PATCH 09/13] target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bc3b02b-42fa-74cd-b8c0-57754d07d454@linaro.org>
Date: Wed, 9 Dec 2020 08:24:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-10-f4bug@amsat.org>
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
> LWL/LWR/SWL/SWR opcodes have been removed from the Release 6.
> Add a single decodetree entry for the opcodes, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode | 5 +++++
>  target/mips/translate.c         | 5 +----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

