Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15AA6DF674
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:05:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pma90-0003ju-Ql; Wed, 12 Apr 2023 09:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pma8x-0003if-7g
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:04:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pma8u-00057p-4Y
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:04:10 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PxN9T3m2wz6H84D;
 Wed, 12 Apr 2023 21:00:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 14:02:51 +0100
Date: Wed, 12 Apr 2023 14:02:50 +0100
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Hao Zeng <zenghao@kylinos.cn>, <fan.ni@samsung.com>,
 <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 2/2] cxl-cdat:Fix the check on the return value of
 fread()
Message-ID: <20230412140250.00000d4a@Huawei.com>
In-Reply-To: <07ab950e-7ee4-2476-9032-4638fe6eed1f@linaro.org>
References: <20230412071633.2660412-1-zenghao@kylinos.cn>
 <20230412071633.2660412-3-zenghao@kylinos.cn>
 <07ab950e-7ee4-2476-9032-4638fe6eed1f@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

On Wed, 12 Apr 2023 12:02:47 +0200
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> On 12/4/23 09:16, Hao Zeng wrote:
> > The bug in this code (CID 1507822) is that the
> > check on the return value of fread() is wrong. fread()
> > returns the number of items read or written, so
> > checking for =3D=3D 0 only catches "no data read at all",
> > not "only read half the data".
> >=20
> > Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/cxl/cxl-cdat.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> > index ba7ed1aafd..130531a9cd 100644
> > --- a/hw/cxl/cxl-cdat.c
> > +++ b/hw/cxl/cxl-cdat.c
> > @@ -126,7 +126,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error *=
*errp)
> >       fseek(fp, 0, SEEK_SET);
> >       cdat->buf =3D g_malloc0(file_size); =20
>=20
> Pointless bzero in g_malloc0, however this code would be
> simplified using g_file_get_contents().

Agreed - switching this whole thing to g_file_get_contents()
will get rid of this code and be a lot simpler.
Perhaps just jump directly to that and note the two bugs that existed
in the code that is replaced?

Jonathan
=20

>=20
> >  =20
> > -    if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> > +    if (fread(cdat->buf, file_size, 1, fp) !=3D file_size) {
> >           error_setg(errp, "CDAT: File read failed");
> >           fclose(fp);
> >           return; =20
>=20


