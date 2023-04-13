Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601956E0C51
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:18:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuxA-0003RL-6e; Thu, 13 Apr 2023 07:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmux7-0003Qu-99
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:17:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmux4-00052j-H5
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:17:20 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pxxph1dYBz67GB6;
 Thu, 13 Apr 2023 19:16:12 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Apr
 2023 12:17:10 +0100
Date: Thu, 13 Apr 2023 12:17:08 +0100
To: Hao Zeng <zenghao@kylinos.cn>
CC: <fan.ni@samsung.com>, <qemu-devel@nongnu.org>, <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4] cxl-cdat:Fix open file not closed in ct3_load_cdat
Message-ID: <20230413121708.00005a43@Huawei.com>
In-Reply-To: <20230413093328.3689564-1-zenghao@kylinos.cn>
References: <20230413093328.3689564-1-zenghao@kylinos.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 13 Apr 2023 17:33:28 +0800
Hao Zeng <zenghao@kylinos.cn> wrote:

> opened file processor not closed,May cause file processor leaks

Patch description needs to say more on how this is fixed.
Perhaps something like:
"Open file descriptor not closed in error paths. Fix by replace
 open coded handling of read of whole file into a buffer with
 g_file_get_contents()"

Fixes tag is part of the tag block so blank line here

> Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange implementation")
>=20
An no blank line here.

> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> ---
> ChangeLog:
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
>  hw/cxl/cxl-cdat.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index 137abd0992..42c7c2031c 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -110,29 +110,17 @@ static void ct3_load_cdat(CDATObject *cdat, Error *=
*errp)
>      g_autofree CDATEntry *cdat_st =3D NULL;
>      uint8_t sum =3D 0;
>      int num_ent;
> -    int i =3D 0, ent =3D 1, file_size =3D 0;
> +    int i =3D 0, ent =3D 1;
> +    gsize file_size =3D 0;
>      CDATSubHeader *hdr;
> -    FILE *fp =3D NULL;
> -
> +    GError *error =3D NULL;

Blank line here.


>      /* Read CDAT file and create its cache */
> -    fp =3D fopen(cdat->filename, "r");
> -    if (!fp) {
> -        error_setg(errp, "CDAT: Unable to open file");
> -        return;
> -    }
> -
> -    fseek(fp, 0, SEEK_END);
> -    file_size =3D ftell(fp);
> -    fseek(fp, 0, SEEK_SET);
> -    cdat->buf =3D g_malloc0(file_size);
> -
> -    if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> -        error_setg(errp, "CDAT: File read failed");
> +    if (!g_file_get_contents(cdat->filename, (gchar **)&cdat->buf,
> +        &file_size, &error)) {

Align parameters with start of 'cdat' (just after the opening bracket)

> +        error_setg(errp, "CDAT: File read failed: %s", error->message);
> +        g_error_free(error);
>          return;
>      }
> -
> -    fclose(fp);
> -
>      if (file_size < sizeof(CDATTableHeader)) {
>          error_setg(errp, "CDAT: File too short");
>          return;
> @@ -218,7 +206,5 @@ void cxl_doe_cdat_release(CXLComponentState *cxl_csta=
te)
>          cdat->free_cdat_table(cdat->built_buf, cdat->built_buf_len,
>                                cdat->private);
>      }
> -    if (cdat->buf) {
> -        free(cdat->buf);
> -    }
> +    g_free(cdat->buf);

Keep the protection if moving to g_free().  Not all paths to this function =
allocate cdat->buf
Protection was not needed when the call was free() though.=20

I have a followup patch that will deal with the other issues Peter pointed =
out. I'll
send that once yours has been finalized.

Thanks,

Jonathan



>  }


