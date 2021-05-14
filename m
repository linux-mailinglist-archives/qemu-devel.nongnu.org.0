Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C803812C6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 23:20:48 +0200 (CEST)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhfEl-0005lv-5V
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 17:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhfDK-0004qP-Ds
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhfDI-0000i7-NQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621027155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLKRLoC9jvJ5JbyR0X8rJ3xGbnC1magvrfn6u8dvF5Y=;
 b=Qivnjh4hbQx0/FhIUS0l/F8eZXhOsgaCbciCJLPLnJOnfl2vZndQYgi9whWoBPj04isMyK
 DWzPI/7/TxorNsV5rFwfyFJ7WIemaDHy8Kay0G7NiWRmvERtEEEvIHDYDfCw3d0VMxoavT
 O2E0E0x4aPV6coqvMqxioZyIBcA9Ydw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-b0RFyYkBPGKoYYN_mLXGNQ-1; Fri, 14 May 2021 17:19:14 -0400
X-MC-Unique: b0RFyYkBPGKoYYN_mLXGNQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso54914edz.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WLKRLoC9jvJ5JbyR0X8rJ3xGbnC1magvrfn6u8dvF5Y=;
 b=Zv8LKQl+UfgF+IIv9ZKzeLbqUgUL56X5/j3SDATAVtYCzHy2zKbczLiUJm34yP22BE
 9S1HTcVa8j81SRsvx6ZCHa09w5f2ccXxdfgXhJHkNm8+kMC1Kx3/zfPGg/h7vqvITFSQ
 stQZDxcsWLjNJaI8X/T/V69UcDx00V3oefotfMfYNxuGgkRA5EZBasbRw4sgv327jK91
 Ts89cXRfjIm7LQ85n9QrJA9p3tq9FIezHyzWABXLWiqirGA3Pf8hIhIOc192yNCtooEj
 Euui2kj3EwqCQtKvXnJpwN2wZ7VxeKtB6MzRfv4WLRUSCLDDP+UvCume1ei06wMPJ1Hi
 JE7A==
X-Gm-Message-State: AOAM533pV7IlE1y3UOZSltWHXBmHlKp9cJus8+2I/8oCRwkKUdN/sCUx
 EJdLJW6kDaw+PpFKd1w7HK7+SACfK+Ph5XdxKtRpA5FPhi3C4bq5oOAXcloNWXC8cgoZIihEWI2
 MjzGd9Yah2Rl4gek=
X-Received: by 2002:a50:eb08:: with SMTP id y8mr44403771edp.89.1621027153114; 
 Fri, 14 May 2021 14:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVTLKwDSSeqhuXOg8U2P4I88Hd5YtJdBxUKgkFD/qI7PWXDgvnNdKv9p7wpCdTCK2/oHEonw==
X-Received: by 2002:a50:eb08:: with SMTP id y8mr44403762edp.89.1621027152933; 
 Fri, 14 May 2021 14:19:12 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id p13sm4107150ejr.87.2021.05.14.14.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:19:11 -0700 (PDT)
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
 <YJ6y9qeQ4RMs7sXN@rvkaganb.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9d233429-3f8d-b8e0-6a80-3f3b3104430d@redhat.com>
Date: Fri, 14 May 2021 23:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJ6y9qeQ4RMs7sXN@rvkaganb.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 19:27, Roman Kagan wrote:
> 
> AFAICS your patch has basically the same effect as Vladimir's
> patch "util/async: aio_co_enter(): do aio_co_schedule in general case"
> (https://lore.kernel.org/qemu-devel/20210408140827.332915-4-vsementsov@virtuozzo.com/).
> That one was found to break e.g. aio=threads cases.  I guessed it
> implicitly relied upon aio_co_enter() acquiring the aio_context but we
> didn't dig further to pinpoint the exact scenario.

That one is much more intrusive, because it goes through a bottom half 
unnecessarily in the case of aio_co_wake being called from an I/O 
callback (or from another bottom half).  I'll test my patch with 
aio=threads.

Paolo


