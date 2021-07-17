Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73473CC4E8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:35:22 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oDh-0003w7-Vu
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oCV-0002z6-4l
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:34:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oCT-0005Di-Oy
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:34:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so10105073wms.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PUFtdTSMkKCIMGo6J38ywrH5YtOHP6vsrJVMeK7ocos=;
 b=OERZrnntk8idAtSwl1m/Mpjw78T/kQmKfZ6XTUeStceFdGpp24BuGJLokk1cpL5+PW
 cBg1Zgl1azkmwfQHu7snMhX1JfOPgiyI/9RB729xFrMaJRkTNBcu0YsEuoJONWGxHya9
 gPoY3dgGMS83Fx+u4CuhfFapoizdL1ppq9/bukQwj8b+1Ip9whpGYARB+c/6//B6U8nk
 a6+5ept4lAkzQ+gv+fmU5E6ZJ7wrd+zOT7G1lrtZnLvsRmxcMuBteYOuyEwqNXAqz3kb
 2+HLTs+cRUOc+erNlXvV/uG98vtkq2CuSY37Ep7Cxz+OP0MwbEXY1Kqq2NCWEK3egO46
 m3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PUFtdTSMkKCIMGo6J38ywrH5YtOHP6vsrJVMeK7ocos=;
 b=jomtnrJciZTGqBt4gcsQmGGO5lYvzHbJLC7cPWrsvEOsCtWMqSRuFo+kNLBKRZSXgk
 zXmUwSsPv82s4I4+2mtiAou/lnjpMgTDfVlgWmfhDHRog7OU8v7Poi19C4UD81O8Wc/K
 gD9dF0Z2S4+uaF3y+KWr3/B3nSVT4cL0CAVZgaGyC9KjbjCUGrEf8PSNrOAWiACWhq6l
 nX+P4aMutAbMVFpV7HghMvrJI8mXMSkPHySBe6ZxNasquxU+cB3VjkbkVBDeENW9CH8P
 Yh6euR4alb0R4IG1+dnZiPi6asm7J9z6oexFdpynOpn8mq4OSzWVRpH3pevY/TusSk6v
 QKVg==
X-Gm-Message-State: AOAM530fHbefhwzY1l8oVTbegrsynS3+caaOOkdSRbI0shARM1CO0hi4
 yjniM8az+JBU5DbXi82lbuBvupFLSXmh8A==
X-Google-Smtp-Source: ABdhPJwJp+Oi1ufFx5YqDACu9jd5Ld68FyL8QOz7X+rb8wCnOtZIu0wIxnmbMgEvOnp9YFvUSPsx8Q==
X-Received: by 2002:a05:600c:4f12:: with SMTP id
 l18mr9801314wmq.22.1626543244255; 
 Sat, 17 Jul 2021 10:34:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e3sm14386401wra.15.2021.07.17.10.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:34:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65E8A1FF7E;
 Sat, 17 Jul 2021 18:34:00 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/10] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
Date: Sat, 17 Jul 2021 18:33:56 +0100
In-reply-to: <20210712154004.1410832-2-richard.henderson@linaro.org>
Message-ID: <87lf643kvr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The space reserved for CF_COUNT_MASK was overly large.
> Reduce to free up cflags bits and eliminate an extra test.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

