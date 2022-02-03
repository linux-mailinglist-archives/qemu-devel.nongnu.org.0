Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2A4A8281
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:41:25 +0100 (CET)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZYI-0000OG-EW
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:41:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZQX-0005uc-6N
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:33:21 -0500
Received: from [2a00:1450:4864:20::62f] (port=42992
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZQV-0007S8-6z
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:33:20 -0500
Received: by mail-ej1-x62f.google.com with SMTP id m4so7256079ejb.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KgNxCIEDBi9hi+Qq1x1b22NhFb04/1UdByFEOkgC6Ho=;
 b=Sji8PE9dIVlAhtfGRJ+ZHOOBrkqSqs1P0ndfbjMrZEQu3XL/WiKNBg2VTVX/wrFoyE
 w+9hleDkDuhRzWeg8jAW3yS45jiAUtjB8sktb6BMxpaodARDrZHUoJDdf2IM+NhCedVn
 77r+1M/NaI6QKDa5bRYGwmggNj8UmMrQI0uEsYKrp7u8se+YXNkwzBRzOcw/ODV77JMr
 H6L8lwiNnfdTZ0E0Vwpl8YzeapDFYmPhlj97KiQhbuAN7DrrDMDLI0oMTaHWKV49t+ba
 oit2Rd4LLRTLfuY3KDOZQ/fjvhpRSrmRyuU10bbkOUNM13NBmT8e0DQ73BPWAq1AMG7F
 TsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KgNxCIEDBi9hi+Qq1x1b22NhFb04/1UdByFEOkgC6Ho=;
 b=uKhvME+uRdZ2JQm0IX5ybBA3mMAXtOWmzYaw+hUnAYIsEJuDfmAubLZTAzelR2qRy5
 ItLJh80a/eZ2oMG6BmKOunhQvB5EiaQIzSwwP+Lrk4CYnYz/D2gUPJrYIW5PCxdMcpBH
 749oZTHO/QpIjPeiUGh+cvG+sIQMyoySF8sCDPk3WRIEwTv0Knqt9sYcmX9X8Pl71Cc/
 8IKes4dr2LuvL7jTpquwDNueA3ltUQTSQof7FXvDPnvGhFHJ+MTQx8fl2luNOrCPq1Tk
 YNgY92/Md4tv+ksWThGjrn/JnaEaeOZ34sRPH/EHkxqSeJzFyVVu+q2uY49KqfFxr6HJ
 Ru/A==
X-Gm-Message-State: AOAM533XVbqjkp0m9dk+TzfDk25d6JM5ZE++Z5bZT1wpQ+YSMPR7Ak6D
 ENH0A4KWpfiYTa9K4UUBv1w3PnqVk/R2Bw==
X-Google-Smtp-Source: ABdhPJzjQ7e5lfKJOZVXr9Ltliu5f55jyyF2XsNqICNYFP6kdabCb4ydBR8oRA3hJHfSNXLL5X0IXw==
X-Received: by 2002:a17:906:7948:: with SMTP id
 l8mr29463172ejo.752.1643884397090; 
 Thu, 03 Feb 2022 02:33:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v10sm21967537edx.36.2022.02.03.02.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:33:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D1741FFB7;
 Thu,  3 Feb 2022 10:33:15 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-15-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/20] tcg/i386: Expand vector word rotate as
 avx512vbmi2 shift-double
Date: Thu, 03 Feb 2022 10:32:30 +0000
In-reply-to: <20211218194250.247633-15-richard.henderson@linaro.org>
Message-ID: <877dacutn8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

> While there are no specific 16-bit rotate instructions, there
> are double-word shifts, which can perform the same operation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Even hackbox can't utilise these - maybe it's time to request a upgrade
for my dev box ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

