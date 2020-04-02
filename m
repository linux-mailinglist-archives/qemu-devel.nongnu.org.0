Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1348C19C7E2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 19:24:15 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK3Ze-0006VT-3a
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 13:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jK3Yt-00064v-Ua
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jK3Ys-0000zz-K1
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:23:27 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jK3Ys-0000zm-A0
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:23:26 -0400
Received: by mail-pg1-x544.google.com with SMTP id l14so2156913pgb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Apr 2020 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZWGyuuzLDGfRtHwx0PH5/7OpvVnJdROwg74lelB4cfE=;
 b=jr5i83avWTBQjrwXX7Td868DPQy8khb/nGOl5WeBvuN2v1UV/0m1853y7Pccjw6ZCL
 V4Ip3tHWzuRbw7UVquNi8inQrtod9Oeo1rdt1z4qqDKhXtJR5XSIevnNuQjONXVE0QVS
 194eHCAbMgI9y7QNHL+LnaHKHZrO/KHeI/DWRx/7WlmdrBszcp5np/P814QZ6SEnsa5H
 vR+yAKbPQAwPHuVLrAYDc18dE/FlmovhJYEphGqP+t9ZHg5nrzC+H1e+4TJ7kg2QG0j9
 CQCK461lPjK2sJN7UHBw5plDvnFLCY/v/KQHVXt1du/TUoeTD3iMkn4oOk6tqXTYtrUA
 zUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWGyuuzLDGfRtHwx0PH5/7OpvVnJdROwg74lelB4cfE=;
 b=l7hmN4OYEGXBopPRMfcxhqpxsYIEk3WAs1uV5H4qw9ArEhTY+dtVKBZjsUrG9i5bnt
 nLnvWT2GUQEsPhFKxepdVAP3f+PtoITBe1UJT5pjYjpXCnfNoZUZ7xyqbwFTmu1vt1pA
 lADAECQ5wxcBMJMuaDKCODZvAxPhv1v9YZ0JIPXRismIwtN4C5FyaUF7wY7xfAIL9GD9
 gfvwb076DX8TZXTbdjXRmGvFXd+iy3VS/6+QmUeqFc6tK3dUCALapwN5Ct7q7jOuBocC
 3OHLgszxW6FUicQCITGxm/KDgPk8pG+czqym1MCtlSd3wTr2ZUtQ0nidXo9gL5vvZR7w
 2qKA==
X-Gm-Message-State: AGi0PuaSciTaRU/JbhSjV1tFs/TiD/D0EAtcXEtLN1wZxz6DGWMOEyqC
 BjWqQEPA7gTQnFVQ5kxGd85qfA==
X-Google-Smtp-Source: APiQypLxKGM2NfZTZcplsTpXRcl2eZ0iOiOkkrgpYrq/5eBVYGjoGY8vRdsvwL3KbNJKG4Jjo84Caw==
X-Received: by 2002:aa7:8438:: with SMTP id q24mr4317520pfn.167.1585848204869; 
 Thu, 02 Apr 2020 10:23:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id x3sm4131825pfp.167.2020.04.02.10.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 10:23:24 -0700 (PDT)
Subject: Re: [PATCH 1/1] target/i386: fix phadd* with identical destination
 and source register
To: Janne Grunau <j@jannau.net>, qemu-devel@nongnu.org
References: <20200401225253.30745-1-j@jannau.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52d8def0-682e-8f1b-f3f6-3ea582fe8e4e@linaro.org>
Date: Thu, 2 Apr 2020 10:23:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401225253.30745-1-j@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/20 3:52 PM, Janne Grunau wrote:
> Detected by asm test suite failures in dav1d
> (https://code.videolan.org/videolan/dav1d). Can be reproduced by
> `qemu-x86_64 -cpu core2duo ./tests/checkasm --test=mc_8bpc 1659890620`.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

