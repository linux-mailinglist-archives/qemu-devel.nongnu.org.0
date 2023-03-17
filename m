Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA86BF0D8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 19:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdExr-0005K1-Rd; Fri, 17 Mar 2023 14:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdExj-0005Jj-Nu
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:37:59 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pdExY-00077M-Vx
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:37:51 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 8234B5E69A;
 Fri, 17 Mar 2023 21:37:41 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b68e::1:34] (unknown
 [2a02:6b8:b081:b68e::1:34])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id bbqMRS0hA8c0-FbU9ciNf; Fri, 17 Mar 2023 21:37:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679078260; bh=gZhmljQ7pzR5txJb0l7tPsQHuJDB4x1wRRl8L2r75QU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=cvd0xWkmuhYja3sygNuHVuUTacQ3TBN0L1wtC/ZuFrrni1UG4fB1SCvw8yboZO+Xw
 a1bO8/RqqYA7H/3iDQVKH6zyS/c7AERmlvWkycVq/5jgxzRNMgwzb165prfTK/XE/f
 jpxpU7d5jeqjIwAOTi9kizHsy8Mosgu5VDfSfRMU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <172b000e-1776-f98e-6e22-3e805de2e8d4@yandex-team.ru>
Date: Fri, 17 Mar 2023 20:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 2/2] vhost-user-fs: Implement stateful migration
Content-Language: en-US, ru-RU
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
 <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
 <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 17/03/2023 19:52, Hanna Czenczek wrote:
