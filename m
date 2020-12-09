Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789932D45CE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:52:53 +0100 (CET)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1lr-0002AO-28
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1kD-0001dS-4a
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:51:09 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1k9-0000Gn-02
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:51:08 -0500
Received: by mail-oi1-x242.google.com with SMTP id p126so2166569oif.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yjoPZWVMJiJHJVskpcWh/Fn51f3+4mNU+ZLWYWY7Lck=;
 b=LJxnuU1xCbJM6WLAPpcWvxKXVHQkJTxlKeSAQcJcEa737cpSaEyvGj5oBzRzFPkq7u
 CnyOUNpDEji+BxvBJvf3gdVtyR76NB2UsAFh7g/GtKYWEBNOHHPINMNuP/1aG3M4yrPm
 VpNhji6fD7PqasJDCK6QnCg4ah9OqicRQ9DRpK++16E6POc2DXc94KPm9dy0UXsCvLlS
 zc5GSdoFAzVfM1BuGpX+hRNgjoO/iHvqbQRV8q23vptrq4tNlvvgfhdTUOl9GZooGowP
 mkJFBd8kRJrZn2u9fjG+MJddrBKANG7iRmgNMq22+ctpFKV8XmT7a7FyYzvg4oz8tntl
 t55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yjoPZWVMJiJHJVskpcWh/Fn51f3+4mNU+ZLWYWY7Lck=;
 b=p5GL1a0xuUSGTGl9P/4Dtl6415QlsAtHbEjfJFkHeeZ2LQtzd4sQZwwrvX4JH9qIYI
 Ly4L9uNUo5jmbseTNpqnprit562S1THkCGZXvy2r/wHZTcqqEdub7oGwGqHbsdz0Detr
 +6r00QA3U+1gl/fcC7X4dRx4s1Tg1kpkQprczH0KCYHrVfAkdWY3Q//JZ3djX2f1PQwm
 1Pexht3BFYdRDJZaa4+hmhe+l571KuIowF8g5ThdsoRMc75p1rQcsWtmTXATcMTZ6dDC
 +Gg0bzytqhPM3HlyN/WkGvP2V1TKffzDdPBX2AkniMaEt2XE3E1juZm+RcVXEdQZlxkP
 Odmg==
X-Gm-Message-State: AOAM533Y5QMeSnmW+ARNM1N00N44xK+lqom+wQJKc10GDNxaVjnx0ybj
 pK45Dd9MWDN71Ri6zBGGCO2ygA==
X-Google-Smtp-Source: ABdhPJxjRDQKCHlz5Pt+quwaeG79haPWgg7G7TYGoMwIvQEs3SotJj+ei4M24kp8gJNuXIQa4aA1kw==
X-Received: by 2002:aca:448b:: with SMTP id r133mr2161531oia.121.1607529063505; 
 Wed, 09 Dec 2020 07:51:03 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c21sm454347otd.44.2020.12.09.07.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:51:02 -0800 (PST)
Subject: Re: [PATCH v2 05/15] hw/riscv: boot: Remove compile time XLEN checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <64d6afcb62eb7b27b863436219cf1a4e28018de1.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b19249c1-2aef-ae9c-8109-d6d5d0a4425c@linaro.org>
Date: Wed, 9 Dec 2020 09:50:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64d6afcb62eb7b27b863436219cf1a4e28018de1.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> +    if (riscv_is_32_bit(machine)) {
> +        dinfo.magic = cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
> +        dinfo.version = cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
> +        dinfo.next_mode = cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S);
> +        dinfo.next_addr = cpu_to_le32(kernel_entry);
> +    } else {
> +        dinfo.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
> +        dinfo.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
> +        dinfo.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
> +        dinfo.next_addr = cpu_to_le64(kernel_entry);
> +    }

This looks like it's still based on the TARGET, but via the types in
fw_dynamic_info.  So far it would be clearer with sizeof(dinfo.magic) or something.


r~

