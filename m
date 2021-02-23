Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8D3230EE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:48:01 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcj2-0007dK-54
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEchc-00070t-Mj
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:46:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcha-0007sw-SZ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:46:32 -0500
Received: by mail-pl1-x62a.google.com with SMTP id w18so7228685plc.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bLYSoJ/0fiyryMMNcEl4c7RbGEbM9kAUL/jH8AFSIko=;
 b=soKxCxhYAFqIYTWMX2AjR5vGnwfeKjVJexZGYRVd1sROaQ0BGZ/EK1F805j+yBGvQ+
 /EnWauRBQLel77JMOBAZRVH1lKwAC1PujH+zgfvm86N7OlpojUnFXZQ+3YyJHEN5TwxS
 F5bQQrCqJ+UPuOsrpUDXg+62G6BIp6HuaChkutdsPJniESRRGneNVFiV4/QNUX8rf7AR
 dk2Z7cF0m81lNXyEfccfEjXTlLDrCeg2CKsrvH8j6rZop59XEX75QkxqtuKZQpnYDhu+
 516FO46VqGmxbqlumnzKGUQqibAnPged6VvodIeM1UeyhzTnwWLXcWQyiI0/9EnC1JCX
 QgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bLYSoJ/0fiyryMMNcEl4c7RbGEbM9kAUL/jH8AFSIko=;
 b=q9mL8SGezyKq0G7Dfx80a7XmipyiIvKOiL2D9CN7Bvsebi91vD0h7/nYxsZWNP+bES
 IMCdpaIgGbLZwnbh0RbNEQ/N/ij8cs1bkqOUo6oja9Zvd6BLJqdyvK+i61u2HuO3udbP
 3kXJVt0vw1JKaQtc4d4qCwbQ4fcYNBQwDK7mNnRH61nQTvt6J4sDl2QM3U2T90lip62I
 icMXoUXFN8VpJC4bMBXiohv49Z9Lb6OKnTGcDjjjc0/uz+Iuzwvv1mlOx7ARcxpnShlO
 c4PX5wysMXX7fRkpU3gBjP++mE7u5AcJMKEBb15B5RA8Ex9xjZT5Si1VkyC+bicKVAra
 D3vg==
X-Gm-Message-State: AOAM531UN4XBxiJa6dGnxvalQhzjr1ZEPsPsHz82XeACdcLxO+ZiH7TY
 11MS97B0gautNSI4jNow+nt+6A==
X-Google-Smtp-Source: ABdhPJxQ5BkoEnuwO+S3L32UJCmAq5Wi2srWR7NG/LG0JkAs/OxvMJm3SYp6O4945NT+P8YaX1JdWg==
X-Received: by 2002:a17:902:690b:b029:e3:688d:5ab9 with SMTP id
 j11-20020a170902690bb02900e3688d5ab9mr28343070plk.55.1614105989220; 
 Tue, 23 Feb 2021 10:46:29 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h186sm19246053pgc.38.2021.02.23.10.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:46:28 -0800 (PST)
Subject: Re: [PATCH] target/riscv: fix vs() to return proper error code
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210223065935.20208-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86510657-883a-f49e-c9da-d7a3d31d3de2@linaro.org>
Date: Tue, 23 Feb 2021 10:46:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223065935.20208-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:59 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> vs() should return -RISCV_EXCP_ILLEGAL_INST instead of -1 if rvv feature
> is not enabled.
> 
> If -1 is returned, exception will be raised and cs->exception_index will
> be set to the negative return value. The exception will then be treated
> as an instruction access fault instead of illegal instruction fault.

It does seem an unfortunate interface; -1 seems so tempting, but does not by
itself mean anything.

I wonder if we should dispense with the whole "negative number" thing and
simply return an exception value.  Then for bonus points put all of the
RISCV_EXCP_* values in an enumeration, and return that type from these
functions so that it's perfectly clear what the interface really is.

That said,

> @@ -54,7 +54,7 @@ static int vs(CPURISCVState *env, int csrno)
>      if (env->misa & RVV) {
>          return 0;
>      }
> -    return -1;
> +    return -RISCV_EXCP_ILLEGAL_INST;

this fixes the immediate bug, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

