Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BA6E09A9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:04:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmssn-0006k1-H4; Thu, 13 Apr 2023 05:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmssi-0006Og-DD
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmssd-0002b5-5x
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681376674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v85VyotEtLzVXkX3uE33Lo+Wa7PXQ8tR76YYut5DzHA=;
 b=W84gfB9oP9C/uY3CxANJy2HH/GtpZrH7RX3V8WDf/KQQIKlYk+isvffhHnJO6+823skeb2
 Yqz8YFweSG8LwBVbvHnC1mbTKWS0mDA0aLAfbiMeoy/jKMm1jCncwlwgCeT5Le81fvMmMY
 MaqdksoxDW02Ok8093pvRC1DrIX046c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-rLf0dVDbMk-WuUIICCCSwA-1; Thu, 13 Apr 2023 05:04:32 -0400
X-MC-Unique: rLf0dVDbMk-WuUIICCCSwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l4-20020adfa384000000b002f4585d0ec9so1069369wrb.15
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376671; x=1683968671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v85VyotEtLzVXkX3uE33Lo+Wa7PXQ8tR76YYut5DzHA=;
 b=GT1LCaqTsF7T4w7EwjJ+6r8T5BL2F6i3helPPBIAKGmgz1x3N3mK7Oy8e8TwMrxGjH
 6cHnYnG+SC2JN2INKNHQ0GnM5f2KQ9XQFGBASAYaGpg9FvGjp8xY6FxRPt0LeFpdSWLP
 JjN4JDCzs886Kk0iIIMOeZxgPN3LBEtfGKTYhwXr1HdCq1BdFYWscgXm3h2v/HRjqt6M
 D+2KdSLMRPtV0+5ekes/1ZiXVZYLagqCZSCjRlQy0sKXoGioZt/ZjL2qz3SXn7KJqcha
 Cp0+UdhZxqzUxCvU46hcl6Rfc6VxBhxAyob3jQqbfrUpFZn3tZzTIqKyF2phDWHSNkyO
 gYpA==
X-Gm-Message-State: AAQBX9fA/LlPJFi4FR+MYN/TMZhz9AzkeDuxh/kl5EjWjk0vkkpnVkZk
 I+b6FD2DNY/U/qsZYaFNeXZUk1BCUraJ6BD3Ccr7dqq+uxf7Aajgwb2xQMQryyqxDqP+nC8Lp4I
 OumB2zAY93lroM9Y=
X-Received: by 2002:a05:600c:548a:b0:3ee:782b:2e31 with SMTP id
 iv10-20020a05600c548a00b003ee782b2e31mr901955wmb.9.1681376671563; 
 Thu, 13 Apr 2023 02:04:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZGLCFuuLQV7Tmv3SiwJJm4xkIzwB8jTFFlWaYrkqfX0z2VhFD9Laokn5lCmk+v8s+SVG36hA==
X-Received: by 2002:a05:600c:548a:b0:3ee:782b:2e31 with SMTP id
 iv10-20020a05600c548a00b003ee782b2e31mr901935wmb.9.1681376671246; 
 Thu, 13 Apr 2023 02:04:31 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003ee74c25f12sm4840386wms.35.2023.04.13.02.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:04:30 -0700 (PDT)
