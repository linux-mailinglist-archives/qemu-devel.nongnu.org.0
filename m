Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA03157FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:50:57 +0100 (CET)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZyK-0008Vx-C4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9ZuU-0006oB-1m
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:47:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9ZuR-0000GT-PW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:46:57 -0500
Received: by mail-pl1-x629.google.com with SMTP id e12so10461522pls.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=pUPihWoN7rjS3xaCvUC79hTYaXgEBiD18jrQPwLaN5s=;
 b=JmgxvLaPjlITkx5hXKyuW3c0rcwDpLHer59017Y87jL0qwjHM8GDvZTRHPsGW2N7kn
 rhJEWtdmBnc0QNtjXFrjXjwsSXYRw/WEy8OS8QSb7bzueTplKYHqVCg5NAlyTIVTFxgV
 WPcwhNOWDu6n0EnRkfHM7dWTjgYUYth89/nnAbTSmnkUeaAHG7YEEqkaRGxW0AFcu6TC
 qtWRDrKep7A0sYF9kUa6CL6FFdw1VzqZm/p8rAzZ8lc6Sa0YS63FfiA3gTBBOd/zvlMh
 OOyVhdzkslmFFqlJdGXndHquKIemFCawcD6E9GEgsD29Ok88rRCbc9rV1CQ5PlZniObf
 gPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=pUPihWoN7rjS3xaCvUC79hTYaXgEBiD18jrQPwLaN5s=;
 b=Gsn3MxpuP9nfIpv9BT3dol+YRU/kNCnN0n+7eTeNbatl+Hg9w8mzCojwi4uiefpJrk
 nvPWdWvY9BHnslFgEs6onDv+Zl932Q2yxTXLvCLMO14kPTO+J2lsWl4hbbqRNex8o6xx
 C9SeXbCfyLDUuyOBbd8pfM0qa77lT6ll+hWh+hsXia86VW5wYe/sUb7ORbUbujMkA5g5
 1GIDbbEX5aJ9r9pyGHQV0EgjkeqWBwW+m9m4Kl5ivi8XA4h5ksBrnIqCaA6yJuAleIU5
 D8Jhkca0o6y+yYRXu7QOz7n2yQ0sEoRy6fbu8UHtc4lZ+YQgg8OhxIbXaSNs/r6gTEZ2
 SZQg==
X-Gm-Message-State: AOAM531b2vuKilsUdH3hkYoIQM806ILNE2jDOKETX0tS+Y9LfbK7IteV
 eICtL8ql/+lNg53iBuivTzTX3L9jwiInfw==
X-Google-Smtp-Source: ABdhPJwYhfQG+2r77xmx1lfFBvBTjEX5mj/73e/LzQFFoTOP8R1CXRq3uL0V7PiE6l7aslx0VXKHQg==
X-Received: by 2002:a17:90a:a084:: with SMTP id
 r4mr5847142pjp.190.1612903613001; 
 Tue, 09 Feb 2021 12:46:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 m23sm16535226pgv.14.2021.02.09.12.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:46:52 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
From: Richard Henderson <richard.henderson@linaro.org>
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
 <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
 <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
 <9f4e07d9-be5c-8bf4-f54a-424a844e8e7e@weilnetz.de>
 <4ad3bbc7-20ef-974c-668e-260dfb81ee8b@linaro.org>
Message-ID: <4edd397f-da3f-e19b-7a5c-ff92ce18f187@linaro.org>
Date: Tue, 9 Feb 2021 12:46:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4ad3bbc7-20ef-974c-668e-260dfb81ee8b@linaro.org>
Content-Type: multipart/mixed; boundary="------------39D31289DBEBF28DFC1D4EB5"
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------39D31289DBEBF28DFC1D4EB5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2/8/21 2:55 PM, Richard Henderson wrote:
> Ok, I've reproduced something on a T3 (gcc102.fsffrance.org).
> Running the same code side-by-side vs the T5, I get different results.

Brown paper bag time: the T5 build dir lost the --enable-tcg-interpreter flag,
so was testing tcg native.

Big-endian bug wrt an odd api wart in libffi.  Fixed thus.


r~

--------------39D31289DBEBF28DFC1D4EB5
Content-Type: text/x-patch; charset=UTF-8;
 name="ffi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ffi.patch"

diff --git a/tcg/tci.c b/tcg/tci.c
index d27db9f720..dd0cca296a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -557,8 +557,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             case 0: /* void */
                 break;
             case 1: /* uint32_t */
-                regs[TCG_REG_R0] = *(uint32_t *)stack;
-                break;
+                /*
+                 * Note that libffi has an odd special case in that it will
+                 * always widen an integral result to ffi_arg.
+                 */
+                if (sizeof(ffi_arg) == 4) {
+                    regs[TCG_REG_R0] = *(uint32_t *)stack;
+                    break;
+                }
+                /* fall through */
             case 2: /* uint64_t */
                 if (TCG_TARGET_REG_BITS == 32) {
                     tci_write_reg64(regs, TCG_REG_R1, TCG_REG_R0, stack[0]);

--------------39D31289DBEBF28DFC1D4EB5--

