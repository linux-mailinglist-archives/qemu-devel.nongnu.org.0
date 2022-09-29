Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577D5EF688
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:28:49 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtap-0003DA-Hd
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrzR-0006WJ-CF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrzP-0001uD-T4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id c11so1744962wrp.11
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=qWXD0JLy9Gp9OnC74I1FaX0wTDQlyZJrmIUjoAvPndg=;
 b=WPkG8GEq09u9WbvpOKMBYPmZKrueOEggQV32rsBFY/eT/K34/ZJb62ixcqzWeXZVXg
 hfWeWoIcdLfHBJg1G2FXWewy8Jdctn3tBowzZtiYIAilAYCrGlbNhuXqGa3rkdPnKSDY
 OhrCBRQ08zHtt70VT8Xe6x4F6lZ+K2IZtfP+Tv8OwKDNWhKfT7zvNsnIkPo/Q9YCv6VV
 TS/Fcnz53iCN1NqJLhBwKzkpSyqFajJeD/ohp3rOMCl1KR9twP+izz/zksFUBpH3SJ48
 1OAAqS/pyzLkB1Yu9IG7ZCxLGSfHG3PqWPc/2a9PoVV6tiTBzuK6KaJ5sPi6ixDkctJ+
 H5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=qWXD0JLy9Gp9OnC74I1FaX0wTDQlyZJrmIUjoAvPndg=;
 b=1S/AB0HpWWurU/UkYk1XTpr3pFFUXMydhqgd/rSMc6spMcnKF9mxdWNaIcVxOSzb2/
 4CHfDX67lmQSNEr4lcHMvuVUNdZzXqoo/XSmM+rHiiYwRGc+/VgHQBZB2D1B7Qj29mz2
 9s1Yxp7SqyYdKXOiugV+QvPezeP7H9e39oB1FADA6AG/8SRMNyEGhYP8RWuQZXTNi8Im
 ccJJRiIuus2Vx6R+ARsag95wxIUoEDFMxbIrcHugtCEgDd2M48e5FH+Uh7G8KTpIFmRy
 IEPe4NVTl8o4p8+XsUPB2vEZLeOu/OYP2fOrwsgeC9voJOLWitgVbDWpqbM6pBUPGCWT
 uYJg==
X-Gm-Message-State: ACrzQf2rhXJKBI1eNla4+EG7hY+5ENeY+it8jnDILvKVbK51rtgXE+Rn
 M/HylU26CtEDysOXpyeoMYV3vg==
X-Google-Smtp-Source: AMsMyM6WaC8cpvfBy44AlSaN6gt05oZEmiImMKWo57ytPIgK5XZBaaGskFZZxHewV45ylpbd2jUNJg==
X-Received: by 2002:adf:e847:0:b0:22c:cef0:4fcf with SMTP id
 d7-20020adfe847000000b0022ccef04fcfmr1976184wrn.247.1664451961682; 
 Thu, 29 Sep 2022 04:46:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adff803000000b00228aea99efcsm3450335wrp.14.2022.09.29.04.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:46:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E0861FFB7;
 Thu, 29 Sep 2022 12:46:00 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 01/17] accel/tcg: Rename CPUIOTLBEntry to
 CPUTLBEntryFull
Date: Thu, 29 Sep 2022 12:45:54 +0100
In-reply-to: <20220925105124.82033-2-richard.henderson@linaro.org>
Message-ID: <87pmfe1k07.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This structure will shortly contain more than just
> data for accessing MMIO.  Rename the 'addr' member
> to 'xlat_section' to more clearly indicate its purpose.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

