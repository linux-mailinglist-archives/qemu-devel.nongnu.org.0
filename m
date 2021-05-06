Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A21374D7D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:24:27 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTgg-0006di-MZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTfd-0005kt-PE
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTfc-0007Rl-1B
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620267798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCZaueHjHzuRrmWYGlzhJxyAvv1JFj+NH62RnthUGtg=;
 b=J0AZ3Vy5pUMrYlAwZhyOheoQJDKXJ5xmkHhddnwxxUsdlXG6/ePm2cwhsESsmXnBrgxk0m
 WbnEmSzck8nFRKh+wv4gxI0MBzUlGKvm64GNg++ILYLJZVDiler8Oe1/vJY//sccJeXBBD
 FyMgNN3jlclANLkOQE9IDzlSdCk9ZlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Y4V5Tm2FPNK8xJ5i2cSJUw-1; Wed, 05 May 2021 22:23:13 -0400
X-MC-Unique: Y4V5Tm2FPNK8xJ5i2cSJUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06097107ACC7;
 Thu,  6 May 2021 02:23:12 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B30BE620DE;
 Thu,  6 May 2021 02:23:08 +0000 (UTC)
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210502160326.1196252-1-linux@roeck-us.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e4927ca2-af25-3fa9-629a-8cbc69c01f45@redhat.com>
Date: Thu, 6 May 2021 10:23:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502160326.1196252-1-linux@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/5/3 ÉÏÎç12:03, Guenter Roeck Ð´µÀ:
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


Applied.

Thanks


> ---
>   hw/net/imx_fec.c    | 8 +++-----
>   hw/net/trace-events | 2 ++
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index f03450c028..9c7035bc94 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -283,9 +283,8 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>       uint32_t phy = reg / 32;
>   
>       if (phy != s->phy_num) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
> -                      TYPE_IMX_FEC, __func__, phy);
> -        return 0;
> +        trace_imx_phy_read_num(phy, s->phy_num);
> +        return 0xffff;
>       }
>   
>       reg %= 32;
> @@ -345,8 +344,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
>       uint32_t phy = reg / 32;
>   
>       if (phy != s->phy_num) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
> -                      TYPE_IMX_FEC, __func__, phy);
> +        trace_imx_phy_write_num(phy, s->phy_num);
>           return;
>       }
>   
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index baf25ffa7e..ee77238d9e 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -413,8 +413,10 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
>   i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
>   
>   # imx_fec.c
> +imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
>   imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
>   imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
> +imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
>   imx_phy_update_link(const char *s) "%s"
>   imx_phy_reset(void) ""
>   imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"


