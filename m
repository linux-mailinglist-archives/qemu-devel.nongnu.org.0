Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287058ED67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:34:32 +0200 (CEST)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlqx-00050y-L0
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYy-0002WL-Ue
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:57 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYx-0003lG-DJ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z2so19070290edc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=+q+ERS8rjfOPBxAx4nTIem17vcjkiLV6zynGbGqAoyo=;
 b=GP5VinQTS3bsDx88sRLRJxnbjHOINC1rmWTQQMnQe85enRJ5Mr/j/TMhZDbM9mQPBU
 uJ/o1diMLBQlodIGWHYOQn7akMyHz06MySsCCR1oGXPD2wF8WKu34gA0INOkVVfwPPlt
 2DoJKVpx1uGYR5Pd6tphnkrsjuPi0+rA+D0C9AXNwjfdd2sDP/hY/GfjVTucm8/X93aU
 ZS6nJMshSMqdD/2IDEGN+F/gks9KGh8qQKJhidSAU6yGSoMp9v1Xr2xc7Edxo5pjtVZw
 ZHOZUmcA7KMZTy401KI0Fc0gKAfKXKhlwMqAR/ywX2fr5HttYGvIBtpQP0jZTdeiOY2O
 xBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=+q+ERS8rjfOPBxAx4nTIem17vcjkiLV6zynGbGqAoyo=;
 b=XfTyettkXS7UKQKWlKHOzrlztz8faVSURGqfj3QybdyDQeOpnZlHQJNsXVm4/klt/V
 jf06BjBjwP7EQIn8G0Je9Z2tI10l4gYs4feoc/YblafBNn1BQvLTVi1IcpwEVU8SR5Rm
 AERjfKjPamLUlc1N1+MtzJ5wqLdStO36e03b6IBN9TAlq8NmkoDDP+OEV3cv668YWb99
 QBrCrYYV5FpymFbrJQkL2NeTLstHWmwNzAnY+p3KBLC/Rf4v0ZkcQq0ubbv8M+ws1Gke
 PB40FXnrm3WIUU5b55dhjhPW1mFE+fwPC6Rh4DqggqNoVM6+yDwBEQfpAxmoGa6MAAPY
 HCtg==
X-Gm-Message-State: ACgBeo31zH449YPB3GuieJIVvvB3Mlhza6xV0OkRWT+llSXSyHRPVtzQ
 hfDz4O2czHayaAFbvyrx5qIizJCPoh855Q==
X-Google-Smtp-Source: AA6agR6rcN/X6U/FxQvSRGkuQk7esjNfI4hw4P+KX+RUSM1pGnSAE7MR8pa8q0cI/UL0w/IBEqquFg==
X-Received: by 2002:a05:6402:22bc:b0:43d:73a7:370a with SMTP id
 cx28-20020a05640222bc00b0043d73a7370amr26460427edb.120.1660137354030; 
 Wed, 10 Aug 2022 06:15:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 mb11-20020a170906eb0b00b0072f4f4dc038sm2290796ejb.42.2022.08.10.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:15:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF0BF1FFB7;
 Wed, 10 Aug 2022 14:15:52 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-22-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 21/62] target/arm: Add is_secure parameter to
 get_phys_addr_v6
Date: Wed, 10 Aug 2022 14:15:49 +0100
In-reply-to: <20220703082419.770989-22-richard.henderson@linaro.org>
Message-ID: <87k07gkznb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from get_phys_addr_v6.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

