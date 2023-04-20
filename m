Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9C6E9626
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:45:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUae-0001aP-UG; Thu, 20 Apr 2023 09:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUaU-0001Di-PQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:44:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUaT-0007Mq-8s
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:44:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a8-20020a05600c348800b003f17ddb04e3so1160019wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998275; x=1684590275;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ey1zoEPfiLo0i2FQ9w1Jv6z45AxJlyuPBTKHAlrxCu8=;
 b=Jg+SCxIyYVCOTBroSNozFsRugtb9rP2bBfdG4Fz2vEukirYH7q10MZoJsMA/iB8Hw0
 BVQ7DxIuX55y0vWr4p/6HS2f7m5ZFl60Ufvh/uiDTEAhedcC3IkIqNPCrqnaKSc8cE5L
 a6zDZLtuK+HMjmUBETOIZXQDJUafIQvpqq8PegDHurPRMsZhq2M/PdnRQw2DVn0NMcgf
 g0HcQUN+V4lGpDZf9rR/MJ5umSBF/ajo3mWVUv5LiBj0ObPq0Ud1lj/iFvFhkqz5iw26
 kWv5xphD86u7R1MsjBtRKVKjJ3OmofKDwbxTq1GDZOoHyYmuuFg6Vzrev8UM6z9WQOjc
 nqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998275; x=1684590275;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ey1zoEPfiLo0i2FQ9w1Jv6z45AxJlyuPBTKHAlrxCu8=;
 b=chXMpDSPihAoJGlLo5eEagnfppRO2ox9HbExMxPxeQv/eYh6q+ArLdWYBnTjTArrD3
 2gj+islRE38mI5UHZa+4hffYOzPFI7T+y7e7iAa7FOzOCFKD7Xws5HF5/nGzlC8VdEy2
 YdjA/Jbdc/sSzwLWg2Rk6vfJHjiXMMI7A75OSV514QAje99KwUMC1JITjP2kxpn8Vqr0
 0ML95ww7oqJ6HMz60rEw+kOjk1EMozK6pLO9VdyPCHj8CjeWLMXr+2pa50b09rgkY+Cy
 t2ytnv0ddhKP0xqPwEIbqaehJyWLtW/dunFjgrGD2nBbh3YxcK3D5C50TqrdDZ/KlRcB
 GXvg==
X-Gm-Message-State: AAQBX9cMWzrG/4YHo2ZoRsLumQQnCGrYNElkAo840X9Lkxp26eysg4CW
 su21pXyL0DVJp4j5I6M7qtqa9Va/pS84Ij8KarI=
X-Google-Smtp-Source: AKy350b7FpLd6yVrWtkTy9RhLEGYzmCJZyAjBXtr0eykGoqAXtTewK2q7s3f6BvRrZ/8Irg/ZBLwsw==
X-Received: by 2002:a05:600c:3799:b0:3f1:7277:eaa with SMTP id
 o25-20020a05600c379900b003f172770eaamr1332901wmr.31.1681998275446; 
 Thu, 20 Apr 2023 06:44:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm5373385wmp.36.2023.04.20.06.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:44:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABADE1FFB7;
 Thu, 20 Apr 2023 14:44:34 +0100 (BST)
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <135d716c2f1cdc125a3d44f5f6a0e67da13de744.1681993775.git.quic_mathbern@quicinc.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com
Subject: Re: [PATCH v2 RESEND 2/7] gdbstub: add test for untimely stop-reply
 packets
Date: Thu, 20 Apr 2023 14:44:11 +0100
In-reply-to: <135d716c2f1cdc125a3d44f5f6a0e67da13de744.1681993775.git.quic_mathbern@quicinc.com>
Message-ID: <87sfcud5x9.fsf@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> In the previous commit, we modified gdbstub.c to only send stop-reply
> packets as a response to GDB commands that accept it. Now, let's add a
> test for this intended behavior. Running this test before the fix from
> the previous commit fails as QEMU sends a stop-reply packet
> asynchronously, when GDB was in fact waiting an ACK.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Excellent work adding some more gdb testing ;-)

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

