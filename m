Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D060AEEB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:22:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omz29-0003xr-5R; Mon, 24 Oct 2022 11:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omz24-0003wH-DR
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:06:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omz1x-0004sn-IZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:06:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso3523990wmq.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKBlmP1gn414kLbAYcypSFuCk31HeTZlx3YficS8rWc=;
 b=EEUZHwkNGWQJJ+meL6MtZC6qwsn3mfpHqlUe2rkTkWCCEwsCLCB9ReEctnsVJD0Gta
 j1o4W7KZNN+7ZiFY+fhAoxJdreaB40xWJnfB7Wobnj/bveddhsfm67zVrAtdbp4RRHTq
 8KaAd0ye+m3AXshutR4c1jXh56+YrmtZzqnnqmMHV4fgVLT9Dux+ilCw73uWsqRT3SpY
 r22cCCna3cHf42A0DrKk1+Mg+YuFaj8P0C0X4u51qVcc+5bg0UYKy3L14LMYd2zSrfJ4
 /nIgAHaVRf/5BFhNmzRjcpZq1IA4B3UZI0VewGv4xJcVT35mRFM+G2LitiI0+O80wxMk
 8b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IKBlmP1gn414kLbAYcypSFuCk31HeTZlx3YficS8rWc=;
 b=3Y0OQYO+8Lu/orQa6zWzLXIBfGrTwDvGHx27zYbN9wLjatrrsJ+eBE3v1TnxNsZDwl
 kmDhVWs0+vnPVxmfcbdRjKQTFkvtK23bY3080iFc6fkupXjogZsfNdICSFxnOPmN/Don
 E2bAtpBoRgCPSvarqFkh5dojAYsATkkSY6OAHn1xxPTd1dA6quNphQKmJseECI7zj3Ov
 37qOj1P6Eog6DhdHv30K1Yyvbb6eZdqz9eb/nCulVn6NerKSpJBpwhjSrCedbZOht3i8
 S1/rRQYTOr1HAVr09UNMbY73SakYVYsAdE1o7M7MpLFWgqVE9IjJZO+diz+Tfn8ofmiV
 RzeQ==
X-Gm-Message-State: ACrzQf2/XB9vEcla9Y4IIY6O/kB9CU7LIOD83g9E2nYXqNttvpxz9cKn
 YLYJHTBenpFDLMUeWtmkLO47oQ==
X-Google-Smtp-Source: AMsMyM5+qpeKYaYq6PLrjKow2Qi9hsfrI4CaTASJfWqzWe9RrWr6o/0QV+SI+syt2WiRKiidSHUgew==
X-Received: by 2002:a1c:770f:0:b0:3c8:33ba:150f with SMTP id
 t15-20020a1c770f000000b003c833ba150fmr10937795wmi.194.1666623979019; 
 Mon, 24 Oct 2022 08:06:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003c6f1732f65sm9113380wmn.38.2022.10.24.08.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:06:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F6CF1FFB7;
 Mon, 24 Oct 2022 16:06:18 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 24 Oct 2022 16:06:13 +0100
In-reply-to: <20221024051851.3074715-11-richard.henderson@linaro.org>
Message-ID: <877d0p9s7p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Both GP and DBM are in the upper attribute block.
> Extend the computation of attrs to include them,
> then simplify the setting of guarded.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

