Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C914EBCF6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:50:56 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZU2Z-0000Em-Kk
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:50:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZTuU-0001hr-Rl
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZTuS-0008WR-Nk
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648629751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IF5ndeDzoknGfsHxOtnPOMKflxfReumbasUw1yPte+8=;
 b=JkGm1aJspOQF1XYmskZlEbNntQWkpbNWckHuRJfO7yiLe6jpWi4fYKGbKZNnHNT9MsluNj
 kaojbm909BlYLBNpScUG/UU+GpRI3tblcUTD4QIBUgovZ1XpU12Xifo3k1/jvnDVa6d/pb
 nN9tLnrLI6njzFDwfIu/WF/kTe3EWao=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-AI1mF-_GOB29FRBeih2bQQ-1; Wed, 30 Mar 2022 04:42:30 -0400
X-MC-Unique: AI1mF-_GOB29FRBeih2bQQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso7602423wma.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IF5ndeDzoknGfsHxOtnPOMKflxfReumbasUw1yPte+8=;
 b=AK5wGzdyoRlFhz3bdY8Xb9Tcxge5P6fHGrVeFr8D4w4MrC4+RXLQK+gxHXPB4rguvk
 QJokWgOPG7r38y5UMnfV470oJZrKBHsc4pyPbRPCBChkeS1/qWel9mIme4XoeUMhBxiA
 K3sqhGSwnqBH9ggpCJMCyN3hfR6pAqc/fATbF75jp0GUGWJeR4mZESiV7ZFZxdnnKVni
 wDVMkBO7/U/tTiL1WRUsMGU4iuzWmgjLXd6QCmTpkj1uvrR2QinEXQg4d5wl/UVD1ZtN
 DG8L83Q7yAP3ppCxcwq4xJhISbCQhiGYHyA0qf5zQRfIXeqsR0ktF0BYOvJvi65BC4Q2
 7bZg==
X-Gm-Message-State: AOAM5327G7MGTQp7nr6WbiWILAvzfWzFLeWbnpl9Q5ChHHmDjNzSCE+H
 wCPIVDLYrr91i/H7nolT0Rda9ftqMFilH0xK4kkP2FGO4MAnB24ZypFehDHjwL2sk/Z5r+eSZKa
 iFvx8/f3HxyaY4ls=
X-Received: by 2002:a5d:64ae:0:b0:205:908a:2bc3 with SMTP id
 m14-20020a5d64ae000000b00205908a2bc3mr34725309wrp.437.1648629748881; 
 Wed, 30 Mar 2022 01:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh3Ruzk3ctrES04H0I/mJH/9Z6Twci81xmOIobsWmfuACYMm9CulxU9HimsB3ycnXAtSm18A==
X-Received: by 2002:a5d:64ae:0:b0:205:908a:2bc3 with SMTP id
 m14-20020a5d64ae000000b00205908a2bc3mr34725276wrp.437.1648629748551; 
 Wed, 30 Mar 2022 01:42:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2200:178b:7244:2a1f:b5d8?
 (p200300cbc7052200178b72442a1fb5d8.dip0.t-ipconnect.de.
 [2003:cb:c705:2200:178b:7244:2a1f:b5d8])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b0038cc9bfe6a4sm3954985wmk.37.2022.03.30.01.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:42:28 -0700 (PDT)
Message-ID: <50b39fbd-c5f4-d080-3cc1-f6e4c27985fd@redhat.com>
Date: Wed, 30 Mar 2022 10:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC 2/8] numa: call ->ram_block_removed() in
 ram_block_notifer_remove()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220323111727.1100209-1-stefanha@redhat.com>
 <20220323111727.1100209-3-stefanha@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220323111727.1100209-3-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.22 12:17, Stefan Hajnoczi wrote:
> When a RAMBlockNotifier is added, ->ram_block_added() is called with all
> existing RAMBlocks. There is no equivalent ->ram_block_removed() call
> when a RAMBlockNotifier is removed.
> 
> The util/vfio-helpers.c code (the sole user of RAMBlockNotifier) is fine
> with this asymmetry because it does not rely on RAMBlockNotifier for
> cleanup. It walks its internal list of DMA mappings and unmaps them by
> itself.
> 
> Future users of RAMBlockNotifier may not have an internal data structure
> that records added RAMBlocks so they will need ->ram_block_removed()
> callbacks.
> 
> This patch makes ram_block_notifier_remove() symmetric with respect to
> callbacks. Now util/vfio-helpers.c needs to unmap remaining DMA mappings
> after ram_block_notifier_remove() has been called. This is necessary
> since users like block/nvme.c may create additional DMA mappings that do
> not originate from the RAMBlockNotifier.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


