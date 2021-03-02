Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C641D3295D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:05:07 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwHS-0001Ux-9w
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwEs-0000kg-Cx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:02:26 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwEp-0000e9-3d
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:02:26 -0500
Received: by mail-pl1-x633.google.com with SMTP id a24so11229317plm.11
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 20:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55oOaZdwm2IvS877B5wgwNLbN64hL1/8rXW71KDwe7A=;
 b=MxUMSRJ4hQxUYRfKBlFTfuqeFmQqqOsGOHydjtLn3GHTdHdp7aNhWEV25ZUk6dqd/u
 nktkBH8DhcaG/js+R9kOufzd6o1DpqKg+rWwBXFayHvEXczVUmWCkEcJlnR4DvLMqou7
 mF3LQ4Gz15/ufbUGQmUNzp3OwunnznH3FA49Zg7SyVJg8CitvPnLbvypgJfJ97N3BNFX
 8dKDpaiR+C4oF2KMQdhYM1PGX2J+u4gEVvFMrvhwIhToiTN4stTmWOBcpZKzSqp1v2L6
 rLYVKFwaT9AKUwJM6h9WPvWTH08a5z5MA7oqDxWt0pnkhrlQTcVsspqqqX7Okj14x+V9
 RSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55oOaZdwm2IvS877B5wgwNLbN64hL1/8rXW71KDwe7A=;
 b=cZsHIQYNgQONpM7JvEKY2DVAWM27EMnRHQ9RFQCNwgCD2NVYLxKY8ryHZeRiuOgr3m
 gPDsVUVk48NZpYAGy0FLCAwPiuOX4OOO/CNoG7AVGTwHP7IuR2XcFgv8WHVAw92Isevh
 EtL5V5IbVoU9fsxvJHXh8BU9uQGvrc0eXNwawm9PyRdP199hAWlOHNSEJCTlDKvcd0S+
 TQhLdROgRlyeI7n4ML/QxYkUrbKej8Vxl6wyuqKxVP67NgT8BdZ1F6dcb6aTuwt2nIEY
 niNWRi0AJbhRLv4V8i/M37b+eTtX7fHg6QcBIX8V55VI41YYW1vZCEDS+ndOR53IHNz/
 OPLQ==
X-Gm-Message-State: AOAM533t9kByYwhim6+Yh1ADDvAKKNPsFYWoV+W0VDGuZlxHUWJrBZ0+
 5IzrhX2XZsXTaw8E2T6cGXWf8+sZt1ashw==
X-Google-Smtp-Source: ABdhPJxnauIPtC53LexIM90/oclsR41hrzkoV7JAFB0aA9mjgszmPIKvMbLMdVSRY5AbpaW6Hu6+VQ==
X-Received: by 2002:a17:90a:29a3:: with SMTP id
 h32mr2315930pjd.209.1614657741227; 
 Mon, 01 Mar 2021 20:02:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d16sm1023546pjd.25.2021.03.01.20.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 20:02:20 -0800 (PST)
Subject: Re: [RFC v2 12/24] target/arm: move cpsr_read, cpsr_write to
 cpu_common
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-13-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de4d984f-031c-b5c7-095c-86fc5d2ff338@linaro.org>
Date: Mon, 1 Mar 2021 20:02:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-13-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> we need as a result to move switch_mode too,
> so we put an implementation into cpu_user and cpu_sysemu.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h        |   2 +
>   target/arm/cpu-common.c | 182 +++++++++++++++++++++++++++++++++
>   target/arm/cpu-sysemu.c |  29 ++++++
>   target/arm/cpu-user.c   |  24 +++++
>   target/arm/tcg/helper.c | 221 ----------------------------------------
>   target/arm/meson.build  |   3 +
>   6 files changed, 240 insertions(+), 221 deletions(-)
>   create mode 100644 target/arm/cpu-user.c

Some commentary about what cpu-common.c is meant to be would be helpful.  So 
far it looks like helper.c under a different name.

r~

