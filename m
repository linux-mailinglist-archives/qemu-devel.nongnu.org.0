Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE374745B4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:56:21 +0100 (CET)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9E4-0007Nl-Ag
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx9Ba-0004nk-DX
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:53:46 -0500
Received: from [2a00:1450:4864:20::436] (port=38533
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx9BY-0000KN-Ux
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:53:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id q3so32810297wru.5
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c2NeLMcRrVsb+Pl9xSQ+FPJM5EtaaTACMt+A1OHAZvI=;
 b=sfzB2WXJtaSED0e94BGzh6lgEcxx3ffN1j0na9SW486Q1cVTAT2gfo5EICJ61WgddE
 LIbdPKHpnYWJdPd+NKA0cEY4gWvAIYRhQ6M57vTU+DYx5TD1KYdDB3jM0IwKsim4dZko
 nApF1zkydd+l84CIdyJm3iUIMk6LrrB0AbF7Qr978xASjzetosn3jU2KoZtEjI+otSP4
 jxjrS9FKzyW3Rt4VAVsfPp5HKi88RI8AWv3YAEoPkt4K9hl/Q+mWdQPnbRB3IN+tCXsl
 RmGjMeiWp5CtI2G0WKpUUkqoSLaCrBz1lsdcwTF93P6hNeT9Qk+9G2d8RwLk5IsTIGeT
 f6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c2NeLMcRrVsb+Pl9xSQ+FPJM5EtaaTACMt+A1OHAZvI=;
 b=q//wz0QDroupRHVCgaC7tDaMaU5XFhVZtFraCV3p4nNZCqrrzTyL4Hlorr5NA1ExR1
 BDvsMCYpma9CBD5NsHqgbj3PR7pgXc8kJEhTrbszGN0eijTQOz7zDCRDhBDR4JT6bug/
 06vg68tDIwBXs57U92KJnmOy8U1eGVUOG1+lV+KnBb8hJ6H2zSXBAHLNDJx9xEYK70ZZ
 vD4wLYeGptvzgNyuZehwYGrYg1QnsZ+SiSFCshTk6AQdR9ODP+LBL/HK5NTdrsMRz+kv
 67zTTW5idNcOBUpLjNSLqMEgxrOq7174PAudYq7Zz2T3Ule5OPViijGKgAGTw1b4SzHh
 smCA==
X-Gm-Message-State: AOAM531dLHe2fmHP1XDZB9k3mV+OLY92lX4x3Oo1edV2pQyqEC8oOmVM
 YIQzeuxx2TyEfV9zPptiAx3mKv33iaIYeA==
X-Google-Smtp-Source: ABdhPJwc5iEXGAM02ETXdcYZ+UbT/oC3LsQiLGYzFHwXhBlninx9T675vN1NkScXhKFi4QNh5OVFJQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr6362878wrb.133.1639493623492; 
 Tue, 14 Dec 2021 06:53:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u23sm119423wru.21.2021.12.14.06.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:53:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F37C1FF96;
 Tue, 14 Dec 2021 14:53:42 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/6] target/arm: Implement FEAT_LVA
Date: Tue, 14 Dec 2021 14:53:35 +0000
In-reply-to: <20211208231154.392029-5-richard.henderson@linaro.org>
Message-ID: <8735mvi6fd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This feature is relatively small, as it applies only to
> 64k pages and thus requires no additional changes to the
> table descriptor walking algorithm, only a change to the
> minimum TSZ (which is the inverse of the maximum virtual
> address space size).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

