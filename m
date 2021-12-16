Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EE476D5C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:29:01 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxn4O-00070Q-1f
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn1s-0005Me-9V
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn1o-0004e0-7U
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639646779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saVJRMAvEeu91mZLngx/O1I0ymsWbJJYgDv4NvvD4nw=;
 b=ZgrAaXcYP6W5bxOTbSvF+Tmhm+7E4tFpvdMjs4OfD0JfX8DsItqAr9ibB4TctcyKJOIwOv
 jmRp6IBH9dJR25gax4qws8x6Dwu/L+QzsEaPK99Okzyz5Cd6DA1Cdc10/DQBAPg9va/aOK
 qmc429feFGNv3yWGqYqoVFX0zDjg5Z8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-54smPW9rOrekv3PkSAsTFA-1; Thu, 16 Dec 2021 04:26:18 -0500
X-MC-Unique: 54smPW9rOrekv3PkSAsTFA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso6695150wrj.12
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=saVJRMAvEeu91mZLngx/O1I0ymsWbJJYgDv4NvvD4nw=;
 b=Ta+qg85+Z6TiCla5tr/Q6KinjwEuY7MLTQk4G6cg8pyuL03MRIz3ZbiMGEuWvxkQzu
 BIdaZkyjKEvBmWG8XWmyz1A7HyYshh13xzSB0JAsFfcGJHTBYLy1fIXOvMcOeN4cRaJb
 pJJdiOQ3XQvMPRJ9ruKbJjABhb/x3fWgtetRS8OLN1mZwfohqdp45EcRpI4CRCZMrqrG
 zLVknxfjAdz7rsYyiRxGG8+cFPRjz4WN0e8mMocaizw3Ji6IQ1LC8tQEE4XkgmSjJbqk
 NsmZu0/9x1zYG3/m5L7qOMqGtWFy9310DuxXEELhkO/naAPH45pgobQ3cZbFSZEJgC25
 6HOA==
X-Gm-Message-State: AOAM5331/MLZkVNeLhfgrg5Quq+De57RLXLUCUxfwwpabzeV1UQUJdMZ
 mEicWOU96vUNsldbogHzA7Oto+gabDvayiXUVqjoTDuklmgO0Bdo84BRt2GxFvFSN/IkWkHTt/K
 8Pb079te6wOFRUBE=
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr8403755wrx.70.1639646777433; 
 Thu, 16 Dec 2021 01:26:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhg41JnZgQUHGSJEHjQ5R+J5FNlUS7O4wt8qjLhfn4gJjiebki654wozR/AFTxsRUZotmaig==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr8403741wrx.70.1639646777275; 
 Thu, 16 Dec 2021 01:26:17 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a10sm8197690wmq.27.2021.12.16.01.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:26:16 -0800 (PST)
Message-ID: <efafa479-0c54-fbf2-58f8-17462935daa9@redhat.com>
Date: Thu, 16 Dec 2021 10:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] migration: All this fields are unsigned
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-2-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216091332.25681-2-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 10:13, Juan Quintela wrote:
> So printing it as %d is wrong.  Notice that for the channel id, that
> is an uint8_t, but I changed it anyways for consistency.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd-zlib.c | 20 ++++++++++----------
>  migration/multifd-zstd.c | 24 ++++++++++++------------
>  migration/multifd.c      | 16 ++++++++--------
>  migration/trace-events   | 26 +++++++++++++-------------
>  4 files changed, 43 insertions(+), 43 deletions(-)

>  # multifd.c
> -multifd_new_send_channel_async(uint8_t id) "channel %d"
> -multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
> -multifd_recv_new_channel(uint8_t id) "channel %d"
> +multifd_new_send_channel_async(uint8_t id) "channel %u"
> +multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
> +multifd_recv_new_channel(uint8_t id) "channel %u"
>  multifd_recv_sync_main(long packet_num) "packet num %ld"
> -multifd_recv_sync_main_signal(uint8_t id) "channel %d"
> -multifd_recv_sync_main_wait(uint8_t id) "channel %d"
> +multifd_recv_sync_main_signal(uint8_t id) "channel %u"
> +multifd_recv_sync_main_wait(uint8_t id) "channel %u"
>  multifd_recv_terminate_threads(bool error) "error %d"
> -multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %" PRIu64
> -multifd_recv_thread_start(uint8_t id) "%d"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
> -multifd_send_error(uint8_t id) "channel %d"
> +multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
> +multifd_recv_thread_start(uint8_t id) "%u"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
> +multifd_send_error(uint8_t id) "channel %u"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
> -multifd_send_sync_main_signal(uint8_t id) "channel %d"
> -multifd_send_sync_main_wait(uint8_t id) "channel %d"
> +multifd_send_sync_main_signal(uint8_t id) "channel %u"
> +multifd_send_sync_main_wait(uint8_t id) "channel %u"
>  multifd_send_terminate_threads(bool error) "error %d"

Nitpicking: bool is unsigned :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


