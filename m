Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20452370DCF
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:12:54 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEiC-0008RQ-Fp
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ldEfH-0006Qn-FQ; Sun, 02 May 2021 12:09:51 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ldEfF-0004Q1-L0; Sun, 02 May 2021 12:09:51 -0400
Received: by mail-yb1-xb30.google.com with SMTP id x131so4404092ybg.11;
 Sun, 02 May 2021 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7ZECMUoZhhvr78eYBIIHUZGf8qWL0mk8oC4kjQwvJk=;
 b=d0GzfX1onSqqnQKffVaTp3Upg7cOpwPp8bFkOnOpd6cHGDfVsrsM+Je7GwvJvbePw6
 IhyveRVIZMxHm3sX3w7G4flwAdUCFTuYRqJc93dhaSYT1XlTIGI7Fc9dVLRFr5qEwIOq
 153JUyeNdsO3oLxvbB2q7xQTMCNfGPlZI9A0viVz8h98ZP7g09XzfbqMvjbp+E49FryE
 kYYQXQLh/MiuRXS4sYCy4fXSy4mn63u6WWJyG0pOWfEsg5/9qNvyYCBV4FerXYG47/Aj
 3/VHVa1kkQRFkhDxy8UGPNxTUQSa83dPjbtlSRYi4g6NMk/LvnzGd9TB066rHgL8NIRs
 w2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7ZECMUoZhhvr78eYBIIHUZGf8qWL0mk8oC4kjQwvJk=;
 b=MUai6RKB9tChm1cOe9jq40l46c6teHdXCSNFEEfhL6h8i70V5eB8ox+fhiMwJRGFIu
 1HV06Y4xJPgm+a0/0/G1+g0+Aeh3w90PKlEBaJ2TFvPxtsoTdFZPRdIq0OOZDyTfiYuN
 9duls//pXyYyrSchCXv0jUsMO3DjzS1xA+i8SxdFkmd3sE+MH0MH6iAeprn9tDcvEx1A
 svOCMmGJe115s902pVMZvOw0ttLmx3vni2wYejihpIuAH33oCFYirgrMROIDbtjkdmV4
 mCV33ECifI/s81JFGI6/zmbDLfmjkZoI6ycGZxN/HoQUfAFZ1ir9Fwhj+p/LnyeV5nzq
 KRAg==
X-Gm-Message-State: AOAM532gx3N10DryWulSxdED1A7j/1ZZ6lLdGEWP5cNJF3CuJlkTReLN
 sn2wiLjbx92SP4oJp/AEvH56zCXX9IVh9j9Wdzc=
X-Google-Smtp-Source: ABdhPJxOUMvF7lwV7OPyp/A/MBXtMReiziBLe3WnTr8K38tJmOcJK5Xp65jyWZ2dKppy4jHs4KfTuaQDrLvf7J+3IKE=
X-Received: by 2002:a25:47c4:: with SMTP id
 u187mr21607852yba.306.1619971787617; 
 Sun, 02 May 2021 09:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210502160326.1196252-1-linux@roeck-us.net>
In-Reply-To: <20210502160326.1196252-1-linux@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 May 2021 00:09:36 +0800
Message-ID: <CAEUhbmWC_jVkrF9V=rs+A2A021ahqefimFtehsxgfvTxphwKZQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 12:03 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> If a PHY does not exist, attempts to read from it should return 0xffff.
> Otherwise the Linux kernel will believe that a PHY is there and select
> the non-existing PHY. This in turn will result in network errors later
> on since the real PHY is not selected or configured.
>
> Since reading from or writing to a non-existing PHY is not an emulation
> error, replace guest error messages with traces.
>
> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/net/imx_fec.c    | 8 +++-----
>  hw/net/trace-events | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index f03450c028..9c7035bc94 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -283,9 +283,8 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      uint32_t phy = reg / 32;
>
>      if (phy != s->phy_num) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
> -                      TYPE_IMX_FEC, __func__, phy);
> -        return 0;
> +        trace_imx_phy_read_num(phy, s->phy_num);
> +        return 0xffff;
>      }
>
>      reg %= 32;
> @@ -345,8 +344,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
>      uint32_t phy = reg / 32;
>
>      if (phy != s->phy_num) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
> -                      TYPE_IMX_FEC, __func__, phy);
> +        trace_imx_phy_write_num(phy, s->phy_num);
>          return;
>      }
>
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index baf25ffa7e..ee77238d9e 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -413,8 +413,10 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
>  i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
>
>  # imx_fec.c
> +imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"

nits: could we put this below imx_phy_read(), like you put
imx_phy_write_num after imx_phy_write?

>  imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
>  imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
> +imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
>  imx_phy_update_link(const char *s) "%s"
>  imx_phy_reset(void) ""
>  imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

