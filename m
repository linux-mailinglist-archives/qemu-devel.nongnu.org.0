Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE3B6BB8B1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:56:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTTa-0001gF-1H; Wed, 15 Mar 2023 11:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcTTW-0001g2-Ki
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcTTU-0007Sr-TF
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678895735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WwFk0rE1pC8W2LA+APBnKby8LThDxZFlrY8RtRviRY=;
 b=H+acpZcgUgrqpj2xI4DDgEmPOAKLQYjShGinwmZNMBP/8An7b/tK/lbd5ixI1N8jRnSkrb
 w03yNDhqZdBqKTkDSnWj0HaY+/XKropwCmpGNgYV0OZ2f077lezRJdEU/iYhRJVluFDrKx
 ba8nfbeUvYqapEjmZEfBynT7nBo0k1A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-UtrmfGC8OmSC_LT8ZWZESg-1; Wed, 15 Mar 2023 11:55:33 -0400
X-MC-Unique: UtrmfGC8OmSC_LT8ZWZESg-1
Received: by mail-ed1-f69.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so27350415eda.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678895732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WwFk0rE1pC8W2LA+APBnKby8LThDxZFlrY8RtRviRY=;
 b=JlGAvhUTHATNKAp0vCvSzsGxp5XYQ3QFmajLzvTNy5u70rV1tiSpZdLaPKsPkQ7JUO
 DCU46serixrL4EUSj9Kgiwtj8WWC+2+L3AYZoJvMkOqy789S8W3IYtL7478ukS/1Mt/Z
 dK8LZXAjWL1C137eMzwgwW1DbnzpsMYVd6M5Db9/OLaeydCjnvdnjDEXO+Ops/vUqvCy
 YEBbp+k0Yi0JpU+JYD39YhtOPes+ZlXOwfRPfBEqM0kx24A4QabFzOM8PmJBXWdHaMCU
 IGbu4ELY8ubreolC5xDNHXWgdN4QDFTn5eOh2YG9Yvy1K/QdYrg1qUzs93F1AwgyHOW0
 2TlA==
X-Gm-Message-State: AO0yUKWw3ohg59yd4ORAon8EfXP8EAWBj2mhrrB5G711XZPF+RC60QD1
 aZOq+ysXU0OWeh8bI3X5u56tvLf+lz7bWOhY5IbJMzGXS6IyxvJb61kmGXrEKgHlJfs/1RGRhd7
 J16cVjw8y0EolutU=
X-Received: by 2002:a17:906:4fd0:b0:8dd:5710:a017 with SMTP id
 i16-20020a1709064fd000b008dd5710a017mr8818817ejw.4.1678895732480; 
 Wed, 15 Mar 2023 08:55:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set/hoGhz7NihxlVCW+FEUlOT4vriMTC0lpCIQfb39a6mHK/D0vjqLdlNlsNAf2tegsiUvMjiJA==
X-Received: by 2002:a17:906:4fd0:b0:8dd:5710:a017 with SMTP id
 i16-20020a1709064fd000b008dd5710a017mr8818786ejw.4.1678895732206; 
 Wed, 15 Mar 2023 08:55:32 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 sc38-20020a1709078a2600b00921278f4980sm2663404ejc.34.2023.03.15.08.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:55:31 -0700 (PDT)
Message-ID: <aca54f19-1c95-01b6-5c5d-bfcee7942c16@redhat.com>
Date: Wed, 15 Mar 2023 16:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 1/2] vhost-user: Add interface for virtio-fs migration
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-2-hreitz@redhat.com> <20230315135844.GC6146@fedora>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230315135844.GC6146@fedora>
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

On 15.03.23 14:58, Stefan Hajnoczi wrote:
> On Mon, Mar 13, 2023 at 06:48:32PM +0100, Hanna Czenczek wrote:
>> Add a virtio-fs-specific vhost-user interface to facilitate migrating
>> back-end-internal state.  We plan to migrate the internal state simply
> Luckily the interface does not need to be virtiofs-specific since it
> only transfers opaque data. Any stateful device can use this for
> migration. Please make it generic both at the vhost-user protocol
> message level and at the QEMU vhost API level.

