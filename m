Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA760C7A1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:12:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFjw-0005Bp-E1; Tue, 25 Oct 2022 04:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFZF-0003oa-G4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:45:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFZD-0006pr-O9
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:45:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z14so6117691wrn.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1KzZIhLKXaU+EL9nTzGltmNVzqSmYU0m2/f8ZTB+Bs=;
 b=eeNaqiBTVDJQpc+CAbGy3bz8mqkYddtjjQueEW8KfPuzknUk+3XysTZkeLXRu7v+Cn
 xXQgo15j66iW/knsI7mrL+RBfnpuX7BjrV6LeN8c0jY5BA4m+bqjL+R7I6154KgK95+Z
 4e3cw/gB+wKvJXOxUixNRItlpROeFFCAd7oXsEB8UxoIVHPTibRIrfBEkMdcfTrQ9NN4
 bc/OjjXHUZfRX1nHAX+IWslUYKcAk2xnz1HdU9KClA6c8qw4q0H0ajme3xB1Dd2YI3yf
 wa+PU2hpVcmJEHl6MY1xr4lBcpO6vBWVABd4bxVFOwobIukTy9u0drP6u/Lch98MZlqR
 qAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W1KzZIhLKXaU+EL9nTzGltmNVzqSmYU0m2/f8ZTB+Bs=;
 b=7iL18A2qwQ8lhCnJCE030DM8SwnRLNG99yNEbSVV2KXlqNslTrOa4YWv5Dh6wE0ruW
 8IU5OdQGRvEYNTooBgqpxDGJ/yKF1AU826hLYoRe92g1AOMAPupcKQX93QSsot68Hmkj
 XFg1khZh5r6h1fbjSXveV+CA5Fif2oOkd7nfG9HBsdfoWaQEO7AxG+NQl2VYckjQt6IM
 rwv0NymxMru61xbrs34vIL7tDYAKqZIe+LiFg6oLi6v4IPMesS1ul8Ns9L6AXDmWhVd/
 o7l+kKaZM1kFe+at3HyA6wl8p39bszwZiD4IOYBLw+zN5P2KR5+U0/vnWQTRfyaNDjgD
 WKuw==
X-Gm-Message-State: ACrzQf2KyhYj9HXYBH7/vGSMIve0J33bEuHgwg9poN981RKd+ogF4ofK
 lpRt+Ykyvv4v1n6t/gx/wGO5TbqoMgfhAg==
X-Google-Smtp-Source: AMsMyM7ysIpVSYIkKgs0i+1OuhJTG9NRe1KTB/AMgZom3jJtc6gxLEwf+6fDmF1uz6Eu/L82kfTS/w==
X-Received: by 2002:a05:6000:1689:b0:22e:2c03:36e7 with SMTP id
 y9-20020a056000168900b0022e2c0336e7mr25723739wrd.252.1666687545787; 
 Tue, 25 Oct 2022 01:45:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003b435c41103sm14146973wmq.0.2022.10.25.01.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:45:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5B101FFB7;
 Tue, 25 Oct 2022 09:45:44 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 02/24] accel/tcg: Make page_alloc_target_data allocation
 constant
Date: Tue, 25 Oct 2022 09:45:40 +0100
In-reply-to: <20221006031113.1139454-3-richard.henderson@linaro.org>
Message-ID: <87pmeg8f5z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Use a constant target data allocation size for all pages.
> This will be necessary to reduce overhead of page tracking.
> Since TARGET_PAGE_DATA_SIZE is now required, we can use this
> to omit data tracking for targets that don't require it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

