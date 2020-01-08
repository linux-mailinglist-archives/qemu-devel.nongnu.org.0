Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C5133FE7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 12:08:29 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip9CN-00074v-Tp
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 06:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ip9Bb-0006fw-0A
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 06:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ip9BZ-0002WB-96
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 06:07:38 -0500
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:43268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ip9BZ-0002Ul-2Z
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 06:07:37 -0500
Received: from player693.ha.ovh.net (unknown [10.108.42.83])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 8266F15607A
 for <qemu-devel@nongnu.org>; Wed,  8 Jan 2020 12:07:34 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 012A8DF17610;
 Wed,  8 Jan 2020 11:07:27 +0000 (UTC)
Date: Wed, 8 Jan 2020 12:07:26 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] 9p: init_in_iov_from_pdu can truncate the size
Message-ID: <20200108120726.1df1f51b@bahia.lan>
In-Reply-To: <20200106193809.23144-1-sstabellini@kernel.org>
References: <20200106193809.23144-1-sstabellini@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13255782555752765873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehkedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.203
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
Cc: anthony.perard@citrix.com, roman@zededa.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, qemu_oss@crudebyte.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Jan 2020 11:38:09 -0800
Stefano Stabellini <sstabellini@kernel.org> wrote:

> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> init_in_iov_from_pdu might not be able to allocate the full buffer size
> requested, which comes from the client and could be larger than the
> transport has available at the time of the request. Specifically, this
> can happen with read operations, with the client requesting a read up to
> the max allowed, which might be more than the transport has available at
> the time.
> 
> Today the implementation of init_in_iov_from_pdu throws an error, both
> Xen and Virtio.
> 
> Instead, change the V9fsTransport interface so that the size becomes a
> pointer and can be limited by the implementation of
> init_in_iov_from_pdu.
> 
> Change both the Xen and Virtio implementations to set the size to the
> size of the buffer they managed to allocate, instead of throwing an
> error. However, if the allocated buffer size is less than P9_IOHDRSZ
> (the size of the header) still throw an error as the case is unhandable.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: groug@kaod.org
> CC: anthony.perard@citrix.com
> CC: roman@zededa.com
> CC: qemu_oss@crudebyte.com
> ---
> Changes in v2:
> - rebase to master
> - fix code style
> - fix build issue passing pointers of different size
> - retain transport error if allocated size is less than P9_IOHDRSZ
> ---

Applied to 9p-next. Thanks !

If someone has free cycles, maybe consider adding some Tread test in
virtio-9p-test.c ?

