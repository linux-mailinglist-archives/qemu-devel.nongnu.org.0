Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5474536398
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 15:53:33 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuaPE-0008Jc-He
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 09:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuaND-0007Sv-U3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:51:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuaNC-0008HI-5p
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:51:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h11so2246794wrb.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=K3suzq6Hj6rKAH6pJMeSBCKhiNyLrktL87e4/i2EkLU=;
 b=e3MhwTI+OKMgcPMxXhGbjJ/skzpA2PbdBbMic/Fn4dIt7RFHa2p1AZa5ts2CjIH8U3
 s3xyGMFRtnlxq11WXU7+e58q4yLRDRD8CbSZF1+3FQeRDrcKmeYwaL4vi8+sAAvxuTps
 DLcD4uUJObUm70chG0oNIgszoCGX5uuUoEen0kK1vmWWVrkKz/yfvvdbvfQ8/MprbMXV
 u+oMI7rwmpDISSkGruaLj/fXXx9JLRldWlzA/JihCOpPvTbD/jkxBfF38bYtIgzoKsdH
 E/y9hDYV5YBqxe5EmKMfiYa8+jJIlFMNN47g/LPEjUfiLpgMuOaTO98Ap/paPfKknLUS
 h5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=K3suzq6Hj6rKAH6pJMeSBCKhiNyLrktL87e4/i2EkLU=;
 b=iCJ6Tnj0WlCFLFtr6u1Yi9QvC3tAM2peSBG2nwQEDhlEY3XrgqDHtH/Qj84tin2Ksh
 SXqXp97rs+mUQb6PQLno0QySCQ1JQUT+H8kCmaryPl9kVMU9bswnSEwyFR7JOZMLN4Wq
 xMHW6E58fW9BQhbYND9VuFPxSLSf6tnUhs+0d1ob7s/Rj9bKFrjfOjXIxOiKRJBNzWVE
 SEEUgpCn2ohdPPoMvlzLXz0KwMCsUvLdGIp2nTIIOe6uXweSxbFdImLF58IwJV4+Sty+
 cQnYUkzYdAYp5VWRbtScWLabrxGZsQA+SAM2UjY4aX9VqzwW6wc3VkSESliYHUkVMOWM
 36Vw==
X-Gm-Message-State: AOAM531diMmjq1Gh1X4Z0mDq0T20QuFbftVwlEEsCtxzy0XcchGCFBIZ
 ZwLgdR2aG7o43yE88MLK/EdnwQ==
X-Google-Smtp-Source: ABdhPJw1qILO4R/3VezPMy+PSTDvrWNrOjfq7dfkmhm72SHqKrmtYhfIkJzEqcq2Q8SQKwdjIA8dsA==
X-Received: by 2002:a5d:47ce:0:b0:20f:d6b5:4648 with SMTP id
 o14-20020a5d47ce000000b0020fd6b54648mr22578108wrc.73.1653659484519; 
 Fri, 27 May 2022 06:51:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0020fdc90aeabsm1767483wrt.82.2022.05.27.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 06:51:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9854F1FFB7;
 Fri, 27 May 2022 14:51:22 +0100 (BST)
References: <20220527101104.26679-1-gautamnagrawal@gmail.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gautam Agrawal <gautamnagrawal@gmail.com>
Cc: qemu-s390x@nongnu.org, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/s390x: Test overflow conditions
Date: Fri, 27 May 2022 14:51:18 +0100
In-reply-to: <20220527101104.26679-1-gautamnagrawal@gmail.com>
Message-ID: <87a6b3ytgl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gautam Agrawal <gautamnagrawal@gmail.com> writes:

> Add a test to check for overflow conditions in s390x.
> This patch is based on the following patches :
> * https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D5a2e67a691501
> * https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dfc6e0d0f2db51
>=20=20
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

