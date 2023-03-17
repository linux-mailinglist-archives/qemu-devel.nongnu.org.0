Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB86BEF79
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDkP-0006lt-WD; Fri, 17 Mar 2023 13:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdDkN-0006li-OL
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:20:07 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdDkL-0000Jq-5I
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:20:07 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:5398:0:640:443b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 6E7B960275;
 Fri, 17 Mar 2023 20:19:50 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b68e::1:34] (unknown
 [2a02:6b8:b081:b68e::1:34])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lJpxgO0h3iE0-me8MNWSD; Fri, 17 Mar 2023 20:19:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679073589; bh=6LomDRG4nR+efSRxGTuQTm5WspZMhTAGhIr+0ABV5MM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SeMcZe3CsVRsXDYdv10C0YBC1vn6XBZhJ2C/FGbHtVw0Lage0NJjb5UiVuprUYyvx
 WWOKPkPUK60mIV8yWvbw1a1OUlKaXRhJwZgRwkW0px5OTEo3H9Nkh91R3xDKHJ9QMy
 CjlpNBHGGTUnNPjXrFrHb9Yy7G064UQkB4b8RZP8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
Date: Fri, 17 Mar 2023 19:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 2/2] vhost-user-fs: Implement stateful migration
Content-Language: en-US, ru-RU
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230313174833.28790-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/03/2023 19:48, Hanna Czenczek wrote:
> A virtio-fs device's VM state consists of:
> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
> - the back-end's (virtiofsd's) internal state
>
> We get/set the latter via the new vhost-user operations FS_SET_STATE_FD,
> FS_GET_STATE, and FS_SET_STATE.
>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   hw/virtio/vhost-user-fs.c | 171 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 170 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 83fc20e49e..df1fb02acc 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -20,8 +20,10 @@
>   #include "hw/virtio/virtio-bus.h"
>   #include "hw/virtio/virtio-access.h"
>   #include "qemu/error-report.h"
> +#include "qemu/memfd.h"
>   #include "hw/virtio/vhost.h"
>   #include "hw/virtio/vhost-user-fs.h"
> +#include "migration/qemu-file-types.h"
>   #include "monitor/monitor.h"
>   #include "sysemu/sysemu.h"
>   
> @@ -298,9 +300,176 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>       return &fs->vhost_dev;
>   }
>   
> +/**
> + * Fetch the internal state from the back-end (virtiofsd) and save it
> + * to `f`.
> + */
> +static int vuf_save_state(QEMUFile *f, void *pv, size_t size,
> +                          const VMStateField *field, JSONWriter *vmdesc)
> +{
> +    VirtIODevice *vdev = pv;
> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> +    int memfd = -1;
> +    /* Size of the shared memory through which to transfer the state */
> +    const size_t chunk_size = 4 * 1024 * 1024;
> +    size_t state_offset;
> +    ssize_t remaining;
> +    void *shm_buf;
> +    Error *local_err = NULL;
> +    int ret, ret2;
> +
> +    /* Set up shared memory through which to receive the state from virtiofsd */
> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
> +                               F_SEAL_SEAL | F_SEAL_SHRINK | F_SEAL_GROW,
> +                               &memfd, &local_err);
> +    if (!shm_buf) {
> +        error_report_err(local_err);
> +        ret = -ENOMEM;
> +        goto early_fail;
> +    }
> +
> +    /* Share the SHM area with virtiofsd */
> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
> +    if (ret < 0) {
> +        goto early_fail;

Don't we need some log message here too?

> +    }
> +
> +    /* Receive the virtiofsd state in chunks, and write them to `f` */
> +    state_offset = 0;
> +    do {
> +        size_t this_chunk_size;
> +
> +        remaining = vhost_fs_get_state(&fs->vhost_dev, state_offset,
> +                                       chunk_size);
> +        if (remaining < 0) {
> +            ret = remaining;
> +            goto fail;
> +        }
> +
> +        /* Prefix the whole state by its total length */
> +        if (state_offset == 0) {
> +            qemu_put_be64(f, remaining);
> +        }
> +
> +        this_chunk_size = MIN(remaining, chunk_size);
> +        qemu_put_buffer(f, shm_buf, this_chunk_size);
> +        state_offset += this_chunk_size;
> +    } while (remaining >= chunk_size);
> +
> +    ret = 0;
> +fail:
> +    /* Have virtiofsd close the shared memory */
> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
> +    if (ret2 < 0) {
> +        error_report("Failed to remove state FD from the vhost-user-fs back "
> +                     "end: %s", strerror(-ret));
> +        if (ret == 0) {
> +            ret = ret2;
> +        }
> +    }
> +
> +early_fail:
> +    if (shm_buf) {
> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
> +    }
> +
> +    return ret;
> +}
> +
> +/**
> + * Load the back-end's (virtiofsd's) internal state from `f` and send
> + * it over to that back-end.
> + */
> +static int vuf_load_state(QEMUFile *f, void *pv, size_t size,
> +                          const VMStateField *field)
> +{
> +    VirtIODevice *vdev = pv;
> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> +    int memfd = -1;
> +    /* Size of the shared memory through which to transfer the state */
> +    const size_t chunk_size = 4 * 1024 * 1024;
> +    size_t state_offset;
> +    uint64_t remaining;
> +    void *shm_buf;
> +    Error *local_err = NULL;
> +    int ret, ret2;
> +
> +    /* The state is prefixed by its total length, read that first */
> +    remaining = qemu_get_be64(f);
> +
> +    /* Set up shared memory through which to send the state to virtiofsd */
> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
> +                               F_SEAL_SEAL | F_SEAL_SHRINK | F_SEAL_GROW,
> +                               &memfd, &local_err);
> +    if (!shm_buf) {
> +        error_report_err(local_err);
> +        ret = -ENOMEM;
> +        goto early_fail;
> +    }
> +
> +    /* Share the SHM area with virtiofsd */
> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
> +    if (ret < 0) {
> +        goto early_fail;
> +    }
> +
> +    /*
> +     * Read the virtiofsd state in chunks from `f`, and send them over
> +     * to virtiofsd
> +     */
> +    state_offset = 0;
> +    do {
> +        size_t this_chunk_size = MIN(remaining, chunk_size);
> +
> +        if (qemu_get_buffer(f, shm_buf, this_chunk_size) < this_chunk_size) {
> +            ret = -EINVAL;
> +            goto fail;
> +        }
> +
> +        ret = vhost_fs_set_state(&fs->vhost_dev, state_offset, this_chunk_size);
> +        if (ret < 0) {
> +            goto fail;
> +        }
> +
> +        state_offset += this_chunk_size;
> +        remaining -= this_chunk_size;
> +    } while (remaining > 0);
> +
> +    ret = 0;
> +fail:
> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
> +    if (ret2 < 0) {
> +        error_report("Failed to remove state FD from the vhost-user-fs back "
> +                     "end -- perhaps it failed to deserialize/apply the state: "
> +                     "%s", strerror(-ret2));
> +        if (ret == 0) {
> +            ret = ret2;
> +        }
> +    }
> +
> +early_fail:
> +    if (shm_buf) {
> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
> +    }
> +
> +    return ret;
> +}
> +
>   static const VMStateDescription vuf_vmstate = {
>       .name = "vhost-user-fs",
> -    .unmigratable = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        {
> +            .name = "back-end",
> +            .info = &(const VMStateInfo) {
> +                .name = "virtio-fs back-end state",
> +                .get = vuf_load_state,
> +                .put = vuf_save_state,
> +            },
> +        },

I've been working on stateless migration patch [1] and there was 
discussed that we
need to keep some kind of blocker by default if orchestrators rely on 
unmigratable
field in virtio-fs vmstate to block the migration.
For this purpose I've implemented flag that selects "none" or "external" 
and is checked
in pre_save, so it could be extended with "internal" option.
We didn't come to conclusion if we also need to check incoming 
migration, the discussion
has stopped for a while but I'm going back to it now.

I would appreciate if you have time to take a look at the discussion and 
consider the idea
proposed there to store internal state as a subsection of vmstate to 
make it as an option
but not mandatory.

[1] 
https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/

> +        VMSTATE_END_OF_LIST()
> +    },
>   };
>   
>   static Property vuf_properties[] = {

