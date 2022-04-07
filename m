Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2184F7BA5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:29:58 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOSj-0007p6-Mx
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJv-0007Y2-At
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJt-00065u-N5
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDuPk30+LwV/Sp7lKCViVThexPD3r2tmZmJj/uhvbwk=;
 b=eJYLfP5fjluhBHUVfrSbS4SZpK45GvKVWAc5wc8hoRfapOFzQE3G3hGZoFYyEL5h8gj8hJ
 hHbm1AI2arXrMIytacQDIThkJOo1dRpdfcld8KhhcJDlvBtsNZj0BqGC9J6SgoQQYShQKa
 hmE3RG+hzPYJSY/QkVQWPmXn8ztb7SI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-EaA41wL5MxyhoXVmFZ2zTw-1; Thu, 07 Apr 2022 05:20:48 -0400
X-MC-Unique: EaA41wL5MxyhoXVmFZ2zTw-1
Received: by mail-ed1-f70.google.com with SMTP id
 bc9-20020a056402204900b0041cc2b0bff3so2635013edb.2
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NDuPk30+LwV/Sp7lKCViVThexPD3r2tmZmJj/uhvbwk=;
 b=q42l+5TH8r719JoC+wCN5n9nDQZsfNw8okLku2vmTJngUrRF5U0C9ivM0uSok8/OvY
 De/mWOpK2w7tM/70jvHdR0UdC9zG9OBFw6SdFE7yNcpLuOTE4fQE14Qiqbi1P8lvWpl3
 UapSMW4LjKIKJJR76f04wsnWgNSDyDeN5aKL3s5JYJ7siC0lRMru5eiLawxj2m8HVFAT
 Ieed016zgFOc2THCwTQv5Kskf+7ZI2BrJj1yCAEYVaydcR//8OvSp4XGpqZftluohH/2
 FhtzFQZFD5LRgeZuJ+Phw7OOMll6F5umk33z1nKdTWhGYWb476nXsQBID71QQzBFcwVZ
 rGoQ==
X-Gm-Message-State: AOAM533S0BBn2nH++/Dode+/A8LoIHxGWYgEbrEkFH3c+qy6pdB4JSZ/
 isJ/SA0TWEqwbWkyY2CaQ3RAvKClmfGlofd4gZnBxJy6uxHutI3HQctaxekq+xiq5HsW8s465aW
 qaqo+SSD2OlHO3Zw=
X-Received: by 2002:a17:907:6e87:b0:6e7:f655:3b41 with SMTP id
 sh7-20020a1709076e8700b006e7f6553b41mr12126528ejc.704.1649323247088; 
 Thu, 07 Apr 2022 02:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdr9YSNf+AXiDn6sgGPfM/8iIKOH5ZccdSGbT+YmP6juT9mcKgqUCmcLaeWQWAkLJyC9Nh7g==
X-Received: by 2002:a17:907:6e87:b0:6e7:f655:3b41 with SMTP id
 sh7-20020a1709076e8700b006e7f6553b41mr12126514ejc.704.1649323246884; 
 Thu, 07 Apr 2022 02:20:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 sa32-20020a1709076d2000b006df935924c1sm7377480ejc.59.2022.04.07.02.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:20:46 -0700 (PDT)
Message-ID: <d64d14ee-b255-15ee-679e-7bf4117b9065@redhat.com>
Date: Thu, 7 Apr 2022 11:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 6/7] block/copy-before-write: implement cbw-timeout
 option
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-7-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-7-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:08, Vladimir Sementsov-Ogievskiy wrote:
> In some scenarios, when copy-before-write operations lasts too long
> time, it's better to cancel it.
>
> Most useful would be to use the new option together with
> on-cbw-error=break-snapshot: this way if cbw operation takes too long
> time we'll just cancel backup process but do not disturb the guest too
> much.
>
> Note the tricky point of realization: we keep additional point in
> bs->in_fligth during block_copy operation even if it's timed-out.

*flight

> Background "cancelled" block_copy operations will finish at some point
> and will want to access state. We should care to not free the state in
> .bdrv_close() earlier.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   qapi/block-core.json      |  8 +++++++-
>   block/copy-before-write.c | 23 ++++++++++++++++++++++-
>   2 files changed, 29 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


