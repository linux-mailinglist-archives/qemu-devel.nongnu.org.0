Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CB6F091C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:08:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps48v-00045S-Je; Thu, 27 Apr 2023 12:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps48q-00042P-DU
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps48o-0000sp-KU
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682611600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2YP9Ie5bDYYlK9WCyYafHP+qW0E/HMxmBcv5YoGWTg=;
 b=WQDPQRBBJfbZAGrjbxtM2K8PkQgXjJnT52VnwVYpczYt5Gw21GZIHhuO7zIx7SnIui7iY0
 va4uFjDkD2ZQcYGRQIKAeMOXR8w4uZuC34qnHlCn6kEa1s46mej9c7dYRmtxCLPOHfIVhA
 HMoZKwLPA0E/jNWng7WmtO/NKQoxOWk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-GZAg6QaLOtWlZFrqX7V9kw-1; Thu, 27 Apr 2023 12:06:14 -0400
X-MC-Unique: GZAg6QaLOtWlZFrqX7V9kw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so4567964f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682611557; x=1685203557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2YP9Ie5bDYYlK9WCyYafHP+qW0E/HMxmBcv5YoGWTg=;
 b=AvoNMx01RR42/wH6bpyBphAJc1EwxGiblQOWI524BdOuJAEaKRrIau2LBM+DchNzQl
 YYxWky36PFxoWQ9wl/eGwfYr3uqJzQ0n/6ESMfTm4K2vusAnF0aU3D+XaWqEdsfaoSli
 yGL1wBGrirfydyn4QDS7+v0c5Hkb0Ga4h7TZd0t/JJoQ+9dVzSE+TkBhsuLUFFegMKxn
 1fiUZr4kf3aRA4A86GzyZZwtO4W8jV/c+b9fNHba+aRbSHWDFR4UPUDtOI9nNADGyvch
 Z2Hv27Pm5umSVpYIK4focR9cYySgHZyS+AJ81+dN5OySX6Oln3r52pnXLrn9rLORSmZs
 xhCQ==
X-Gm-Message-State: AC+VfDwvpdWVzia6Uzz3o7jftavh9i3VS0Rutop8AmUIEqHoQFMENfHN
 +qmUQm7AYF7Pe3Gbqjo137z6bOAYjTaXQFaBW9D2x7RV7T/1LOY3ue0M/znlLhO890XKJVhWpXH
 TfS+PY4hbuvKIfYs=
X-Received: by 2002:a5d:45d2:0:b0:304:aad4:b1e4 with SMTP id
 b18-20020a5d45d2000000b00304aad4b1e4mr1608509wrs.32.1682611556921; 
 Thu, 27 Apr 2023 09:05:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yTnS6m5zg0PLHoMkYxXGckuvHbsbIdn1lZwYZ9y6V3OgcriT+7fQ+h9OJmePi4+x/UvmIqw==
X-Received: by 2002:a5d:45d2:0:b0:304:aad4:b1e4 with SMTP id
 b18-20020a5d45d2000000b00304aad4b1e4mr1608466wrs.32.1682611556626; 
 Thu, 27 Apr 2023 09:05:56 -0700 (PDT)
Received: from [192.168.8.102] (tmo-097-86.customers.d1-online.com.
 [80.187.97.86]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm18860774wrq.94.2023.04.27.09.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 09:05:55 -0700 (PDT)
Message-ID: <97eba78f-59d2-5eaa-50ec-7ddbd9fa9f3a@redhat.com>
Date: Thu, 27 Apr 2023 18:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 7/8] memory: abort on re-entrancy in debug builds
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, "open list:Block I/O path"
 <qemu-block@nongnu.org>
References: <20230426161951.2948996-1-alxndr@bu.edu>
 <20230426161951.2948996-8-alxndr@bu.edu>
 <20230427144444.dnjazwxpcrmrce7e@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427144444.dnjazwxpcrmrce7e@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/04/2023 16.44, Alexander Bulekov wrote:
> On 230426 1219, Alexander Bulekov wrote:
>> This is useful for using unit-tests/fuzzing to detect bugs introduced by
>> the re-entrancy guard mechanism into devices that are intentionally
>> re-entrant.
>>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
> 
> This doesn't actually do anything right now. Doesn't look like DEBUG is
> defined with --enable-debug

Ah, I thought you'd enable it with --extra-cflags=-DDEBUG or so

> Any suggestion for how to make re-entrancy louder/fatal on
> debug/developer builds? Maybe we can just replace the trace event with
> an unconditional log-message?

I'm not sure whether I'd go for a completely uncondition log message, but 
maybe qemu_log_mask(LOG_GUEST_ERROR, ...) is ok?

  Thomas


