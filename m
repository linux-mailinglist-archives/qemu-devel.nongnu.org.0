Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0101264B39A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 11:51:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p52rx-0005T4-8G; Tue, 13 Dec 2022 05:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1p52ru-0005S6-La; Tue, 13 Dec 2022 05:50:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1p52rs-00029N-Df; Tue, 13 Dec 2022 05:50:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4100214B4785C;
 Tue, 13 Dec 2022 11:50:21 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 11:50:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005aef23cf4-cb28-473b-9e5b-0ae057ec234d,
 2B952FF697BCF1CD2ADA004D19172BA55612CD4F) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 13 Dec 2022 11:50:19 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Christian
 Schoenebeck <qemu_oss@crudebyte.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH-for-8.0 07/10] hw/virtio: Directly access cached
 VirtIODevice::access_is_big_endian
Message-ID: <20221213115019.4adfc326@bahia>
In-Reply-To: <20221212230517.28872-8-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-8-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 8a476ef1-4fc0-4c47-ab27-e75fdbadde9b
X-Ovh-Tracer-Id: 6407777846676396475
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuueeijedtleeluedthfetjeffieetffeuvefffeeftedvieefueejgfdugeetueenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdhkfiholhhfsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpjhgrshhofigrnhhgsehrvg
 guhhgrthdrtghomhdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhmpdhhrhgvihhtiiesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 13 Dec 2022 00:05:14 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Since the device endianness doesn't change at runtime,
