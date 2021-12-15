Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3A4763D5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:58:35 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbMA-0002GV-IG
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:58:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKZ-0000CF-Rr
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKY-00056k-5U
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Og6YqIyksUyH18AebpX4JaVWOF3xQBj/8/rbB4GtOo=;
 b=FQ/7uyw1VsjLO05AqBKEL4lVyHleBLFS7rphpnX4H1h5ZS6F9rrtc+YdHH/KWg6TsjE4Il
 MLlIR720mkag/QxMC0EaINmVt6W196ghcTbkGPkZJ9/EkN4U7pqpwjiD9jRwANlgt/Tbk4
 qYjlfoCAgsPLv3cf6w7bYsh9LsjxO/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-VPfTHfxnPfi1MietXViNlA-1; Wed, 15 Dec 2021 15:56:52 -0500
X-MC-Unique: VPfTHfxnPfi1MietXViNlA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso1325685wmq.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Og6YqIyksUyH18AebpX4JaVWOF3xQBj/8/rbB4GtOo=;
 b=kw2YXvWbWvqHg0OsA2AC7z/Eqa3DoL4p+ATxKhy33wKvi93QKvG+9T4vG1ba+mtlJU
 c+oOar1BPfPNI/MzgZgqdHD/IH+EAKtyePt9wQv/iHmTWWFoUHX1fydBr0bZoHsSRmnJ
 Rv5gXEKdctT9nJB09QU3A2wM8B/MQP6n9eCGC8oqv6VzHk3xTRJ/pS3pKzaEsFEyb9Aa
 A2J7qw6Hp4XDj8KSu+teBS9eBb2hTIe1FD0Q0+Wxbrtb+b+kUcLiaJ2fYnrzYKNNEhfH
 iUb82QudcrnLARSGq1zQTiluz0zU8gmQbdbtxfq/W3NmYGsKnCHY/U+2aJ+VYoOydaf6
 1Kcw==
X-Gm-Message-State: AOAM532bV2EiEo5SQACzOrWsi6lt9mvLxmnbXKlWPhuM6YwnRldPbeme
 PwAZVynZCaabliEgcASjHmu28AUETIb4VfPQpWWv/72xv5EKs5mM4oKFQctFrhEOk2eeYh65+Th
 NJNsGu1K8zEK8HIM=
X-Received: by 2002:a1c:2085:: with SMTP id g127mr1985511wmg.120.1639601811315; 
 Wed, 15 Dec 2021 12:56:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3H6AEzRBk8pnEh282X2MLlliAAtJ+xTyLIefWfyo9iAYqGDIDLzBuiruFiPIU2X4KYVRjTg==
X-Received: by 2002:a1c:2085:: with SMTP id g127mr1985493wmg.120.1639601811140; 
 Wed, 15 Dec 2021 12:56:51 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u2sm3394536wrs.17.2021.12.15.12.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:56:50 -0800 (PST)
Message-ID: <812d89b9-c97e-51d6-bb75-1c5ed7adc788@redhat.com>
Date: Wed, 15 Dec 2021 21:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] hw/sd/sdhci: Fix DMA re-entrancy issue
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211215205527.488480-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211215205527.488480-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 21:55, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is an attempt to fix the DMA re-entrancy problem
> on the SDHCI device. OSS-Fuzz found it and Alexander generated
> a helpful reproducer.
> 
> By setting the MemTxAttrs::memory bit before doing DMA transactions,
> the flatview API will return MEMTX_BUS_ERROR if the transaction
> targets a non-memory (a device), which is usually how DMA-reentrancy
> bugs are exploited.
> 
> On real hardware, the checks are on the interconnect bus, not in
> the SDHCI block. However QEMU blocks aren't modelled that way.
> Using the flatview API seems (to me) the simplest and closer
> to hardware, it is a generic API and we can use it to trace
> bus transactions on all blocks.
> 
> Note this series is simply one example to fix the generic
> issues. The important changes are in the previous series:
> https://lore.kernel.org/qemu-devel/20211215182421.418374-1-philmd@redhat.com/
> Based-on: <20211215182421.418374-1-philmd@redhat.com>
> "physmem: Have flatview API check bus permission from MemTxAttrs"

Please disregard this cover, I forgot to post as RFC...


