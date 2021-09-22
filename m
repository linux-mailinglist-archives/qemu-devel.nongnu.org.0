Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5E414F96
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:07:57 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6ey-0002dX-LY
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5HL-0000Wu-8y
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:39:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT5HJ-0007zV-Ls
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:39:26 -0400
Received: by mail-pg1-x535.google.com with SMTP id f129so3313490pgc.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eDtSKmw/4T/3aohIqHSZ2AcW0hvRGrfYQIhpatBkM8Q=;
 b=YmmGGCVn4CIxwyrQjIFIW3XuiWdpAlX9W9CLvb1N+ZT8Wg+23QTa/2q2893aJmKith
 mOq0BLCXu7Fv6N9y7cRqLscerMd1nbQlcHg/fNOjFXpFJgWt7QFLjMq9A/vJP4lRRMI9
 VKYLOCk52FTlpzwNwUhkBvKo+zW/cJ1LAPsY96NseOgpldTkPMOa9qktnF5L9uy3IKGC
 lWqVPTYJcmnci4zbY3jk5huM8cjIBI5A6krZRhlAeTvQJcdhh6fk7XqP4gZZ0133eb2/
 9lyFoEAf9XPULZenEezRyVveZbE7zPJGowVbrUCmZbsXgSw+QDiiYX+1nvXxDxaQ9aZT
 w82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eDtSKmw/4T/3aohIqHSZ2AcW0hvRGrfYQIhpatBkM8Q=;
 b=dKjEzusTz1XeGFVc9PPMvua6ELwQtgOn/ymYs+sVvCzuE5aCCuswv4uRTheibZQtDz
 tByuSt7xriEEIrXaksHef7WGNbWbWn1W/pp9Vx9VyXtIkVna3/BzA9xoSsiyKt+zflFG
 1fIp+NlKyqKgFy+mP0OoqGP42WouChSPhzXhJLGMkAy5OXkWyt2HGgfGZJ93+Ogbo2pV
 3s5VukNb5yKU1NsJuFzxarzck2EQnq+zc6x4pQlvtCjDRPI853zJe9eT1SI6WenVsCE9
 KqaPiz7JQgijK0Uwg189FRzihp12NgFaEOL9LN4lM8uF+P0SierbP55o1ngiB2utiY3b
 jPwQ==
X-Gm-Message-State: AOAM532DX0ID0IMykArPfgl0W0PoAW5rb2vzPzt8+mYROS8/nmiTO0ye
 v7Sc/CrEvCps1iDzKdvyFnnF/Ax+BypVRg==
X-Google-Smtp-Source: ABdhPJx7l4ZAYXwDPXZR9aXQ7tLOVdiie1RgvJuVgHJOwNXdxD8IbMfGSD7/9wgQgoOapvW2HzCfow==
X-Received: by 2002:a63:d814:: with SMTP id b20mr564719pgh.268.1632328763974; 
 Wed, 22 Sep 2021 09:39:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm3411531pgc.11.2021.09.22.09.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:39:23 -0700 (PDT)
Subject: Re: [PATCH v2 28/30] linux-user: Add safe syscall handling for
 loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-29-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb948730-fb9d-d9d0-02a8-1d78bfd32151@linaro.org>
Date: Wed, 22 Sep 2021 09:39:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-29-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   linux-user/host/loongarch64/hostdep.h         | 34 ++++++++
>   .../host/loongarch64/safe-syscall.inc.S       | 80 +++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 linux-user/host/loongarch64/hostdep.h
>   create mode 100644 linux-user/host/loongarch64/safe-syscall.inc.S

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

