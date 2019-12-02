Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1510E47E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 03:18:16 +0100 (CET)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibbHz-0000xf-Te
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 21:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibbGH-0000Rf-4c
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:16:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibbGC-0001OR-Sf
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:16:26 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibbG9-0001IQ-0K
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:16:21 -0500
Received: by mail-pj1-x1044.google.com with SMTP id t21so3379015pjq.1
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 18:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aUtWXITmFKZOW7HyFXYE5IJwJduJapQuYwKCcEb51ms=;
 b=gKDj1Fz0jN9/PEipONomiv1fl4x9ndGFwhRn5hmvfXOgJTtiWVociq0UMmT424mhwm
 MZyI78xArDHUHtJQ7il3KB4DtPfISEt5KkLy7CQlbUpQT9Qk7UaFzYWk/OB1NokwwOX6
 Xa4QttF+fEfXbSDO6KA7cBCbWjWjdtpZ28wi1O2YikRvtig7SCtiZekBhbEgQXiObJwS
 NO1H8jmwwpRh1GLW53rvHDCTtytGM8XGaiCjXLrfGX2CAo1wSqZgOE8pAmsJT8H1f7R9
 Xlle8AzsbzakSqdTmvHbFUDq0M+8CnpOyHASBlhV+R3L9FiHxQ5kJmxXJuxLR51PSXNV
 +Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aUtWXITmFKZOW7HyFXYE5IJwJduJapQuYwKCcEb51ms=;
 b=Hh8S/KInD2bDlVff0ipfkFkPRlrADbiSp8oA44wvNmymFVuAu0Dp4JtgO08/SakXWh
 UTtSKxhTPkd5QOEwIVMi4ySFRXVjTVImKiQsOkPQDawaS1JadtQRYhlJk70BngW7sPXv
 ypbys0U19holHMcncLVHqmD6e8xMBXcFzchmiSh0v34D7N/eaJwkBfqLkH8XikvIGHSH
 X/E+ef8oszNzL4K++Sf92cabBtXeZrMc8H08hDaELXFl6N23ezSpLTyvQ8E365F6fN52
 fdNSvqkX30jqDQBtI3g3OY7FULDARg3HLZxe6WQEyHvGdfauO37ud0rIrnFbPbFQ8Bkq
 Osbg==
X-Gm-Message-State: APjAAAWjCyGtj+vV1cG+zy7nNekRI3plsjUHK8GPfSBRhH9c/wikWKlQ
 v16yyuSToGJHbzv9Eh7RyqoxyA==
X-Google-Smtp-Source: APXvYqwDxcxavd7NMNTK7Tdwk7Enrh2Cfhc6CxPOQS42audTEayXyahZNzCF6cWX4pW1zNNKGcjVVg==
X-Received: by 2002:a17:902:bcc3:: with SMTP id
 o3mr10676407pls.90.1575252978471; 
 Sun, 01 Dec 2019 18:16:18 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y128sm6029900pfg.17.2019.12.01.18.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 18:16:17 -0800 (PST)
Subject: Re: [PATCH v2 02/14] gdbstub: stop passing GDBState * around and use
 global
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e14c454-2c31-0ee2-ccfc-21521a73c71c@linaro.org>
Date: Sun, 1 Dec 2019 18:16:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-3-alex.bennee@linaro.org>
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
Cc: damien.hedde@greensocs.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 luis.machado@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/19 8:45 AM, Alex Bennée wrote:
> We only have one GDBState which should be allocated at the time we
> process any commands. This will make further clean-up a bit easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 539 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 267 insertions(+), 272 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

