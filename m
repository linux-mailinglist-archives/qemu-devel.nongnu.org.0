Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3A3B2A2B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:16:26 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKXB-0005me-Hz
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwKVg-0004FQ-9U; Thu, 24 Jun 2021 04:14:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwKVe-0002c4-Np; Thu, 24 Jun 2021 04:14:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id u11so5562895wrw.11;
 Thu, 24 Jun 2021 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KFgFjMAzQ6w+mBdJJEG4v4sVa2efs2y1oO+FZnOUGzQ=;
 b=hlwWC7VGICPe+Zt3UNSDQpOgytoiDSlYohwUn0xBrwiyeknNq6/Wo5MEg748xYhq4r
 ns7MW9//M+dKXV1cMmjLlFNm7/TA3CGElF0/IwxitRi94gQKEtwIkBQXnHQ0qOMytq3p
 Jb/nE/fEakyHR5icbu36kEikOGLBvDnY3yRlCU8rHjS9PN3kuq2d6BGAv/BYim2pRxHU
 exRrRg4QErPpER1XKfkYQG9ieQ5CAeoMWaJnw4xacX/TRsAcFMPA5kx70n1p8j19d78p
 Axf7GbRktqYy15pdTzqqfV0raINpPDqvWaim/jTeIIKZIZOmb36xgVb+zeztoGnXuE0A
 L3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFgFjMAzQ6w+mBdJJEG4v4sVa2efs2y1oO+FZnOUGzQ=;
 b=Li9aIaoEAaqsn+rPIear0kdvQVeOODfhWRncVUWPueVETHyFErnjUpP+7L5/7vN4ua
 0a+hNp5I4VGF9zMsoLtm0CDpEdfrXNP70dxgYm/k63BCXCPi35zAorvwnAW/mTyQC/ot
 26PpUUCs7+UcUqQRStn6DyK2Wzl0mJjGqKAFdxg62o1GJmx/PPnz58AuQuzULcEtSsI1
 obii397OnpfYRNi+2TV7CuzwGTqpo7vI36dVwwZY9+Kfnj3craZhvIhy8He+EHS3uwJq
 vLuAEX2/GXRelWYMGX/H87QTIZfsdgl0ybtZ1H0OgLzigVLaFtJFudYGjaKozDFjUsZE
 1K0A==
X-Gm-Message-State: AOAM5331rUJ4jW7gI8cK6XBN0QST2KNx60NYR+YMgDGC/QTol5eT7+JY
 LXpncTUxyLbG2XPZghM0vRORiVvN8kS1HQ==
X-Google-Smtp-Source: ABdhPJzMJ441/u9oJXdcqeD4iE8HyegdA+SkUtT6T74fXp4ciw9efrkNdE+JULDw/wtQ4OSx6UUJGw==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr3079156wru.198.1624522488609; 
 Thu, 24 Jun 2021 01:14:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n20sm2136705wmk.12.2021.06.24.01.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:14:48 -0700 (PDT)
Subject: Re: Difficulties to access guest memory in TCG plugins
To: Kevin Mambu <kev.mambu@protonmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c51799c-6882-c459-0996-325c58de87fd@amsat.org>
Date: Thu, 24 Jun 2021 10:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing the maintainer: Alex.

On 6/23/21 5:08 PM, Kevin Mambu wrote:
> Hi, everyone,
> I need to put in place a plugin which is able to modify memory for a
> specific project, and until now I managed to do so using
> cpu_memory_rw_debug().
> However, the function happens to fail at times, and when looking at the
> source code of cpu_memory_rw_debug() on elixir, the issue seems to be
> either the memory being locked by another part of QEMU code or some kind
> of page fault.
> My prior researches tend to put the blame on the RCU lock mechanism, and
> I was wondering if there was another, fail-safe, function I could use to
> access guest memory from my plug-in ?
> 
> Thank you in advance,
> 
> *Kévin Mambu*
> Sent with ProtonMail <https://protonmail.com/> Secure Email.
> 


