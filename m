Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E032354516D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:58:46 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKYX-0001Ca-Ve
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKIp-00021b-6A
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:42:31 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKIn-0003zv-NZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:42:30 -0400
Received: by mail-ed1-x534.google.com with SMTP id fd25so31772257edb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YvGW2u1USxNm6oeW7dVLXeCxIaGyX6dYDvr8wHwQ0gM=;
 b=w6G/RnDLbytPKg1m6tg1Sj+5EHAeYrwzPrORo0d0okYSyeSmrPz3ZvsC+Wqov+bBUc
 wm+UvfAEX1MXwLoSBTCdt9+mrw3bsA8k/0rFAOyVCwZCMxsZW8TpoaPVG/10i69diqaB
 n7XJ20fNG6awsa68vd3DSf5wZnszzNXejoWLqtVHuLJJuDUQ3KDh53fXdAagM7pytBs+
 +xPQFiRHP0gKnQQJgU0nyALSY2vZESj900zlCGTE15xpqgpMtkXXZut1XO9hzH7/tVOc
 C3hmlYaW6sKrLRa9uVkzJ2yYvClXu8LLUKE9xdrAUZjWhcIF7JJg9hi9AQuRrkOAGgDY
 JGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YvGW2u1USxNm6oeW7dVLXeCxIaGyX6dYDvr8wHwQ0gM=;
 b=Fcr+WZxKzL4zQDfFE9sry5aF79m+mVIcMXTllLC3TwRnDvDtcDxlzUifN777f+qHJ/
 jU/d9W7Vr2F8YCFUTXYtyyQOhQYeOMbv2Ch8CxFMjAVR31GfzQ3DNDG/6etfybP0X3DY
 A5WxeZssVT1o6RogQvnznaQ+EeyAsuxGYVGU2l4SDF4+dX29/we1zBFgwP8yjSyIVLuw
 2r2+DBZXBIc/wFp02teVTZeovZAQAnl4q5GOWO8YjedO4GtMSqErc7G1LnMDKWNl5uMS
 5lOu5SZz1Zb56Ab/iRd5i3mIBhvhrJnt71vFvmSR5R7q6/C5ZKV1j1h8yc/8R8MTuDdj
 PYVw==
X-Gm-Message-State: AOAM5307POkoKEBPl8CocwYnqgJWtqGEOQoPez2w2iv6fbVsSw+6sCHc
 OxCLXf3844PBiFMriDVfImu4VA==
X-Google-Smtp-Source: ABdhPJzvG52E0MPYxDQUSjn0UFBzSsYBvK+8gCk6G4GuuBhZZBUpuRPriOvECUE/IVOxpwn8E+XpuA==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id
 eb5-20020a0564020d0500b00425b5c8faebmr46209085edb.273.1654789348095; 
 Thu, 09 Jun 2022 08:42:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0070776750bc5sm10771552ejc.109.2022.06.09.08.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:42:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 096C61FFB7;
 Thu,  9 Jun 2022 16:42:26 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-14-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/53] semihosting: Return void from
 do_common_semihosting
Date: Thu, 09 Jun 2022 16:42:17 +0100
In-reply-to: <20220607204557.658541-14-richard.henderson@linaro.org>
Message-ID: <87o7z1sv1a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

> Perform the cleanup in the FIXME comment in common_semi_gdb_syscall.
> Do not modify guest registers until the syscall is complete,
> which in the gdbstub case is asynchronous.
>
> In the synchronous non-gdbstub case, use common_semi_set_ret
> to set the result.  Merge set_swi_errno into common_semi_cb.
> Rely on the latter for combined return value / errno setting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

