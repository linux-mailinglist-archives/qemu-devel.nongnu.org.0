Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A76BF032
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEFt-0006vI-W2; Fri, 17 Mar 2023 13:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEFk-0006uY-Fb
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEFi-0002LX-EO
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679075549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlPip0HefSzzLR6+oySbfjIK8KqluHLB69+7XwAgj2Q=;
 b=BWTPQeRBE9pFGxe+Z2d560vPWo9fSMVK2NdYvWde3J7BQT13pwalndHi+j5yNwtIGPzYn2
 oY+8YGVSjNwbM6qTq0auyQyu7T7RZ6OW3qCzYWbr//e0Swcxiuo2riUIvwo0waTpjcTLhr
 QC/fm/uZOdeJoz8M3v6sYGa0e8zUH9g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-Lg0z5a9tOam-SEaOoj053Q-1; Fri, 17 Mar 2023 13:52:28 -0400
X-MC-Unique: Lg0z5a9tOam-SEaOoj053Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so8932744eda.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679075547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlPip0HefSzzLR6+oySbfjIK8KqluHLB69+7XwAgj2Q=;
 b=0tFH5PGGdB6OlMvpzeyWJpEH7AFZtXrjHbeEgtDihR+GLKyPtEH4HVnFPqGJKsv53y
 /A6i4DWrMWj0f+BQhWToCvON3iXFVJO38xGuUStFFpSBhlqOhtDlKO7MO4GZfOFtEAzN
 2uTATdgZiFuzh3GEza2LzCkZWnbpkGmqCABib6F9nhFn5iXnolGXtMZhKhr8Yil6bFYS
 n1s+d5+pVl6VrA7KwobnEQl3iSfCq9obyAvK8JWPYRw8opZFhpEi/S5gTjoPnjEN1c8c
 EEMn5Drl6F+m59VXS52ZF24HRVCOsz4JM6O83tDz2wffPX6klj3AMqXtoYw/S97h2Yye
 h66g==
X-Gm-Message-State: AO0yUKWMC7BEphvdGedOJbbNJo5XKA9YsW+jWHN6DccttXnaaMPkhZRM
 itWVGERrJzFApIZXN+SsqjE31/rKswsmDqyUlWC3nrzXl528SF5J/MO2S1uFqQVW8n5OhBW+Cqp
 Yni/o8cGRjBMEyKM=
X-Received: by 2002:a50:ff1a:0:b0:4fd:215e:b691 with SMTP id
 a26-20020a50ff1a000000b004fd215eb691mr4147792edu.4.1679075546912; 
 Fri, 17 Mar 2023 10:52:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set90F8x46yHTglbCC2fxXOUrBP9y1AYINXtx8SI3FcMDJBHAbXpICeu+AHWlCo/J0QBAB6jMrA==
X-Received: by 2002:a50:ff1a:0:b0:4fd:215e:b691 with SMTP id
 a26-20020a50ff1a000000b004fd215eb691mr4147775edu.4.1679075546625; 
 Fri, 17 Mar 2023 10:52:26 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a50c40f000000b004d8d2735251sm1381956edf.43.2023.03.17.10.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:52:26 -0700 (PDT)
Message-ID: <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
Date: Fri, 17 Mar 2023 18:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 2/2] vhost-user-fs: Implement stateful migration
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
 <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17.03.23 18:19, Anton Kuchin wrote:
