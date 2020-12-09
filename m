Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7612D3BC7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 08:00:27 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmtSc-0002pW-5J
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 02:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kmtR8-0002FT-2g; Wed, 09 Dec 2020 01:58:54 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kmtR5-0001mj-1h; Wed, 09 Dec 2020 01:58:53 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CrSYN5DNSz5245;
 Wed,  9 Dec 2020 14:58:00 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 9 Dec 2020 14:58:41 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.162]) by
 dggemm422-hub.china.huawei.com ([169.254.138.104]) with mapi id
 14.03.0487.000; Wed, 9 Dec 2020 14:58:35 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: zhukeqian <zhukeqian1@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, "Eduardo
 Habkost" <ehabkost@redhat.com>
Subject: RE: [PATCH] bugfix: hostmem: Free host_nodes list right after visited
Thread-Topic: [PATCH] bugfix: hostmem: Free host_nodes list right after visited
Thread-Index: AQHWzdb2bpPhpoOZ/kejtTT+18xBT6nuSzDg
Date: Wed, 9 Dec 2020 06:58:35 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BADE9F8@dggemm531-mbx.china.huawei.com>
References: <20201209025648.23068-1-zhukeqian1@huawei.com>
In-Reply-To: <20201209025648.23068-1-zhukeqian1@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: zhukeqian
> Sent: Wednesday, December 9, 2020 10:57 AM
> To: Peter Maydell <peter.maydell@linaro.org>; Igor Mammedov
> <imammedo@redhat.com>; Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; Chenqun (kuhn)
> <kuhn.chenqun@huawei.com>; Chenzhendong (alex)
> <alex.chen@huawei.com>; zhukeqian <zhukeqian1@huawei.com>
> Subject: [PATCH] bugfix: hostmem: Free host_nodes list right after visite=
d
>=20
> In host_memory_backend_get_host_nodes, we build host_nodes list and
> output it to v (a StringOutputVisitor) but forget to free the list. This =
fixes the
> memory leak.
>=20
> The memory leak stack:
>=20
> =3D=3Dqemu-kvm=3D=3D209357=3D=3DERROR: LeakSanitizer: detected memory lea=
ks Direct
> leak of 32 byte(s) in 2 object(s) allocated from:
>   #0 0xfffe430e3393 in __interceptor_calloc
> (/lib64/libasan.so.4+0xd3393)  ??:?
>   #1 0xfffe41d58b9b in g_malloc0 (/lib64/libglib-2.0.so.0+0x58b9b)  ??:?
>   #2 0xaaac0cdb6e43 (/usr/libexec/qemu-kvm+0xe16e43)
> backends/hostmem.c:94
>   #3 0xaaac0d2edf83 (/usr/libexec/qemu-kvm+0x134df83) qom/object.c:1478
>   #4 0xaaac0c976513 (/usr/libexec/qemu-kvm+0x9d6513)
> hw/core/machine-qmp-cmds.c:312
>   #5 0xaaac0d2e980b (/usr/libexec/qemu-kvm+0x134980b) qom/object.c:1001
>   #6 0xaaac0c97779b (/usr/libexec/qemu-kvm+0x9d779b)
> hw/core/machine-qmp-cmds.c:328 (discriminator 1)
>   #7 0xaaac0d26ed3f (/usr/libexec/qemu-kvm+0x12ced3f)
> qapi/qapi-commands-machine.c:327
>   #8 0xaaac0d43d647 (/usr/libexec/qemu-kvm+0x149d647)
> qapi/qmp-dispatch.c:147
>   #9 0xaaac0d21f74b (/usr/libexec/qemu-kvm+0x127f74b) monitor/qmp.c:120
>   #10 0xaaac0d22074b (/usr/libexec/qemu-kvm+0x128074b)
> monitor/qmp.c:209 (discriminator 4)
>   #11 0xaaac0d4daefb (/usr/libexec/qemu-kvm+0x153aefb) util/async.c:117
>   #12 0xaaac0d4e30fb (/usr/libexec/qemu-kvm+0x15430fb)
> util/aio-posix.c:459
>   #13 0xaaac0d4dac8f (/usr/libexec/qemu-kvm+0x153ac8f) util/async.c:268
>   #14 0xfffe41d52a6b in g_main_context_dispatch
> (/lib64/libglib-2.0.so.0+0x52a6b)  ??:?
>   #15 0xaaac0d4e0e97 (/usr/libexec/qemu-kvm+0x1540e97)
> util/main-loop.c:218
>   #16 0xaaac0cd9bfa7 (/usr/libexec/qemu-kvm+0xdfbfa7)  vl.c:1791
>   #17 0xaaac0c823bc3 (/usr/libexec/qemu-kvm+0x883bc3)  vl.c:4473
>   #18 0xfffe40ab3ebf in __libc_start_main (/lib64/libc.so.6+0x23ebf)  ??:=
?
>   #19 0xaaac0c82ed5f (/usr/libexec/qemu-kvm+0x88ed5f)  ??:?
> SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).
>=20
> Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---

