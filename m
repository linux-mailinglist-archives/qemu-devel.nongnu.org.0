Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B13F0D26
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:09:36 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSoZ-00025u-Iv
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSnY-0000oS-J8
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:08:32 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSnX-0006qm-9B
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:08:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso5319174wmj.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bTk/2OJ66DeILboCw2i9t/5BsqO2gF0WICgMdPZMBWE=;
 b=e/nxaZcLiqWd4WGngXVUr3w0uCXIqTHVGInQFIrQ1pIO1eFx0XRXxlRpSflumwdPQK
 BPl0QZ4w1oNuvl1iBKgJQYURhld3bNM9/Pz3+WWZYiaZMSVZleAUPuhchyNT+MMtLeN6
 8mh6eog6aBuNP2yz/EGN1fquQfwvwQFuauzHo48wAlD4MkDZuo7UDVALXHh8y8pQbFMO
 2x850qghexbv+yT3LntEieCLu2RpJ4oOa56nqBOsA+lMC/cRVN1sZS+TTCFEhPVsm68i
 trCCWDL8pZAdNZ59uBgRW+FlKc5HzJjUv0J567Dpe+WCLiWMmbZfL3gRY1l3JOC/k4cP
 BqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bTk/2OJ66DeILboCw2i9t/5BsqO2gF0WICgMdPZMBWE=;
 b=b+b+OcZd+zci7+3D7xjx5IWOnX1KeLOK5e08HL5e+K2TMvDVlNj2lBj7KlhbcaTo8Q
 1ZZwBjzHgt6h0Nh8Z2mmyz8/APe4szLoFwTPBSUe5I0TA5cPYOVDztV6lDQux+SHTzUv
 KH3+TCAiK2pF7HZL81qZZKHco9WeB5lsuA2qMADdzdjwoLmYisNqx04AHSkkhQds+Prd
 Rik7rrKo5oCFQWXSrTPTpKG943ip5M0Eki6fycQNJbPwDHqORK5ITTSlPc/i8ehK0eu+
 p0fIq3FDo3NjX1wlQKR+vBkjKiaMz1ZxNvrQpW/TIYmSQVWH+DukmOMQVLU33YrHaRHR
 zWcg==
X-Gm-Message-State: AOAM532FG6X/vW93D5Ot7PltCD/MTy0Z2YNeXMz4FaM2Plw6WY4BePOu
 08dKbiFcYjz6zGHS6Ie73myUh0ZfVE0=
X-Google-Smtp-Source: ABdhPJxLgtrscsm/zmUFe2d7dvbu+0zI8xCJ0mNleDURTfkVwxe9dDdxVUKBgQg3Q5ENXdoAqt5S2A==
X-Received: by 2002:a05:600c:4a29:: with SMTP id
 c41mr10132550wmp.86.1629320909736; 
 Wed, 18 Aug 2021 14:08:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i9sm1099869wre.36.2021.08.18.14.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:08:29 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] tcg/sparc: Introduce tcg_out_mov_delay
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818204602.394771-1-richard.henderson@linaro.org>
 <20210818204602.394771-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e884b20f-edc7-653f-6666-79ffcd23c0b8@amsat.org>
Date: Wed, 18 Aug 2021 23:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818204602.394771-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:45 PM, Richard Henderson wrote:
> This version of tcg_out_mov is emits a nop to fill the
> delay slot if the move is not required.
> 
> The only current use, for INDEX_op_goto_ptr, will always
> require the move but properly documents the delay slot.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

