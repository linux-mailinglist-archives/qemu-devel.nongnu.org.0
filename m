Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC460BC5E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:41:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on58r-0003sB-5I; Mon, 24 Oct 2022 17:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1on58p-0003pO-1G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 17:37:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1on58n-0000JM-DF
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 17:37:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bu30so18089556wrb.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 14:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9M8sF9U94jzIUFQIp2DX9bx+NdVCz568aPkxO0ld7RU=;
 b=trvWxu0LLppqHB5no6alRopRTAqNRgJ5GTEMpMIWO1Hsg0MFIvvqHAmCt4Q46eu9c4
 7ztVGz/GWopEcmSQR3kKf8CdneW6WYoBT82fkZdXR4rk0v8WxCdWex4n/YSjtpjsCsR5
 EqWRlxEJJOvgqJ+LWF1FMVz/ez3yb+yl0Pe1s9WyNhq0sEFs5oSE+nkEZPKV9AGNsWjb
 qJF2XnZTNcUdShcX1DP6sG99ltyAGjF/T6H1hzAT/oJwjGVdgj8uDzJu46urBo/D9A9Y
 H9eg1wVONNrc+ZDHthbTAaIaoYfRe89CW1vI3gaki0FYv0H9UMxEMvlODTNIxdTxxD7K
 22iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9M8sF9U94jzIUFQIp2DX9bx+NdVCz568aPkxO0ld7RU=;
 b=0a/HdkTAuiUK9j8UygrGsvD8YB4Go4W47xX08F1Kho2uaRZ3FYNa7awksdb6Dsr+yv
 l7edqvqESG3B316pG4gCckzrMCc14fpV1ZMqu5YfrXJ9TY4WRKkf3aXEkAoz1ROFQWsE
 0rU86KuFfTMx9+VruIRbo6ffjAJkRh6qAofRTUAYGKGGnIsPc6rODU1MmU11n9CJNgM0
 uxT2Bi53XTFXEkyJNA+l951MipfjBz0Lio8gTzSQYKrLZheJQtcv2av45TAZg37osVFZ
 MNOoZ7ihbVivtG/0fbug3kJWCWTVAzPfM+ZtMqqC5GFdv33D5SZDCoVTW3ND/DBlvUFc
 U9ug==
X-Gm-Message-State: ACrzQf3WRz1Am/n633Kj81t/ltrnbiwKNpkNHd3WT7whPV+NQoQGvXzH
 29wm5ZZyaOwg3Uta53b26+QOFA==
X-Google-Smtp-Source: AMsMyM5DeNoJK5qFnnd4VintJq/gbdOuN3aQCs5hAxgQMTHTL+2Z3vKrbv1IOoLSz92vOjPQ/bapyw==
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr9264572wrn.89.1666647467442; 
 Mon, 24 Oct 2022 14:37:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b003c6c2ff7f25sm877068wmb.15.2022.10.24.14.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 14:37:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8965B1FFB7;
 Mon, 24 Oct 2022 22:37:46 +0100 (BST)
References: <20221024035341.2971123-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Date: Mon, 24 Oct 2022 22:37:40 +0100
In-reply-to: <20221024035341.2971123-1-richard.henderson@linaro.org>
Message-ID: <87y1t49a39.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> More closely follow the default linker script for nios2.
> This magically fixes a problem resolving .got relocs from
> the toolchain's libgcc.a.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

