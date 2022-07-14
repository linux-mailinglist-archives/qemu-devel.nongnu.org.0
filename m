Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FC574A83
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:21:38 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvyT-0000Hx-Qb
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvtQ-0003fu-52
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvtO-0005zH-6n
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657793780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4atXjMp33bnLHDD2zeM+Mi769Y3G1kIQZ7sy/QyQLyM=;
 b=GgZ1MpsjJqmqtAacpnGL6d+mgzStYhM37LRBZ0pA7eXUAoui2n8ZoAPJrKvaiqqWtq17wI
 CPX4U/YZh2bv9Kkcl/XFajek5FFKq+kaolgZI+WvhFyN27W4gG8lSZbBLm5EduziSRToJZ
 xl7At4+PS1jm5D04dvsVlCcJJc1jn70=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-Ss-h-lClOWWU-lsp5s1J3w-1; Thu, 14 Jul 2022 06:16:18 -0400
X-MC-Unique: Ss-h-lClOWWU-lsp5s1J3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b0043a82d9d65fso1245155edb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 03:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4atXjMp33bnLHDD2zeM+Mi769Y3G1kIQZ7sy/QyQLyM=;
 b=A79woJhI9uQL9ysbhH9+aQzNdU5zzH8u+msdlxiT12OEtUXlYzcIwUpoTITKLg/7uQ
 gSeosOMd+cZE2uxKaoRtjHSOwtuW8ZthuADmARTUBNe5F+CyKjmaQbwfqcTJr0gnTbez
 mdJ091BZC8WANIcpYgM6UjtI45ArARL8NrttQq159tHr42qpPCmFISJKqAxVtqsF2Jw5
 jI+/DrVZcOw+V14k/ynl3lCgndN5rP22daTrrZTjjahiEa5yA/pTO5fK1tu6drNA7x/1
 86XhYSEbSjbykSQ0CxazozMIRZOqrucAFlVw9GkPMrzovINNBTleAHk3RP74nTqpM3Qx
 ms5w==
X-Gm-Message-State: AJIora+J9eKsK2/gxNf0CbAvcVB8DA/T4qqCoUcdouztUiVDvGmWw/wH
 GrWB+toQGNGJUYgY3hSzMhNNq9LlcfBowGivefY1XB7CQiCC5jk0VFbooqNbcC4yGYpX8GCi1ua
 C1xy5lG/TimVrT3I=
X-Received: by 2002:a17:907:2e0b:b0:72b:8720:487e with SMTP id
 ig11-20020a1709072e0b00b0072b8720487emr7872919ejc.102.1657793777904; 
 Thu, 14 Jul 2022 03:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vboU5MWh63UMLL1lRluof/bk4i+ec2ZRGGVx9zrDVWMzZz4HWhoB5CcyG3pcbT8IYGZC+i1w==
X-Received: by 2002:a17:907:2e0b:b0:72b:8720:487e with SMTP id
 ig11-20020a1709072e0b00b0072b8720487emr7872875ejc.102.1657793777575; 
 Thu, 14 Jul 2022 03:16:17 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 cw11-20020a056402228b00b0043a8f40a038sm772084edb.93.2022.07.14.03.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 03:16:17 -0700 (PDT)
Message-ID: <de535c49-a975-85dc-82f5-24d845a46502@redhat.com>
Date: Thu, 14 Jul 2022 12:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 8/8] virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization
 hint
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yanan Wang <wangyanan55@huawei.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-9-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-9-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.07.22 06:17, Stefan Hajnoczi wrote:
> Register guest RAM using BlockRAMRegistrar and set the
> BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
> accesses in I/O requests.
>
> This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
> on DMA mapping/unmapping.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/virtio/virtio-blk.h |  2 ++
>   hw/block/virtio-blk.c          | 13 +++++++++----
>   2 files changed, 11 insertions(+), 4 deletions(-)

Seems fair, but as said on patch 5, I’m quite wary of “register guest 
RAM”.  How can we guarantee that it won’t be too fragmented to be 
registerable with either nvme.c or blkio.c?

Hanna


