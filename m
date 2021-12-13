Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81955472CE9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:11:39 +0100 (CET)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwl7C-0008QR-Lg
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwl3x-0006lF-Sg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:08:23 -0500
Received: from [2a00:1450:4864:20::42f] (port=39900
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwl3m-00042I-Bn
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:08:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so26940462wrn.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+6llY0QMplisqvtvK7eGyD3RI6H6Od5dpW1DkbKAG2M=;
 b=y3mm6g/43kK55Nu+cnjNibeocxtwWQfeKqUESyECBuXeYdcu/xWXpnes7K27f6d3T/
 7tSEjenLQTd5YcOJ3vbASr4EKS2LRqQIGdBVQoRJ62G8sxV0OZrto0owQNF22lAW0OLt
 ymyE0SpBpbw4HpRS6Q+fafDffU3Kh/cMTeO3bRpoDfAziC2Hsp2FAXkjYiQyZgtNh1ms
 TqDG2gxgRX9WLdJFZq4pI3oH/BVFyDnEXYF7/q73RxhfsXH/hq1T+J9U0d4F43V0iU56
 W54p2/4LFOmTubjkSObbaMEEWMTs7VJNqZeoF0Gi29BTwsbZmAkqjWIix7lyjhQo0uKe
 L4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+6llY0QMplisqvtvK7eGyD3RI6H6Od5dpW1DkbKAG2M=;
 b=GGSnHVIIwqdARonnH1Er8dTthNXj5ilPdKVRVvpYn9deabJSq1cswYJb5k0ekGfvxp
 c0p2Mdws3q4z8DwwaactHJtWpOFzZyQLPHa1KdTF05IJf5G1I5h3y1ooLQumGuPZeaeG
 iwcce97wZaUAnTUYZ5sfUcBW0bTghzDBcmdUG+idcTb6/q+BtOj9PTJBYnquME1mAilA
 6u6P106S+YIM/MMm5SMu3NhRtV3sctMxwaogn4IDH1v06ykb2Q2oZFap5kl6XvK5Znbl
 oAqZZ7UjGbuZ00HhEKhvnr7M2aGLdlDNvH5wy6nWhSo2FkJOX2rc/w5Hge2chZ6slPWM
 Vbyg==
X-Gm-Message-State: AOAM531lo01R0IAl/LFeIshcUO6zIBGUC5K1VN+DDGNo5Yy54CBW3vSg
 +o7wxzx5hbCpEKd59gxtBT/OTA==
X-Google-Smtp-Source: ABdhPJwuVa1Dbjw0JQFab0C0u3ZZdXpYn5BoypfYIjXIvaIOzJyPFdT4+z4AVAWjmAGIkQysTuodgg==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr17023952wrp.699.1639400884864; 
 Mon, 13 Dec 2021 05:08:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e7sm13796742wrg.31.2021.12.13.05.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:08:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 873BC1FF96;
 Mon, 13 Dec 2021 13:08:03 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-13-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE
 RDBase field size
Date: Mon, 13 Dec 2021 13:07:58 +0000
In-reply-to: <20211211191135.1764649-13-peter.maydell@linaro.org>
Message-ID: <87pmq0lkjw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> The comment says that in our CTE format the RDBase field is 36 bits;
> in fact for us it is only 16 bits, because we use the RDBase format
> where it specifies a 16-bit CPU number. The code already uses
> RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
> to match it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

