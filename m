Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18474454B6F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:54:03 +0100 (CET)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOC9-0005xD-LP
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNx8-0004om-I7
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:38:30 -0500
Received: from [2a00:1450:4864:20::42f] (port=41768
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNx7-0000MH-7B
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:38:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a9so5856582wrr.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VQFQ038jdH/oC2CnellSUdw7imFiXXvh1PbS8yIQtx4=;
 b=QOEDhtrlci8wB9Z6Wj42Xkviu9aOiW/iMx6TEjTa+nPfOvbv+BqTUtvs5xWIVC2bcJ
 yY+vpf2bu+hnRB+bPlnVcufg4C7BBHRTW7rprl+V0DbyOvbQz/sZ6RAxUGGnKnz6kJr7
 1R8vtYXZ1mrItu/EVRQqiouDg1lAbM6aS2k0xK+DCG7uxPM3orTBaocacGGzOxjXVPXq
 WwWrGwZ90d8JFW8MipQBrufsOMl/xwgaXi9EEV9wvXleE4USBM66MTeDJXUv25J5ZfYW
 dyxo/fDvFBNncSZtFtQubnh3Anytv5WXsISatr0NWM7TMBPPw4Vr9afHLqKx7b/2HO9j
 FwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VQFQ038jdH/oC2CnellSUdw7imFiXXvh1PbS8yIQtx4=;
 b=w0c+eWzGtBpY7IECG1pt/nf/guSEX8DwNIkI/x1dUiDWpeHADVHs830jL/Sz0pSk1B
 mGFF7JxU/PHKat/Zgj27y7SGeaNqLMEnTJJTW/+gMd3tqjQ5zwykE+vOlADbWoVWphLl
 7Hc2Ttf6KWECw+q6SIvOkdlnJ3WhYTT1c4OHDcYlIO6quocEzD+tEhdcwE7bOkMTZ2tf
 wAF0Jc0jwE9jQND0azn5YwQiZibyp3hhUuTVJkPSUXgb10tCLZDpw7QBqUVI+6Ng2lwP
 Zxr92h9GF24/Wjly3pkaPbjkDT6Tn/dIlI0ShW9X8FgvRwiJnDIZRvtp1su068+Tjq75
 DTxA==
X-Gm-Message-State: AOAM5319BMRxuy2tL/6oa7gqBvNwPJnpQAxbRrM0GzDsB4qIt+sKre/Z
 bbGVdaTKAUMzvmGmjXzGD+OgWQ==
X-Google-Smtp-Source: ABdhPJwHErSrlHi/ngigRjJYgw6b3u9DUufZ7Jt7bZQeMiD8NdStGb4SZ/wZAfrazTLSrQqMeTjCGw==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr20912833wrf.410.1637167107917; 
 Wed, 17 Nov 2021 08:38:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s63sm65418wme.22.2021.11.17.08.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:38:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58D841FF96;
 Wed, 17 Nov 2021 16:38:26 +0000 (GMT)
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 03/17] linux-user/safe-syscall.inc.S: Move to
 common-user
Date: Wed, 17 Nov 2021 16:38:21 +0000
In-reply-to: <20211117160412.71563-4-richard.henderson@linaro.org>
Message-ID: <87r1bevit9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, imp@bsdimp.com,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> From: Warner Losh <imp@bsdimp.com>
>
> Move all the safe_syscall.inc.S files to common-user. They are almost
> identical between linux-user and bsd-user to re-use.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

