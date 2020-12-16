Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D192DC76D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:56:28 +0100 (CET)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcuQ-0008OB-EM
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpct9-0007p0-TO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:55:07 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpct8-0004sd-0u
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:55:07 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id 9so6088428ooy.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2CFUuBiNzFNBAosUnId5FiHeO92OY2tm9I21TCPDhhs=;
 b=dmydcMeVQCMrESmykaofoXKqXxrW+8ctPm07OwJXfifNqos4BSxv1kps7B9d5IDOCh
 XLpEc2D7C0+mJrblOjLYqGPK8gDxmsFY/yiKeexMbMpA5PFaN2hDrZy1gkwSlBN9SDtW
 InOp3Es83B2vwW4nA6+NlI+VzXAZgrQ/1aUWckEKD5nt7ky59sw4SQnfeaxp3P/uSAw3
 rTaGSeYwH8HXMiSvVfKKyHYrWItd4YbH43OlJapti23KJ1uLx3xG/9g6QRkuZlLaGnSR
 JwOUwMfYBqSNuugbp2NdjesvCedlS3jSbufNTZNVvs7Qs1w1qDZx/kbt6oz8NN9D8ymK
 5Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CFUuBiNzFNBAosUnId5FiHeO92OY2tm9I21TCPDhhs=;
 b=IY2cQKfa0zRVoBWrwtYdAS5buznym8+15Ys+7Ido9UGUCRF9oZVC78UKLDxTTnFcac
 MrOEPcX7ud7DcpkpwJgX1047dXG4uOGoFG8UeuQYvFs+LfmEs2ePyWmYibjHXTukdgHH
 Dkfgh+ASZfV21pmBIScPKaFs3rZxj1vFQW+Nkn1wow4Am/rGiZE/QgLDUk8WrBFN1TRF
 eOyTAb/saRJxpJOBQtuCERygKQJ9yV3gTDVwFWgNuvYyHlA0tp8uT2q170AWq+Bsl1i8
 9b8ogUoMsLLyIe8dgS48706AvmLPoXxpOyS+XYmoaphcoPkBBESVgmeoLtr4+WJOgFDS
 f5EQ==
X-Gm-Message-State: AOAM532tcgvanXphEekqUnca9ilAPPbBMXod9+6+sw5P2EeOol5rW/3D
 xpcTXZIIvEOuYKTKKJ+upWgwBQ==
X-Google-Smtp-Source: ABdhPJxadoryUmt7PHZt4kdVDBwhb05K4Rqqv5javg9bkiEAyD/QmYAyOV+OtjRRiICzz94iFJQf3w==
X-Received: by 2002:a4a:4592:: with SMTP id y140mr26731317ooa.26.1608148504463; 
 Wed, 16 Dec 2020 11:55:04 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a18sm610992oia.29.2020.12.16.11.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:55:03 -0800 (PST)
Subject: Re: [PATCH v1 3/6] gdbstub: add support to Xfer:auxv:read: packet
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05650fa8-8418-2805-4589-d8e41c5be076@linaro.org>
Date: Wed, 16 Dec 2020 13:54:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214153012.12723-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Lirong Yuan <yuanzi@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 9:30 AM, Alex Bennée wrote:
> From: Lirong Yuan <yuanzi@google.com>
> 
> This allows gdb to access the target’s auxiliary vector,
> which can be helpful for telling system libraries important details
> about the hardware, operating system, and process.
> 
> Signed-off-by: Lirong Yuan <yuanzi@google.com>
> [AJB: minor tweaks to test case, update MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200730193932.3654677-1-yuanzi@google.com>
> ---
>  gdbstub.c                                     | 54 ++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  tests/tcg/multiarch/Makefile.target           |  9 ++-
>  .../multiarch/gdbstub/test-qxfer-auxv-read.py | 57 +++++++++++++++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

