Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0B43D1DD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:43:29 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfopc-0006yU-FH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoHE-0003ER-9a
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:07:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoHC-0000uv-R0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:07:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id t7so3874339pgl.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGb6PiVAKLHgBGE53O3UhHWJbHX6ETyV/7EBI++X+QY=;
 b=DsE5ijW5C4fgcLFhscpX1zwIZFmK+kd4ouQ1pumflpSigb8X/aO5N9jnR0CyFdSf7+
 bttH4RQNAbOnlwzPnLEjpBFQgeoy4oXoLulLQXjlRboIQx685GY44Wh+vNt4BiLJxlh1
 BdR0ey/fXOTRGCSYdfVfjxVooViwlUxCgrldGuE7yLNq15PJmarRAty7Al9BMk55QFLG
 /GvC+7Hj3E8uyWwkDWDJVS54D4xdEfoy2rPK+j1pYpDPOfnZ9IGSvew0+2h9qSD+RMga
 dQDRtrrQUQYtIqUStmum9BzG817lcVtJkZa1aeCFmsa1ID2EjXEOwGFNrZARrnJJCPPH
 ImYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGb6PiVAKLHgBGE53O3UhHWJbHX6ETyV/7EBI++X+QY=;
 b=DoVcD9+3AMKNIXQyzuC9DAtIcmPQyT3HMabfAGTrA4E2+YWifAVrYzFk1/jhoYH9nM
 VGJlbX5fPC6dXRIjOyV2NFRnkLsuHX5s9TZezEEQtNKRA4/q7E6f/3gMdshqRNbvkEkh
 6H+rYxahOo7E0UOVWiJ0VNprKPGM8m0cRKNc5J4R+KtrqPspI3oFE2RoQjhmLEvcPsvu
 9FmpAjDWFVpi4W1oeFMhCnKAUcp0v/1HDKMt/uHqvDENHnS0dPoAYdzWouoyJYGW8iwJ
 dNep9lpr6d5oucaQcYnt9W3ivpWGBQDaiDqE18WMjhKHL6FiaTmXYtw3nhRREsT8vQIX
 PDUw==
X-Gm-Message-State: AOAM5319sIqKAxW1kISKxYZS6pWOJ4rAQm/0yPBIVzPos4tl3mpCZUe9
 ngR4eCRTAU5DBshhXZ8ypaFPxoLQuEpVLw==
X-Google-Smtp-Source: ABdhPJzLXUmpk85hbklhsSAfYELNaxUqz+bI+rHtltQypfABqnPV6CfnJr+dHNsvV0/PhN6gjoOnyg==
X-Received: by 2002:a63:9517:: with SMTP id p23mr12833367pgd.7.1635361673189; 
 Wed, 27 Oct 2021 12:07:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id rj2sm483053pjb.32.2021.10.27.12.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:07:52 -0700 (PDT)
Subject: Re: [PATCH v2 05/32] target/mips: Have check_msa_access() return a
 boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d969a093-d4db-d765-d204-b40c652eeebb@linaro.org>
Date: Wed, 27 Oct 2021 12:07:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Have check_msa_access() return a boolean value so we can
> return early if MSA is not enabled (the instruction got
> decoded properly, but we raised an exception).
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: return true (opcode decoded) because the opcode is decoded, reword
> ---
>   target/mips/tcg/msa_translate.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