Tested-by: Chen Qun <kuhn.chenqun@huawei.com>

By the way, the bug detailed stack is as follows:
 Direct leak of 32 byte(s) in 2 object(s) allocated from:
    #0 0xfffda30b3393 in __interceptor_calloc (/usr/lib64/libasan.so.4+0xd3=
393)
    #1 0xfffda1d28b9b in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x58b9b)
    #2 0xaaab05ca6e43 in host_memory_backend_get_host_nodes backends/hostme=
m.c:94
    #3 0xaaab061ddf83 in object_property_get_uint16List qom/object.c:1478
    #4 0xaaab05866513 in query_memdev hw/core/machine-qmp-cmds.c:312
    #5 0xaaab061d980b in do_object_child_foreach qom/object.c:1001
    #6 0xaaab0586779b in qmp_query_memdev hw/core/machine-qmp-cmds.c:328
    #7 0xaaab0615ed3f in qmp_marshal_query_memdev qapi/qapi-commands-machin=
e.c:327
    #8 0xaaab0632d647 in do_qmp_dispatch qapi/qmp-dispatch.c:147
    #9 0xaaab0632d647 in qmp_dispatch qapi/qmp-dispatch.c:190
    #10 0xaaab0610f74b in monitor_qmp_dispatch monitor/qmp.c:120
    #11 0xaaab0611074b in monitor_qmp_bh_dispatcher monitor/qmp.c:209
    #12 0xaaab063caefb in aio_bh_poll util/async.c:117
    #13 0xaaab063d30fb in aio_dispatch util/aio-posix.c:459
    #14 0xaaab063cac8f in aio_ctx_dispatch util/async.c:268
    #15 0xfffda1d22a6b in g_main_context_dispatch (/usr/lib64/libglib-2.0.s=
o.0+0x52a6b)
    #16 0xaaab063d0e97 in glib_pollfds_poll util/main-loop.c:218
    #17 0xaaab063d0e97 in os_host_main_loop_wait util/main-loop.c:241
    #18 0xaaab063d0e97 in main_loop_wait util/main-loop.c:517
    #19 0xaaab05c8bfa7 in main_loop /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:17=
91
    #20 0xaaab05713bc3 in main /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:4473
    #21 0xfffda0a83ebf in __libc_start_main (/usr/lib64/libc.so.6+0x23ebf)
    #22 0xaaab0571ed5f  (aarch64-softmmu/qemu-system-aarch64+0x88ed5f)

 SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).


>  backends/hostmem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/backends/hostmem.c b/backends/hostmem.c index
> 4bde00e8e7..9f9ac95edd 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -105,6 +105,7 @@ host_memory_backend_get_host_nodes(Object *obj,
> Visitor *v, const char *name,
>=20
>  ret:
>      visit_type_uint16List(v, name, &host_nodes, errp);
> +    qapi_free_uint16List(host_nodes);
>  }
>=20
>  static void
> --
> 2.23.0


