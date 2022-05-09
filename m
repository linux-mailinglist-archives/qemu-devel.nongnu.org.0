Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C551FFAB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:31:54 +0200 (CEST)
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4QT-0003sM-6g
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1no4Nw-0000j6-Qc; Mon, 09 May 2022 10:29:17 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1no4Nv-0002kT-8b; Mon, 09 May 2022 10:29:16 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v59so25234966ybi.12;
 Mon, 09 May 2022 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RuBBFR8VtoQkhvGrZ1ijCSi3k8LeTTivJB9g5aSB2fI=;
 b=bW4RrdZ/VeV5bpWyC0ffW31JYPzmrcccx8ZY2MGfYPYI6OsEsBsX8T2snaywLO2Srl
 Xzm4bFXMyLo8W3n9p2bZk7gtDDziKWuoJAutjc+m+qKrFJRagqn9J4MYSFIzfbEgSGyn
 PzJA14tkATEI/qdcmoZlqOd0ov/DBSyAuCcF+70eFxn406BjvSCDpfzHOBu4vH4UNDD1
 KsgRNpVzZpevbH2er+byKUtIzu0JQ2btI5EH60BNYPt0IQr7NZegBCwIXjppSsadTo7z
 c+0styn7q8vN41JX4oihCa6yeAZPEMjUPOAwqf/VxI4xYBcE3frrg3I9xoHTiLJEsAmd
 bc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RuBBFR8VtoQkhvGrZ1ijCSi3k8LeTTivJB9g5aSB2fI=;
 b=iNX5NDz5Pj+x4Xj3WC8eG0FXPkU/vZB/O5j8KEUKksb3Xwu9tF2omEDZvCfJhVK9zR
 rMMXXvasKk91fTs/PmaY3IIjgfpsWPeJxsmvgjSZk5l/6KEkHZCbpCIB16LQHftL3jct
 VTSMBULvajETVjQkaUFohHC0teRdQIu/mGpzWg59ts/TfgDXOLX1pgluKh753DXf+ItA
 QtsxiQ+EdUKg5wqPnqo0usOH2oZ+Fd+3jDAwUt4qiv/OmNf1PYP6I8tjQ92VEypbojpG
 /8hmWYNqE5J48TBOEPS+OS57NSINUIXQAItDosPkVljSImRqOL00MJYbT0M9NmBLYwCz
 AneQ==
X-Gm-Message-State: AOAM53310VkxpYB88ltPlaeOWvzOQMEcrekxWM/8FL9mJzEmC4iNyDee
 tCFS+MNzwCzbb7w0Ap+eBCASNlYZ82jUr+4H8sg=
X-Google-Smtp-Source: ABdhPJxIbej8RYrk+p/nrCRW5Mxq84jdOfg7QjbOhVk9VEsKcgymDms9noPG8E2yFVbF0419xN+i/JiLl3TLdDREutw=
X-Received: by 2002:a25:4944:0:b0:648:a796:a2 with SMTP id
 w65-20020a254944000000b00648a79600a2mr14207147yba.123.1652106553576; 
 Mon, 09 May 2022 07:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 May 2022 22:29:02 +0800
Message-ID: <CAEUhbmVfREvoi57nexHtPY59ieP3=Tk-73TG81pX7PXGwb0OeQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD
 spec v3.01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 10:13 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> CMD19 (SEND_TUNING_BLOCK) and CMD23 (SET_BLOCK_COUNT) were
> added in the Physical SD spec v3.01. When earlier spec version

nits: it should be spec v3.00, despite the fact that in QEMU we have
been using a name v3.01 to indicate v3.00.

> is requested, we should return ILLEGAL.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 8e6fa09151..7e3bb12b1a 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1263,7 +1263,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>
>      case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
>          if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> -            break;
> +            goto bad_cmd;
>          }
>          if (sd->state =3D=3D sd_transfer_state) {
>              sd->state =3D sd_sendingdata_state;
> @@ -1274,7 +1274,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>
>      case 23:    /* CMD23: SET_BLOCK_COUNT */
>          if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> -            break;
> +            goto bad_cmd;
>          }
>          switch (sd->state) {
>          case sd_transfer_state:
> --

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

