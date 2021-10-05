Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E651E421F8F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:42:37 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXf5x-0004FM-0n
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXf2X-0001pS-It
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXf2Q-0007KZ-TG
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633419537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bIg40p09ZCVFUx3DRVjct5fzGwee/N2Z5DzlQvt6gE=;
 b=CKWKxJBrKYbArvlelr2weqD1LTBPfgVsRHZG0xtsz7jvLX3SYD1akOUCav5zRYJEOEAaZ9
 CPP0mrUvvh7YPXXKqKZModBlthg5x4/dKFMWMNvu8222eMFEpon29YRODXGM4oMbulbbw4
 igYFCSJ2kr+xpb5WsunSMMs4HYlXUHc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-lW7QmouXP9-WhzJSBbmI4g-1; Tue, 05 Oct 2021 03:38:56 -0400
X-MC-Unique: lW7QmouXP9-WhzJSBbmI4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so5410857wrt.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 00:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8bIg40p09ZCVFUx3DRVjct5fzGwee/N2Z5DzlQvt6gE=;
 b=c11qFU4Jkewo5FKpufq+6gy3Akxx3+xgtKG2wsgqxy6IsLoUvDG9BoP8CRI4altIae
 iHFFHH8lmxk8tx3G9+mbnlMwzMj8g6VD8gJhPnTQJ6+jLN3KcAB1fAbKVu9kfOWwtAuI
 CxoFY8avlzalLzS3mlSKV6tln6HNknK2Hjab6Lk1jXMO1UdwQ/b57XMQ+O4MGmJodcml
 H6a46yMES4YvhRlKF0BMorMQA3eYZ4LS+wKxcgnRVHkt3Lqc2osgbss2O8WZ97ipV7tf
 yd7Os7EBZmmO9cfAjRnmN7TW8L98+5xqLZ4QA/KaAp67qbvy+FbxKuJalLsPZKMV4wXS
 fl6A==
X-Gm-Message-State: AOAM532zPsUPGOqyiug6qu9SDoF2f7WVoS7Hj4/85jYCkeA2IcFAAGa0
 xHr4pMM+T3Cty93yHP2EQfu11X8RvfnFJ5IXZQD7dhHZ+n50t1IY4e8gsh5uM2BSxCyxl/5MG2C
 wb1RHzJ9YTsaSps0=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr20112082wri.140.1633419535489; 
 Tue, 05 Oct 2021 00:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPdlw1NMM6CLJf4QK6KKdb1PzLD9UTYVgV3gyFru/YtFSdRd1uIkR0H3fvL1VNWJJibxIwtA==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr20112042wri.140.1633419535216; 
 Tue, 05 Oct 2021 00:38:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6741.dip0.t-ipconnect.de. [91.12.103.65])
 by smtp.gmail.com with ESMTPSA id
 o12sm1046196wms.15.2021.10.05.00.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 00:38:54 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <54ce3304-ee62-4e95-eb4c-7ea1a81f30a0@redhat.com>
Date: Tue, 5 Oct 2021 09:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1633376313.git.qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 Greg Kurz <groug@kaod.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 virtio-fs@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 21:38, Christian Schoenebeck wrote:
> At the moment the maximum transfer size with virtio is limited to 4M
> (1024 * PAGE_SIZE). This series raises this limit to its maximum
> theoretical possible transfer size of 128M (32k pages) according to the
> virtio specs:
> 
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006
> 

I'm missing the "why do we care". Can you comment on that?


-- 
Thanks,

David / dhildenb


