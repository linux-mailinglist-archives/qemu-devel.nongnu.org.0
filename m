Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96562FC0A2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:10:47 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xKw-0000Yj-OP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1wBP-00085y-Vz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:56:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1wBO-0004WW-A1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:56:51 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s11so15536399edd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/e1umK+YKruqaGVk7mO6X/oPkBFq5t+de6wTLKv04qg=;
 b=dvxXtcvh5u/fMx4beRFDys71exTsfgQVY9EFqCxVgW8l8ntsUk6H6AaX5JEjk9vxDD
 2XvFbxalldcubhpIMeoTBNg0X5OoU/BlFKkOeFdnA+8rP/D8+f+IMJMSl/n1g0POJ8R6
 6J3ltvjjDTPc+G5db0ym4F9zVu2HkxxSAhJY6OFH/PeBTSUGMss7vVk50F9UOyE4Lg+M
 YN63rxxEyO0zWEhdlkClxmwAA49B/QWY2yuoW2DB2pJnq9g8K7uqVyZMlnXuSf51EWy+
 zn5biqRi9dcTWhChb9dK3JU9nMWRfUEumIeVPB1Z7KSehfIp3TObDwy0muBgKiicOXPM
 IQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/e1umK+YKruqaGVk7mO6X/oPkBFq5t+de6wTLKv04qg=;
 b=jEtVHb8pHC0PJXZNjDDI64O868dAItTlRvjwLGcsA3GD8rGXyLQ8MtVaPaZxT4vJHX
 pzDF4qnSn3kpvlXIoU5do0ZTUAeJdt9ofCdPnw8s2tadUY8NhmXM2aXsly49qeKX4Cy7
 i21QQKMaj8kaASFQ/LhAdQ5HL5FA1ihRKzUjMmM8D8O0eLEIqqDzp39Keprn/mfzMaqx
 RVJaXiTg+5Baa8ZrB7YELnyu5JWp0acg3Oc8O6QhhuoIOSLj9rxS1rB+hyMt3Vm9Sqe+
 BfTfhjG4iSziiHc/BPincprduzvYBKtWm8v3qpt4cfn75VDhLy02h/hhrEZU4iWka/2f
 0XPg==
X-Gm-Message-State: AOAM5315MSiW7z9tLgFVyELQ8tq2mCVBmrDzJtNef+DtP+cd90OoBoO3
 oBwHSSdqnY4hIx+0MwL/Hqg=
X-Google-Smtp-Source: ABdhPJyN3/tB91KY8HofkYDamEm27amNUvviapxWLd+vMtwfsviIj5N8oeNYwfFAKi/Evx30XQqZSQ==
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr4310132edo.203.1611082608386; 
 Tue, 19 Jan 2021 10:56:48 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m9sm12881271edd.18.2021.01.19.10.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 10:56:47 -0800 (PST)
Subject: Re: [PATCH v1 3/6] tests/docker: make _copy_with_mkdir accept missing
 files
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210119175208.763-1-alex.bennee@linaro.org>
 <20210119175208.763-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dc7e96ba-68ed-4e91-f6f0-0b0987e0f804@amsat.org>
Date: Tue, 19 Jan 2021 19:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119175208.763-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 6:52 PM, Alex Bennée wrote:
> Depending on the linker/ldd setup we might get a file with no path.
> Typically this is the psuedo library linux-vdso.so which doesn't
> actually exist on the disk. Rather than try and catch these distro
> specific edge cases just shout about it and try and continue.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