> On 17.03.23 18:19, Anton Kuchin wrote:
>> On 13/03/2023 19:48, Hanna Czenczek wrote:
>>> A virtio-fs device's VM state consists of:
>>> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
>>> - the back-end's (virtiofsd's) internal state
>>>
>>> We get/set the latter via the new vhost-user operations 
>>> FS_SET_STATE_FD,
>>> FS_GET_STATE, and FS_SET_STATE.
>>>
>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>> ---
>>>   hw/virtio/vhost-user-fs.c | 171 
>>> +++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 170 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>>> index 83fc20e49e..df1fb02acc 100644
>>> --- a/hw/virtio/vhost-user-fs.c
>>> +++ b/hw/virtio/vhost-user-fs.c
>>> @@ -20,8 +20,10 @@
>>>   #include "hw/virtio/virtio-bus.h"
>>>   #include "hw/virtio/virtio-access.h"
>>>   #include "qemu/error-report.h"
>>> +#include "qemu/memfd.h"
>>>   #include "hw/virtio/vhost.h"
>>>   #include "hw/virtio/vhost-user-fs.h"
>>> +#include "migration/qemu-file-types.h"
>>>   #include "monitor/monitor.h"
>>>   #include "sysemu/sysemu.h"
>>>   @@ -298,9 +300,176 @@ static struct vhost_dev 
>>> *vuf_get_vhost(VirtIODevice *vdev)
>>>       return &fs->vhost_dev;
>>>   }
>>>   +/**
>>> + * Fetch the internal state from the back-end (virtiofsd) and save it
>>> + * to `f`.
>>> + */
>>> +static int vuf_save_state(QEMUFile *f, void *pv, size_t size,
>>> +                          const VMStateField *field, JSONWriter 
>>> *vmdesc)
>>> +{
>>> +    VirtIODevice *vdev = pv;
>>> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
>>> +    int memfd = -1;
>>> +    /* Size of the shared memory through which to transfer the 
>>> state */
>>> +    const size_t chunk_size = 4 * 1024 * 1024;
>>> +    size_t state_offset;
>>> +    ssize_t remaining;
>>> +    void *shm_buf;
>>> +    Error *local_err = NULL;
>>> +    int ret, ret2;
>>> +
>>> +    /* Set up shared memory through which to receive the state from 
>>> virtiofsd */
>>> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
>>> +                               F_SEAL_SEAL | F_SEAL_SHRINK | 
>>> F_SEAL_GROW,
>>> +                               &memfd, &local_err);
>>> +    if (!shm_buf) {
>>> +        error_report_err(local_err);
>>> +        ret = -ENOMEM;
>>> +        goto early_fail;
>>> +    }
>>> +
>>> +    /* Share the SHM area with virtiofsd */
>>> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
>>> +    if (ret < 0) {
>>> +        goto early_fail;
>>
>> Don't we need some log message here too?
>
> Sure, why not.  There are other places in this patch that just return 
> -errno but print no error, I think they could all use a verbose error 
> message.
>
>>> +    }
>>> +
>>> +    /* Receive the virtiofsd state in chunks, and write them to `f` */
>>> +    state_offset = 0;
>>> +    do {
>>> +        size_t this_chunk_size;
>>> +
>>> +        remaining = vhost_fs_get_state(&fs->vhost_dev, state_offset,
>>> +                                       chunk_size);
>>> +        if (remaining < 0) {
>>> +            ret = remaining;
>>> +            goto fail;
>>> +        }
>>> +
>>> +        /* Prefix the whole state by its total length */
>>> +        if (state_offset == 0) {
>>> +            qemu_put_be64(f, remaining);
>>> +        }
>>> +
>>> +        this_chunk_size = MIN(remaining, chunk_size);
>>> +        qemu_put_buffer(f, shm_buf, this_chunk_size);
>>> +        state_offset += this_chunk_size;
>>> +    } while (remaining >= chunk_size);
>>> +
>>> +    ret = 0;
>>> +fail:
>>> +    /* Have virtiofsd close the shared memory */
>>> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
>>> +    if (ret2 < 0) {
>>> +        error_report("Failed to remove state FD from the 
>>> vhost-user-fs back "
>>> +                     "end: %s", strerror(-ret));
>>> +        if (ret == 0) {
>>> +            ret = ret2;
>>> +        }
>>> +    }
>>> +
>>> +early_fail:
>>> +    if (shm_buf) {
>>> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * Load the back-end's (virtiofsd's) internal state from `f` and send
>>> + * it over to that back-end.
>>> + */
>>> +static int vuf_load_state(QEMUFile *f, void *pv, size_t size,
>>> +                          const VMStateField *field)
>>> +{
>>> +    VirtIODevice *vdev = pv;
>>> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
>>> +    int memfd = -1;
>>> +    /* Size of the shared memory through which to transfer the 
>>> state */
>>> +    const size_t chunk_size = 4 * 1024 * 1024;
>>> +    size_t state_offset;
>>> +    uint64_t remaining;
>>> +    void *shm_buf;
>>> +    Error *local_err = NULL;
>>> +    int ret, ret2;
>>> +
>>> +    /* The state is prefixed by its total length, read that first */
>>> +    remaining = qemu_get_be64(f);
>>> +
>>> +    /* Set up shared memory through which to send the state to 
>>> virtiofsd */
>>> +    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
>>> +                               F_SEAL_SEAL | F_SEAL_SHRINK | 
>>> F_SEAL_GROW,
>>> +                               &memfd, &local_err);
>>> +    if (!shm_buf) {
>>> +        error_report_err(local_err);
>>> +        ret = -ENOMEM;
>>> +        goto early_fail;
>>> +    }
>>> +
>>> +    /* Share the SHM area with virtiofsd */
>>> +    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
>>> +    if (ret < 0) {
>>> +        goto early_fail;
>>> +    }
>>> +
>>> +    /*
>>> +     * Read the virtiofsd state in chunks from `f`, and send them over
>>> +     * to virtiofsd
>>> +     */
>>> +    state_offset = 0;
>>> +    do {
>>> +        size_t this_chunk_size = MIN(remaining, chunk_size);
>>> +
>>> +        if (qemu_get_buffer(f, shm_buf, this_chunk_size) < 
>>> this_chunk_size) {
>>> +            ret = -EINVAL;
>>> +            goto fail;
>>> +        }
>>> +
>>> +        ret = vhost_fs_set_state(&fs->vhost_dev, state_offset, 
>>> this_chunk_size);
>>> +        if (ret < 0) {
>>> +            goto fail;
>>> +        }
>>> +
>>> +        state_offset += this_chunk_size;
>>> +        remaining -= this_chunk_size;
>>> +    } while (remaining > 0);
>>> +
>>> +    ret = 0;
>>> +fail:
>>> +    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
>>> +    if (ret2 < 0) {
>>> +        error_report("Failed to remove state FD from the 
>>> vhost-user-fs back "
>>> +                     "end -- perhaps it failed to deserialize/apply 
>>> the state: "
>>> +                     "%s", strerror(-ret2));
>>> +        if (ret == 0) {
>>> +            ret = ret2;
>>> +        }
>>> +    }
>>> +
>>> +early_fail:
>>> +    if (shm_buf) {
>>> +        qemu_memfd_free(shm_buf, chunk_size, memfd);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static const VMStateDescription vuf_vmstate = {
>>>       .name = "vhost-user-fs",
>>> -    .unmigratable = 1,
>>> +    .version_id = 1,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_VIRTIO_DEVICE,
>>> +        {
>>> +            .name = "back-end",
>>> +            .info = &(const VMStateInfo) {
>>> +                .name = "virtio-fs back-end state",
>>> +                .get = vuf_load_state,
>>> +                .put = vuf_save_state,
>>> +            },
>>> +        },
>>
>> I've been working on stateless migration patch [1] and there was 
>> discussed that we
>> need to keep some kind of blocker by default if orchestrators rely on 
>> unmigratable
>> field in virtio-fs vmstate to block the migration.
>> For this purpose I've implemented flag that selects "none" or 
>> "external" and is checked
>> in pre_save, so it could be extended with "internal" option.
>> We didn't come to conclusion if we also need to check incoming 
>> migration, the discussion
>> has stopped for a while but I'm going back to it now.
>>
>> I would appreciate if you have time to take a look at the discussion 
>> and consider the idea
>> proposed there to store internal state as a subsection of vmstate to 
>> make it as an option
>> but not mandatory.
>>
>> [1] 
>> https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/
>
> So far I’ve mostly considered these issues orthogonal.  If your 
> stateless migration goes in first, then state is optional and I’ll 
> adjust this series.
> If stateful migration goes in first, then your series can simply make 
> state optional by introducing the external option, no?

Not really. State can be easily extended by subsections but not trimmed. 
Maybe this can be worked around by defining two types of vmstate and 
selecting the correct one at migration, but I'm not sure.

>
> But maybe we could also consider making stateless migration a special 
> case of stateful migration; if we had stateful migration, can’t we 
> just implement stateless migration by telling virtiofsd that it should 
> submit a special “I have no state” pseudo-state, i.e. by having a 
> switch on virtiofsd instead?

Sure. Backend can send empty state (as your patch treats 0 length as a 
valid response and not error) or dummy state that can be recognized as 
stateless. The only potential problem is that then we need support in 
backend for new commands even to return dummy state, and if backend can 
support both types then we'll need some switch in backend to reply with 
real or empty state.

>
> Off the top of my head, some downsides of that approach would be
> (1) it’d need a switch on the virtiofsd side, not on the qemu side 
> (not sure if that’s a downside, but a difference for sure),

Why would you? It seems to me that this affects only how qemu treats the 
vmstate of device. If the state was requested backend sends it to qemu. 
If state subsection is present in stream qemu sends it to the backend 
for loading. Stateless one just doesn't request state from the backend. 
Or am I missing something?

> and (2) we’d need at least some support for this on the virtiofsd 
> side, i.e. practically can’t come quicker than stateful migration 
> support.

Not much, essentially this is just a reconnect. I've sent a draft of a 
reconnect patch for old C-virtiofsd, for rust version it takes much 
longer because I'm learning rust and I'm not really good at it yet.

>
> Hanna
>

