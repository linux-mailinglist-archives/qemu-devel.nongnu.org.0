Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37242AF9D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:22:30 +0200 (CEST)
Received: from localhost ([::1]:35366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQAH-0001rI-ON
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1maQ9P-0000xl-Dc
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1maQ9L-00022N-S9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634077289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ka8EX7FV99ACVJtdYujqfg3fCxvyoeJikXX1mf0+6Z0=;
 b=IABWFBcHx0qjMA8s9oWHsmRZ71sovEmjAbt/sQITO2C+xOiqMQX2cucJcgq2E5A/gAMB2r
 ki9G/kGSDA2u1gUdCrxg1iZ1LHqL9tmjVuzZfdjmolLDaHgov1g0EJnWONj8bd9e9AIOQg
 AIKzFcG54c/vSDGo2My+yhS5nHcGhpk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-Y3aO38OXPjyI-9mluzxpAA-1; Tue, 12 Oct 2021 18:21:28 -0400
X-MC-Unique: Y3aO38OXPjyI-9mluzxpAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so434424wrb.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ka8EX7FV99ACVJtdYujqfg3fCxvyoeJikXX1mf0+6Z0=;
 b=Cr16p8bRi9PWODSiPvCaN1ui70nyyJOec1eo5rPh2I4ytOM7p6Y2KHkvu3SFnP8cGe
 8RJXUUOyD4k4TvPhL9D8gh/hI/QNFU3NuDmAvqN69O8G44fgwyg/bthvlIezWnOxxExC
 0Qa6kOjtBVlQqj1IqzzXwwTj/srGvn9Iph7y+CLqei329VlaESEQP5qjvV4w65aDu6pq
 EenG7a5H41ARqddzuXp5eBmx2jKPb9WOHv0+WiS7oZRvfEXjkmY04ZqslEwrmWFKwS0a
 RG78VJASBcdUfdVjA7Dyv+vVmCr2kQ6XOSfpPU3nOESO7oruwETPNJ3df2jiBfukvkS3
 81wA==
X-Gm-Message-State: AOAM531WvS30D3ohcfPhyuRy0PmFQTS4CmmyWVeV2UsKZaIMFEMPqDvi
 BB7/1aZxHvQx2s3apcYvPlCXTRZRPRSxKCb6kJIr6+/bSQulz4sBsHTTTgITrbVAs6KO0GYWgoH
 q49Rm0Y5yNQJaCl0=
X-Received: by 2002:adf:a310:: with SMTP id c16mr34802306wrb.319.1634077287588; 
 Tue, 12 Oct 2021 15:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpJLs3oMFBsxhGcBh/yego2FLpmsDmJr8LEgO1el0TDmET3DspNnVppJEM2Osm9HT+QvH6Iw==
X-Received: by 2002:adf:a310:: with SMTP id c16mr34802286wrb.319.1634077287399; 
 Tue, 12 Oct 2021 15:21:27 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id l6sm3906992wmg.10.2021.10.12.15.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:21:26 -0700 (PDT)
Message-ID: <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
Date: Wed, 13 Oct 2021 00:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211012155001.811160-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 17:50, Eugenio Pérez wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
> 
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  include/qemu/iova-tree.h |  8 ++++----
>  hw/i386/intel_iommu.c    |  2 +-
>  util/iova-tree.c         | 10 +++++-----
>  3 files changed, 10 insertions(+), 10 deletions(-)

> -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
> +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
>  {
>      DMAMap map = { .iova = iova, .size = 0 };

You missed this one ^

With it declared const:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


