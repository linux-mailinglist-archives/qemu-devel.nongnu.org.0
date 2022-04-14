Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A55013CD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:21:57 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1IC-0006RZ-Ag
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Fk-00044s-3M
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:19:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Fh-00037o-40
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:19:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so3453417wms.0
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=alK/+d8aLbLgNTseBk8uqum31bO/WRsBvmRni65ykGQ=;
 b=PvuvLIR1ngy4SwhaIlYvrYRb+lmk/pMSBN7EVIPDGBP2jJxj5jYZePWgVhTPBZ4qWp
 C/b9NSK4ypWaHOkRVRMZFz2ta6fmo4o2a/UaVGBGmwKhSMy+vaOJ6KxVK7nJKeojWWy/
 85am/ZYB2AYhTDi08Ewffg1CbH6jxU/QQqBXsjNuc6FyMYWYtiT64BWnip8tWNvaEm/n
 +9VoejaeCE0TBronrf/KiZsPRVMEZs1xgEiVUCncYjEfXn8gNvqPfKZPbOLGDW6a+Hw0
 LQaHiWGSrkaw6kcz5A/Ga356eZknfR/y6R6oDg3BtUcNgutDH9a88TXCj6r+/7Lndjww
 K1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=alK/+d8aLbLgNTseBk8uqum31bO/WRsBvmRni65ykGQ=;
 b=OMfTVWDoGvbj4A40Swq2SshhghH9qtEslA5Jp/dJKr31HmwzEIqp2fgCvS2NU3RVGS
 YWCVLdcub1MOL0RNmKigZqCNdXd0QUzx6WrWQfvwVEH4WqOruqk0AVmzx3Apr4y/7zaU
 V6gORVio3oVlERpuNMEWHKSzSdBxspO7ec0c4w2W5SxojtVbFo1Ed3GN1aDADk77kTLr
 0HdvOYquswqvEIqoxVgJ0obbcpjvlHBPtOiR5dU8zPOh9CjVnQk6E2pYJjt2gGWHGmWZ
 dnYnb7AOMM8QCGZfh/LyzrjnzUJ4r2fG3XR52gnPfLLDnJWmF1ZaTqiSqTBClaYWCkWU
 RHiQ==
X-Gm-Message-State: AOAM530HSYeRJfPtSqVYtU58UkMjehvOxRGHmU3qTbsUBijs1Ikg4/Qy
 6qR/hcvxEFfFdJKI6x7+dajXrQ==
X-Google-Smtp-Source: ABdhPJwIjYcZjxsORdF/apo/jRe3GW5dLW88BSPwCuIyV9JgaIVaEQHJkwOrER2gJml1ti0sIEIpJQ==
X-Received: by 2002:a7b:c407:0:b0:38e:b5b5:116f with SMTP id
 k7-20020a7bc407000000b0038eb5b5116fmr3665049wmi.133.1649949558475; 
 Thu, 14 Apr 2022 08:19:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d584f000000b00204171ba528sm1906153wrf.109.2022.04.14.08.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:19:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1FAD1FFB7;
 Thu, 14 Apr 2022 16:19:16 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-42-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 33/39] util/log: Rename qemu_logfile to global_file
Date: Thu, 14 Apr 2022 16:19:10 +0100
In-reply-to: <20220326132534.543738-42-richard.henderson@linaro.org>
Message-ID: <87o813u1zf.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to emphasize this is the file-scope global variable.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

