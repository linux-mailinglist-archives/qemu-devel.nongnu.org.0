Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CE6A5E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4G6-00073X-QL; Tue, 28 Feb 2023 12:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4G3-000737-Sv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:59:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4G2-0005Dv-9n
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:59:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id h14so10683489wru.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZkNxQGfO8OdPz8Rod0BYs18tw5RrO64IS2putAq/N8=;
 b=zvrDYAd+z65KXSkst9L7qww4vz5jqOZl0/22Q3OkuNzWuRaAP59koGacL6r5WRhHFa
 9/BxGCFxcnLW+yYquE6MYQqCMr9DVvQN6sNgYyL3+NYvMqSZ+rg+yNdWIgYJu6XT7OXA
 5tpPjPsfUejJIM6AVZyYpE6NEw9B3rVSVnJVLbizlcaQXQ0j88dxPIPB+rXb9hnaGCPn
 fmd/aJRH6obK3xwtZH1EsgsOIqusI1jtv+a6gReCqWyRGoixXnsncR0gWV/W7ytfjMkN
 dO2dsdAR/iojNsUHvPNkhOIFe4aiBiO0QPb1owWNVPkHiRIlsL5xkfnPQxxCsu/Hiqdn
 wn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KZkNxQGfO8OdPz8Rod0BYs18tw5RrO64IS2putAq/N8=;
 b=DXawKtrWR/UK8TgA505toL8xuhjy4/2tCCtUNE7iNS0yEFC/JLQSaYTb8P/XmeHU42
 bGh9WjnnUysJNEI67xyiKYoWecAwiTUhomtiDVXimalWN7vdX6UrWNC4sx7uggiBcteh
 HbdA3r9Co9WE/Tbi9uJTch3NPScGk1w/Tdmjaj3AmQxdyWDx0Myg/kHmUMfPzOCRTCJO
 qUEYwYwDVr9A3EBRj/fvEHbAPlTat119ju56T3EI0iCQEZ2HhhZhXkHU7/pt0usxlyey
 N6yaYZsAUjzYW9YoB0IFy9zj/vur2jtEpdlGCoame5yKYwc3UyZVgrW08Fw1D8B2hcDP
 V4eQ==
X-Gm-Message-State: AO0yUKXyhb4Wiskg4bj1GjqnGFaHjOHY55RCpx707ONI4AiwXcDhCQ0D
 n30QgtvIIGKNMnN7HbhaS+/Bhg==
X-Google-Smtp-Source: AK7set/UNnbfsDAScrdpBlUSW93IFWH3aiUbC7iY2yxPLZFpIk5gpKhljtG2EOyE6uxNxo9QjT7L3Q==
X-Received: by 2002:a5d:5004:0:b0:2c5:5fb0:b215 with SMTP id
 e4-20020a5d5004000000b002c55fb0b215mr3151062wrt.30.1677607160665; 
 Tue, 28 Feb 2023 09:59:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm10327030wri.30.2023.02.28.09.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:59:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC7FC1FFB7;
 Tue, 28 Feb 2023 17:59:19 +0000 (GMT)
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/30] accel/tcg: Introduce tlb_read_idx
Date: Tue, 28 Feb 2023 17:59:14 +0000
In-reply-to: <20230216025739.1211680-5-richard.henderson@linaro.org>
Message-ID: <87mt4xeknc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Instead of playing with offsetof in various places, use
> MMUAccessType to index an array.  This is easily defined
> instead of the previous dummy padding array in the union.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

