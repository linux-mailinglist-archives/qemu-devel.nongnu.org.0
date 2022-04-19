Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E05069F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:23:49 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglxU-0007TU-VV
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglr6-0000Qw-Qy
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:17:17 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglr2-0003Ju-PE
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:17:11 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i27so32150700ejd.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+6hcLfYT0NwFssLM6I2quVoQUBUnFHm0iKeKLn3Zlt4=;
 b=j/M9w8CIMKjZkrdNLr0BfD6VFyz/zBTNSIz3bMwEsrnTCklgJzJA+7lR02qxM2gxIT
 mMzIQbTaAB5mb6WjCcE+bqDLC5tkMLRG+TwF55zJtSb28YnWrdOap9cBwJW39AHHL/iM
 89KkIekBYhEgSARfAtEeHb54OnsKhEqBHQXCUux+JcWWwkQX7mTAi+AQvqkzkDPpHYxY
 j5ePRkKrccMt7W8BxIftacUSdc0cKGckpqs7yOk75BU5u7Ul7GdE9NX3lYSyRCrZ2mXQ
 0kgI+4RtCP0ojkBMAg163oaDOkga+48qaOjpd7Gs4Z+zp5V7pmH8R/R7q7nOwYbs6/sb
 t2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+6hcLfYT0NwFssLM6I2quVoQUBUnFHm0iKeKLn3Zlt4=;
 b=5CHgC0nLT4Q37lSC5wPmHiw3DegWIcMGTxO+qx/t3TFlnVGEKNVmlvDkv901zcZufv
 0diLzR/BuMbuPOoK8tvps84kwBKP30SVqQefHIqSI3sNwJxC08kcS9FcbOMLwmj7UDj1
 5qKBMfBgK4Mn8Fy6FmUbvcvoi/ezsuGHG4U5LfXCRSmnOEykEA7EfIqK8IoU+F8v07VE
 y1J3wsHU3h53Pi4VfQap9RA6QD7Q2rH/eHeD+9Omxp9hO6DZEDg2VquhzQhAtQiW8a2d
 aUe+L/dhiW1OD3uU5UlNA7B7vj8KXnO1pgcg0Puotl6tuQ5F97tfbTcNSvsRITJGpz8z
 ArRQ==
X-Gm-Message-State: AOAM532MayjcrOhsVLXtuD3n+GLIoTojANklyNgNV/ZiFnMahiAysuod
 gCUBU49ehazSN6o8nVS6MyaujQ==
X-Google-Smtp-Source: ABdhPJxpoGGgyhu4eD5U4EL0yD6F/qk72Usg7mJBi9h0KhervaKZdZtiCVdglrGOwthR4B4YNdBxvw==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr13112531ejc.713.1650367025687; 
 Tue, 19 Apr 2022 04:17:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 cq24-20020a056402221800b00420ad7d2dd0sm8397686edb.29.2022.04.19.04.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:17:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C1891FFB7;
 Tue, 19 Apr 2022 12:17:04 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 05/60] target/arm: Change DisasContext.aarch64 to bool
Date: Tue, 19 Apr 2022 12:16:59 +0100
In-reply-to: <20220417174426.711829-6-richard.henderson@linaro.org>
Message-ID: <87pmldwcen.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

