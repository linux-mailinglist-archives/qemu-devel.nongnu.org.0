Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA73397239
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:21:24 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2SZ-0006dU-RR
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2R8-0005Rc-I4
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2R7-00050i-6W
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622546392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypM71I9ngkzyVJ8KfIKx0MNPd1cKehC7qgUHI7ziCDk=;
 b=PUvOYUrVlXDVHVp96Eag1e75JKMuEbt/JxoZyKGOhbcKXfEYWZjfDu7Q4Qwz2icnSRUijD
 mo5hG/z+nubmvX15gsqcYw+AkZdKynIWcserbhIiu1KgUVEah/iKaWwrKwasCPBMOnj1jz
 4s93SDKMThSDfjwjAjy9atRfWffEZUg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-3dRUy0pWMLCvyexvm9wbvg-1; Tue, 01 Jun 2021 07:19:50 -0400
X-MC-Unique: 3dRUy0pWMLCvyexvm9wbvg-1
Received: by mail-ed1-f72.google.com with SMTP id
 dd28-20020a056402313cb029038fc9850034so6106096edb.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ypM71I9ngkzyVJ8KfIKx0MNPd1cKehC7qgUHI7ziCDk=;
 b=hAdBgrCLE3ojDCa3ubIBxaJGGNWkmMPbYgO65iXZ9baSMry1OtX6lVTLWdIv+uCjg6
 sD3ShLUueIcAkiVH5Yys8LwP6NlcgLn7QQzvlpQEPoEff7j9PJWGbUbcDdzC7voEYlLg
 85yTdsRzL/u5eSOWxXybVD8Rb5yYAki4D5EzF+Z2vBRqYwMsiEPXBYTlFvBTRkwg3P6H
 UoLf+SNZ6STM+CJPjgSJKX64jtv8yk6L6cW66IRk0ITtjNuyIoh8R8Et3ZRi/AyJfcLw
 FXOgTBwo0TvtBHOx9GNDpX39zO6aXw4zao+9uwW06sgeA2Fknt7PfAjnWMcnLVqRkKeX
 mWtQ==
X-Gm-Message-State: AOAM532gzSRIyqg97aqqH8kc2PmcHa7cYw+ZWASqrCEkYONZZiu6PEAc
 GSYx7Ksbyzb0m85F8aAlF/b1pvF9O158qRUFctG0niQxoB7So1hE0TiQl7b6UaJ2hdRg6FvghCu
 TxKY10ZoYxivMRv8=
X-Received: by 2002:a17:906:14c9:: with SMTP id
 y9mr15516305ejc.192.1622546389771; 
 Tue, 01 Jun 2021 04:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJZDPIBDZwnmYRcJ99wLgG43KtVP2Lde1uoZ+W9CQWHIRsc+qB8sS5vE2w4rb8+63VnsaNRw==
X-Received: by 2002:a17:906:14c9:: with SMTP id
 y9mr15516273ejc.192.1622546389528; 
 Tue, 01 Jun 2021 04:19:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f21sm6295185edr.45.2021.06.01.04.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:19:49 -0700 (PDT)
Subject: Re: [PATCH v2 29/33] iotests.py: hmp_qemu_io: support qdev
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-30-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2874d95f-d98b-1c9f-a3df-e8545e25c143@redhat.com>
Date: Tue, 1 Jun 2021 13:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-30-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


