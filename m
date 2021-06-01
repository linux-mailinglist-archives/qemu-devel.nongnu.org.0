Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32493970F2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:07:45 +0200 (CEST)
Received: from localhost ([::1]:39152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1JG-0000mE-UZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo1HJ-0008EZ-3c
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo1HC-00007M-V2
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622541933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aItQ+SPvSmqddOBoT4DtFEfdGn7KkexU+UGdWfOr8AM=;
 b=fp0qsJsY1BNPne5i4F5XUQEfO+9v/4nabe9Llyje6IDbNde3Sag/wOUaoAT7l2vNKktOI1
 LOdYi9gm4A99Z83fqvE7AFLLmf8DGhLdvzD4rd28CprmqCSAh9r+XahLPi8HLclJeZ3bBO
 kNEKP6HcmUukALoqpAAe4fhg1CjxtH4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-6m9fPuBJPu27R0CEOAU6hQ-1; Tue, 01 Jun 2021 06:05:31 -0400
X-MC-Unique: 6m9fPuBJPu27R0CEOAU6hQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso876158ejt.20
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aItQ+SPvSmqddOBoT4DtFEfdGn7KkexU+UGdWfOr8AM=;
 b=emipyha+Ulv3h1PueQ606wUf2CxcuYDEcBu/2gcDkRBZceEuPOQZQwHf5QO+TTRzMf
 /mFmxu2V97MEbvchu4VTZsO3WcX4bUfyZ7ni1IWNztwaDrKHSyj2p8mQGVqFet4tpUli
 84MYCzMR5oe4wtTPB+OQd8UbgDjJ1ocBV90DH/B16qkJZabQbkNa2FPWy55KQ22E7gUN
 Sod9ggQ1Xg4MjTRVmcVqWpD444Om4gYgJLbQdly+0+g47RGKKHOi0gKjGISyod3DEQ7D
 v+Ekk4SxbVP6FOiHiklT7d+W554lZoOf/+Tw1LGLHA6Nq4FYWk2cvq9JL8oD03poIn1U
 wnSQ==
X-Gm-Message-State: AOAM531yAjhnHqrUeErtzhduKFrTc2ieIzWbRfmDaRom8Uzb5a+ietLJ
 xi8OrF1QFCbeoBNIGi/lyh6i6Dq+VO7U+t79F3gxvnEYe0HAV/jAe+WeSTzxBqhqjljetTQ8AUj
 t9CyhC6pVlVcEypI=
X-Received: by 2002:a50:d54c:: with SMTP id f12mr30891166edj.301.1622541928865; 
 Tue, 01 Jun 2021 03:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2y2mSkPSG7BwPbdj4kyuBvDx6aX7pGF2R2Kfg1COiJvxwNRGXZpYfr8CRt3u4EZHPN6SZLQ==
X-Received: by 2002:a50:d54c:: with SMTP id f12mr30891144edj.301.1622541927782; 
 Tue, 01 Jun 2021 03:05:27 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 gb27sm491925ejc.18.2021.06.01.03.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 03:05:26 -0700 (PDT)
Subject: Re: [PATCH v2 23/33] python/qemu/machine.py: refactor _qemu_args()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-24-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <adce53b1-a5f7-a085-3ca5-ad113e759e48@redhat.com>
Date: Tue, 1 Jun 2021 12:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-24-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
>   - use shorter construction
>   - don't create new dict if not needed
>   - drop extra unpacking key-val arguments
>   - drop extra default values
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   python/qemu/machine.py | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