> On 13/03/2023 19:48, Hanna Czenczek wrote:
>> A virtio-fs device's VM state consists of:
>> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
>> - the back-end's (virtiofsd's) internal state
>>
>> We get/set the latter via the new vhost-user operations FS_SET_STATE_FD,
>> FS_GET_STATE, and FS_SET_STATE.
>>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   hw/virtio/vhost-user-fs.c | 171 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 170 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index 83fc20e49e..df1fb02acc 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -20,8 +20,10 @@
>>   #include "hw/virtio/virtio-bus.h"
>>   #include "hw/virtio/virtio-access.h"
>>   #include "qemu/error-report.h"
>> +#include "qemu/memfd.h"
>>   #include "hw/virtio/vhost.h"
>>   #include "hw/virtio/vhost-user-fs.h"
>> +#include "migration/qemu-file-types.h"
>>   #include "monitor/monitor.h"
>>   #include "sysemu/sysemu.h"
>>   @@ -298,9 +300,176 @@ static struct vhost_dev 
>> *vuf_get_vhost(VirtIODevice *vdev)
>>       return &fs->vhost_dev;
>>   }
>>   +/**
>> + * Fetch the internal state from the back-end (virtiofsd) and save it
>> + * to `f`.
>> + */
>> +static int vuf_save_state(QEMUFile *f, void *pv, size_t size,
>> +                          const VMStateField *field, JSONWriter 
>> *vmdesc)
>> +{
>> +    VirtIODevice *vdev = pv;
>> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
>> +    int memfd = -1;
>> +    /* Size of the shared memory through which to transfer the state */
>> +    const size_t chunk_size = 4 * 1024 * 1024;
>> +    size_t state_offset;
>> +    ssize_t remaining;
>> +    void *shm_buf;
>> +    Error *local_err = NULL;
>> +    int ret, ret2;
>> +
>> +    /* Set up shared memory through which to receive the state from 
>> virtiofsd */
>> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
>> +                               F_SEAL_SEAL | F_SEAL_SHRINK | 
>> F_SEAL_GROW,
>> +                               &memfd, &local_err);
>> +    if (!shm_buf) {
>> +        error_report_err(local_err);
>> +        ret = -ENOMEM;
>> +        goto early_fail;
>> +    }
>> +
>> +    /* Share the SHM area with virtiofsd */
>> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
>> +    if (ret < 0) {
>> +        goto early_fail;
>
> Don't we need some log message here too?

Sure, why not.  There are other places in this patch that just return 
-errno but print no error, I think they could all use a verbose error 
message.

>> +    }
>> +
>> +    /* Receive the virtiofsd state in chunks, and write them to `f` */
>> +    state_offset = 0;
>> +    do {
>> +        size_t this_chunk_size;
>> +
>> +        remaining = vhost_fs_get_state(&fs->vhost_dev, state_offset,
>> +                                       chunk_size);
>> +        if (remaining < 0) {
>> +            ret = remaining;
>> +            goto fail;
>> +        }
>> +
>> +        /* Prefix the whole state by its total length */
>> +        if (state_offset == 0) {
>> +            qemu_put_be64(f, remaining);
>> +        }
>> +
>> +        this_chunk_size = MIN(remaining, chunk_size);
>> +        qemu_put_buffer(f, shm_buf, this_chunk_size);
>> +        state_offset += this_chunk_size;
>> +    } while (remaining >= chunk_size);
>> +
>> +    ret = 0;
>> +fail:
>> +    /* Have virtiofsd close the shared memory */
>> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
>> +    if (ret2 < 0) {
>> +        error_report("Failed to remove state FD from the 
>> vhost-user-fs back "
>> +                     "end: %s", strerror(-ret));
>> +        if (ret == 0) {
>> +            ret = ret2;
>> +        }
>> +    }
>> +
>> +early_fail:
>> +    if (shm_buf) {
>> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * Load the back-end's (virtiofsd's) internal state from `f` and send
>> + * it over to that back-end.
>> + */
>> +static int vuf_load_state(QEMUFile *f, void *pv, size_t size,
>> +                          const VMStateField *field)
>> +{
>> +    VirtIODevice *vdev = pv;
>> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
>> +    int memfd = -1;
>> +    /* Size of the shared memory through which to transfer the state */
>> +    const size_t chunk_size = 4 * 1024 * 1024;
>> +    size_t state_offset;
>> +    uint64_t remaining;
>> +    void *shm_buf;
>> +    Error *local_err = NULL;
>> +    int ret, ret2;
>> +
>> +    /* The state is prefixed by its total length, read that first */
>> +    remaining = qemu_get_be64(f);
>> +
>> +    /* Set up shared memory through which to send the state to 
>> virtiofsd */
>> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
>> +                               F_SEAL_SEAL | F_SEAL_SHRINK | 
>> F_SEAL_GROW,
>> +                               &memfd, &local_err);
>> +    if (!shm_buf) {
>> +        error_report_err(local_err);
>> +        ret = -ENOMEM;
>> +        goto early_fail;
>> +    }
>> +
>> +    /* Share the SHM area with virtiofsd */
>> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
>> +    if (ret < 0) {
>> +        goto early_fail;
>> +    }
>> +
>> +    /*
>> +     * Read the virtiofsd state in chunks from `f`, and send them over
>> +     * to virtiofsd
>> +     */
>> +    state_offset = 0;
>> +    do {
>> +        size_t this_chunk_size = MIN(remaining, chunk_size);
>> +
>> +        if (qemu_get_buffer(f, shm_buf, this_chunk_size) < 
>> this_chunk_size) {
>> +            ret = -EINVAL;
>> +            goto fail;
>> +        }
>> +
>> +        ret = vhost_fs_set_state(&fs->vhost_dev, state_offset, 
>> this_chunk_size);
>> +        if (ret < 0) {
>> +            goto fail;
>> +        }
>> +
>> +        state_offset += this_chunk_size;
>> +        remaining -= this_chunk_size;
>> +    } while (remaining > 0);
>> +
>> +    ret = 0;
>> +fail:
>> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
>> +    if (ret2 < 0) {
>> +        error_report("Failed to remove state FD from the 
>> vhost-user-fs back "
>> +                     "end -- perhaps it failed to deserialize/apply 
>> the state: "
>> +                     "%s", strerror(-ret2));
>> +        if (ret == 0) {
>> +            ret = ret2;
>> +        }
>> +    }
>> +
>> +early_fail:
>> +    if (shm_buf) {
>> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static const VMStateDescription vuf_vmstate = {
>>       .name = "vhost-user-fs",
>> -    .unmigratable = 1,
>> +    .version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_VIRTIO_DEVICE,
>> +        {
>> +            .name = "back-end",
>> +            .info = &(const VMStateInfo) {
>> +                .name = "virtio-fs back-end state",
>> +                .get = vuf_load_state,
>> +                .put = vuf_save_state,
>> +            },
>> +        },
>
> I've been working on stateless migration patch [1] and there was 
> discussed that we
> need to keep some kind of blocker by default if orchestrators rely on 
> unmigratable
> field in virtio-fs vmstate to block the migration.
> For this purpose I've implemented flag that selects "none" or 
> "external" and is checked
> in pre_save, so it could be extended with "internal" option.
> We didn't come to conclusion if we also need to check incoming 
> migration, the discussion
> has stopped for a while but I'm going back to it now.
>
> I would appreciate if you have time to take a look at the discussion 
> and consider the idea
> proposed there to store internal state as a subsection of vmstate to 
> make it as an option
> but not mandatory.
>
> [1] 
> https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/

So far I’ve mostly considered these issues orthogonal.  If your 
stateless migration goes in first, then state is optional and I’ll 
adjust this series.  If stateful migration goes in first, then your 
series can simply make state optional by introducing the external 
option, no?

But maybe we could also consider making stateless migration a special 
case of stateful migration; if we had stateful migration, can’t we just 
implement stateless migration by telling virtiofsd that it should submit 
a special “I have no state” pseudo-state, i.e. by having a switch on 
virtiofsd instead?

Off the top of my head, some downsides of that approach would be (1) 
it’d need a switch on the virtiofsd side, not on the qemu side (not sure 
if that’s a downside, but a difference for sure), and (2) we’d need at 
least some support for this on the virtiofsd side, i.e. practically 
can’t come quicker than stateful migration support.

Hanna


