Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74371472B50
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:26:48 +0100 (CET)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjTV-0001B6-Bn
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjQ8-0007zp-G3
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:23:06 -0500
Received: from [2a00:1450:4864:20::331] (port=39447
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjQ6-00083h-Ij
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:23:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso13750266wmr.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QLz5yXatlPalrxl/J0XJMgBTraRNlBAL8IABRk4xtKM=;
 b=QJRd/P39prN5mi8eStrFM/2fYclmtyHDWp1i6wZII+CI2iuUCSqfiLVLEGmR4II1lq
 BFsMyc5Sguaw29olG7o5PzCfr12Mq7ZDRcwXbvoXB9QMXOnSTMf0Iwys1Cf/ocisGWQ/
 BHE7/g2bbDx7oZ2y1uxeKR588C7hC3SO9za0LZXDFM8LGmUSTNICemKRG/tIcb3b2TKn
 fmWiIAHgOtMwdJt7w0jF9fdcpzxUmGe6xaFEwoafn2BOtBQzB6fzwtnx//SUvyJfagIX
 tYOTIe0/a4qnN/8ARz9vpuZPbwZAo14IF/ryjxTAM4ar+iWfE6RN8HonLxiDdPG/pTzd
 omaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QLz5yXatlPalrxl/J0XJMgBTraRNlBAL8IABRk4xtKM=;
 b=Atvi6bhS8ZACjVj7ys5YBOvQGSNm9osAhoytvDcABN3SrTWtG0MVFs8RpDah7TOm/z
 8tUzLxrZdepbQWp2Y5PwAuEOAWZ2lsBiNhrcUOWatzfHrc9Gz07V40uX2wiMJZLf4UMg
 2oJDCrdAu0Ei5fmwWXQa/S2rm1io3Fm55gGNaGs214oWz8Ei82CoJJ33h/+WbIb9sxe2
 /T9W+zzS6h5anWwhYLcx4NM0e/9QI/yyoP0HzUEzOQhHSxflUgeIWz13CjARDn/t3ZKp
 ETOJKHlMFvuiK8SGbilxuTMviA1VT3kVXGszbSQyNwRVvHirXUcUmCEt3lmHPAH0tJH2
 hpIA==
X-Gm-Message-State: AOAM531iwXlusw4nG3ELHexFZrZ4rm5BypJ+oNu9H9UqR/+VUVR8Qvc9
 dxMYki4F26a3mRKNHkHFs3ZRyg==
X-Google-Smtp-Source: ABdhPJydc/vEerrXSA7Z5GPSqfg/ZssdGjPls7ewP0duILyljPzwE+SYqC+2XKJYtoarzHmroQpX6w==
X-Received: by 2002:a7b:cd0b:: with SMTP id f11mr37240313wmj.3.1639394579579; 
 Mon, 13 Dec 2021 03:22:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm8037469wri.102.2021.12.13.03.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:22:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C69B1FF96;
 Mon, 13 Dec 2021 11:22:58 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-3-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds
 check on rdbase
Date: Mon, 13 Dec 2021 11:22:49 +0000
In-reply-to: <20211211191135.1764649-3-peter.maydell@linaro.org>
Message-ID: <871r2goijx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> The checks in the ITS on the rdbase values in guest commands are
> off-by-one: they permit the guest to pass us a value equal to
> s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
> meant the guest could cause us to index off the end of the
> s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
> would probably crash.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

