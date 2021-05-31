Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCF39644E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:53:17 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkE8-0005hh-Iu
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkCL-0004Cp-AP
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkCJ-00039v-Pa
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622476283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMYJY6XEOWPgXwMnSmMSD7Bfa+p2ws4fuWnZDjvXPLY=;
 b=YYYP9YXcHOYRn6NbXGULMoBIaS8mCN1owNtbee01MU1SUnxwSkcgVVBEg7LdOD86ui9WSd
 XJYTVM7uE4Dk4wzonjFh1TjVD3Ii6/bjHpiTjZpL9Ya9kA7Ay9tBwxd4UD0VeEU56jPUbW
 DXdykHCRQyrqw4AjevEMA1cv58QoO48=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-P0DaeR99OuyCaC4lMjbDnA-1; Mon, 31 May 2021 11:51:19 -0400
X-MC-Unique: P0DaeR99OuyCaC4lMjbDnA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso2876177edv.15
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 08:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tMYJY6XEOWPgXwMnSmMSD7Bfa+p2ws4fuWnZDjvXPLY=;
 b=DbnnWftsiMAH0KSRb+tnMhoANK30SRRmYRQa+GywxIOVajC4YPuBx46zfQj6gcjRjh
 nFpwy4fmvkgaPtljelECEvrEQQZ+u41AifqclkdoI4EaaA65H++fIS3ibGiCo73qhfQE
 TvnYyWSqnDUIalnwDudcueyr+VdxygE41AgSqIYVIIsX6Q66Tn5I6WSAeGuaaZVD/yqL
 up09jE5xHN1XDID1bTzJnXNySJacl40TnRNQdcf+BwmtCIt7Q8MJvdtxc+VaSJmdWqm9
 AQFosmUBG2fgZSvBH14Mf+q+Dw/GPQGxoO1/6AXB1gDnJ1QBkrrpmc75rX99bpMm2Mw0
 S3ew==
X-Gm-Message-State: AOAM530npO6CwJWfvF/ffAb+khYXSjBmgjNXE6olGDjoZguRSTWpxGuN
 Rr7bHof8/X/Z2G6A/lu3dP8xslLYVNiCLYBvCd9ctGIGZj/oAaefVxJovP0RCpqdBMMbEyFMdl5
 8+Di+qJOShR7UU/k=
X-Received: by 2002:a17:906:51c7:: with SMTP id
 v7mr24106024ejk.86.1622476278294; 
 Mon, 31 May 2021 08:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziBTkwxYPKynQTe803OK4aeaD5uFBiUam4M9s9R6neGE7g6ocQyobATgOWQx3G6oiIglulig==
X-Received: by 2002:a17:906:51c7:: with SMTP id
 v7mr24105990ejk.86.1622476277956; 
 Mon, 31 May 2021 08:51:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 i20sm6973980edr.94.2021.05.31.08.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 08:51:17 -0700 (PDT)
Subject: Re: [PATCH v2 05/33] qdev-properties: PropertyInfo: add
 realized_set_allowed field
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-6-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <bf59e90b-88a1-15a1-cdd3-dfe2e5f98802@redhat.com>
Date: Mon, 31 May 2021 17:51:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-6-vsementsov@virtuozzo.com>
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
> Add field, so property can declare support for setting the property
> when device is realized. To be used in the following commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/hw/qdev-properties.h | 1 +
>   hw/core/qdev-properties.c    | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


