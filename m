Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F4470409
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:39:56 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvi03-0000mn-4d
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvhyD-00077j-3y
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvhyB-00025a-3A
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639150678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KEdH938fQqCm5FoWHJ2dRY/QfDwqbZNtf7rV6cotQ0=;
 b=MYsECqQtIFmRuM2K3foI1ns7u57WkqmH4nTZC6FR1VcuAMpkppbUEs2yzBI6Tq6RC1zt3t
 qPjgO+fKEZ7R9wGtc8wujovmJO4GSSwIKP1dv//Arif39H6mhFwkLvi7ZimxZf7YNCsX7J
 tCVqZLQ/PE35KHrWuc/SzZoKf9OhF8Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-BYCYdDj_OMuLVtovbBAJyw-1; Fri, 10 Dec 2021 10:37:55 -0500
X-MC-Unique: BYCYdDj_OMuLVtovbBAJyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so2436761wrb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4KEdH938fQqCm5FoWHJ2dRY/QfDwqbZNtf7rV6cotQ0=;
 b=vJhVMNTRkig82lzGcIw4MTMf9ROWIcUyQw3iXE32Ml7w7DyZomsxidPm1mvmt5stNT
 /dP5PeQsBnRmW2EH/XHJusjZEsMXaUhqXYLYyv2wOFaubN90e2gN4g8KjWb0hvgXvlPU
 tjoe67NsyTuKD96edajLnD/MpQPhJH74ZoIQAbyGt+vEZnB1/qQDboq+gPegXoixsQhK
 7SRm4N7Av03l+9yLYDVpnyVGG+zRQ7ehXLUrrwpMXvCTA+5OLG90k0LluZQKfZNMeavj
 c0GPqTR5b9rJD/nsXUDfOKqzLcd2pD+z9ev/w42yNRw9SVEKME23m/eCL0e15akjyjig
 k4wQ==
X-Gm-Message-State: AOAM533qcHVhqn6DGs6cuhlIBGNhjBFEAz7Oba2spicMP8r1/bJUOola
 4AqTAfhfIVki8OUNynxr4+kvbuz1t77QwdY6mOTp/JpcdUQy/MLwL3D+1mT7COOkrpjlAKGNmC5
 0IflyywXg+Rd+Gcw=
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr14608990wrn.218.1639150674819; 
 Fri, 10 Dec 2021 07:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVlOzKcOOFIm31qzz9QVWLVkWhVbetAZkPx0VbozwPORVhxPTKC/pr9wTida6sbWRyxDH4Xw==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr14608957wrn.218.1639150674622; 
 Fri, 10 Dec 2021 07:37:54 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l4sm2782130wrv.94.2021.12.10.07.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:37:54 -0800 (PST)
Message-ID: <d6d4795a-1940-987e-429f-0622e761adeb@redhat.com>
Date: Fri, 10 Dec 2021 16:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 06/31] block/block-backend.c: assertions for
 block-backend
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-7-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c  | 83 ++++++++++++++++++++++++++++++++++++++++++
>   softmmu/qdev-monitor.c |  2 +
>   2 files changed, 85 insertions(+)

So given my thoughts on patch 5, I believe that blk_set_perm() and 
blk_get_perm() should get assertions here.

Hanna