OK, sure.

>> as a binary blob after the streaming phase, so all we need is a way to
>> transfer such a blob from and to the back-end.  We do so by using a
>> dedicated area of shared memory through which the blob is transferred in
>> chunks.
> Keeping the migration data transfer separate from the vhost-user UNIX
> domain socket is a good idea since the amount of data could be large and
> may congest the UNIX domain socket. The shared memory interface solves
> this.
>
> Where I get lost is why it needs to be shared memory instead of simply
> an fd? On the source, the front-end could read the fd until EOF and
> transfer the opaque data. On the destination, the front-end could write
> to the fd and then close it. I think that would be simpler than the
> shared memory interface and could potentially support zero-copy via
> splice(2) (QEMU doesn't need to look at the data being transferred!).
>
> Here is an outline of an fd-based interface:
>
> - SET_DEVICE_STATE_FD: The front-end passes a file descriptor for
>    transferring device state.
>
>    The @direction argument:
>    - SAVE: the back-end transfers an outgoing device state over the fd.
>    - LOAD: the back-end transfers an incoming device state over the fd.
>
>    The @phase argument:
>    - STOPPED: the device is stopped.
>    - PRE_COPY: reserved for future use.
>    - POST_COPY: reserved for future use.
>
>    The back-end transfers data over the fd according to @direction and
>    @phase upon receiving the SET_DEVICE_STATE_FD message.
>
> There are loose ends like how the message interacts with the virtqueue
> enabled state, what happens if multiple SET_DEVICE_STATE_FD messages are
> sent, etc. I have ignored them for now.
>
> What I wanted to mention about the fd-based interface is:
>
> - It's just one message. The I/O activity happens via the fd and does
>    not involve GET_STATE/SET_STATE messages over the vhost-user domain
>    socket.
>
> - Buffer management is up to the front-end and back-end implementations
>    and a bit simpler than the shared memory interface.
>
> Did you choose the shared memory approach because it has certain
> advantages?

I simply chose it because I didn’t think of anything else. :)

Using just an FD for a pipe-like interface sounds perfect to me.  I 
expect that to make the code simpler and, as you point out, it’s just 
better in general.  Thanks!

>> This patch adds the following vhost operations (and implements them for
>> vhost-user):
>>
>> - FS_SET_STATE_FD: The front-end passes a dedicated shared memory area
>>    to the back-end.  This area will be used to transfer state via the
>>    other two operations.
>>    (After the transfer FS_SET_STATE_FD detaches the shared memory area
>>    again.)
>>
>> - FS_GET_STATE: The front-end asks the back-end to place a chunk of
>>    internal state into the shared memory area.
>>
>> - FS_SET_STATE: The front-end puts a chunk of internal state into the
>>    shared memory area, and asks the back-end to fetch it.
>>
>> On the source side, the back-end is expected to serialize its internal
>> state either when FS_SET_STATE_FD is invoked, or when FS_GET_STATE is
>> invoked the first time.  On subsequent FS_GET_STATE calls, it memcpy()s
>> parts of that serialized state into the shared memory area.
>>
>> On the destination side, the back-end is expected to collect the state
>> blob over all FS_SET_STATE calls, and then deserialize and apply it once
>> FS_SET_STATE_FD detaches the shared memory area.
> What is the rationale for waiting to receive the entire incoming state
> before parsing it rather than parsing it in a streaming fashion? Can
> this be left as an implementation detail of the vhost-user back-end so
> that there's freedom in choosing either approach?

The rationale was that when using the shared memory approach, you need 
to specify the offset into the state of the chunk that you’re currently 
transferring.  So to allow streaming, you’d need to make the front-end 
transfer the chunks in a streaming fashion, so that these offsets are 
continuously increasing.  Definitely possible, and reasonable, I just 
thought it’d be easier not to define it at this point and just state 
that decoding at the end is always safe.

When using a pipe/splicing, however, that won’t be a concern anymore, so 
yes, then we can definitely allow the back-end to decode its state while 
it’s still being received.

Hanna


