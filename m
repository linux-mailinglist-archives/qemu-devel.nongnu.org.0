Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DA6E9873
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:37:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWK3-0005YM-8V; Thu, 20 Apr 2023 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ppWK0-0005Wg-TE
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:35:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ppWJy-0001Ss-Ks
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=D0SpxB4nGyWoJGrBgRrB8G077hE5vPwsBeKqeUeVMYw=; b=SkR/WCA5g3yJ2Q5rWYtv8o7Tbc
 oZQLr8/RCc+T5RtDad08+qwF7WDeWN6p7pTg5OdlVI0x9SiFtUAhrrW1w6ZVT7zLQqNvgXIkYafEa
 xiTxfxGREzAPMGSrScvHr2o8lyg03Nj7zWW5F0mICJlRS6T4T4pLJ32OISO0TcM25Q3iS46Gnt1Ib
 mJ2p+78t0NhU3rMztvqi4zR+vIS9+iebJwf3m5e6YSFw89El7N0xZx4tbMXIqYS3GQUh3xQqstqZw
 inCUIiaTvPoMl2uDoDW3xvLeH66y+XGdBao8WFQadsgTHAKbq+DdC1cSa/ZhhBo37ZO6aiaV2HzKX
 P1M2fOl0x8WEZi0ExMWvjd2m5Y9S3lEcxTmow7Xqa0kwoE4kP+MqWJjHDNzUlkhDSU7IUcpKHSis7
 vWuLMRortKRKSw/qjcq+yeVAw4W+k9ypooiJaRDENl8QyHPlqtMYhTWU9nFTx5rtT6HTv1noPt0i2
 JyiOip/+MAuYV0Yb+PF4zEv0wbIvHLzn7Ms2S1iowuu0FhMpTKMgFNP2Agg8RB1z+IJhGvQPj+JWx
 0I9aBjlnsADMgFDjp2M2qX0bbabqhsxl8ledMUZN5k/SJ1V1iuotR4Xrmfn3k3UsbOg+Un+W7jTfl
 UEySFT0uQjx9IaYxjIyuiSN/AkZ/gmx3SSKJGXGzY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 09/10] hw/9pfs: use qemu_xxhash4
Date: Thu, 20 Apr 2023 17:35:33 +0200
Message-ID: <1860032.XFESxothFF@silver>
In-Reply-To: <20230420150009.1675181-10-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-10-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, April 20, 2023 5:00:08 PM CEST Alex Benn=E9e wrote:
> No need to pass zeros as we have helpers that do that for us.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  hw/9pfs/9p.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 9621ec1341..9bf502c45f 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -741,12 +741,12 @@ static VariLenAffix affixForIndex(uint64_t index)
>  /* creative abuse of tb_hash_func7, which is based on xxhash */

I guess this old comment could be dropped then.

Except of that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  static uint32_t qpp_hash(QppEntry e)
>  {
> -    return qemu_xxhash7(e.ino_prefix, e.dev, 0, 0, 0);
> +    return qemu_xxhash4(e.ino_prefix, e.dev);
>  }
> =20
>  static uint32_t qpf_hash(QpfEntry e)
>  {
> -    return qemu_xxhash7(e.ino, e.dev, 0, 0, 0);
> +    return qemu_xxhash4(e.ino, e.dev);
>  }
> =20
>  static bool qpd_cmp_func(const void *obj, const void *userp)
>=20




