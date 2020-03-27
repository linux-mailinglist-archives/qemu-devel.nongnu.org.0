Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B381960DF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 23:12:03 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHxCs-00039T-QK
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 18:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxBb-0002JJ-LC
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxBa-0004mE-Lf
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:10:43 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHxBa-0004lb-FG
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:10:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id b22so5238409pgb.6
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 15:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6RKzaqqq8L7JpUo7MqmWZtYiL8iBIduoRu+01osPcjE=;
 b=p7XiViajmRxNuaw2PBAzqFH3MNfS/R9PPkDS6FA8pkmyNCLYAfraHjaVf8LIHaxs+o
 +a2XtRRVNz7pZHFnKe1ESsQmW+nh4HoXe2v0niKzvPxhjAdqa7hBausoZXJDZ1BeHfO4
 EYSD55jc25oghgCDEekdMI+cNys25IwAA2TkhJP8Su9AvI3J8dkiYyXqxzFsQtNnPhH/
 yAn3gUcc6a37+cBvrE7XUxdHKb07Cv53NUeaqOmCS7EAew11rs4ZLFdeWANavDfbZ1Kr
 DoupA9iDW+trDT4p00H5+22owtlaB5xUwR0XFdvz7Mutbx5wDXSKleaarP70iEuOlJwo
 nv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6RKzaqqq8L7JpUo7MqmWZtYiL8iBIduoRu+01osPcjE=;
 b=TSJINOZVx+lSub8i4wBehOeC+bYHLGniZjQUMBuHSSlB+w4PARW7rt/KIezLgXugLE
 iUr/ROCDG3JoO1zabPORGMigQNr0Gd5GA4mxJlVi/Xb6Kl7xTBkZAN+7IDzVEun0oqNr
 GVUzYrrJTcDp+fA2H/G2Ob69cF2ISWgEa7ytt2RjtsmvL9NAZIfkoifm7Ewq5b2N8+YT
 NkHWP1lNWkviuuoZbivRziKEAvAgriEIGD4yRZm6icvXfy1hnADFZFQcUecb++sDunIK
 gbgX/QODhDoXpR0XXbHLRZUcr650HEyHH9ToCrPtAADK9rlILArlpNVAftlfQtwk4Mkb
 n3IA==
X-Gm-Message-State: ANhLgQ0GMlEn0Owe4NwIzTBjj0SCheGHNFNcurBPLX68K+r/ZsUl5y0n
 w2Eshpm5N8T9REPUDvdpmWcUfA==
X-Google-Smtp-Source: ADFU+vs9YG9YJ5dKec9oCB4gigptjrr5eh2PINt2odTU/XdvEkJwJJXmpdbC6TX+EvVVXw3sJ7Lw6Q==
X-Received: by 2002:a63:175e:: with SMTP id 30mr1451138pgx.162.1585347041295; 
 Fri, 27 Mar 2020 15:10:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id v123sm4801323pfb.85.2020.03.27.15.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 15:10:40 -0700 (PDT)
Subject: Re: [PATCH v1 2/7] linux-user: protect fcntl64 with an #ifdef
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7856911-10a3-bfee-3fda-b03ca5c71e27@linaro.org>
Date: Fri, 27 Mar 2020 15:10:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327094945.23768-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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

On 3/27/20 2:49 AM, Alex Bennée wrote:
> Checking TARGET_ABI_BITS is sketchy - we should check for the presence
> of the define to be sure. Also clean up the white space while we are
> there.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/syscall.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

