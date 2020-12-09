Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF32D461A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:58:43 +0100 (CET)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1rW-0004KG-Sx
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1pw-0003XV-Tw
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:57:05 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1pv-0002GB-8l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:57:04 -0500
Received: by mail-ot1-x342.google.com with SMTP id x13so1803733oto.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CgeJ+FhlwnVmPVJ5PD7WstdqIFbg9IBk7OCa4ebUROc=;
 b=p8Wq4ry5xZvutL1tzhXrL7AQ+6uUzzfauECaghoDayJOjqbHT2nyjxknfA+alZg1G/
 ZbDgNzA7DWY7fz+0AJNFm8b0FIllZMdsRYbsE9qQwCJRCcvVXFI2ituO/revaoOIBSlW
 sdZb23V0FXBrCM6YEoHnqacptNm/K7heo8npiN95bG2MWNf5dfMb5RUgePDzE/7BfSKg
 2smuuOSwZ1J/ponXvx6Kcrk1jAvEmT1pImY5RwZIxFUje9sKEiYxe0NEWFQyVak7G4o6
 vlD7RWTws5splCyFBs6rukcqc5dy1NpO6q/1v6i8chocootK8GgeX3zWgPR9uksyIccj
 wl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CgeJ+FhlwnVmPVJ5PD7WstdqIFbg9IBk7OCa4ebUROc=;
 b=nW+lgnRXLSh6mlnmJcYbrovxhG4O0zmNboAYgcf1i0gGi4INs/ToatbPZihsOXJqMd
 VQuN2bwzNMZl9qSQO2W64p2sJEwmwBu21wNs+RjOw4Tj19Jw91wbm6IlvbgrYIaaPYyJ
 VEWtyyMg61/Hco7MDOp7m2h10CoeOLb8qFlI1opHuudEbXc1d7sFRkMsUB8OWTi0dTBG
 yU9ABhxExbCuh5g/ou6EEZ7uj/ywhgWBFtrOIhlkwePNqv3R7a2XJ3RAVnbXkoMYtX1D
 DMmuODHo+DRbOynIR17duaOb+6GUAYvTPa3uVj+6/27rwkqzTvH3njbfUGj6PCR8TGXL
 UvSA==
X-Gm-Message-State: AOAM531kqnYlpfAJsXTBqEgyEMZNoILnPMKgvGqTDf3rUrPmZHuIVwGy
 xlPppZT8uNxYo3KGBddCJFfp1Q==
X-Google-Smtp-Source: ABdhPJwbELtCqU3J/cXDXU6P+MXV5kdlEy+6vS4HGe4Gjp23mrBwkfRFw94QBpQWmrLBPY7iGTSlXg==
X-Received: by 2002:a05:6830:1c34:: with SMTP id
 f20mr356469ote.147.1607529421958; 
 Wed, 09 Dec 2020 07:57:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g88sm453263otg.64.2020.12.09.07.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:57:01 -0800 (PST)
Subject: Re: [PATCH v2 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65e90c9b-ca1b-a1c4-78ea-63500ce59ece@linaro.org>
Date: Wed, 9 Dec 2020 09:56:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> The helper functions defined in helper.h specify that the argument is of
> type target_long. Let's change the implementation to match the header
> definition.

Given that these are riscv64 specific, you could alternately change the header
definition.  Dunno if that's clearer or not, considering an implementation like
float32_to_int64 -- is it immediately obvious whether or not we are truncating
the result?


r~

