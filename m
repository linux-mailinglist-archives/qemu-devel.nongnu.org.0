Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A981557C6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 13:30:45 +0100 (CET)
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02mS-0004Sj-3c
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 07:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j02kI-0002hb-G9
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:28:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j02kH-0008Nd-Fn
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:28:30 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j02kH-0008N5-3w
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:28:29 -0500
Received: by mail-wr1-x444.google.com with SMTP id k11so2445910wrd.9
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 04:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lBPsNWX2+Masn25Jj6lRUVNcZ+uWsSAHpZUsQixLVJA=;
 b=g6uhTXALs8gdOplYiW+a0xUAo0zyJVh3qMv/31mTvnMzOpgZv9888obmz2NpHBMRHD
 hJDAAm5uVxDMbPl8laZ0g3Ntm8pvQb3MEsCfN2F+26i9CZXXB1xaRdWMuNkyVFXvIwbJ
 VQAcFytnJwPXalAsaOx15gBA8x/Ngacu/pCNT4bR7OLtcUuGUlGGIXh7/T+3cDLWaDkd
 R4q/t8Mhs74GSylhhz3JvvH4CUJSD9mk4LyD4jHduMI6KVqcoRAqbnT7ff6yIT/7p83Q
 7eeRlcyW13T0uKWT/75yVxkUXVTi54kl0vBXwZXB0hXRsvGOdUp67H3jzg7Gq6C+EVKz
 cFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lBPsNWX2+Masn25Jj6lRUVNcZ+uWsSAHpZUsQixLVJA=;
 b=lQONTQ9EhWJwwlUkVG9zNkEqhgDWdtfmdjQ7eqSjjyjuIiIfEu0xpbgozshOQ1atCe
 NYidsGJpwc7BJUbfA27sAn9c9szP92XmonVG2qvzi/1jdYd1Fd+SFOnl3MeG/Hd7H3Jn
 udG1J/uf5nuIQfWtHDM6CTqdxQwJX8oxGDB9iCDDUm8TK/KI5aXblcdZteKBccvONrI3
 xjz7fw35rQqeuA9RS2jnwlGuwZj2rrQBbo+0X4I/jAJRRTvb80DXIG8Aoiuq578TJ2F8
 MuZEAvr1DZbO8ju3YSA48Krl5akfhTtpphjZ5FwTA3iH473Xz1RXmpsg11JX3YzJoanp
 41PQ==
X-Gm-Message-State: APjAAAWMEjB91LSVnV09MPb/cIdf1A2dUL2C2uiTKCNbYKWoRHMBFSSh
 Jf1jrG0d0kJ6uRKF3pHCWqswdg==
X-Google-Smtp-Source: APXvYqzb7xszLtfptubZbrj+xiDFdQASFuxYik6IJrLmq6szsT4rArF2zgy6L+E7Tt2ENNkgkm2sPQ==
X-Received: by 2002:adf:f304:: with SMTP id i4mr4316239wro.94.1581078507513;
 Fri, 07 Feb 2020 04:28:27 -0800 (PST)
Received: from [10.43.13.93] ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id n10sm3129742wrt.14.2020.02.07.04.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 04:28:26 -0800 (PST)
Subject: Re: [PATCH v2] vl: Abort if multiple machines are registered as
 default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200207112729.28554-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62f09eee-631e-8831-120e-82468aec5fc9@linaro.org>
Date: Fri, 7 Feb 2020 12:28:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207112729.28554-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 11:27 AM, Philippe Mathieu-Daudé wrote:
> +            default_count += !!mc->is_default;

I'd prefer we simply change mc->is_default to bool.
There's no good reason for it to be type int, afaics.

In the meantime, there are no settings of is_default outside {0,1}, so you
could just drop the !! for now.


r~