>  hw/9pfs/9p.c               | 26 +++++++++++++++++++-------
>  hw/9pfs/9p.h               |  2 +-
>  hw/9pfs/virtio-9p-device.c | 11 +++++++----
>  hw/9pfs/xen-9p-backend.c   | 13 ++++++++-----
>  4 files changed, 35 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 520177f40c..2efed37753 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2090,22 +2090,29 @@ out_nofid:
>   * with qemu_iovec_destroy().
>   */
>  static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
> -                                    size_t skip, size_t size,
> +                                    size_t skip, size_t *size,
>                                      bool is_write)
>  {
>      QEMUIOVector elem;
>      struct iovec *iov;
>      unsigned int niov;
> +    size_t alloc_size = *size + skip;
>  
>      if (is_write) {
> -        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov, &niov, size + skip);
> +        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov, &niov, alloc_size);
>      } else {
> -        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov, size + skip);
> +        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov, &alloc_size);
> +    }
> +
> +    if (alloc_size < skip) {
> +        *size = 0;
> +    } else {
> +        *size = alloc_size - skip;
>      }
>  
>      qemu_iovec_init_external(&elem, iov, niov);
>      qemu_iovec_init(qiov, niov);
> -    qemu_iovec_concat(qiov, &elem, skip, size);
> +    qemu_iovec_concat(qiov, &elem, skip, *size);
>  }
>  
>  static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
> @@ -2130,7 +2137,7 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
>      }
>      offset += err;
>  
> -    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, read_count, false);
> +    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &read_count, false);
>      err = v9fs_pack(qiov_full.iov, qiov_full.niov, 0,
>                      ((char *)fidp->fs.xattr.value) + off,
>                      read_count);
> @@ -2259,9 +2266,11 @@ static void coroutine_fn v9fs_read(void *opaque)
>          QEMUIOVector qiov_full;
>          QEMUIOVector qiov;
>          int32_t len;
> +        size_t size = max_count;
>  
> -        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, max_count, false);
> +        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, &size, false);
>          qemu_iovec_init(&qiov, qiov_full.niov);
> +        max_count = size;
>          do {
>              qemu_iovec_reset(&qiov);
>              qemu_iovec_concat(&qiov, &qiov_full, count, qiov_full.size - count);
> @@ -2504,6 +2513,7 @@ static void coroutine_fn v9fs_write(void *opaque)
>      int32_t len = 0;
>      int32_t total = 0;
>      size_t offset = 7;
> +    size_t size;
>      V9fsFidState *fidp;
>      V9fsPDU *pdu = opaque;
>      V9fsState *s = pdu->s;
> @@ -2516,7 +2526,9 @@ static void coroutine_fn v9fs_write(void *opaque)
>          return;
>      }
>      offset += err;
> -    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, count, true);
> +    size = count;
> +    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &size, true);
> +    count = size;
>      trace_v9fs_write(pdu->tag, pdu->id, fid, off, count, qiov_full.niov);
>  
>      fidp = get_fid(pdu, fid);
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 3904f82901..8d07a0b301 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -425,7 +425,7 @@ struct V9fsTransport {
>      ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
>                                    va_list ap);
>      void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
> -                                        unsigned int *pniov, size_t size);
> +                                        unsigned int *pniov, size_t *size);
>      void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
>                                           unsigned int *pniov, size_t size);
>      void        (*push_and_notify)(V9fsPDU *pdu);
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index b5a7c03f26..991e175c82 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -147,19 +147,22 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t offset,
>  }
>  
>  static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
> -                                        unsigned int *pniov, size_t size)
> +                                        unsigned int *pniov, size_t *size)
>  {
>      V9fsState *s = pdu->s;
>      V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
>      VirtQueueElement *elem = v->elems[pdu->idx];
>      size_t buf_size = iov_size(elem->in_sg, elem->in_num);
>  
> -    if (buf_size < size) {
> +    if (buf_size < P9_IOHDRSZ) {
>          VirtIODevice *vdev = VIRTIO_DEVICE(v);
>  
>          virtio_error(vdev,
> -                     "VirtFS reply type %d needs %zu bytes, buffer has %zu",
> -                     pdu->id + 1, size, buf_size);
> +                     "VirtFS reply type %d needs %zu bytes, buffer has %zu, less than minimum",
> +                     pdu->id + 1, *size, buf_size);
> +    }
> +    if (buf_size < *size) {
> +        *size = buf_size;
>      }
>  
>      *piov = elem->in_sg;
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 71eebe12dd..18fe5b7c92 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -187,7 +187,7 @@ static void xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
>  static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
>                                            struct iovec **piov,
>                                            unsigned int *pniov,
> -                                          size_t size)
> +                                          size_t *size)
>  {
>      Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
>      Xen9pfsRing *ring = &xen_9pfs->rings[pdu->tag % xen_9pfs->num_rings];
> @@ -197,16 +197,19 @@ static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
>      g_free(ring->sg);
>  
>      ring->sg = g_new0(struct iovec, 2);
> -    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, size);
> +    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, *size);
>  
>      buf_size = iov_size(ring->sg, num);
> -    if (buf_size  < size) {
> +    if (buf_size  < P9_IOHDRSZ) {
>          xen_pv_printf(&xen_9pfs->xendev, 0, "Xen 9pfs request type %d"
> -                "needs %zu bytes, buffer has %zu\n", pdu->id, size,
> -                buf_size);
> +                "needs %zu bytes, buffer has %zu, less than minimum\n",
> +                pdu->id, *size, buf_size);
>          xen_be_set_state(&xen_9pfs->xendev, XenbusStateClosing);
>          xen_9pfs_disconnect(&xen_9pfs->xendev);
>      }
> +    if (buf_size  < *size) {
> +        *size = buf_size;
> +    }
>  
>      *piov = ring->sg;
>      *pniov = num;