Message-ID: <44fac0de-d651-1b1b-e263-161587c40d3b@redhat.com>
Date: Thu, 13 Apr 2023 11:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] vhost: Add high-level state save/load functions
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-4-hreitz@redhat.com> <20230412211447.GD2813183@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230412211447.GD2813183@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12.04.23 23:14, Stefan Hajnoczi wrote:
> On Tue, Apr 11, 2023 at 05:05:14PM +0200, Hanna Czenczek wrote:
>> vhost_save_backend_state() and vhost_load_backend_state() can be used by
>> vhost front-ends to easily save and load the back-end's state to/from
>> the migration stream.
>>
>> Because we do not know the full state size ahead of time,
>> vhost_save_backend_state() simply reads the data in 1 MB chunks, and
>> writes each chunk consecutively into the migration stream, prefixed by
>> its length.  EOF is indicated by a 0-length chunk.
>>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   include/hw/virtio/vhost.h |  35 +++++++
>>   hw/virtio/vhost.c         | 196 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 231 insertions(+)
>>
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 29449e0fe2..d1f1e9e1f3 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -425,4 +425,39 @@ int vhost_set_device_state_fd(struct vhost_dev *dev,
>>    */
>>   int vhost_check_device_state(struct vhost_dev *dev, Error **errp);
>>   
>> +/**
>> + * vhost_save_backend_state(): High-level function to receive a vhost
>> + * back-end's state, and save it in `f`.  Uses
>> + * `vhost_set_device_state_fd()` to get the data from the back-end, and
>> + * stores it in consecutive chunks that are each prefixed by their
>> + * respective length (be32).  The end is marked by a 0-length chunk.
>> + *
>> + * Must only be called while the device and all its vrings are stopped
>> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
>> + *
>> + * @dev: The vhost device from which to save the state
>> + * @f: Migration stream in which to save the state
>> + * @errp: Potential error message
>> + *
>> + * Returns 0 on success, and -errno otherwise.
>> + */
>> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Error **errp);
>> +
>> +/**
>> + * vhost_load_backend_state(): High-level function to load a vhost
>> + * back-end's state from `f`, and send it over to the back-end.  Reads
>> + * the data from `f` in the format used by `vhost_save_state()`, and
>> + * uses `vhost_set_device_state_fd()` to transfer it to the back-end.
>> + *
>> + * Must only be called while the device and all its vrings are stopped
>> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
>> + *
>> + * @dev: The vhost device to which to send the sate
>> + * @f: Migration stream from which to load the state
>> + * @errp: Potential error message
>> + *
>> + * Returns 0 on success, and -errno otherwise.
>> + */
>> +int vhost_load_backend_state(struct vhost_dev *dev, QEMUFile *f, Error **errp);
>> +
>>   #endif
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 90099d8f6a..d08849c691 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -2125,3 +2125,199 @@ int vhost_check_device_state(struct vhost_dev *dev, Error **errp)
>>                  "vhost transport does not support migration state transfer");
>>       return -ENOSYS;
>>   }
>> +
>> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Error **errp)
>> +{
>> +    /* Maximum chunk size in which to transfer the state */
>> +    const size_t chunk_size = 1 * 1024 * 1024;
>> +    void *transfer_buf = NULL;
>> +    g_autoptr(GError) g_err = NULL;
>> +    int pipe_fds[2], read_fd = -1, write_fd = -1, reply_fd = -1;
>> +    int ret;
>> +
>> +    /* [0] for reading (our end), [1] for writing (back-end's end) */
>> +    if (!g_unix_open_pipe(pipe_fds, FD_CLOEXEC, &g_err)) {
>> +        error_setg(errp, "Failed to set up state transfer pipe: %s",
>> +                   g_err->message);
>> +        ret = -EINVAL;
>> +        goto fail;
>> +    }
>> +
>> +    read_fd = pipe_fds[0];
>> +    write_fd = pipe_fds[1];
>> +
>> +    /* VHOST_TRANSFER_STATE_PHASE_STOPPED means the device must be stopped */
>> +    assert(!dev->started && !dev->enable_vqs);
>> +
>> +    /* Transfer ownership of write_fd to the back-end */
>> +    ret = vhost_set_device_state_fd(dev,
>> +                                    VHOST_TRANSFER_STATE_DIRECTION_SAVE,
>> +                                    VHOST_TRANSFER_STATE_PHASE_STOPPED,
>> +                                    write_fd,
>> +                                    &reply_fd,
>> +                                    errp);
>> +    if (ret < 0) {
>> +        error_prepend(errp, "Failed to initiate state transfer: ");
>> +        goto fail;
>> +    }
>> +
>> +    /* If the back-end wishes to use a different pipe, switch over */
>> +    if (reply_fd >= 0) {
>> +        close(read_fd);
>> +        read_fd = reply_fd;
>> +    }
>> +
>> +    transfer_buf = g_malloc(chunk_size);
>> +
>> +    while (true) {
>> +        ssize_t read_ret;
>> +
>> +        read_ret = read(read_fd, transfer_buf, chunk_size);
>> +        if (read_ret < 0) {
>> +            ret = -errno;
>> +            error_setg_errno(errp, -ret, "Failed to receive state");
>> +            goto fail;
>> +        }
>> +
>> +        assert(read_ret <= chunk_size);
>> +        qemu_put_be32(f, read_ret);
>> +
>> +        if (read_ret == 0) {
>> +            /* EOF */
>> +            break;
>> +        }
>> +
>> +        qemu_put_buffer(f, transfer_buf, read_ret);
>> +    }
> I think this synchronous approach with a single contiguous stream of
> chunks is okay for now.
>
> Does this make the QEMU monitor unresponsive if the backend is slow?

Oh, absolutely.  But as far as I can tell that’s also the case if the 
back-end doesn’t respond (or responds slowly) to vhost-user messages, 
because they’re generally sent/received synchronously. (So, notably, 
these synchronous read()/write() calls aren’t worse than the previous 
model of transferring data through shared memory, but awaiting the 
back-end via vhost-user calls between each chunk.)

I don’t know whether it’s even possible to do it better (while keeping 
it all in the switch-over phase).  The VMState functions aren’t 
coroutines or AIO, so I can’t think of a way to improve this.

(Well, except:)

> In the future the interface could be extended to allow participating in
> the iterative phase of migration. Then chunks from multiple backends
> (plus guest RAM) would be interleaved and there would be some
> parallelism.

Sure.  That would also definitely help with an unintentionally slow 
back-end.  If the back-end making qemu unresponsive is a deal-breaker, 
then we’d have to do this now.

Hanna


