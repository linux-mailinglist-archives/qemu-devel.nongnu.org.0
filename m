Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE46EAB59
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:15:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqbB-000888-LB; Fri, 21 Apr 2023 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqb7-00087O-64
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:14:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqax-0000fv-Ro
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:14:43 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2vxx5bl8z67bjL;
 Fri, 21 Apr 2023 21:09:41 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:14:29 +0100
Date: Fri, 21 Apr 2023 14:14:28 +0100
To: Hao Zeng <zenghao@kylinos.cn>
CC: <qemu-devel@nongnu.org>, <fan.ni@samsung.com>, <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5] cxl-cdat:Fix open file not closed in ct3_load_cdat
Message-ID: <20230421141428.00006f44@huawei.com>
In-Reply-To: <20230413122358.3737557-1-zenghao@kylinos.cn>
References: <20230413122358.3737557-1-zenghao@kylinos.cn>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 13 Apr 2023 20:23:58 +0800
Hao Zeng <zenghao@kylinos.cn> wrote:

> Open file descriptor not closed in error paths. Fix by replace
> open coded handling of read of whole file into a buffer with
> g_file_get_contents()
>=20
> Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange implementation")
> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Jonathan Cameron via <qemu-devel@nongnu.org>
>=20
> ---
> ChangeLog:
>     v4-v5:
>         fixes some style issues and keep the protection after using g_fre=
e()
>     v3-v4:
>         Modify commit information,No code change.
>     v2->v3:
>         Submission of v3 on the basis of v2, based on Philippe Mathieu-Da=
ud=E9's suggestion
>         "Pointless bzero in g_malloc0, however this code would be
>          simplified using g_file_get_contents()."
>     v1->v2:
>         - Patch 1: No change in patch v1
>         - Patch 2: Fix the check on the return value of fread() in ct3_lo=
ad_cdat
> ---
>  hw/cxl/cxl-cdat.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index 137abd0992..dd69366797 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -110,29 +110,18 @@ static void ct3_load_cdat(CDATObject *cdat, Error *=
*errp)
>      g_autofree CDATEntry *cdat_st =3D NULL;
>      uint8_t sum =3D 0;
>      int num_ent;
> -    int i =3D 0, ent =3D 1, file_size =3D 0;
> +    int i =3D 0, ent =3D 1;
> +    gsize file_size =3D 0;
>      CDATSubHeader *hdr;
> -    FILE *fp =3D NULL;
> +    GError *error =3D NULL;
> =20
>      /* Read CDAT file and create its cache */
> -    fp =3D fopen(cdat->filename, "r");
> -    if (!fp) {
> -        error_setg(errp, "CDAT: Unable to open file");
> +    if (!g_file_get_contents(cdat->filename, (gchar **)&cdat->buf,
> +                             &file_size, &error)) {
> +        error_setg(errp, "CDAT: File read failed: %s", error->message);
> +        g_error_free(error);
>          return;
>      }
> -
> -    fseek(fp, 0, SEEK_END);
> -    file_size =3D ftell(fp);
> -    fseek(fp, 0, SEEK_SET);
> -    cdat->buf =3D g_malloc0(file_size);
> -
> -    if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> -        error_setg(errp, "CDAT: File read failed");
> -        return;
> -    }
> -
> -    fclose(fp);
> -
>      if (file_size < sizeof(CDATTableHeader)) {
>          error_setg(errp, "CDAT: File too short");
>          return;
> @@ -219,6 +208,6 @@ void cxl_doe_cdat_release(CXLComponentState *cxl_csta=
te)
>                                cdat->private);
>      }
>      if (cdat->buf) {

Check patch complains about this check being unnecessary. I'll drop the che=
ck
and then pick up this patch as a precusor to the other stuff Peter pointed =
out in this
area.

Thanks,

Jonathan


> -        free(cdat->buf);
> +        g_free(cdat->buf);
>      }
>  }


