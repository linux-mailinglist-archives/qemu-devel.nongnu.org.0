Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192B50BBDD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:42:14 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvQC-0005oX-Ip
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvND-0003mN-SX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:39:07 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvNB-0005IN-De
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:39:07 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso5710554otk.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jOfLfWbjzrTLYXWUAi+Ms8kAksosWjkiM41csahqBj8=;
 b=PAerVdir1J2onrRzhl8Z0sitXiz2+Ym58q2IDmP46jZD9EzrLD4o1kmtgd0lXdM5JT
 Xozk6ZxHaXxDgVaJcxmUdXHm1KBJCCWKTeISMfgl/+Qop2MVUAhu/Yy4UT28zoTjOzMt
 ro+RttIq2LZTbATSC3H5bVx+ZD5w3XDvx1mzaUfDDa7OmR70bbuLkA/DO9bVBpgjbVsA
 VI6X4FQ4ZJiME/6S0mAvGI8fjTFYjiHO1N0wnhi9JWXaDsHA6qRI9IEpzyUkWw8xGEvZ
 SSD+i9N8z3uKbBK46bGzMO4seVXqW1URAQn2gybyQmi/VmSWPO44ubIVUQ+sD7T6AZA3
 FlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jOfLfWbjzrTLYXWUAi+Ms8kAksosWjkiM41csahqBj8=;
 b=CvS+sz/cPi49Hootbt7rsAP9myx1q3X2Q2GNZsI8Xwy/w83TlWOXaYm5McWh0Y9+2+
 vfRu2k6t58y7PSlzTyqAUsKPKM+YYCtl7dPBopL25cerwt0S7fLmMXZQ6rk/CFVWzepZ
 l9kmdNfxfykYJFwmjDA2X654uxixXka2e/kb0QoaS1jTOpRvX6545TwUYLJgluN3RBz9
 E84thxLkgl5bkJfAtxm4iXUG0Gd0B/Ygx+IQqUrPGEZaNvxAWg+EiaLjsucV8Y2vHREA
 dCodYL81Q/YzxN5BEeFRDPPFz5s6+AFfEcxSHmroXescA54gDkCbmNR856Dw1gbB+7tH
 iLpg==
X-Gm-Message-State: AOAM5330FFV9V8DaERYrg/6sIqHzFowTajJfLeWX8t1g9vH3hdrZO/oG
 VwrgKfJqLbDCm255Vr68FaSThg==
X-Google-Smtp-Source: ABdhPJwTI+vyIE3XoWEXmRjqac2pQXo/EJJggPPT+7zHW9RC5FgXPZmbQ+pNeKCgtT0eTxqyFfyp2w==
X-Received: by 2002:a9d:171:0:b0:605:5788:10bc with SMTP id
 104-20020a9d0171000000b00605578810bcmr1964821otu.162.1650641944305; 
 Fri, 22 Apr 2022 08:39:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 123-20020a4a0181000000b00324a1217e96sm893775oor.35.2022.04.22.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:39:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AE1B1FFB7;
 Fri, 22 Apr 2022 16:39:01 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-28-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 27/60] target/arm: Make some more cpreg data static
 const
Date: Fri, 22 Apr 2022 16:38:53 +0100
In-reply-to: <20220417174426.711829-28-richard.henderson@linaro.org>
Message-ID: <87fsm5t9ey.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> These particular data structures are not modified at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

