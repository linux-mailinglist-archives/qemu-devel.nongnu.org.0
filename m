Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C360C8F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:52:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGba-00088v-U8; Tue, 25 Oct 2022 05:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGbG-0004u6-Kc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGbD-0002Go-99
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666691513;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YF3BMgtgs6VTne7K/aUtBILk1Rld/5M9vKAJ4MAUD/8=;
 b=hIYudhE4aL95UCfezXC2aJdVB5BfVzO0J2Trm+481/WLIvr1iztOg1auWdU0RizdztwyEM
 zKxfrvBYEUCjQQlCRcBg6l+DyDNcniqrjxFc5mHmNXKjGDelq9qgYoYMD5M9Ex//hReOlb
 6ZRZBZbZ+89PMbaYDMpGMfHYqAyVHa8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-V1Gw9BdzMoCEadkcArl6XA-1; Tue, 25 Oct 2022 05:51:51 -0400
X-MC-Unique: V1Gw9BdzMoCEadkcArl6XA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so3658665wrg.14
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YF3BMgtgs6VTne7K/aUtBILk1Rld/5M9vKAJ4MAUD/8=;
 b=dKpycOquLRtf9ZsnBSm0GtDJmbSKT9HYj3Y7J5J4hXe+BWx16gzU1yM0b7QRMXE8pw
 zbpmh7J9/sl3EPGD0B9gyJh4OgQBUvRK2y/IDirpYATcGj0NrOBXcUw5ScaBWE1LRqqx
 F90Lt+9jWEsqbCto/lQyxEjrpJBAsQzc2uWO73yADqOavOIWjyUUPKw2yHJZd81lrXQV
 2yi3J21n/Lk7IsD/0gs5spAl/Js9VsPD0vocHCTxNsyUkJnlv1+MR3cICXdiH5ikc9Qv
 KesDhV2+8BkrEuGb61jX+s+LNSfMOryW7bfn0p4WSAZQBBWgvp2Ff2mxue3HoYwceokG
 sXIg==
X-Gm-Message-State: ACrzQf31J8/hwTTJ/NqGCKDTuH+fz4CZJsZ1LzbuRT2E+KqUJl9xfZGl
 34BQYoRGecetCfOYOe3gsgQIF/YMt2IBytHHo527VTIfR9G99c1Asw4lA6voxitKeaobUdP4obX
 8i9CBBnXJg2AeB6M=
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr45611061wmi.67.1666691510174; 
 Tue, 25 Oct 2022 02:51:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qy6p4iYsel6sdjWqj6RScV/f0Tmr9irAI3k5Wx0erZDEnbxce9T2vmZF2iGGuI/gc2TCnOA==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr45611039wmi.67.1666691509888; 
 Tue, 25 Oct 2022 02:51:49 -0700 (PDT)
Received: from localhost (static-28-206-230-77.ipcom.comunitel.net.
 [77.230.206.28]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003c7084d072csm10657283wmq.28.2022.10.25.02.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:51:49 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 2/4] migration/multifd/zero-copy: Merge header &
 pages send in a single write
In-Reply-To: <20221025044730.319941-3-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 25 Oct 2022 01:47:29 -0300")
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-3-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 25 Oct 2022 11:51:48 +0200
Message-ID: <87a65kdydn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
> When zero-copy-send is enabled, each loop iteration of the
> multifd_send_thread will calls for qio_channel_write_*() twice: The first
> one for sending the header without zero-copy flag and the second one for
> sending the memory pages, with zero-copy flag enabled.
>
> This ends up calling two syscalls per loop iteration, where one should be
> enough.
>
> Also, since the behavior for non-zero-copy write is synchronous, and the
> behavior for zero-copy write is asynchronous, it ends up interleaving
> synchronous and asynchronous writes, hurting performance that could
> otherwise be improved.
>
> The choice of sending the header without the zero-copy flag in a separated
> write happened because the header memory area would be reused in the next
> write, so it was almost certain to have changed before the kernel could
> send the packet.
>
> To send the packet with zero-copy, create an array of header area instead
> of a single one, and use a different header area after each write. Also,
> flush the sending queue after all the headers have been used.
>
> To avoid adding a zero-copy conditional in multifd_send_fill_packet(),
> add a packet parameter (the packet that should be filled). This way it's
> simpler to pick which element of the array will be used as a header.
>
> Suggested-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

>  
> +            if (use_zero_copy_send) {
> +                p->packet_idx = (p->packet_idx + 1) % HEADER_ARR_SZ;
> +
> +                if (!p->packet_idx && (multifd_zero_copy_flush(p->c) < 0)) {
> +                    break;
> +                }
> +                header = (void *)p->packet + p->packet_idx * p->packet_len;

Isn't this equivalent to?

      header = &(p->packet[p->packet_idx]);

>      for (i = 0; i < thread_count; i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
> +        int j;

For new code you can:

>          qemu_mutex_init(&p->mutex);
>          qemu_sem_init(&p->sem, 0);
> @@ -940,9 +940,13 @@ int multifd_save_setup(Error **errp)
>          p->pages = multifd_pages_init(page_count);
>          p->packet_len = sizeof(MultiFDPacket_t)
>                        + sizeof(uint64_t) * page_count;
> -        p->packet = g_malloc0(p->packet_len);
> -        p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
> -        p->packet->version = cpu_to_be32(MULTIFD_VERSION);
> +        p->packet = g_malloc0_n(HEADER_ARR_SZ, p->packet_len);
> +        for (j = 0; j < HEADER_ARR_SZ ; j++) {

           for (int j = 0; j < HEADER_ARR_SZ ; j++) {

> +            MultiFDPacket_t *packet = (void *)p->packet + j * p->packet_len;
> +            packet->magic = cpu_to_be32(MULTIFD_MAGIC);
> +            packet->version = cpu_to_be32(MULTIFD_VERSION);

Can't you use here:

            packet[j].magic = cpu_to_be32(MULTIFD_MAGIC);
            packet[j].version = cpu_to_be32(MULTIFD_VERSION);

And call it a day?

The rest is fine for me.  Thanks for the effort.

Later, Juan.


