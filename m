Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4331C005
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:04:15 +0100 (CET)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhIE-0001n0-B7
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBhDD-0000K7-US
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:59:03 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBhDC-00056r-Gr
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:59:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r5so3562141wmp.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7t3q/7j8XANO/eMjtO8F9brWBUGATYE6BRUqKesopmg=;
 b=UEzn/Dymmreo1hDQaG6HmojBQsUNQP0wHrlFYLS+6RO4qx9CROyuWQwCf9azIEfe1+
 kXUNVXDz6y7nSCy1ZPVBa3Ohv8LtQQPsQyUEyT1d4Na5gBkHavCfoUIm7epPyL2ND3NG
 Xem2UarP04hzCjcHY8SsFK/dZVogbfGI3sh3LmqB5alwRSRzaCvCUVJlxBZuRZpMXl3D
 rienjtC80IqUdOHIi+nCeCcrZCzKK5GWwE/Cmiof0DOpx0C0mkFW2tRI6XCvRLNP5uwh
 AKlJWnqw/z3bfmI0afhA0yvKGK8Bxzfd2Kmu5056dhIUYNGOnluZAAs9taqjF6XQgKTn
 l3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7t3q/7j8XANO/eMjtO8F9brWBUGATYE6BRUqKesopmg=;
 b=miZjMcBEK6XrgNxPz1FfM8Ybq74SrHZmbNDpiMWVF/S3OYgGcGWZ2uNiLdbXKsqYJ8
 rVxFgFFFdnt+KOZQCTaRuCAZsBeTKf4wtNCpofw4HuUliFUJW7Y8+rCQ6szDZUr1Cet1
 vsYgyyad5zwksgDF8QrvLGHF4v9E0o92rtkZFbyrdIFZlyXEGQfUeDm8WPRtaIF+wKEN
 C9XPM+R33hCD++uQPk//INB9U6L6Vs0rqP3nlbNLDPoO0a1i8mpQfW0/34+yfaHFWCPz
 tR0Y6sB2TsulbLmf64SRjVxiVOCwdQTfnDPLu/65C9i3W7i2r4G4nYEz4WbMBA4+MhJr
 hFhQ==
X-Gm-Message-State: AOAM5336QN2GDU9z94zXq//7aC1sCuds3nslOM8L4pp1zHrrVAxZ2Ysv
 z2z/J9cYabq2u9yttDlGGIc=
X-Google-Smtp-Source: ABdhPJzT/fUvJsMJ+2vfvQjFMTuK3WNZZz5OzNe0peN8lf4vD/Gtv23NBawv8nvDFLArNUxD3+qTTA==
X-Received: by 2002:a1c:5a08:: with SMTP id o8mr511518wmb.60.1613408340387;
 Mon, 15 Feb 2021 08:59:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a9sm21793536wrn.60.2021.02.15.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:58:59 -0800 (PST)
Subject: Re: [RFC PATCH 12/42] target/mips/tx79: Move PCPYLD / PCPYUD opcodes
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-13-f4bug@amsat.org>
 <2606adaa-6558-61da-53e0-c4830f7fc448@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <efff1469-bcf6-92d6-fe9c-188c6112eb14@amsat.org>
Date: Mon, 15 Feb 2021 17:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2606adaa-6558-61da-53e0-c4830f7fc448@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:28 PM, Richard Henderson wrote:
> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>> +    if (a->rs == 0) {
>> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
>> +    } else {
>> +        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr[a->rs]);
>> +    }
>> +
>> +    if (a->rt == 0) {
>> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
>> +    } else if (a->rd != a->rt) {
>> +        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
>> +    }
> 
> Use gen_load_gpr.

This is code movement, but I'll clean in a previous patch.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

