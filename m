Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922D399D5C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:03:37 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojGK-0002ZW-5Z
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojE1-00080s-1R
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:01:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:47064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojDv-00077l-PM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:01:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h12-20020a05600c350cb029019fae7a26cdso3198730wmq.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NxYo3j1Hq/IU6wuz0W3aD0BUnZIP9GP9EcuIZx2Iqks=;
 b=ZsFaod33ncGBgbE3OIyM+loaB4BRnH5/TVNNH8tDvmjEVjGanAO5AI1vlqpTm4wvQp
 JWPJI44wzdZ1rNyDdhvaODBuIqhLM0Y0ievY0TN086VoldaZ2X2K7AJinXcIWoAtLrFX
 SDIwuTH4nnMQtHFuEaU80vPQq10S97YqOBkABBR7SCDWYYe1hdZ35r/d93AgKpMWXb9t
 nzE0D3I5jIOymp4g1V9NI+/f788gd1oIV67izRStgmBdZXmcFooJAIy+O1J7hVhPfQAg
 KZhzWTSblR6bGJ+SvAvSGws0F/TuLL6RelzTdF8riL4h754hKOCVQeHgdcVeFi/Dgfwg
 hJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NxYo3j1Hq/IU6wuz0W3aD0BUnZIP9GP9EcuIZx2Iqks=;
 b=DsUr/CrtUag/Uf/iNuH2MY/j+w4zuTUgdE523ffFZUSzEhF4Dfh42djYHp+VRs6XgC
 nLWwm2XAAMY2ldzj+JqnSoZnc/RYYDPDQvu/YwXtX1WJutZ1seKlsbSrAnZwSjqQBiEr
 /1KtkKhGfvg9InIl/7txKyG2LaOVXJkcZ4bNY+p1xmaPUPNDa/CKn1tnhWCqnfnHyQdX
 2WHsRTu7xVCjLAxJXapQCMynKmGGkNKnQT+NPLkCVwHDVqMn+1mqigRCUa2uC88U/kUP
 OnoQ9mDCQXwLEx21qL7e5fHsCM9dRDpmrUBpyd4OGl9hS+Tww7E5MHOP2Tw30Mm41sg5
 7oNg==
X-Gm-Message-State: AOAM530PqwP+aqLmXd/O5g14K6zax9y1OfgDQal/wP0uL5jaWi1duNQW
 ynZJHiraztAxCM1rWd0qJ/R26w==
X-Google-Smtp-Source: ABdhPJy2nOKXkRAAotEaDGFSHr2ejiovJysUdxU6NjculssinDsquqS/4FfSdv5XMMxfGOCRMFUJ5w==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr9154275wmi.66.1622710866158; 
 Thu, 03 Jun 2021 02:01:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm2912937wrc.42.2021.06.03.02.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:01:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79AEE1FF7E;
 Thu,  3 Jun 2021 10:01:04 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/28] softfloat: Move scalbn_decomposed to
 softfloat-parts.c.inc
Date: Thu, 03 Jun 2021 10:01:00 +0100
In-reply-to: <20210525150706.294968-7-richard.henderson@linaro.org>
Message-ID: <87r1hj9van.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_scalbn.
> Reimplement float128_scalbn with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

