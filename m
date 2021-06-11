Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D83A4169
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:46:55 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfck-0005TC-4x
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfbG-0004i1-D7
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:45:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfbE-0003A1-9a
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:45:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id z8so5732501wrp.12
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dRBXuylDRDBzkIyQEIrNMGrKetiQ22zipuWaVj+zm3I=;
 b=bRei+9WFlGvGmp5HqqJYScfo6W/LCHwa0+Uqr3UjYA3OKPF1uTa2lPudXDpgf7x9Ro
 2IlG3TZ7bro5JgnTh3VpUEsN5ssNsWZ+LzId0wQ7E+B3c/wyJyPna9FBFS7rgqA31FSz
 TsAqKjq6ld1HR72V86+jd9LGo1NQU8RFONNUBBZMz1dESPqnSKqurskvAeQ7iowUpnd1
 c5Jxxmwticz56tXauWiT8B+G9OjtfOUDw0SPkV8PIdYlG3MGYgri5gNx+5EvykGY50G4
 IK1WQtYxj0Xbm+eSjAZdnVDuY+CrQGugE3MntcOKtpqGlKEYhu33QryjsjEATBR2NqoH
 92eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dRBXuylDRDBzkIyQEIrNMGrKetiQ22zipuWaVj+zm3I=;
 b=eU/PIeWJkQeymJFv10gp8HZjmrw8PkjuLMKDU6hg2xhlugpPStRyNOzarJcosmgYQT
 b3Gezj2ln+HUBugJCOe5lKfjnZe7swpC5rbc+jdwfKqbPZFB0bKKrOBQNb7dzLSUI19d
 kLX8XhhhLqWZmnvYtbBKjj3kxAeJS58LedNgCaiCcW5dbXlrRKI8jf3N+iIBgCm+Kxpy
 qcHdudHHWMtMeS/6JIpuiOnAYI/TyJig+85/Py4y6ZkuNzbuP7hgpuNwND3HElp1KGup
 eV+JKzRjeXlpiuwtvCFnGVe3Xlcn21H0a4h2Kk7ey2EL5YMFqR9HRcCQoMMxBAccbeG5
 yC+w==
X-Gm-Message-State: AOAM533E6mTECyZXGehL68/uW4f3COJ/n0gNG8oO6V1HPuO5rWItnFZp
 x5n4CBmRsbE8ZNmlsWKqZkb1cg==
X-Google-Smtp-Source: ABdhPJyvsnVz31UNzo8CkL8nAwiYcsGKdiY9FesB5T9muuCQDV9jY8DdEj2Oc88dZ2i6hHObzG2Bxg==
X-Received: by 2002:adf:c393:: with SMTP id p19mr3685286wrf.92.1623411918757; 
 Fri, 11 Jun 2021 04:45:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b62sm5804846wmh.47.2021.06.11.04.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:45:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3916E1FF7E;
 Fri, 11 Jun 2021 12:45:17 +0100 (BST)
References: <20210607223812.110596-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] softfloat: Fix tp init in float32_exp2
Date: Fri, 11 Jun 2021 12:45:12 +0100
In-reply-to: <20210607223812.110596-1-richard.henderson@linaro.org>
Message-ID: <871r98iq0i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Typo in the conversion to FloatParts64.
>
> Fixes: 572c4d862ff2
> Fixes: Coverity CID 1457457
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

