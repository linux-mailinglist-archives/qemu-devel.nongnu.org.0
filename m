Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EF472FD7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:55:43 +0100 (CET)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmju-0002O1-63
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmfg-00054f-TY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:51:20 -0500
Received: from [2a00:1450:4864:20::432] (port=41964
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmfd-0000or-78
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:51:20 -0500
Received: by mail-wr1-x432.google.com with SMTP id a9so27459271wrr.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=62p5M+vJ+96O0Z+TQy5jW4IRp+ah1LlPaLKA5q8J8M8=;
 b=pKT1jOEL5iE/1N8gkN8Kr668XWR4+FNsbU07a9QqhxReyJlWIrEUpnOUW2R34gUhty
 XhAdcz6fcCVpuMvLHctdpJj13LASSAky8pOYXFEjndnyupmE+DX0f3pyjNkXZHfQnnWy
 2C3rzCzoO3AR7sPmBpSo95VNBoMn6AdPURbgasqVfBruf1+MPCM3Xq0v7fFic+enGrRy
 dEsk0kE0anTKg1SYivUFjmDTuoQdmFx4ABAJjCB9VnOhuf06aMunhILIvHhmORoojCZf
 Nek0FNw9FiFWtQ7kaINvo/ud9fvCyVw8VqhqeKazSxtOtOG49rVfUqWVtLMFa2pQMMhB
 03cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=62p5M+vJ+96O0Z+TQy5jW4IRp+ah1LlPaLKA5q8J8M8=;
 b=breMexaD+n6XyaK+/Y8EKT060H/k+hSxYbT52BM7d7sm//RPoKmovd9rBEcca7lzJO
 bJ14fog+jsHytSBGA4cVVb3p2aOq0/UD9ns2lGMiqfdYipoH+0U9kfPUHqASvelljTX3
 J6XhT7RkFcoU/aV3Vq97ARtfOORFn1oiN/vXsxVD0rQl5g4ejAcysB0PibjYPojz1H7M
 OJK/NPlwmvQgQVq7dnwztZT1J5e9NYzGiqiYhIOA9X66yuMi9iiKBbbnGvojAF/n4kIF
 2jJgkoD2M2lBUVdIsGfgAY3HN0BHZAv6q2NuefMxmLWcH3/e44xir9hjc4jL/hzo7O/H
 2Jog==
X-Gm-Message-State: AOAM5319aktFkEgzRFnJsdbBmFrDzrLL7RAyUbvRcK1YJ12wc8YAFfcU
 Cgs5/WZGMXs66aAkPA6FFaj5Gth/93BSXA==
X-Google-Smtp-Source: ABdhPJzTMTpQiAP2F3h1Ar3sDN1vxyJIDvoXuN50Z3UXuUGRkNx9liEcUbq+2S7q+AmG/GqfkINujQ==
X-Received: by 2002:adf:d190:: with SMTP id v16mr32051513wrc.381.1639407074862; 
 Mon, 13 Dec 2021 06:51:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm12939431wrm.27.2021.12.13.06.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:51:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61FD31FF96;
 Mon, 13 Dec 2021 14:51:13 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-24-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 23/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
Date: Mon, 13 Dec 2021 14:51:08 +0000
In-reply-to: <20211211191135.1764649-24-peter.maydell@linaro.org>
Message-ID: <87ee6gk17i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix process_mapti() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

