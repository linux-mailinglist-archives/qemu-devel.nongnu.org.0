Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698C60B0FF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:14:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzGF-00025i-7e; Mon, 24 Oct 2022 11:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omzGC-00025D-NX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:21:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omzGA-0007zN-Up
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:21:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id y10so6833613wma.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zD8E24ouQaievn8cnU2ef9NsFkiPAZ0ElUkNUiKT6GE=;
 b=W+EAO0PEzApHGRCf6plt8HI5dtU6MOmqUm5tYFZ5FYUD6NIXsNNpufy7BObs0ubNmC
 xBqsLegKOTYWd0Js/MsHUuvU6ywE54SZZTgELuIQVhloQIrBRAnju+pEJn/F+TT1X42N
 r7vz+YWCBzdHL3Lln6J5u0HDuNIb1hbrpIAM69aKDmFlMBsrirDXQ8DT/pXzAUe2CHXN
 W5NEbU8fJ6+z/x6dyj84FMk0r/SiAUI2vEyqD6Wq2xGWWIbhyVw5p2ZwAxj4m16KWuWx
 4yP32AETjp35AHMAyT7cAK9TLFSa7UCnZk4N+9azu8UzFGke5/YV8FCF3uznlKvYJrUI
 Y8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zD8E24ouQaievn8cnU2ef9NsFkiPAZ0ElUkNUiKT6GE=;
 b=lWPpk57hdvwIeFGHZdYd0XI1tmic2azyst2uppOZJVuJ7D3S57Vo3YCKi/QD0iuuWV
 sZrWpcpS9X9kOXUdw9XQiUhwY2orSzWuzVMclQZHS2/13j4SHkBe7qQ2yxHwNvfdUrLf
 agUWpZ5sUOcHtQB2J/+Ir2/6fGdCdSY8SHW3uDAis6PQnWzo42ng5xKBxxBbqytDPf7q
 0dWyk+ekE6oEF3rFp8hXK4CwcK/lmS52RF8s/a+VxpkeUicOVE3CNSeGcp4Jo2Uijqk1
 x9gUMunSfG7dWDdpCL2GE1P2r7qWg9uCjGtsqVNr2aivLQ2oAYonktsETqwYNTFIoGI8
 Dcbg==
X-Gm-Message-State: ACrzQf1txp7ncvxUdwFzzQIRp1+qsTwZghDw+fdXK1qnDWpa//24KUUH
 Gu5AwCQNW1tf8HfrfAginC7MgA==
X-Google-Smtp-Source: AMsMyM52SNWt9nRnk+WIMAjoA17oGlOB/wTjt+rQyVgv0U7MZjGb3Cq6rcrceTbVN/gfqnsvvAhYbg==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr23217143wmb.187.1666624859881; 
 Mon, 24 Oct 2022 08:20:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003c701c12a17sm8373306wma.12.2022.10.24.08.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:20:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72DBC1FFB7;
 Mon, 24 Oct 2022 16:20:57 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-12-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 11/14] target/arm: Tidy merging of attributes from
 descriptor and table
Date: Mon, 24 Oct 2022 16:20:53 +0100
In-reply-to: <20221024051851.3074715-12-richard.henderson@linaro.org>
Message-ID: <8735bd9rja.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> Replace some gotos with some nested if statements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

