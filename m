Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA0E6FC2DA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:33:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJi0-0006Tl-Rg; Tue, 09 May 2023 05:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1pwJhy-0006Tc-8x
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:32:34 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1pwJhv-0001iB-LE
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:32:34 -0400
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QFt9c5NFSzTkGN;
 Tue,  9 May 2023 17:27:48 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:32:24 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2507.023;
 Tue, 9 May 2023 17:32:24 +0800
To: Mauro Matteo Cascella <mcascell@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, "pizhenwei@bytedance.com"
 <pizhenwei@bytedance.com>, "taoym@zju.edu.cn" <taoym@zju.edu.cn>
Subject: RE: [PATCH v2] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Thread-Topic: [PATCH v2] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Thread-Index: AQHZgktdMleXQJZXSUqPNJQLcw0Hra9RrWRA
Date: Tue, 9 May 2023 09:32:24 +0000
Message-ID: <bc84fba1d2eb4bcd864e7de3fbc7bd7c@huawei.com>
References: <20230509075317.1132301-1-mcascell@redhat.com>
In-Reply-To: <20230509075317.1132301-1-mcascell@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=arei.gonglei@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "Gonglei (Arei)" <arei.gonglei@huawei.com>
From:  "Gonglei (Arei)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Mauro Matteo Cascella [mailto:mcascell@redhat.com]
> Sent: Tuesday, May 9, 2023 3:53 PM
> To: qemu-devel@nongnu.org
> Cc: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>;
> pizhenwei@bytedance.com; taoym@zju.edu.cn; mcascell@redhat.com
> Subject: [PATCH v2] virtio-crypto: fix NULL pointer dereference in
> virtio_crypto_free_request
>=20
> Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM
> algtype.
>=20
> Fixes: 0e660a6f90a ("crypto: Introduce RSA algorithm")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Yiming Tao <taoym@zju.edu.cn>
> ---
> v2:
> - updated 'Fixes:' tag
>=20
>  hw/virtio/virtio-crypto.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>


Regards,
-Gonglei

> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c index
> 2fe804510f..c729a1f79e 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -476,15 +476,17 @@ static void
> virtio_crypto_free_request(VirtIOCryptoReq *req)
>          size_t max_len;
>          CryptoDevBackendSymOpInfo *op_info =3D
> req->op_info.u.sym_op_info;
>=20
> -        max_len =3D op_info->iv_len +
> -                  op_info->aad_len +
> -                  op_info->src_len +
> -                  op_info->dst_len +
> -                  op_info->digest_result_len;
> -
> -        /* Zeroize and free request data structure */
> -        memset(op_info, 0, sizeof(*op_info) + max_len);
> -        g_free(op_info);
> +        if (op_info) {
> +            max_len =3D op_info->iv_len +
> +                      op_info->aad_len +
> +                      op_info->src_len +
> +                      op_info->dst_len +
> +                      op_info->digest_result_len;
> +
> +            /* Zeroize and free request data structure */
> +            memset(op_info, 0, sizeof(*op_info) + max_len);
> +            g_free(op_info);
> +        }
>      } else if (req->flags =3D=3D QCRYPTODEV_BACKEND_ALG_ASYM) {
>          CryptoDevBackendAsymOpInfo *op_info =3D
> req->op_info.u.asym_op_info;
>          if (op_info) {
> --
> 2.40.1


