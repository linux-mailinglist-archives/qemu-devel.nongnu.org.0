Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C986E77AB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 12:45:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5Ja-0001tN-HK; Wed, 19 Apr 2023 06:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5JY-0001tD-Pu
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5JX-0002oE-65
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681901123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXwxlbEOdJy43W45D5Y/9ObwykEH7RvI3L4R4FHZKUM=;
 b=AEStOfSPeQGdhecURCxC21vMSPdLLUtUKSx3910Hk53RplhFl3hwHyVzCaf37L03a4SZrB
 1snNftprhZ/YnNLkqRwwDpsKNi0frRgTLY5y9QuvkwLUzAmKCwpQGAmhS36ESKTN9uL+86
 0gndDzXm8ZeKqsWX0At9LnDfjlxzFGY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-Vqp1wDzwPbS5CCdO1ghq-Q-1; Wed, 19 Apr 2023 06:45:22 -0400
X-MC-Unique: Vqp1wDzwPbS5CCdO1ghq-Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94ee1fc1233so185962766b.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 03:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681901121; x=1684493121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXwxlbEOdJy43W45D5Y/9ObwykEH7RvI3L4R4FHZKUM=;
 b=dflLtEAHnTbNLKR8rz8OW5FJYEjvyOav93NJjZ859VjQxcwt0AioK3jwssdW9rzEUt
 pMKyQwa5Pt++YD4nyCJ5kn+jyocyoTlLbBnJ7fW/BN6/DvTXqrl54+9gacznHGLEiwkD
 ubIhn+z8iMMlT7KH0o4sFDpf+pS8QEbJ+pJwZ7YLCk6nsDrb+/FQE8G3YrKpY+adhAss
 kBiNgNdBy0mtM9ci++xkBqj5GLLKqLGDeGRxTBkQFAzfQA2M7ZGNRD4V5gG6LWIra40l
 NSIGSZrV1RU18uHYWE6pXCmQf1iAm5sbikD3LBXEzEIaJFSIPfllY48FSaodOh8R8Psx
 oqKA==
X-Gm-Message-State: AAQBX9c3L/j7zzdCkma58pQyICBbq+NzTuRcBhhcFFIJBTfE17JvIcId
 jYb9HZ1CqExd5SAC+4P2r5UrbIUVTq/ap9nBFScOSmmcM9QOdKwqDd0Uvb37C7/xTWCHduNS2x3
 VNCveqQMmQX5vlJI=
X-Received: by 2002:aa7:cf05:0:b0:506:af22:1271 with SMTP id
 a5-20020aa7cf05000000b00506af221271mr5194715edy.0.1681901121575; 
 Wed, 19 Apr 2023 03:45:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ajohFHaQ0OTvM3DEmnNJb7sTdfyvlQZgh9v9KUkW6gXu2Yj6CPmd5QvHwkRx1anKE4ZifuYw==
X-Received: by 2002:aa7:cf05:0:b0:506:af22:1271 with SMTP id
 a5-20020aa7cf05000000b00506af221271mr5194701edy.0.1681901121249; 
 Wed, 19 Apr 2023 03:45:21 -0700 (PDT)
Received: from ?IPV6:2003:cf:d71b:cc43:1955:48c6:4ddb:556c?
 (p200300cfd71bcc43195548c64ddb556c.dip0.t-ipconnect.de.
 [2003:cf:d71b:cc43:1955:48c6:4ddb:556c])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a170906381900b0094f3f222d34sm5296134ejc.56.2023.04.19.03.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 03:45:20 -0700 (PDT)
Message-ID: <e4cc0882-c6e0-a830-45d6-e3aab398ab98@redhat.com>
Date: Wed, 19 Apr 2023 12:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
 <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
 <CAJaqyWegMfuc8s6bKdxdM4uVixmhy-F3xUUyOCYS1yGDXoiVZA@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWegMfuc8s6bKdxdM4uVixmhy-F3xUUyOCYS1yGDXoiVZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14.04.23 17:17, Eugenio Perez Martin wrote:
> On Thu, Apr 13, 2023 at 7:55 PM Hanna Czenczek <hreitz@redhat.com> wrote:

[...]

>> Basically, what I’m hearing is that I need to implement a different
>> feature that has no practical impact right now, and also fix bugs around
>> it along the way...
>>
> To fix this properly requires iterative device migration in qemu as
> far as I know, instead of using VMStates [1]. This way the state is
> requested to virtiofsd before the device reset.
>
> What does virtiofsd do when the state is totally sent? Does it keep
> processing requests and generating new state or is only a one shot
> that will suspend the daemon? If it is the second I think it still can
> be done in one shot at the end, always indicating "no more state" at
> save_live_pending and sending all the state at
> save_live_complete_precopy.

This sounds to me as if we should reset all devices during migration, 
and I don’t understand that.  virtiofsd will not immediately process 
requests when the state is sent, because the device is still stopped, 
but when it is re-enabled (e.g. because of a failed migration), it will 
have retained its state and continue processing requests as if nothing 
happened.  A reset would break this and other stateful back-ends, as I 
think Stefan has mentioned somewhere else.

It seems to me as if there are devices that need a reset, and so need 
suspend+resume around it, but I also think there are back-ends that 
don’t, where this would only unnecessarily complicate the back-end 
implementation.

Hanna


