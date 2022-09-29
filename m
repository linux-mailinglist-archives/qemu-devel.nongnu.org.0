Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509085EF6F4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:55:14 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odu0J-0004aa-QL
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods04-0006dw-4T
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods01-0001xN-Fp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id e18so777079wmq.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=Ags1RstYaLpoQgSW1ZvQWVGttxLfjfivSvu2d7Asmmg=;
 b=lFwNZZrTQ2RQ46g1A/MMwf2I65eRttAO9++H9/CAnScHYp8n8luM1oG9BuYM28zvHD
 E5GcPRdL5iEpeMstRq4tJvr+j1/hXxgY5fradWUnhkSpJWFkDILnZiaNyNoxc/7rMTzN
 VfUj0oj/Aa259FqBUjIsRt05tquPbzjPBAkW/uXiEs+qhezG7yE4SLyffdqyblscCmmn
 Ax6oP9Vc0oRIcnmILLMGxT/iYsdTSDhIlwvybcABvy2hv4Be/6Euz/qI0kxkgiKTqQrE
 8DSonHtZjsHEAK2Iq/We6IU5WEj74+nBLynG27dqk5PTxBFP1ZNOKY5Z6FnoffxlmJXW
 JwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=Ags1RstYaLpoQgSW1ZvQWVGttxLfjfivSvu2d7Asmmg=;
 b=M72av31eSdr1MVbYY1Ggsg5b+4t7mZdgA7Jf0HZz3pwNYGLUQfe7QaneJd5z1UufhK
 wCCW+WEoRUaSVAz3VdEhv0G8vMdbbRmDb0hp4jmFY0eXJddKy96Ou75tuNSPMcoKkf1J
 0ahvTruSQ0pkKzru4lhiP6Gbjg4lwfqImDkYdd5CghoD+X6RU2iL0ODKIgf8yH0Zf00C
 P0YUHzlJdmhFIpaEgmS+KxmDXvrtps2ysvsEbUayt1fuLk1pjI9E9lT8FeReELtruTQu
 BXzL2wO77nR5x6eb13PYAtfzUs8tlf9oxZuk0QyNqjYFYf0xl36eCua19ScAjMgu4/Vm
 d3wQ==
X-Gm-Message-State: ACrzQf36nZv35mZLAk55+JNdFRArIPOwGoQavSEXTmWgUlJJgTA7c14J
 69fZ9wUgskkuV8Yx7NAFuv0hew==
X-Google-Smtp-Source: AMsMyM6ywyXU3tbv/nTNwxIumzLLFVUdWc9WEqFcoCwIX5IaxTsjN5l5wBgI+JfhKVVNUY3jFj4j1Q==
X-Received: by 2002:a05:600c:1d89:b0:3b4:7554:defb with SMTP id
 p9-20020a05600c1d8900b003b47554defbmr1867196wms.21.1664452000120; 
 Thu, 29 Sep 2022 04:46:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228dbf15072sm1925972wrx.62.2022.09.29.04.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:46:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C68391FFB7;
 Thu, 29 Sep 2022 12:46:38 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 02/17] accel/tcg: Drop addr member from SavedIOTLB
Date: Thu, 29 Sep 2022 12:46:34 +0100
In-reply-to: <20220925105124.82033-3-richard.henderson@linaro.org>
Message-ID: <87leq21jz5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This field is only written, not read; remove it.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

