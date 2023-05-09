Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A956FBC45
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 03:04:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwBkc-0005wn-V8; Mon, 08 May 2023 21:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1pwBkZ-0005wD-KT
 for qemu-devel@nongnu.org; Mon, 08 May 2023 21:02:43 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1pwBkX-0003Gm-2q
 for qemu-devel@nongnu.org; Mon, 08 May 2023 21:02:43 -0400
Received: from kwepemi100013.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QFfs74gFNzTjxv;
 Tue,  9 May 2023 08:57:47 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi100013.china.huawei.com (7.221.188.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 09:02:23 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2507.023;
 Tue, 9 May 2023 09:02:23 +0800
To: Mauro Matteo Cascella <mcascell@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, "pizhenwei@bytedance.com"
 <pizhenwei@bytedance.com>, "taoym@zju.edu.cn" <taoym@zju.edu.cn>
Subject: RE: [PATCH] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Thread-Topic: [PATCH] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Thread-Index: AQHZgb4Xn07N6c7VrEmQg3bODoBT969RHXIQ
Date: Tue, 9 May 2023 01:02:22 +0000
Message-ID: <f443c6c7ec2d4d2e88afeb586d5653ed@huawei.com>
References: <20230508150146.1092355-1-mcascell@redhat.com>
In-Reply-To: <20230508150146.1092355-1-mcascell@redhat.com>
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
> Sent: Monday, May 8, 2023 11:02 PM
> To: qemu-devel@nongnu.org
> Cc: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>;
> pizhenwei@bytedance.com; taoym@zju.edu.cn; mcascell@redhat.com
> Subject: [PATCH] virtio-crypto: fix NULL pointer dereference in
> virtio_crypto_free_request
>=20
> Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM
> algtype.
>=20
> Fixes: 02ed3e7c ("virtio-crypto: zeroize the key material before free")

I have to say the fixes is incorrect. The bug was introduced by commit 0e66=
0a6f90a, which
changed the semantic meaning of request-> flag.

Regards,
-Gonglei


