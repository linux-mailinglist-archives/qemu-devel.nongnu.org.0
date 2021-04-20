Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61403656F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:59:37 +0200 (CEST)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo6T-00060X-1h
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYo3g-0004Pe-90
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:56:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYo3c-0006u1-CE
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:56:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so878222wmq.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=g8HzsDS/IRWF/NwhCqm0MXRAkWHk6syOQIHTNsdrU0Y=;
 b=MZI6eYhBBsGPlS3pYzYRd/0YHHSBrMaCbTAQY5rEkWWF6mGOI0AlWbZU9GNP5p/2qh
 g878TDKZ/UNY2RqkuLuPIXBGy/lF26kFMpkjtj6EPfGdQ2uLASgXznMGq62Ck9FUzRJe
 UsQB/fiQ38rsaXyVQL7IYvQ/uLkiGgLFBdERyFP3pgUaksWzLnzydg0JLeJv5w57aS1Q
 GxxB/LXh1b28ahIlNQvQiyUAFW4j8BJQyCZgl3rH5Gb37e7LeFOXNHtfexya0D1ckawv
 BCoVoEeUBm7zsecWacMcmnPfWIyrwfmP6tMSmwpEIwVtfDdLg/XEZi4OHiOzOT0MVsKF
 ApcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=g8HzsDS/IRWF/NwhCqm0MXRAkWHk6syOQIHTNsdrU0Y=;
 b=hmX/rCNGSt5AHgF4Mc+z0pX5tm2r6ECl5nlYjuAXVAwIJigd33PgYsYtXsWeYeZWhh
 uNTkIApA4kIpwDVxTuIHUi/Xw/3pKX16ojxofczxHkkGnqUIqhtlbdsTFrzhR/aXbnOE
 Gp6e0BU9DSyHhRdA0+6sDxTeMVGDYpw9QhRhyNWiPyJVR6Seu7pwYp21l/pozmO8EZld
 0d9NqitKRgT4pnfEMrhpiwT5xotHWpKu9tkYS5yc5Js1GZWW5eE27im1ns2CU2vl9oLO
 C/cUqEwG5IxqQ+pICFazR0FcUO4ojckrxJMBr33LlXAvxFfrRztN8Hxq8l73HShYZMv+
 N8Wg==
X-Gm-Message-State: AOAM533+vI5grC6Nc/8IJk1/kdDUhP8XWAJ6YteuSBt9OLgjGoftbG5t
 lfoVqhHIP5H7qDzhLQvmRdvZ4g==
X-Google-Smtp-Source: ABdhPJz6lqBIGnvvMt0ut8Fq64R9A957Z2WtAQG1q9DM0Cnc+kiG8p07iBkj29rA/qUVDuVE6lZW0g==
X-Received: by 2002:a1c:6184:: with SMTP id v126mr3889036wmb.118.1618916198496; 
 Tue, 20 Apr 2021 03:56:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm29978656wrg.31.2021.04.20.03.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:56:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD3DF1FF7E;
 Tue, 20 Apr 2021 11:56:36 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-15-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
Date: Tue, 20 Apr 2021 11:56:27 +0100
In-reply-to: <20210416162824.25131-15-cfontana@suse.de>
Message-ID: <87k0ox8brv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> give them their own common module cpregs.c, and an interface cpregs.h.
> Extract the raw cpustate list to its own module.
> This is more or less needed for KVM too.
>
> For the tcg-specific registers, stuff them into tcg/cpregs.c
>
> As a result, the monster that is tcg/helper.c is a bit less scary,
> and a lot of stuff is removed from cpu.h too, relegated to cpregs.h.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

