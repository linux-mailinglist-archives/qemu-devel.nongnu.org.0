Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA13266D8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:21:16 +0100 (CET)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhjn-0006Jn-9p
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFhPx-0006Pr-Kx
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:00:45 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:32878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFhPt-0003yV-Ow
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:00:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id i7so1427200wmb.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MG+tbxmlWiJzbEQRWCyjxsZh/yb8jZ47Y1iZMekePw8=;
 b=AAEWYc65FgtzeitMdxp4joPBgbaYeL237d9swY3qQkNd3JYOjgyEpBPJ+WOeftUKS/
 UMwaLCW4u7VY2EJqbPSpJ5JGNgDeWXXutqoRRGe/QVHIFaGdd8XP0PJXIVzGXnW/6Auh
 nm4LBXPZCNAE7gw1IDF+T0bo1W8EeyjGe9lBjwEM9g9H2xfQzl8ZbJOU61khLwxwkab8
 Wk8ljvy1hkQuAgOV2MnrkIZl3mZU/tf+eA+445TPK/TJXkwU4Ih5ZkM1AYkdZzPucuia
 ojqq9tN5sXsrZpj2b0/146U5DsYRy268G1iVwfBVGbU3vx9vYGUOT07SxIPmDk7CxC9O
 OFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MG+tbxmlWiJzbEQRWCyjxsZh/yb8jZ47Y1iZMekePw8=;
 b=MCUFBRK0oz/nUZ7yDgdGO5KU5sXiPTkMfKYahK0zXr6B5YPVEk4xgpeuE/KIXLXvMi
 e6Bve/GbtTg7nt0jpcN5sSh4ol68xIRIFFbsaLRv7aXisP9sOXQ+T/4974L9v/cfjGUd
 /jQqG+3hz6r9K5mIDn8unuRBQXLbqe77SaoRqTPmO4sH8+paPEaXorItb/dRRg+Xb2l4
 MWPXUueiB6UC1hf2tI2UZ3hV3iKSvTFngXJVtkGiYPS28zk9Olf7csEfvDcURt7u5jra
 muO1c/AgeBQMb+nzC7yuHxuJm6vScAWEBY9nsuchJKzR45s/NGIb3GZF098VEoR9vhpo
 t8Aw==
X-Gm-Message-State: AOAM532BFoOBllRyliL/mYQo00zEbzTvs6IJcOOgStazdJCNoUa4/3d/
 0Pnq0k73NOFGYByquSo5Jxo=
X-Google-Smtp-Source: ABdhPJwwXpq0ACp9rqp4k/jnSCjubk//VaR6i985LPBjTsQWz1DmAG6GCfngjlAP38eFSOINFsYweA==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr3987973wmb.18.1614362436567; 
 Fri, 26 Feb 2021 10:00:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f2sm11262259wrq.34.2021.02.26.10.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:00:35 -0800 (PST)
Subject: Re: [PATCH v2 0/5] target/sh4: Pass MMUAccessType to
 get_physical_address()
To: qemu-devel@nongnu.org
References: <20210218145111.1591763-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <577ee7d2-edf5-8517-9eb5-68e0707daf1e@amsat.org>
Date: Fri, 26 Feb 2021 19:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.349,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 3:51 PM, Philippe Mathieu-Daudé wrote:
> Taking notes while reviewing commit 671a0a1265a
> ("use MMUAccessType instead of int in mmu_translate").

> Philippe Mathieu-Daudé (5):
>   target/sh4: Fix code style for checkpatch.pl
>   target/sh4: Replace magic value by MMUAccessType definitions
>   target/sh4: Remove unused 'int access_type' argument
>   target/sh4: Let get_physical_address() use MMUAccessType access_type
>   target/sh4: Remove unused definitions
> 
>  target/sh4/cpu.h    |  11 -----
>  target/sh4/helper.c | 101 ++++++++++++++++++++++----------------------
>  2 files changed, 50 insertions(+), 62 deletions(-)

As SH4 is not very active, I'm queuing this and will send a pull
request in a few days.

