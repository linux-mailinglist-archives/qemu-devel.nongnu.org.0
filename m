Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD81566E569
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqCh-0005Uz-Vw; Tue, 17 Jan 2023 12:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqCa-0005Mx-6w
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:56:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqCY-0006A6-L7
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:56:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5336314wmb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BB6VGsaW87gK1yOtfaMtA93CmQ0X021gLItAw2gYyHY=;
 b=vR0Dy1smY8vtGVXnVTV/TBEpIXRyTWRz5hDAs5XF86i02P43URJrkqkKvA2jvxf0k2
 zsi7grUbdMDAbEm/EzV07Jl0m/OzAO6qtZaBrpQ4VSOFxSG3bSlhHCl3vfd/DruXRjcW
 NK+BFJgfkmvaHcFgrXFG5kBTvrxz6Lg3gtamWBNAByJKFQt0IHuquDblX0DmnPmFVu7G
 5vNp85qh3K68eVkUSNNGI1xPgZbRCd3mKXsZi8efVMd/1Z502lIR9ZcGe3p+eVl8rNms
 41158OYPQaW/IcfrdPHCkm2BVhyq+RT84Bd9lpcrXEQJ9a8IToM2WxawwqMIuktUGGZM
 32Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BB6VGsaW87gK1yOtfaMtA93CmQ0X021gLItAw2gYyHY=;
 b=RueSZG+pljB3OsZO1x1D+N9jp2dUgLsDZlmJjfVVtPI04xlfBI8l9itpl/VGpIfF4r
 u2nFFhrlTr5mjm9+ZWdrmyAFvZxt2suiRFiqA89rpqyoeLanNy2JKGf93AdQPG/P2EeO
 IsFIO/ety0W2NVad89ZzAdO2joAOp8GosZFDPxW5j2FdF6ctUKXhhtFFOMzecfXbg82c
 XbDPWbxYmRnpokrx7ktdT3rNlRJf18aCqIgz25mEHDGsX/VfueljW/CY05xeHU3r9C0y
 kBntZSyt52eT8oQZl+CUdIXrLgzC/dnBN4F0h4XyTlMOdGsn6EV90ll9pX6YKCrtq8Br
 KC+A==
X-Gm-Message-State: AFqh2kr2u4760Kd7/l3NFsXPvju6t0XSjkrgM5/75Ik/LBnjwtRGoJ5L
 cSME4YWjc2N/sWweXlQTSsJ0SQ==
X-Google-Smtp-Source: AMrXdXuW4fddL58988iljASNzeHo78HYriDBgRTDbaNpWEBs+VVM1TW6XdgSu4qAosiUWk2VNcTbKQ==
X-Received: by 2002:a05:600c:34ce:b0:3db:25f:be9e with SMTP id
 d14-20020a05600c34ce00b003db025fbe9emr3868302wmq.33.1673978209148; 
 Tue, 17 Jan 2023 09:56:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ja3-20020a05600c556300b003db06224953sm3476980wmb.41.2023.01.17.09.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:56:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62AFE1FFB7;
 Tue, 17 Jan 2023 17:56:48 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 08/22] tcg: Split out tcg_out_goto_tb
Date: Tue, 17 Jan 2023 17:56:43 +0000
In-reply-to: <20230109014248.2894281-9-richard.henderson@linaro.org>
Message-ID: <87sfg92gf3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> The INDEX_op_goto_tb opcode needs no register allocation.
> Split out a dedicated helper function for it.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