> use the cached value instead of evaluating it on each call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/virtio/virtio-access.h | 44 +++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio=
-access.h
> index 07aae69042..985f39fe16 100644
> --- a/include/hw/virtio/virtio-access.h
> +++ b/include/hw/virtio/virtio-access.h
> @@ -43,7 +43,7 @@ static inline uint16_t virtio_lduw_phys(VirtIODevice *v=
dev, hwaddr pa)
>  {
>      AddressSpace *dma_as =3D vdev->dma_as;
> =20
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {

For x86, virtio_access_is_big_endian() expands to :

static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
{
    return false;
}

When I added these memory accessors, there was a strong requirement from MST
that x86 shouldn't have to pay for an out-of-line check when it is known th=
at
everything is always little endian. Not sure exactly what you're trying to
achieve with VirtIODevice::access_is_big_endian but this shouldn't mess with
this fast path.

>          return lduw_be_phys(dma_as, pa);
>      }
>      return lduw_le_phys(dma_as, pa);
> @@ -53,7 +53,7 @@ static inline uint32_t virtio_ldl_phys(VirtIODevice *vd=
ev, hwaddr pa)
>  {
>      AddressSpace *dma_as =3D vdev->dma_as;
> =20
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldl_be_phys(dma_as, pa);
>      }
>      return ldl_le_phys(dma_as, pa);
> @@ -63,7 +63,7 @@ static inline uint64_t virtio_ldq_phys(VirtIODevice *vd=
ev, hwaddr pa)
>  {
>      AddressSpace *dma_as =3D vdev->dma_as;
> =20
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldq_be_phys(dma_as, pa);
>      }
>      return ldq_le_phys(dma_as, pa);
> @@ -74,7 +74,7 @@ static inline void virtio_stw_phys(VirtIODevice *vdev, =
hwaddr pa,
>  {
>      AddressSpace *dma_as =3D vdev->dma_as;
> =20
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stw_be_phys(dma_as, pa, value);
>      } else {
>          stw_le_phys(dma_as, pa, value);
> @@ -86,7 +86,7 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, =
hwaddr pa,
>  {
>      AddressSpace *dma_as =3D vdev->dma_as;
> =20
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stl_be_phys(dma_as, pa, value);
>      } else {
>          stl_le_phys(dma_as, pa, value);
> @@ -95,7 +95,7 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, =
hwaddr pa,
> =20
>  static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t =
v)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stw_be_p(ptr, v);
>      } else {
>          stw_le_p(ptr, v);
> @@ -104,7 +104,7 @@ static inline void virtio_stw_p(VirtIODevice *vdev, v=
oid *ptr, uint16_t v)
> =20
>  static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t =
v)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stl_be_p(ptr, v);
>      } else {
>          stl_le_p(ptr, v);
> @@ -113,7 +113,7 @@ static inline void virtio_stl_p(VirtIODevice *vdev, v=
oid *ptr, uint32_t v)
> =20
>  static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t =
v)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stq_be_p(ptr, v);
>      } else {
>          stq_le_p(ptr, v);
> @@ -122,7 +122,7 @@ static inline void virtio_stq_p(VirtIODevice *vdev, v=
oid *ptr, uint64_t v)
> =20
>  static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return lduw_be_p(ptr);
>      } else {
>          return lduw_le_p(ptr);
> @@ -131,7 +131,7 @@ static inline int virtio_lduw_p(VirtIODevice *vdev, c=
onst void *ptr)
> =20
>  static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldl_be_p(ptr);
>      } else {
>          return ldl_le_p(ptr);
> @@ -140,7 +140,7 @@ static inline int virtio_ldl_p(VirtIODevice *vdev, co=
nst void *ptr)
> =20
>  static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldq_be_p(ptr);
>      } else {
>          return ldq_le_p(ptr);
> @@ -150,9 +150,9 @@ static inline uint64_t virtio_ldq_p(VirtIODevice *vde=
v, const void *ptr)
>  static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
>  {
>  #if HOST_BIG_ENDIAN
> -    return virtio_access_is_big_endian(vdev) ? s : bswap16(s);
> +    return vdev->access_is_big_endian ? s : bswap16(s);
>  #else
> -    return virtio_access_is_big_endian(vdev) ? bswap16(s) : s;
> +    return vdev->access_is_big_endian ? bswap16(s) : s;
>  #endif
>  }
> =20
> @@ -160,7 +160,7 @@ static inline uint16_t virtio_lduw_phys_cached(VirtIO=
Device *vdev,
>                                                 MemoryRegionCache *cache,
>                                                 hwaddr pa)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return lduw_be_phys_cached(cache, pa);
>      }
>      return lduw_le_phys_cached(cache, pa);
> @@ -170,7 +170,7 @@ static inline uint32_t virtio_ldl_phys_cached(VirtIOD=
evice *vdev,
>                                                MemoryRegionCache *cache,
>                                                hwaddr pa)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldl_be_phys_cached(cache, pa);
>      }
>      return ldl_le_phys_cached(cache, pa);
> @@ -180,7 +180,7 @@ static inline uint64_t virtio_ldq_phys_cached(VirtIOD=
evice *vdev,
>                                                MemoryRegionCache *cache,
>                                                hwaddr pa)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          return ldq_be_phys_cached(cache, pa);
>      }
>      return ldq_le_phys_cached(cache, pa);
> @@ -190,7 +190,7 @@ static inline void virtio_stw_phys_cached(VirtIODevic=
e *vdev,
>                                            MemoryRegionCache *cache,
>                                            hwaddr pa, uint16_t value)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stw_be_phys_cached(cache, pa, value);
>      } else {
>          stw_le_phys_cached(cache, pa, value);
> @@ -201,7 +201,7 @@ static inline void virtio_stl_phys_cached(VirtIODevic=
e *vdev,
>                                            MemoryRegionCache *cache,
>                                            hwaddr pa, uint32_t value)
>  {
> -    if (virtio_access_is_big_endian(vdev)) {
> +    if (vdev->access_is_big_endian) {
>          stl_be_phys_cached(cache, pa, value);
>      } else {
>          stl_le_phys_cached(cache, pa, value);
> @@ -216,9 +216,9 @@ static inline void virtio_tswap16s(VirtIODevice *vdev=
, uint16_t *s)
>  static inline uint32_t virtio_tswap32(VirtIODevice *vdev, uint32_t s)
>  {
>  #if HOST_BIG_ENDIAN
> -    return virtio_access_is_big_endian(vdev) ? s : bswap32(s);
> +    return vdev->access_is_big_endian ? s : bswap32(s);
>  #else
> -    return virtio_access_is_big_endian(vdev) ? bswap32(s) : s;
> +    return vdev->access_is_big_endian ? bswap32(s) : s;
>  #endif
>  }
> =20
> @@ -230,9 +230,9 @@ static inline void virtio_tswap32s(VirtIODevice *vdev=
, uint32_t *s)
>  static inline uint64_t virtio_tswap64(VirtIODevice *vdev, uint64_t s)
>  {
>  #if HOST_BIG_ENDIAN
> -    return virtio_access_is_big_endian(vdev) ? s : bswap64(s);
> +    return vdev->access_is_big_endian ? s : bswap64(s);
>  #else
> -    return virtio_access_is_big_endian(vdev) ? bswap64(s) : s;
> +    return vdev->access_is_big_endian ? bswap64(s) : s;
>  #endif
>  }
> =20


