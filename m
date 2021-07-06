Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640423BDE7D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:40:57 +0200 (CEST)
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0rsG-0003f1-9N
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0rr7-0002xk-Sm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0rr4-0001xW-HB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625603980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFADG8jWEYnG6TUugP4ELTX+yqI3a5eYUN5JW85cGH0=;
 b=DxUdQCrW2t+fQ+BqWvR89rOybbzn/xrwejuyWecY3VQo1Z1V6RK+x8TG9nP/qttGiwaLME
 U2+QgMgxrzC0cabSc8Q5VXRvYlFgAPFGcPDS/ivxBRhkvaNYliTUO+Mv6xslXJp3fXQ64s
 H0BBY4gRX7pGkCbbsEO1aERR27InAZo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-64HUnKyAMdGryIN8x7lqpg-1; Tue, 06 Jul 2021 16:39:39 -0400
X-MC-Unique: 64HUnKyAMdGryIN8x7lqpg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so100343wrs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 13:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IFADG8jWEYnG6TUugP4ELTX+yqI3a5eYUN5JW85cGH0=;
 b=MIELA9zkckuaChP2NxYJr8WeAjG2RxFQVk4T4YqSZP7XdK/O7ClavDWmUsjqIV88Hv
 Uz1Wpd+PYGG+pvs3XeUAxqE5i86CAobcRdMo9/HiG0WbmYBAWuzKsFRvL61FrDGoecTI
 jcXf0w0Xp8kjCPExFSTXp+hlDsSvFgrcQkKi9uv2GlOKbFQTTnXalGTNjH76eQUc3+iF
 JphmtgLLpBcd5XHpZZJob3AO3QI5JQhj2gbKDcf+Y0VEiEZc6lBKjHZcuaxf7F0ppPcn
 /K0zqpOBTXwQqV14MSm3/2bHB1U1Yupg5CFdsXD8vBa2XmksSabfvdeAuZFTphB6nd+B
 uRRw==
X-Gm-Message-State: AOAM532tJvV22hCIZmz+NuNZrZn2uB4HVY8Mysq3+TJ+dPDaoTfGKJNw
 MGfynRqRpQvKt5JFEPtAU+LX3vvk/vEEps2MJvdG8Yu8cq6nmWT+QWVAOjUTEUniSmPGvEEEo7q
 j84AqhHL2ZjB9rzc=
X-Received: by 2002:a1c:4681:: with SMTP id t123mr2728960wma.108.1625603978226; 
 Tue, 06 Jul 2021 13:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq4w4PA7qn5B+/3ZuAtn5U8IbjD4XK447Wdyr+JdrUNN+G/x21cmuP2l2ujLofzO4DXzA6vg==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr2728939wma.108.1625603978009; 
 Tue, 06 Jul 2021 13:39:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x18sm17496017wrw.19.2021.07.06.13.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 13:39:37 -0700 (PDT)
Subject: Re: [PATCH] fuzz: fix sparse memory access in the DMA callback
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210706161735.57967-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <65e86b4b-e105-c321-aa86-03626f8fe4a9@redhat.com>
Date: Tue, 6 Jul 2021 22:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706161735.57967-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 6:17 PM, Alexander Bulekov wrote:
> The code mistakenly relied on address_space_translate to store the
> length remaining until the next memory-region. We care about this
> because when there is RAM or sparse-memory neighboring on an MMIO
> region, we should only write up to the border, to prevent inadvertently
> invoking MMIO handlers within the DMA callback.
> 
> However address_space_translate_internal only stores the length until
> the end of the MemoryRegion if memory_region_is_ram(mr). Otherwise
> the *len is left unmodified. This caused some false-positive issues,
> where the fuzzer found a way to perform a nested MMIO write through a
> DMA callback on an [address, length] that started within sparse memory
> and spanned some device MMIO regions.
> 
> To fix this, write to sparse memory in small chunks of
> memory_access_size (similar to the underlying address_space_write code),
> which will prevent accidentally hitting MMIO handlers through large
> writes.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


