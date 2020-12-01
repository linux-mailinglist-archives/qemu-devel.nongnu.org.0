Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A92CA2B9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:32:55 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4py-00033I-8J
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk4oX-0002ML-DX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:31:25 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk4oV-0002En-ND
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:31:25 -0500
Received: by mail-oi1-x242.google.com with SMTP id l206so1525700oif.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0zAP7pUMJAoeQvXb2XOU6F09p4DRNurDW2hG5sMrnd0=;
 b=WD2Ra3tulvBHsceZI9RlM5r7DULvX80Xy5sIXL9AVdSEahXdEmH5cIfEPaPSJal/Uj
 R3h24hyjPmCcvIcfol92XtB/GnchCOVMLVECylLdrEhZDk+vTV0ykr1FKvV7OwB3Itdx
 AV/qX0LUsv0ozbm+ICeHOem9NL29y/cELGjxzUJ+X60sYXSyYF61XjvxlY7UvI97J87g
 9fQFi9tueH/jl5wMKxDQxeNusQRb11edn6Rig9PC1lmT6YjVEMqrp8HwjUqdCuNmzBqA
 6zJDxL2KkJDfzHNy8NNH9aEXxc5ycSF97Sqgz/HDyzM8DnOlaIznXsNs/s4cy7DFtg0o
 Cl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0zAP7pUMJAoeQvXb2XOU6F09p4DRNurDW2hG5sMrnd0=;
 b=j1Q0u2kL68sPjdIBmmhTk4GniukZRUabFzvgcXG5p0H/PeVYM1OVQSljaXyiwzSZi+
 LvdLiSW9a1cSbR6rqOo+clet0MhJFu3nO9Ax6a/QoBpaCCXpP0rzycY1oVrwTHxhMAqz
 M9II1e+VeZcO9CreJypJfJ+ndGzFH8U7Bin5aMzdNHLsdyNJzc/E0aGxKN2SrGUlEW5H
 waDRhOeLYy62DxAIzoWwYXn7iNdIvazA9IKJLIH6dod0C46vOH37gBzs7iuGPOtH0QRW
 vFdnWsrVzYVSE/MiJUYdkUx6KectAISOxvecolhae6oye0JbTlmrEyZdBsnuC+ZYWkqs
 uySA==
X-Gm-Message-State: AOAM532NKY3WQ7CG6WVYlJS2R8aIq01mC6H5numgnVqAk7ezbXhG6qtz
 5pLwZSnYm+rjS1wNWApgktRq1A==
X-Google-Smtp-Source: ABdhPJzduLfMfESz3c0ToV/ik53OLLbcgLp4lhMJSVbd6IZGBs32AIWI0RmkaYcfLBJgk1uDXUTSLA==
X-Received: by 2002:aca:f1c3:: with SMTP id p186mr1526785oih.154.1606825882278; 
 Tue, 01 Dec 2020 04:31:22 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t10sm344069oot.35.2020.12.01.04.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:31:21 -0800 (PST)
Subject: Re: [PATCH v2] decodetree: Allow use of hex/bin format for argument
 field values
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201201103404.2795455-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4cc7502-71c5-3bbd-67d0-53e5fb2272e2@linaro.org>
Date: Tue, 1 Dec 2020 06:31:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201103404.2795455-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 4:34 AM, Philippe Mathieu-Daudé wrote:
> ISA datasheets often use binary or hexadecimal constant values.
> By doing base conversion, we might introduce bugs. Safer is to
> copy/paste the datasheet value.
> 
> To add support for bin/hex constants in argument field token,
> extend the re_num_ident regexp and use '0' as radix base when
> parsing the integer (to interpret it as a code literal).
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Fix regexp (Richard)
> ---
>  scripts/decodetree.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..c8136073535 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -50,6 +50,7 @@
>  re_fld_ident = '%[a-zA-Z0-9_]*'
>  re_fmt_ident = '@[a-zA-Z0-9_]*'
>  re_pat_ident = '[a-zA-Z0-9_]*'
> +re_num_ident = '[+-]?([0-9]+|0x[0-9a-fA-F]+|0b[01]+)'

re_num or re_number, perhaps -- it's not an identifier.

>          # 'Foo=number' sets an argument field to a constant value
> -        if re.fullmatch(re_C_ident + '=[+-]?[0-9]+', t):
> +        if re.fullmatch(re_C_ident + '=' + re_num_ident, t):
>              (fname, value) = t.split('=')
> -            value = int(value)
> +            value = int(value, 0)
>              flds = add_field(lineno, flds, fname, ConstField(value))
>              continue

It occurs to me that we don't actually have to interpret this string --
decodetree doesn't do anything with it but pass it along to the generated C
code.  We could in fact accept a re_C_ident as well, to allow symbolic values.
 So long as the symbols are defined before the decode.c.inc file is included.

So perhaps just change ConstField to not expect an integral value, and just
store the string.


r~

