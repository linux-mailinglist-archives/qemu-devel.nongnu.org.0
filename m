Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73A66E62F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqqS-0006N7-08; Tue, 17 Jan 2023 13:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqqO-0006Mp-SR
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:38:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqqN-0008PX-AE
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:38:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g10so22999470wmo.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9H4y0Bt2sXI9mL8arvA/aO2CDynRZefdfnh2/L4eq6g=;
 b=ZOTU1dxbqoO0yX9XCCxoZ1DqCbKuXH9HPnbicWFmeXsfn6nEA1zpGPOWSCvvpf6PvC
 3opzXF/M17hWMpdlUWR5CRSWyE8SypvB2s33eKt+sMCW4kudOqmnmq7f0LWCqr2yBJah
 qDrv1kkxHQP9Ch9Dj74gfraz5e3Z3y2M/6OnxRYwypU/4M8G46YvAx6c9ZYQD+07wKMl
 ACcYl9LMKAxhVHeINfIBFpZ+qQW4ibIymFrpec/O5Clz1ijelIENFqGkUbjr/SqBEq6s
 GOIGVmx8vgfM2dDAe5PVsVp76a/SaYvavkUey//RNIIfI5OqGHS+H+mxUQlgcXk18Xc/
 62VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9H4y0Bt2sXI9mL8arvA/aO2CDynRZefdfnh2/L4eq6g=;
 b=UbYhwpULoybFv1ktpHKaHim7OfKOJdHzBLaLk3i133/d2YMOqRarvHV79Ud8PkgIe9
 ugW8QcSH2b+CFut8t1X5XloI/b+5BLfqmBfXMGLaXdWaqdKLbA1EWbr1lV0Wr6Zc6LKl
 Rgc0voLLgnhDhXCFslptT4fC333px6R+EatK6qrzUOWkUPXWGIxGskzOFAohDC5AMtq7
 ggM+aODAG/ulYSoKYmd44zxW9K4E689FAQ4ycBWTt+PE5SskkMvXJo8Q0sET6ltwhFSp
 lZ6v5q9kcbNlga5Edd/b2Ep/9dDD0d4kun80aHNHao7ZU0xWo+cBbHJH/q1wmWj7CfAD
 znWw==
X-Gm-Message-State: AFqh2kpbKZkteINCKqzx+UQSYdEZnE9Px9HmfwqnF95I3TdTapAvj/dy
 sn3Xc7ohfiY6wUZqCTsg6H9Z8w==
X-Google-Smtp-Source: AMrXdXtyH7hhN9t9OvGRD+K/YTFRfwW3v10PcbGMvBoXiNkPUO3x7ea7xZ22TqFfYTypo848NQvKdw==
X-Received: by 2002:a05:600c:3ba5:b0:3da:ff66:e3cc with SMTP id
 n37-20020a05600c3ba500b003daff66e3ccmr3944581wms.21.1673980677270; 
 Tue, 17 Jan 2023 10:37:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003cfd4e6400csm40479799wmo.19.2023.01.17.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:37:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BAAD1FFB7;
 Tue, 17 Jan 2023 18:37:56 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-23-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 22/22] tcg/riscv: Implement direct branch for goto_tb
Date: Tue, 17 Jan 2023 18:37:51 +0000
In-reply-to: <20230109014248.2894281-23-richard.henderson@linaro.org>
Message-ID: <874jsp0zy3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> Now that tcg can handle direct and indirect goto_tb simultaneously,
> we can optimistically leave space for a direct branch and fall back
> to loading the pointer from the TB for an indirect branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

