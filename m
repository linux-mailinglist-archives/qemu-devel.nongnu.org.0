Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272AA43953B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:47:20 +0200 (CEST)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyRj-0006xD-7z
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyIH-0002Mi-CW
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyIE-0006ig-Kp
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635161849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76gqdk4WiyoKI0zW5rA1zMLxPGZgr9v8sHOlKK9TVMc=;
 b=P4Rx5a8qDN7+YbHLs3n7rlUIsRpF7clufOP+GBw3HSFKdXYunILTCaAhobS0EiJN0cCibL
 LOpi9QJeRKnlIOd7YGW4/L7aoymrtj/VytSy/tiJdZLHwIgjzw89j7FGo2qZzJe87+CAxA
 cYJqBxr1q1gsVisFn/NipRzqRLbq7xI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-_GxT13k9P2GDKzx6j4WlDA-1; Mon, 25 Oct 2021 07:37:28 -0400
X-MC-Unique: _GxT13k9P2GDKzx6j4WlDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso3399870wme.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=76gqdk4WiyoKI0zW5rA1zMLxPGZgr9v8sHOlKK9TVMc=;
 b=dVHcK4eFQ4jYN6TM5Z9cjYMQSqOnuFl7VDB5CZjHTycQ/Bd7waMTLQCVWqwgGqlI4Z
 sniVJ+RmMfkgLioeOGB0Jokfs9HOFLGptpFExzAKuYI31SSCfOqEjpMtcEFYMRFyyChs
 I/nJYpU9v/r1PSKCv21sfRqkxVAEZXlsMpyKHNYKZKya8+RnxKN7jT2did21oihMgRuy
 EyPoMK7OagNc6fWOI4fat94K9QIrvS3EeFy2bzh8bMRBjww9AzHC/ceaUz4zXQMKEbDP
 fTRV7Oi27PU2m3AWs9Mfa5GQRwgTLMc2gt7D7bDa5A1scyxG62ur6dRj09VzU17oXHFZ
 ehJg==
X-Gm-Message-State: AOAM530LfiGCBfSD4np/RkGxrPdVHHN5PRizdbqqqnDo1X3Bi0muZrJK
 H+J1o9SquRTrGcNjBDy756MY3pj9BTVOAeyVtkImuoxB9eK4/JVmTyJ1GFV0hV8hAcI5pQuoO1C
 t12lMBVRS3S4Kzr4=
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr7077538wmp.14.1635161846900; 
 Mon, 25 Oct 2021 04:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHbxcCxALDxlzjZVzIel1avkxb+w/sBxP3u/7VkAaPy+4PfiUvQdx2+Jy47bMDURtsVjFWxA==
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr7077463wmp.14.1635161846574; 
 Mon, 25 Oct 2021 04:37:26 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id p7sm16045269wrm.61.2021.10.25.04.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 04:37:26 -0700 (PDT)
Message-ID: <8bd4dc02-d6bb-7138-f3fc-81c1f83b0a71@redhat.com>
Date: Mon, 25 Oct 2021 13:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025101735.2060852-3-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:17, Emanuele Giuseppe Esposito wrote:
> block.h currently contains a mix of functions:
> some of them run under the BQL and modify the block layer graph,
> others are instead thread-safe and perform I/O in iothreads.
> It is not easy to understand which function is part of which
> group (I/O vs GS), and this patch aims to clarify it.
> 
> The "GS" functions need the BQL, and often use
> aio_context_acquire/release and/or drain to be sure they
> can modify the graph safely.
> The I/O function are instead thread safe, and can run in
> any AioContext.
> 
> By splitting the header in two files, block-io.h
> and block-global-state.h we have a clearer view on what
> needs what kind of protection. block-common.h
> contains common structures shared by both headers.
> 
> block.h is left there for legacy and to avoid changing
> all includes in all c files that use the block APIs.
> 
> Assertions are added in the next patch.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c                            |   3 +
>  block/meson.build                  |   7 +-
>  include/block/block-common.h       | 389 +++++++++++++

Can this patch be split in 3?

(first)

>  include/block/block-global-state.h | 286 ++++++++++

(second)

>  include/block/block-io.h           | 306 ++++++++++

(third)

>  include/block/block.h              | 878 +----------------------------
>  6 files changed, 1012 insertions(+), 857 deletions(-)
>  create mode 100644 include/block/block-common.h
>  create mode 100644 include/block/block-global-state.h
>  create mode 100644 include/block/block-io.h

Also consider enabling scripts/git.orderfile to ease patch review.


