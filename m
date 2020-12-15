Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8C2DAE19
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:38:53 +0100 (CET)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAXU-0004Zm-Gs
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAW8-00041Y-SG
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:37:28 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAW7-0003ev-4c
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:37:28 -0500
Received: by mail-ej1-x644.google.com with SMTP id ce23so27710865ejb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZD1lk/HdeUfig3u19uZtakYcAZnjy5AfMijIuvr9g7M=;
 b=NVnDxyIPttUd74kdKMjQWTQ1ZFmR9CxTN9jlAodn1w9Wr5WQjjMYshq+hPJpztgwGQ
 ZLZ6kVAWq6443qPwWwraAcWC+T5l1CVzMR+u+F5t33ayCEIoeSyBW1lJuHbiz4iEvx6K
 uDjVQuQj4fuOy/fI7V2JHa3HhiYvbd6H7vwFeAyPSpOZFArLlaQXY2oa6wUKvconPrBB
 mKEmY22OLhchZitaPT7bwcJOC6BW9MqS/5oluKQPSMc2LSI3mwzS72BmJ34fAjGi0cZo
 FBw3pWXOeIinKJ2UoxdiNav+Pv31SSCJizteBeKbLxD+d4fIhF5/nAaqTkDDFXLOg2SM
 EEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZD1lk/HdeUfig3u19uZtakYcAZnjy5AfMijIuvr9g7M=;
 b=ImPJQ1ZmcGDTY5k6b1Tc9LO6NL1vYPm44+uODnJ6NsdxgdcNf463doeTb1jPRi+7vp
 XUjIqXVmfsen5sgo1Gr9z/uQpo17ihdYwTbU9MszD+QxLSuyA5usnwLdwTXks0CIGK3k
 S7txVeCcQhMBD0Jlt+hk8VZ2Uqg93Nc31reJUPg7HsrhGK3MSZHWKWmAzE/kBQg9OqCi
 +9bemaxWyrWO4yrn042Zx8ji9kaQ2q32mAcC+8DOl2To3FpfTR1gk2lyarQcIL+8xefp
 6qc2xucs9MkugNeFH4b80zC376+FiuzT9K3+ZTtbFn2hM732wojHC8BB80K5QDM6E5/G
 q3Hg==
X-Gm-Message-State: AOAM531dUM5enw0XydSd7ya8oDTfSRujKxFLdcsiEYAdZeQKNXXuXNeT
 lJWtbHvGbolJKt03zY8i7RK2zP2YstJj14msYoRfcg==
X-Google-Smtp-Source: ABdhPJwiFxkbpv2x5YxEfKn7sbVP/GrNmX2se82nALonsGtJBkFEmbJelZqbIZxlD2SgZU5EQMw2fiLeUeAYfMSVmQk=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr26310070ejd.382.1608039445514; 
 Tue, 15 Dec 2020 05:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20201210141610.884600-1-f4bug@amsat.org>
In-Reply-To: <20201210141610.884600-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 13:37:14 +0000
Message-ID: <CAFEAcA_zcbw-8G0dOiRAAv-bsPV_M3_E-x3mtcLgkvDjYEEfSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 14:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Malicious user can set the feedback divisor for the PLLs
> to zero, triggering a floating-point exception (SIGFPE).
>
> As the datasheet [*] is not clear how hardware behaves
> when these bits are zeroes, use the maximum divisor
> possible (128) to avoid the software FPE.
>
> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>     B.28 System Level Control Registers (slcr)
>     -> "Register (slcr) ARM_PLL_CTRL"
>     25.10.4 PLLs
>     -> "Software-Controlled PLL Update"
>
> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM

