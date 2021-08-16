Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC83EDCC3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:03:10 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgx3-0001Ko-7Z
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFguL-0007QF-6j
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:00:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFguH-0002az-GP
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:00:20 -0400
Received: by mail-pj1-x102b.google.com with SMTP id oa17so27829488pjb.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nafmyV6c+X+K89fT/+8F8Qnv6LuwyVol6Rp945Dis2k=;
 b=WBriyo60naZ1E1GdtLVd/hRE4mJDr3NKeWmOxR9cs7yQWv/xGNbZqJ46vVVU1b/wU1
 RdbCgekFJhuGlFQHrdtqppOXN5V6ck1TU0YLBsMNhC9Ddpr+jhwKCgiJzmj94hS4aFsI
 lMWoSPpbKCA7pedZpSsRnn7vSfQOQQTqItKxbBvD92XFmtSZQ7YcjwAitZbSs679Fz8S
 WqpqbOKOWKR/GFvuX9Vy+UmevZSvrjfaVVHLDlh8ouJCsfNNTPapMyauznm1Xp+JyQK5
 Hv9Cz77ncY9/mmzyqMiaylWzNG3b4tE3uobG+1kdDNDs5sNxEpd0gV5+ebz1qnCvp23W
 L+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nafmyV6c+X+K89fT/+8F8Qnv6LuwyVol6Rp945Dis2k=;
 b=F/8lZddpm/yNETUOnh9Jrvx0r2NeG0bGNFL3eqO/iTZbCBXfhi4z/Vx+2zat2ercbt
 XhqSKkBrLXr1b/860kz1ohUFXOoKT5KAqYNSGXP07/Ls8HR+H2/e+C28m8+c3ZGo6bJl
 w87WdovR6mxdlPejZaF9nX1XTHMD4Jq9BGCI3Ljxi74jCLCshCKl+INUSUM+lI3qwLDg
 5+nSnKVxxbesePPrNWyRZwZW6sF1I9PBOkbTHRgI0OcM5vdBS/fM8Vp2NHZDomNZZVwQ
 vuIkibjC948hpfNaapmipDH0vz+wnkV3S8OnAn2nL0jHDLPBNexy9W7xIryWb9XqTj90
 WNmw==
X-Gm-Message-State: AOAM531aQgCvyJpgk/1ezogf5zCfLJx+P1uRIpOCh4DXY6XlD8VDPdGz
 2WKrqIdGEUqo7IzzyG4iU5CfoBoN5zcZmQ==
X-Google-Smtp-Source: ABdhPJxXEsmONRDBMNZ4KEqTAi8TW3p6GLMbNJhv8Na2OgTAePyVPXOvF8Nj5jP4qEMrTrxYqORqwA==
X-Received: by 2002:a17:90a:a406:: with SMTP id
 y6mr313349pjp.221.1629136816027; 
 Mon, 16 Aug 2021 11:00:16 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w186sm55503pfw.78.2021.08.16.11.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:00:15 -0700 (PDT)
Subject: Re: [PATCH 0/3] arm: Avoid asserting in cpu_address_space_init()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ba0fa2f-b9bf-7175-2c61-e506f3dd5585@linaro.org>
Date: Mon, 16 Aug 2021 08:00:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 3:58 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    raspi: Use error_fatal for SoC realize errors, not error_abort
>    target/arm: Avoid assertion trying to use KVM and multiple ASes
>    hw/arm/virt: Delete EL3 error checksnow provided in CPU realize

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

