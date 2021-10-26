Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF743B563
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:19:52 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOEx-0003H2-FV
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfO8V-0004bO-Sq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:13:11 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfO8U-0001NV-BL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:13:11 -0400
Received: by mail-lj1-x22b.google.com with SMTP id w23so15593354lje.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CBEBoqcxm6O2GI17G1DKmQbFsRcsRWR9gJxciAsnBfE=;
 b=EJLEewFzU/eDEq34o+5vlXhvIVBAuZwgOk1vQvvo0cTYZLtJ5erKodPDZSUEd1xy6H
 O+8vK4Q4Bt168THz0iud5dTTll8FFhOFfDaF27DWt/7JbvdAADMaBzkKJWyPZIIQd9P6
 XdCuHb5vhiZJT4CJ8Tljv0w0Ge1WV6QTb9IYUiaFOI6N2CmmJLxMaBX1cX7aZ4GOSfnm
 N8Vn+JbELGf4RIxI45NEGkiwcezEhZOTxDZeHEwHAcbkIcUJYRe91unGwQsKY1YOVSmR
 OGejyyl+dIoVNHMU3HoPTdl7jh16v7tmTyHPmeKzAJRBxSHEbBIrfNaKws9MaKPEjy02
 8IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CBEBoqcxm6O2GI17G1DKmQbFsRcsRWR9gJxciAsnBfE=;
 b=ImMuuwXiwXrzeXPCXCHWLuzWxA50dhjNPSQbtPCReaCiy+gjdicgjDL7kqyTaON9d7
 UfrrzsvxqdWCoo90Cv2iGaLXuaDhdV1m91Or0Y5wKgJ7Cc/veGukPw9+IE2SaxYhq9Lg
 3k5Dp5tnE4j+xkurI5b4Lssiu/Aii1i2p7Qlu7vmnYQt0v+xbl+6kYdex5MawEDPprzp
 Axl/mO1MUClxQE3CF7MCw2uzYFFIqpOKHDlCfScHDaGo7tGP+Fhgcj2JBt1sgwjzc+7q
 Zza4tg1dpkMCrChgbq1wfmlDrv2LdsxlHuHZFBZ71XrpQ42uBMhgCJYO9RPINEbwJyd1
 L+Yg==
X-Gm-Message-State: AOAM533RfoNCilg/SOOJJ1e9V4W9PK1BdRWJdLPTp+X6bscFDKcVZZ2x
 CRVon40dT7A9FzypXo5nCM4g7Q==
X-Google-Smtp-Source: ABdhPJzDDvkU1IQdqj3pzjhOrFD6SGdExBWlkZGS9x2PotRtqFz+mflksaJSrIr/Q2Ib3UyzWOmDSQ==
X-Received: by 2002:a05:651c:2328:: with SMTP id
 bi40mr26813042ljb.121.1635261188416; 
 Tue, 26 Oct 2021 08:13:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm2028050ljp.56.2021.10.26.08.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:13:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 917B41FF96;
 Tue, 26 Oct 2021 16:13:06 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-12-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/48] tcg/optimize: Return true from
 tcg_opt_gen_{mov,movi}
Date: Tue, 26 Oct 2021 16:13:02 +0100
In-reply-to: <20211021210539.825582-12-richard.henderson@linaro.org>
Message-ID: <87mtmv2519.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22b.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This will allow callers to tail call to these functions
> and return true indicating processing complete.
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

