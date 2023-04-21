Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F06EB092
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:29:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuZ1-000055-BC; Fri, 21 Apr 2023 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppuYz-00004x-W8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:28:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppuYy-0002DJ-8w
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:28:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso57299965e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682098126; x=1684690126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CGztsHJJOJRpjTln/mX+f57tm3Dtjda64nWRHoC/gqk=;
 b=Rg7ibYH6XvKvkVz3dgvDbUnGLZ8ZE3LxJAXN8LkgR7iqXbsZSSbNrVv4FzXTyTmg/H
 aQWY3d222ArrXjOgMPcNzYkZmWr9wxmSO83Gl785vhXfCxO1zUYZqALVogObhsm5LWg5
 FwhyS01VJLT4f5yNwbI9BFqmJxaL0seSYYQE+PIT31FvzEctUuKD6PxWtTjSTj+qJ9AQ
 KokLeOYwIFrfQKR1Qv14TErujyZsdcCNTdfI4IwOfdF+6HCNp53sHNXJbxhrXPUAr5Ul
 aWeLL2cFpBs9WaWRzYx7EcIXbL9eGYcyPL4TjGRc8RY1wCwavhQJP0ltQE2YChQsrQn6
 lzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682098126; x=1684690126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CGztsHJJOJRpjTln/mX+f57tm3Dtjda64nWRHoC/gqk=;
 b=AG1Kmnrl0K042NxA3pzDCwdTk0bjzV1PVIfpSnj5VGCZ+sxKfmuvpqbMjYugmeXXMq
 m6uAw7yf3XAaK+ZujiCmGKOBXH1ezLweC3nL5V2vCbH4FnvEY5Yl2lsOGAH497f07tnl
 ZbiaKghH4bBZYkD/C9o9CljMAYoCJ9jMe1p/bAp4HNWg5fHi7mgTQ5M6VQXoOwN7+Sl2
 JFBFMNziBtvzBvh+g9kjuOer9Pysj7uuDA8yUBYhpA3hgPDQbIimZG8wXGwpq8/S5nDY
 +snivghKEEyAMhIxEyOroPh8lVJShx7gkgP8z31q9RiZ8/HRaDl3uPA5nMELXn1f0sN/
 +JBA==
X-Gm-Message-State: AAQBX9ctv/r2mW5DGcDdZPhqv34JDI4Gvt12hN5vvzh2lAf5ercFknzo
 2EFeah+scpTpFWKm7xIhewBf1Q==
X-Google-Smtp-Source: AKy350aOT46UZ7rAcu+z7qciEuc/qJomD7t4JBQVsRa3YCOB0mmpEOFmhb++unWUCPyB4IexEZHxTg==
X-Received: by 2002:adf:faca:0:b0:2f6:1bb2:8348 with SMTP id
 a10-20020adffaca000000b002f61bb28348mr8404835wrs.34.1682098126554; 
 Fri, 21 Apr 2023 10:28:46 -0700 (PDT)
Received: from [192.168.34.227]
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm4791961wrx.103.2023.04.21.10.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:28:46 -0700 (PDT)
Message-ID: <ea774322-d8e7-accc-a2c5-538b1c9a24b0@linaro.org>
Date: Fri, 21 Apr 2023 18:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/23] First batch of testing and misc patches for 8.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230420101216.786304-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 11:11, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:
> 
>    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-04-20
> 
> for you to fetch changes up to ec6fb1c8cd8d55c3d2a34cacfea6df0fe6c76057:
> 
>    tests/vm/freebsd: Update to FreeBSD 13.2 (2023-04-20 11:28:16 +0200)
> 
> ----------------------------------------------------------------
> * Compat machines for version 8.1
> * Allow setting a chardev input file on the command line
> * Fix .travis.yml to work with non-public Travis instances, too
> * Move a lot of code from specifc_ss into softmmu_ss
> * Add a test case for TPM TIS I2C connected to Aspeed I2C controller
> * Update tests/vm/freebsd to version 13
> * Some more misc minor fixes here and there

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


