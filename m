Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF519E1EF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Apr 2020 02:34:30 +0200 (CEST)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKWlY-0003zb-Tm
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 20:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jKWko-0003Yc-4F
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 20:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jKWkm-000197-U5
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 20:33:41 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jKWkm-00018G-56
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 20:33:40 -0400
Received: by mail-pl1-x644.google.com with SMTP id a23so3478562plm.1
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 17:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vi1xtTN7UB/twtE/RhBtS602Oa6rQh70/R8B+HG/Bcc=;
 b=alzfZHz0JnwQOz/5ZyXdyI2WKkQ8nUD4s3yAKFilq/XwkCr40SV9QnKO0kjeDP682L
 EJZ4MMV5L1oyPuMLqS9lp8iWpxSbtifv/WwjEbWeVGRYjVnFuVReENpT5kizm94BWkRe
 IDwu0GqOieCXjI/rd/jQw60VzU5VqwTrkhLfa+T2ryJycXiVZtSUJHLeGxHLnZGKk8QC
 sqlYA+PJKm46K/OQQ0Sup0W7SYjXecK3iJH6bv6sey8qZ+8kEG2FbKHHuEjRqv2xZzOx
 sutp5pzmdHIKcnGDrLOPnxtC8uyaV0bbZyvaLiLjAU178Je+MMadKp2tPUBEjsEU/R+K
 j49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vi1xtTN7UB/twtE/RhBtS602Oa6rQh70/R8B+HG/Bcc=;
 b=i164QY021o9kAXxZinvgA6niyv/lIbOYfhgOEfb/8CDZrW+bJsTcFknLCMhtA0nzQd
 DI0Fk85JslCFDjpCEZABTeln8vX93KSX4er48Wk0i/75cjamJqrmFZGkdwmVoePfnaOS
 KMeN5pBbd6/fLj5zc5cDq64zCx/V4cjAGl/QNyeu6az8b+D6kO+gAwmDAMOmF4/rOW73
 rr0Lejbm8BjKS1V5BjGjNfRlcSvkga55cc6X7XFUiAalYPzjZCxbBWV5kFRqR+AsqK0Q
 hvwoKQT+M1ljh9K6Ly/RVBtc8sSoTflTOg2J0pKCOpe/vEzPOJwf7u435eZ5MquQED7n
 BAcQ==
X-Gm-Message-State: AGi0PuavjudiFbFR8IV2o2gLL1i/oBJ1i3756xHmkDTjtoq9TQ9qO2nO
 hymFXQow00QnpSmmOFc8izdtcQ==
X-Google-Smtp-Source: APiQypJz0Y8aeTfu7V0ZamS3keWuP3q5Ca/3nreezZGAYBOZZjcM1pywjeg9lg9Bwn5Epmdnxuo4/w==
X-Received: by 2002:a17:902:9004:: with SMTP id
 a4mr9459878plp.275.1585960418891; 
 Fri, 03 Apr 2020 17:33:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id r189sm6108869pgr.31.2020.04.03.17.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 17:33:38 -0700 (PDT)
Subject: Re: [PATCH v3 08/12] linux-user: factor out reading of /proc/self/maps
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200403191150.863-1-alex.bennee@linaro.org>
 <20200403191150.863-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <830061f9-91cd-145c-4388-f2bfe9a3d7a6@linaro.org>
Date: Fri, 3 Apr 2020 17:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403191150.863-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/20 12:11 PM, Alex Bennée wrote:
> +                e->is_read  = fields[1][0] == 'r' ? true : false;
> +                e->is_write = fields[1][1] == 'w' ? true : false;
> +                e->is_exec  = fields[1][2] == 'x' ? true : false;
> +                e->is_priv  = fields[1][3] == 'p' ? true : false;

Drop the redundant ? true : false.  That is of course the result of the boolean
operation.

> +                errors += qemu_strtoi(fields[4], NULL, 10, &e->inode);

The root of the typedef chain for ino_t is

/usr/include/asm-generic/posix_types.h:typedef __kernel_ulong_t __kernel_ino_t;

so I think you should just go ahead and use unsigned long here too.  Or maybe
even uint64_t, because 32-bit has ino64_t, and could in fact have a Large
Number here.


r~

