Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E72500FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 15:48:08 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nezpO-0002Jm-PE
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 09:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nezoX-0001QS-0A
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 09:47:13 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nezoS-0004YF-8w
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 09:47:12 -0400
Received: by mail-ej1-x62d.google.com with SMTP id l7so10191670ejn.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KX+uLkge4/8dxwGXXZEWkFsZDjrhV2xBinNdgDfcvYQ=;
 b=kjC41c+U2hCWRt7+UKMtvZ8iUTjeY5OmuftWtWYRSbSnDD0JuOAv+bWD81tUxSLKwC
 Slc6oL6L2KoqV56/5x8Ftgr2JEJrC/DCUfJDLMXWDqCbBxl99yAZnxsKofkrDnFBbJUC
 bsOZ+6+Je+J7MS5ihFCGsQP8UglCdSypPOQFUGNGBzTF0A8iCm7kscsMhkoFaJH9qToU
 qy8VLdnBxnQhumqtno5lD1QU8ROyP+6Cvn2FwUfu5mWFaMlcu6PzZ3cOEic6S9uW53tk
 L0MJJ+OCzoWC0AO8S3fQcaxbWiHO1y99eWUF8+XSkZYrURm71iM9MrWqu/kK6KR/KSPV
 m1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KX+uLkge4/8dxwGXXZEWkFsZDjrhV2xBinNdgDfcvYQ=;
 b=sYr37H1563DJmDMW+s5bnU80Hfog2jGvUak7LlCoidlWp/MyS8XdlJE8WFPlXsAJMo
 v1xigmheRS7fBpFWR9bJzQarEBVxB0uOe62KOm8FkeSRNRcXKsWEKbmKAb+9qq0h89dZ
 38qiE+NejfFKLBZNveX2GsdkZXWaGnhFB4YIKG0XRJm6l3rjjudpPJ6YBc3nuMxlJy12
 R79AlxUFeIDjHBMzY3oEF1eMh6Em/kxK9h1Ar8l/25ViH4DR4D4ReGUXl5EyaUQyT1Rg
 D0vbB4xA3FDjkYwh58tW1aFNeKNJM8LLfVxmhpTvmpUoMFhhUBacv+9E1pBzAFXlFcaT
 vMBA==
X-Gm-Message-State: AOAM530/XvCTviDaAj2yj2EZui/7lkE5h6Jgx7Cp7xY6XjKjFZ+Yxm6S
 IQ75oSKhmkNm0Swv+d69vAGLFw==
X-Google-Smtp-Source: ABdhPJywLCHyyWypoFUAs6G6KFWjF1FFT0tiHJgUlpj49qleX+KTNJNFRPo29F7HHy3NVDwdGWbI0A==
X-Received: by 2002:a17:907:980b:b0:6e8:b8a8:d045 with SMTP id
 ji11-20020a170907980b00b006e8b8a8d045mr2523438ejc.460.1649944026120; 
 Thu, 14 Apr 2022 06:47:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a50e14b000000b0041cd9288aedsm1039461edl.86.2022.04.14.06.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 06:47:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 321781FFB7;
 Thu, 14 Apr 2022 14:47:04 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-23-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 14/39] accel/tcg: Use cpu_dump_state between
 qemu_log_trylock/unlock
Date: Thu, 14 Apr 2022 14:46:59 +0100
In-reply-to: <20220326132534.543738-23-richard.henderson@linaro.org>
Message-ID: <87wnfrwzdz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Inside log_cpu_state, we perform qemu_log_trylock/unlock, which need
> not be done if we have already performed the lock beforehand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

