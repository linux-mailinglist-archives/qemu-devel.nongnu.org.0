Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969D4A8280
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:41:01 +0100 (CET)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZXv-0000F8-EO
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:40:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZRf-0006mM-Ds
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:34:31 -0500
Received: from [2a00:1450:4864:20::52c] (port=46049
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZRa-0007Zf-SY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:34:31 -0500
Received: by mail-ed1-x52c.google.com with SMTP id p7so4852315edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zf9gAbZhgTGEauCb61t2//fncU3qSMldqO8iv51NA9s=;
 b=N307MhizWYluor0KKpk7Saz0OQapK4d4EIWZiyvh1Em7Y0acYJ5eTBTyhaBrw7sFT9
 A4GwWRuG7SbdvLp9DhO3M6512aLWfU1ENYe6F69TnsC5ymYuwFpIKWVNlxSyTniqIfmI
 mAvg1zHxEry177U946zjKAraE+cn7kqJ2MEvmwn4D1NaHlC3upyJGbPY1A6w9cRJis4Q
 0u1SJ/IrNr2wUp8dS3RG7CAIl/eeOO6u5V6awSmDeCeFsazdFsGgsNKdMMV+GyqLwLP+
 JW61Vxy2ERlWTbuj8ir8UfaxuNSbyaiTfWisu/jJgk3phaVsEE2FPAgOp71W9TmgNmeG
 2D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zf9gAbZhgTGEauCb61t2//fncU3qSMldqO8iv51NA9s=;
 b=btBFx4gjcPEWpteH7UAuqubh6CI1rqRAQiOVJ0oJxD/2oRvbJ5fe/SpemKbeyBH3rL
 p/sigMNTxTry3DpM96HZPu7ik/c8nChk3ifWiSjNRz/1ZhN/wcR1e46ZD/ezp4gryU36
 EYlkvYZe+ELh7QViM0Tl+LXDKRqL1tzJQyBcCJ84pl8yUvrFcxHKQnK2WJ6/ZRD4701T
 4leNemqvQtyJmI3Er4WmgX9EzDHnkckAgZVb3pS/unn+rAVbc5AucuWYIwE97/gJyP6Q
 4UpFsTSFY8+Sar9J2LTk87BkIPXoITkf5KL+ZND5SWHyYs8GFR79PEQyV2SHPMBm8kEy
 WbnA==
X-Gm-Message-State: AOAM532+1AXsyfQd9tCvr23Uz7SHAF3YdHDOAyHiHmGE/EV+a5kbeJGu
 bSfNqeCufbCLC6t5oW6+I4eDSF++f2Ggng==
X-Google-Smtp-Source: ABdhPJxV2xdhzkzTDP22o0itIEWSMBRp9oncVqzZQxERLBzNNJF1bK9FKp8nP5BtrglJ1w4SWYCSbg==
X-Received: by 2002:a50:d757:: with SMTP id i23mr12941204edj.446.1643884464705; 
 Thu, 03 Feb 2022 02:34:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v23sm16920268ejy.178.2022.02.03.02.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:34:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F1AD1FFB7;
 Thu,  3 Feb 2022 10:34:23 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-16-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 15/20] tcg/i386: Remove rotls_vec from tcg_target_op_def
Date: Thu, 03 Feb 2022 10:34:17 +0000
In-reply-to: <20211218194250.247633-16-richard.henderson@linaro.org>
Message-ID: <8735l0utlc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There is no such instruction on x86, so we should
> not be pretending it has arguments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

