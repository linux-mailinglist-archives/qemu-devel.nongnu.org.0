Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53871CB556
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 19:03:59 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX6Pm-0000yl-Cf
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 13:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX6Oo-0000Ve-B6
 for qemu-devel@nongnu.org; Fri, 08 May 2020 13:02:58 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX6Om-0004cx-TW
 for qemu-devel@nongnu.org; Fri, 08 May 2020 13:02:57 -0400
Received: by mail-pf1-x444.google.com with SMTP id z1so1270605pfn.3
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mkY1Ej3vEADZzKtbjvLxLTTwiqkg0d7YXwKdoGcY2LQ=;
 b=Ka6VCocvlkEv0SksR2srIsURlR2cbHXUXB/VcZngNHYFhYXCyRZ39ySLhlarfnt1z9
 NTL6QZsXe3cJlWyPvHaXtTx3Qgo2/1g4BOSoKqNkKPgZ5LSEY47TFBcu+BaB8QKhPvyn
 XK+qzyGNElrK/9UWWewosCVztOLqUAT7tD/dREmFAUzX9wXIrVMbaojYZoUH9PubMjCa
 6V/hbEcE7vlIEbvuZ00R1RldmZtNLq+DNSYqCIf/zK/9OZukRzIof0joGu/5h5YRI4E0
 Z8vfwQLU5mctgzE1/Wk8BrylwIdQ4/jlsDc6HUrgmC6GMr6vjpavKXBeZm2ztjiF3+QX
 pvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mkY1Ej3vEADZzKtbjvLxLTTwiqkg0d7YXwKdoGcY2LQ=;
 b=BJfOHaXClADFYZAv8HTGGfC/DK4+pBiStNyM5ZO2QT7VPvkJ9cJnl6yC6xBCWRxc7z
 rp91Bxt2AhG0JRnyc/aCxlvLZ/GK0aEJntNodb1kUJJala7e0rWqQBQezbfwDLCBaLkO
 Wy4OboC5Pe9Xrsm9hA5639aXcamB+T/Z7olW2MywjDMTW7bC12JBTvV95MqAGndFOcrS
 C+QMZk/PCHdWmKDBI9vs/cH0j5HyrRMXujWjnb2yNfjXIBY/K+TSsCb2UN84raPkrCjI
 R72O+gQ5SjZ5xU5Cnzy4DNN8A9ITmC5zpssTUvQP4jl8lQOe+nPG5VjAqzfq/XWOhpwn
 SZDA==
X-Gm-Message-State: AGi0PuZBAI8iUn8wthLPvuqIJEGPLAXJJFiiCpVpimXlFcZ3akI1YH8N
 rp76k62URZyFFeRxyeZSigIWN0/QBXE=
X-Google-Smtp-Source: APiQypJwnC5eiMM+KJWYlkMvYvdAHsdFqTUVNMeWf/Cr5fA0KCleIMrzzzXq4qIiHYNgxHBaGu1ykA==
X-Received: by 2002:aa7:9a11:: with SMTP id w17mr3850839pfj.314.1588957375048; 
 Fri, 08 May 2020 10:02:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id z25sm2267510pfa.213.2020.05.08.10.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 10:02:54 -0700 (PDT)
Subject: Re: [PATCH v3 00/19] tcg: Better handling of constants
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200508151747.6166-1-richard.henderson@linaro.org>
 <87pnbe4d3b.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57b9d80b-09eb-fef8-ea13-d45e10ef11ce@linaro.org>
Date: Fri, 8 May 2020 10:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87pnbe4d3b.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/20 9:15 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> V3 fixes the target/sparc regression during register allocation.
> 
> Which patch has the fix in it? I couldn't see any per-patch rev notes.

Patch 3:

> +            /*
> +             * If the input is readonly, then it cannot also be an
> +             * output and aliased to itself.  If the input is not
> +             * dead after the instruction, we must allocate a new
> +             * register and move it.
> +             */
> +            if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
> +                goto allocate_in_reg;
> +            }


> Also I'm sure I reviewed a bunch of these, did they not count because I
> found a bug ;-)

Oops, you're right.  I simply missed them, having gotten distracted by the bug.


r~


