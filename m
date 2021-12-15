Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC9475A50
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:08:42 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUxV-0006DA-9J
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:08:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUQd-0005zM-Ck
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:34:44 -0500
Received: from [2a00:1450:4864:20::436] (port=40888
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUQY-0007Fu-9L
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:34:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id t9so38243571wrx.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tfh4w4VmxF2tBTWfo8JcZHoL8hs1ByaBmmcOZlUG6hc=;
 b=Q4Ianc6xYnmrkJN4LPCztCL7uBjaJfhLeJgPZX8up2T7gbZ4msgvLAJHVafo3+NLY0
 BZmMMIGqXBnCGimAxPOJclHiNRXQc78w5URtBlzlgpdveabLXiooGeR3nCiRu5+HhZzE
 9ILnrMo4T3xR9TTpA2XhnD9t4RpiUDlUlN0JU9erpNE8sXyODqZYfDLQ/RDgsWDa8YkM
 vv/He16+2NMZvF4kVH8HNOdVWglOmC4HIBft0ZTx8oF56KfGDwLVni2DDjsgwJcbHdSu
 Zc2NpXdG9Q9fZjPfhBebDCPNOQnDtiRU09qnsg4na2azNuri9vq1UUIHTcRMrHDa8hrO
 2xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tfh4w4VmxF2tBTWfo8JcZHoL8hs1ByaBmmcOZlUG6hc=;
 b=hPt0ihakAgOxpVgTHfLCi/dQ4KoqQMwP2LmWYT2dZLIlDaruBzSQ1lfAGa0ZRHd4ae
 6g7XmukA2aPhMwMZl+4N9MuSqC+UgtoctEw87BFmEe/T8RxtGR5zw9tfbGXMdmHVm2DS
 XkB03Pw6UVTyUOAxl2i4VqE77+v4kkTMmNXRCvJub2aitB0n7n732iTA3v5tmFlPeS7Z
 hFkoCDG+OhJcaXDgKGSe5FZC9LKaMXOufu25SRPJaTnFG95otEzy5me3AouYv19Pt4NS
 +wv6a37jcnMIE9qGRPRoLp81K4KG1XFXBSMp+oueTwQtclceunIFdpUAla1w2zv5bgDq
 zn8A==
X-Gm-Message-State: AOAM533kOxfSqfwibROQTy4JQFZ6e38mCqp6AL0iIDD1t5oBFveYKMaX
 97TAyEx4pmS76m2tTknvpsHRfmvIQ5btlm7zrMzx4w==
X-Google-Smtp-Source: ABdhPJyZVhInZz0Qg9a/K8X93JcyoAbPUmgsTHKFpYlHrgCERECjzupTFM83Dv0nQTSQzQI8NKdyA0kw0W0e8xxzVpA=
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr3751905wrx.2.1639575268558; 
 Wed, 15 Dec 2021 05:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20211215124312.254042-1-f4bug@amsat.org>
In-Reply-To: <20211215124312.254042-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 13:34:16 +0000
Message-ID: <CAFEAcA-LfKzk_S0PZp_awge+SoUM=TEeO6GS=XszTESfeV_wgg@mail.gmail.com>
Subject: Re: [PATCH] target/rx: Correctly set Error Summary bit in set_fpsw()
 helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 12:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> FIELD_DP32() does not update its first argument, so the Floating-Point
> Error Summary Flag (FS, summary of FV/FO/FZ/FU bits) is never updated
> to the Floating-Point Status Word (FPSW). Fix by assigning FIELD_DP32()
> returned value to env->fpsw.
>
> Fixes: 075d047e2bd ("target/rx: TCG helpers")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

