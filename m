Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F173619C777
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 18:59:12 +0200 (CEST)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK3BQ-00033P-24
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 12:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jK3Ae-0002cX-9Y
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jK3Ad-0005Sf-9i
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:58:24 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:54895)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jK3Ad-0005SF-0N
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:58:23 -0400
Received: by mail-pj1-x1044.google.com with SMTP id np9so1767669pjb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Apr 2020 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M+u15fhqkohHEsinrLsc73Re2P0Lc/bIU4UNErEj/7Y=;
 b=NCUKVz4XrMSNaF23hSHdIxnLDyMNIVDndc+P/PUGnHGz8I/Bx8rPgw8k34d/4fs3No
 ziZVHzVX38FhpJOJ4CGmTo7+blHKWzEmTKYPjbI33i5/bzIeAUj1Gkf8aC3zToEwyZIf
 ufGRvVHOhvSFbLc3jflIHR3rdhzGrcOGmoozebtCP/TBhRd+3RuauCf+FajueDBCRsWS
 JeFOI5j4jKpdE7Xoid7cNf04lxuLVyVD4BSOVDb5oBMyK5Ssln5JjvDyQfCQRpLrIJ1x
 7Hb+45zLLR02SpvPDx4jBD6JK1m+plFhUCLkNK3AltuQ6QhICNaueEdbpWhh/qw/E9OR
 CVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M+u15fhqkohHEsinrLsc73Re2P0Lc/bIU4UNErEj/7Y=;
 b=ppCfaqD03+UGIljSvhs4iCMVBqxVAxuefdkLzwFo1JDk96mIKVYEUJVE6oIFmN3aaV
 tvD22lQZaVKOlD66eS0uFSVd1OasUt1RV+AewfGbt7V/m89qVeny1dFLMemCfW0tOdXM
 PR03MlJtGv59M/aYeuKobh5fQLosdwVYrbmcBQjMvIIQu9WTpCR05oaZXu+jVSnT+mny
 kTcNh9C9rOvQi9YFZAHUdG3NXVAcDA8ZbJqEGqQNGVYyy0oZ8LWjRR6b9Yh28zrnCPHl
 jKS9PI46+R0QF3XYOlgyZkmu96QjRy8bknzX2EhF8DL+56OEaTdRnrlgpP3/K7pLx96Z
 8UeQ==
X-Gm-Message-State: AGi0PuZ60lTP4GA3RCbTCRTbLgbawXOC8gXbCC+ovQNnu7tGqPsrbUOs
 fwCmVd2F1MkbJ/cVpqL2ONpYwg==
X-Google-Smtp-Source: APiQypKpKgZqwh2k2TudVRGq1wFs3PWRKN0TaRQDDp1t5Q9nq5e+i9Nej9nLiRws0pJlPBrudYjoDA==
X-Received: by 2002:a17:902:22e:: with SMTP id
 43mr3609752plc.119.1585846701709; 
 Thu, 02 Apr 2020 09:58:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g81sm4049739pfb.188.2020.04.02.09.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 09:58:20 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] linux-user: factor out reading of /proc/self/maps
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200401094759.5835-1-alex.bennee@linaro.org>
 <20200401094759.5835-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9efb706f-e296-a1b8-6c77-b859a68a8357@linaro.org>
Date: Thu, 2 Apr 2020 09:58:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401094759.5835-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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

On 4/1/20 2:47 AM, Alex Bennée wrote:
> +typedef struct {
> +    uint64_t start;
> +    uint64_t end;
...
> +                errors  = qemu_strtoul(fields[0], &end, 16, &e->start);
> +                errors += qemu_strtoul(end + 1, NULL, 16, &e->end);

uint64_t vs unsigned long -- you want qemu_strtou64.

> +                errors += qemu_strtoul(fields[2], NULL, 16, &e->offset);

Likewise.

> +                /* A bit ugly as strsplit doesn't skip multiple separators */
> +                if (g_strv_length(fields) > 6) {
> +                    e->path = g_strdup(fields[g_strv_length(fields) - 1]);
> +                }

And if the path contains spaces?


r~

