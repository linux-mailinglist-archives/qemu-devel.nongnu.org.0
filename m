Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B73D3D24
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:07:38 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xi4-00004u-R9
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6xgr-0007pq-Pz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6xgo-0000NZ-GE
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627056376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNHQKzMBw9gAa3K6cK1mThPt/nVeNYM7N8QaZsKU/ac=;
 b=NqcQ0l4HviEAB8gw+gXPIbu/GuI6d5zmxVnqAtWP2SnQug4iIvPnC34j2e2kO6uHgaaZN0
 11TnqyYMYYEK0hXQ4B3kkngwWKfMPR+EQzb/ihD0cVsjcuDKXh4Xag7AhGp0j3NUHTHTmH
 lGPHZi2qReOHjNofEntp6o9p3NVX3ek=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Pq6B2zMLNRO5oiS05wf-jQ-1; Fri, 23 Jul 2021 12:06:15 -0400
X-MC-Unique: Pq6B2zMLNRO5oiS05wf-jQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l10-20020aa7caca0000b02903b874f26036so916137edt.20
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZNHQKzMBw9gAa3K6cK1mThPt/nVeNYM7N8QaZsKU/ac=;
 b=Pc8Tld2XuJvEFHJw9QaCA2XEw9t5+YL3cBD9Ts68ogYJgBVj2lKeol6++YQ14f4hMy
 3hBx1CllDue9AH0SC7I1xix/jEDFqElTXQc/XpMSePte9J3L9ue2q6kPHC5c1oyGI2YH
 c73dEAqfRbHkGwEapMtSlMD0dri9LJu0YEmW5RCqKKZapThzYz5nlaJQ2Uhz9+Texa8J
 QUXp/k4rVvx7yR9bYE+6Kbs1blDhYF4h+vbtAb7frmHNMdVK/2lAaDfRMbaZFUa9qkW0
 5qXBpYfkTEwP85V+cNyhBa5vuhnZWL7/7MBZD3a64i5b5n7KWyf9VRK+MrIwj4GS2My7
 MmYg==
X-Gm-Message-State: AOAM530kSDF/vmDhonwwqpK75bJRthtaDCPZ/mNktZxrKu8Oc/QHfZPY
 YohFt+bxBK5tS6YcDPEzUMmakQ+6q7EXSHdc+hBpvVCtgMtRWK4EZ6losTQyPKeODl/n1B4+2so
 rjiAng7WQtTL6m54=
X-Received: by 2002:a17:906:c055:: with SMTP id
 bm21mr5392997ejb.350.1627056374050; 
 Fri, 23 Jul 2021 09:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5mmtTAKPI6Z0ZvWKGNLBjcLopIJ6DUuns6DRhOuciXnfFfBypqFVUpJtJrlNbh/rtgfkm3Q==
X-Received: by 2002:a17:906:c055:: with SMTP id
 bm21mr5392977ejb.350.1627056373861; 
 Fri, 23 Jul 2021 09:06:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id hd30sm10754905ejc.29.2021.07.23.09.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 09:06:13 -0700 (PDT)
Subject: Re: [PATCH 0/3] MAINTAINERS: "Host Memory Backends" and "Memory API"
 updates
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210723100532.27353-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb02918a-2064-1b91-66eb-af6d3c0d5499@redhat.com>
Date: Fri, 23 Jul 2021 18:06:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723100532.27353-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/21 12:05, David Hildenbrand wrote:
> Some maintainer and file updates for "Host Memory Backends" and
> "Memory API".
> 
> David Hildenbrand (3):
>    MAINTAINERS: Replace Eduardo as "Host Memory Backends" maintainer
>    MAINTAINERS: Add Peter Xu and myself as co-maintainer of "Memory API"
>    MAINTAINERS: Add memory_mapping.h and memory_mapping.c to "Memory API"
> 
>   MAINTAINERS | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

Queued, thanks.

Paolo


