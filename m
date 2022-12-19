Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB6B651131
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:24:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jru-0002vI-SM; Mon, 19 Dec 2022 12:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jrt-0002tp-H4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:24:01 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jrs-0003Hy-28
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:24:01 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx10so9449172wrb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jrn5DGlt6SsT1SS1DGlTASrHEigcNPtm8vwlCoEL6+U=;
 b=SrfwOE+6j9cv6wW4RgH7Mj9PLmd/jEsrvxuMJbbKEVBey97Usl6fbjsLM8Eaf0oQ2e
 fohun4VakdBr+Jh0mKZHYEIVgRvRTla18VDiyDpZukoQpBkskDFzFocvy2XzNCMlM81I
 iNaHdCX3ryyMosqLM5H6mv1SZhXgY44uNDsezkrTSaeKvYk7oChk8nBJFG2keoLtG1sw
 eroElJDRQpJe5AKA+0btgxdhvCDlGdoE1rv1/RoXiWSFp+QVrmTMsnVancKuDcMXq1zu
 wHaW7OBHVdBUsYB+H1hiljZDqBMEhZ4i7EpTSxBQYBh0NAY8rca3xhJ4uSVjI5u3bu8p
 aorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jrn5DGlt6SsT1SS1DGlTASrHEigcNPtm8vwlCoEL6+U=;
 b=Ia1S8LSCVpV5kCXyaiALPDjngpmlhy2GVOOzY6bvuUtRakRJpZ+cDfgI0VxufyxCUU
 trFt24AKus8jS8sLcOqmLHVdGCvbAfSEzknOsJryhLlYT6O+yIa82izcvNZsIeW2AhQY
 MB8hqLchWuwVR5AGHy4XmlwkjZgP9l7+J86SoqNdsFVNqd1Ius6yhURBSx4m8A/6Ke6u
 OXB7rkBAd7iyBWoW5lvBXrKIgZ0nwGZnF90VP2YUv7vEy7doFIS5Kp0dgTH9rVmoVdBr
 t2uqGcyA0XKhWXtCkbqX6aQXnuQBs+1qYAIQC1rSuE72+bWmdVmuMn7XqDfVS3teCkbM
 +muQ==
X-Gm-Message-State: ANoB5pl6+Hsu8LtB7nNHMY7CIBzIECyRY0L0uTzEoFI1rteXT43vMSCj
 5DK+DKGWoE6bMEeELr693+frgQ6fQLzCzBTS
X-Google-Smtp-Source: AA0mqf6I+KIR92ZME5iSQHvKhc9Akfwfsu9KBze5sGR7fCO6CvGWkCJ2vhn9I/9lxl1Eiyh3yKBF1g==
X-Received: by 2002:a5d:4566:0:b0:242:782c:f397 with SMTP id
 a6-20020a5d4566000000b00242782cf397mr28915211wrc.25.1671470638025; 
 Mon, 19 Dec 2022 09:23:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002424b695f7esm10437486wrv.46.2022.12.19.09.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:23:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 009E31FFB7;
 Mon, 19 Dec 2022 17:23:57 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-19-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v4 18/27] accel/tcg/plugin: Avoid duplicate copy in
 copy_call
Date: Mon, 19 Dec 2022 17:23:51 +0000
In-reply-to: <20221213212541.1820840-19-richard.henderson@linaro.org>
Message-ID: <87cz8fjoib.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> We copied all of the arguments in copy_op_nocheck.
> We only need to replace the one argument that we change.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

