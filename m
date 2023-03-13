Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75A6B787A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhvb-0007yS-Qs; Mon, 13 Mar 2023 09:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pbhvZ-0007xG-Tk
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pbhvX-0003Dl-M4
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678712962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bu44FXxZ0cnZh3U/qPfWE3A7X8UwkJ49apQu65y8qyQ=;
 b=aJyfCbLsGOPWYtVYAGwpqAu5nAen8R2HIQgk1z/JmWaXViXu4/j844FypXwP90NhQVaOZD
 EJrXqFB4lvhxkD4sMy9nr7rRLF3DbXcK6Q13tRxI1YnwjzQs50260jSyH8hNiwcWzCdMyi
 G+zduusHJx5Ema7Ok5QA1VRxa4ku5/0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-rZJC7SqBPF2rgs7mVC8pEQ-1; Mon, 13 Mar 2023 09:09:20 -0400
X-MC-Unique: rZJC7SqBPF2rgs7mVC8pEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003ed26fa6ebdso618644wms.7
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 06:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678712959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bu44FXxZ0cnZh3U/qPfWE3A7X8UwkJ49apQu65y8qyQ=;
 b=yQPtGPqRenitj5NSxH40JfGFqvPVrZlZB3B1XrDYTztURCPKtZLb4fR51TeX4MBtjO
 zRUSBYVuech8yf332xIz0QR+iCf+ytBKszdJ4x9pD24ZqxRjWdoyq8rH1avx1F+7tn+5
 JsuTyyyDsir4vjEfx4q5JizP1q8er51VmMNibt0dueRfPinOUG74OEIn1w8F419eMHvj
 pBL+DOZwZnG55nYcZHlRy5JllyMVPDabpMCy/CsM8mt62MPuOC+6AWB1Vpzc21wLYyg5
 3l8pMMovE/SWQZ+b76/CoW0SUoAAfpMDGj0BEJRtnkGmxKu7TVp8owbj4TksAzxLZJ8p
 HHcw==
X-Gm-Message-State: AO0yUKWXA9JLXBsN+mA2MTcVy8QuhwgFZ//J67whpoqWdr2JaFlQDu2S
 UOxLo0auo65mVedm+wwgNqNZZmtTGP8X7iV6D40U+rNU672E4CaGaMeHFQwxFUK8HcTC1wS+qC6
 JrcupPXyQXW6/UI4=
X-Received: by 2002:a05:600c:4f50:b0:3ea:bc08:42ad with SMTP id
 m16-20020a05600c4f5000b003eabc0842admr10823692wmq.2.1678712959430; 
 Mon, 13 Mar 2023 06:09:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Ix21J76nlFgX1nX/ogtvm++8CTePWXPkMgzPOZzKPmoEn2pHtftGKqRrcwNayl/nPL9kBRw==
X-Received: by 2002:a05:600c:4f50:b0:3ea:bc08:42ad with SMTP id
 m16-20020a05600c4f5000b003eabc0842admr10823663wmq.2.1678712959069; 
 Mon, 13 Mar 2023 06:09:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 i1-20020a05600c290100b003e89e3284fasm8983507wmd.36.2023.03.13.06.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 06:09:18 -0700 (PDT)
Message-ID: <f060c5ab-f60e-a0a4-6415-f4ace8db479e@redhat.com>
Date: Mon, 13 Mar 2023 14:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
 <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
 <ZAs92f/J9qvA6X5B@redhat.com>
 <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
 <9bc7a6d8-744e-9593-1de0-88f19a1e1bc1@proxmox.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9bc7a6d8-744e-9593-1de0-88f19a1e1bc1@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/13/23 13:29, Fiona Ebner wrote:
>> In fact, shouldn't request queuing was enabled at the _end_ of
>> bdrv_drained_begin (once the BlockBackend has reached a quiescent
>> state on its own terms), rather than at the beginning (which leads to
>> deadlocks like this one)?
>
> Couldn't this lead to scenarios where a busy or malicious guest, which
> continues to submit new requests, slows down draining or even prevents
> it from finishing?

Possibly, but there is also a .drained_begin/.drained_end callback that 
can be defined in order to apply backpressure.  (For some other devices, 
there's also aio_disable_external/aio_enable_external that do the 
equivalent of request queuing but without the deadlocks)

Since starting the queuing of requests at the end of bdrv_drained_begin 
wouldn't hurt correctness, and it would fix this kind of deadlock, I 
think it would be worth giving it a try.

Paolo


