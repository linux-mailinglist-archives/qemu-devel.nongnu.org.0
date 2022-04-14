Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B291501463
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:29:10 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1PA-0004fT-ME
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1NZ-0002da-IE
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:27:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1NX-0004fM-6r
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:27:29 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s25so6352154edi.13
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lRncShHb2t43YSXHCvUp6O0BxtKYe8S+jCTfdWPTimg=;
 b=b5HTULpiwK2CumL6pK2Q2vRlvOr1NR0Wh1oeDXRWAJJtewBoBFTDxii4voNcCMpviM
 zjKE5BsuwQk4PH3f9jWFIXJUKqtjJREQuHyY6brIFwpXxDQywsTCSQWWJQVJttqheMjy
 V5osgBH3+kTae97Pd2PBPh02lCLtkckHjySRG64mhF4w3fo994XVWzg7tP/tCHvybhfc
 1lsX400FXg/otPeTpA+7eYG2yI4dBm8G/+8GKr1Hy+AZnK8BUeRlkeCUsmwrYzBSx6wz
 ICmtHA/exLY6Pu+nWDHQ+aNtHHK0uO/dluE/J4vyPRz3PDadGl//VkXLcdMzjq8jGLs+
 sT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lRncShHb2t43YSXHCvUp6O0BxtKYe8S+jCTfdWPTimg=;
 b=j1q7lUtMnJ7Me4fOlwR4xD7WFAjUM7aO9IbZyT99kr/NQjLt1/MEwmHVpe2lvGg4Fv
 92RrjxEwwk4L8AIRuiO1UYOA18UXEqH7PVruc0MdqCcJ5Ieow33LrW2QywInTzacMeRr
 w1ps0RnRx1iyzNVOhHo53a93wpcXBxh0pfgHGi/V1T7cyqz5o818CRtqg+fDmiojI422
 M7erxl/8j3ZOGmUaoTy6kgpGoT9hU1KFkHGZ8+ZIDe28jmBuNM3xFlLCQ5SH3FQZTGVI
 CdGG6Mc+TNghtHRAJEnBFbhs4ziZQmkMaEX/gOSMr3PclfwmQhgMKV3eK/jXHsE3mQ2R
 ZqXg==
X-Gm-Message-State: AOAM533NA26Bg1T5tVokv4Bm71YnnQSWV+vZjZpUEVNZ88etc7pMP0rs
 Qkehnfzm7OhhJJ6JkfObj8qiAQ==
X-Google-Smtp-Source: ABdhPJyAnW+bs1pkXO7PBRDgYAhnGBbuwI2+cfUm2foEB5KH976YETLrZhjq05mrQs0nlG63gd1/UA==
X-Received: by 2002:a05:6402:27d1:b0:419:1b02:4a04 with SMTP id
 c17-20020a05640227d100b004191b024a04mr3547005ede.218.1649950045285; 
 Thu, 14 Apr 2022 08:27:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709061c1300b006e8843b0729sm714699ejg.76.2022.04.14.08.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:27:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 039861FFB7;
 Thu, 14 Apr 2022 16:27:24 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-46-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 37/39] util/log: Rename QemuLogFile to RCUCloseFILE
Date: Thu, 14 Apr 2022 16:27:17 +0100
In-reply-to: <20220326132534.543738-46-richard.henderson@linaro.org>
Message-ID: <877d7ru1lv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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

> s/QemuLogFile/RCUCloseFILE/
> s/qemu_logfile_free/rcu_close_file/
>
> Emphasize that this is only a carrier for passing a pointer
> to call_rcu for closing, and not the real logfile.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

