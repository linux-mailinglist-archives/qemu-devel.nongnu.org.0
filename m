Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3B339FA4
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:52:31 +0100 (CET)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8RC-0005zU-Ee
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Q4-0005Sg-J5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:51:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Q3-00014q-AY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:51:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l19so5626866wmh.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mKbspbZZBFcmWj0knqY/0xMWRB8kyBX83+2hxs+nfgg=;
 b=US/Rhj9+VspcL5OWKEmzsyRKIdDFDS8h+KyHv5r4lbevFub/8+U1JtfQZrk89F9BQq
 mHXgI0zynbypvKTl6GGIsVnsIxfkycoos858EVdAPX6yZC5K21jhVPOXRAdfvbTq0EcA
 74A6qY77aIHMdqJUBeZACb+edzlfl7b0A9MuXZQhoIeW5YUkNplw2FPKMQn9iGQeNvJz
 iGNgQZ4ehpzerHP6C4r4kQBN4DMCorz7TfbanGXFi7j/JWEQTzMehueUXyQ5slwGkZjR
 cauJRz6q6ByGCsSWgxABD2zpUrU6dxVsFmJs4S1VlSipgWrNy6CohcorOmE371IFOkV8
 fjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mKbspbZZBFcmWj0knqY/0xMWRB8kyBX83+2hxs+nfgg=;
 b=Y2jhPE4Wt/gFNmYl+8ochEXioZIFMnfkUZx3U3DzBoo46R4Jy6TL5pnk0Vhjyvkj6h
 TjeZzTmTuU9n/vQl5nhyAWxcUO0CvY7EK86O+Tv5IEt0y9ao2uIDH+md9jky6VBUEeZ8
 /UGP4s4DrK7zgVfSJ4eK9q1g5BywHrwcAKfgDei3PcybbE5PIt4IAM/Poyhsw1kIfJ1u
 wwde85J2jfSQ95z76/XksPn3DFK8uaPjbGKTyjHrE5SrFnuBPHNNB/2ovBlB/D8fXep9
 RRpJf9SxOfjeY+rfKHVBDsadU4QM7SAExUkosrp2vOwUBPEgb9DxZg7Jh2cYApvHE3B4
 uSRg==
X-Gm-Message-State: AOAM530i2pEYWPgsuOKHrtmk7ZOVP9W48owdr/P8ahwTUykHR/iCspnp
 7AF1kEn0YIhuEEBsVRHyT3c=
X-Google-Smtp-Source: ABdhPJzoPAPh2ZmLskQPNH581nMX5CvLpqiLynk7lHuXqTZIVlsPz8ePtfrD5CsyJteh7xLeapHsJA==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr18663699wmk.101.1615657877834; 
 Sat, 13 Mar 2021 09:51:17 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm17059294wrd.9.2021.03.13.09.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:51:17 -0800 (PST)
Subject: Re: [PATCH 24/26] util/osdep: Add qemu_mprotect_rw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24bdca41-e6f1-d552-556a-376b7afac323@amsat.org>
Date: Sat, 13 Mar 2021 18:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> For --enable-tcg-interpreter on Windows, we will need this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/osdep.h | 1 +
>  util/osdep.c         | 9 +++++++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

