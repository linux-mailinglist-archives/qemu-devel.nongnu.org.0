Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B24500FC2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 15:49:05 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nezqK-0003C0-9t
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 09:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nezom-0001nz-FA
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 09:47:28 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nezol-0004Z7-2W
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 09:47:28 -0400
Received: by mail-ej1-x62d.google.com with SMTP id s18so10251955ejr.0
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=No4LJPGovvMgH8NH4Ifv7/OZLxTuVvPBQsg7diPdQZ0=;
 b=Fdqor0BDlOtZo9jBO98eNaCppGNLfeuy5mWmLw0K+xFtCot31qm3TrG+eYPEWguaJm
 JwRvEH+RSb6S0z+Gi4mzBnTGS/jP3IPxI2gje1B0KjdSRouO3cA/RT9aiNrbOJUhp0F8
 X85NOP5X44c6uSpY0OqQ1PXmUBNnbfOtFFTO2w4cPByhvN6VAtwUPcLsh7RkSBhnD9L9
 KzQAi0U4KoGVu1mKsBoj2jggcqOzjeLbXrx8MGHtFt9PB5gWn590vPALLtWhIbNj82lj
 rmEaWVf9Q8qb+rjN6BG0NIS6d3ruquqakPM7Bc0Thk7L40hrtCp/SJpPG9uJ66rGvRxA
 d6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=No4LJPGovvMgH8NH4Ifv7/OZLxTuVvPBQsg7diPdQZ0=;
 b=hpmlEQY0c/EE13tExKRih7qHXejrrc12nvM65u5bz2uMy0onaJ6CRysBPqIRhk4a/d
 AUzF410ITSta7zv8GAka6SF7PjxVoiAXa8mdFV9xD7lgsI/eIMP4fcHJnMboU0oz5eQq
 vpXOrAYfiHG+KWH/gvVD2y+iRkjNPfJRvK38wVmXZw2kL2d3MH0pbAJrPmdPaF7ghGBF
 NFqS10/PSt3vatwGGVs3CncjRytDh3CRhZQG3w6zIlPPjXHA526lebeT+PdJpfcHPCXF
 nN9YEge0Y223RlDGypPH6AHcz2TcRtcHbyO2J0Gh7KJs/UKFUBWpGMel6xmeaZBzo1u/
 2ifg==
X-Gm-Message-State: AOAM53007TJeJOrT265g7GfTq1jf5dLaBjSSpaSK8886oiT6bwj5kd+4
 OcRTwqFi4uqgn+6VVeAaXp2UGw==
X-Google-Smtp-Source: ABdhPJxCcDMSYsO8rI7OSDajOpJnk5qMmL07Vs9U9OwZQ1+wiTmwriMSsy99V/pTJkK0Q9A2NJ0b5A==
X-Received: by 2002:a17:906:3707:b0:6e8:6bfe:da0e with SMTP id
 d7-20020a170906370700b006e86bfeda0emr2467898ejc.78.1649944045841; 
 Thu, 14 Apr 2022 06:47:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm646125eje.173.2022.04.14.06.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 06:47:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AD8A1FFB7;
 Thu, 14 Apr 2022 14:47:24 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-24-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 15/39] target/nios2: Remove log_cpu_state from reset
Date: Thu, 14 Apr 2022 14:47:20 +0100
In-reply-to: <20220326132534.543738-24-richard.henderson@linaro.org>
Message-ID: <87sfqfwzdf.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This is redundant with the logging done in cpu_common_reset.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

