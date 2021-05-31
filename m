Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A13964A1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:04:17 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkOl-0002UK-RQ
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkKd-0007Ym-Bw
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkKb-00071d-Kb
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622476796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se/ipcekoXKcShS02ly9NWqiI5Wwq/ZWT0V//b2MGWs=;
 b=SZhJ13FBIMHNKXOEzrZXjM96C2B08ATjekLwN6jcMAx9BaFK7ZprMWeKGoohuUn4bIj419
 5LDwgCQMb+Gt1Objk3LxUmODmCdtZrQg4TVFxU6BwKTOxyIQ12X2HcmA2G7E6yhXjDcneG
 5yBU9YWt2aek2hhWFI+uzHTaIY8in9Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-If75frYaMEmTWyhaJlA3RA-1; Mon, 31 May 2021 11:59:54 -0400
X-MC-Unique: If75frYaMEmTWyhaJlA3RA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s18-20020a0564020372b029038febc2d475so735927edw.3
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 08:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Se/ipcekoXKcShS02ly9NWqiI5Wwq/ZWT0V//b2MGWs=;
 b=IvQTfhAECemijj62cwpzcgyxGV/l6MPWJOO8MWT6AJjPSO5hNWdHuXjqhekL7+G+mq
 UIUXiISBNgDwbWBGc0GpLlI5WUDcX9GEn863JY7dhfIQxgNydFxuQ926pWis2uwxMoOF
 Nq0XvpePhbc/H5jJfKpYvG6aWi7LYmYEKgIcDQrgV93cuIym1rlzYvL3oR9EAmcM76UQ
 iWrjoBhIZjGKYAeyTdNCLAsaEnN+oQooZ8z3VT9NTONvkQMi6TZih/j+nvMBpSkBqlcz
 8Zbp4Vr0f9n8IPXvJYUgAMw+sbObE5sRUATJH4zz3UDC54RXWLRr0/P7XDyl8zmCvS3J
 2lMQ==
X-Gm-Message-State: AOAM532NvMHywF8Nv1/xi3Apm0MzV8Hzd8+NixgeM1iydECky7H5Z0jD
 UodFkF+/XZJmpWA9aAwi04SjkNxAn5xfMxunHMMFKIbgcRKiAf2bEjSa6HuojA9w090FWgPJ+JF
 2LlcDRPnWQoVabnE=
X-Received: by 2002:a17:906:6d43:: with SMTP id
 a3mr23705040ejt.142.1622476793631; 
 Mon, 31 May 2021 08:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9+KYFfvPmNcAu3e45xLH8VbOKZq02/qwEUmFg1eWvl/tZCajUGaNXlNbs6XY0bStAT20/Q==
X-Received: by 2002:a17:906:6d43:: with SMTP id
 a3mr23705015ejt.142.1622476793471; 
 Mon, 31 May 2021 08:59:53 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 r4sm6113470ejd.105.2021.05.31.08.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 08:59:52 -0700 (PDT)
Subject: Re: [PATCH v2 06/33] qdev: allow setting drive property for realized
 device
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-7-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <977f7760-7bd2-adcf-f368-90d2c66067d7@redhat.com>
Date: Mon, 31 May 2021 17:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We need an ability to insert filters above top block node, attached to
> block device. It can't be achieved with blockdev-reopen command. So, we
> want do it with help of qom-set.
>
> Intended usage:
>
> Assume there is a node A that is attached to some guest device.
>
> 1. blockdev-add to create a filter node B that has A as its child.
>
> 2. qom-set to change the node attached to the guest device’s
>     BlockBackend from A to B.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   hw/core/qdev-properties-system.c | 43 +++++++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 12 deletions(-)

Tentative

Reviewed-by: Max Reitz <mreitz@redhat.com>


