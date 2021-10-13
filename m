Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51642B58C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 07:36:11 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maWvx-0000r2-PG
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 01:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maWuW-0008WF-Ud
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:34:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maWuU-0006dv-1A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634103275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtrlVoKuLfOYKsehm561O/XQVc6V0dbs6gDvvYnszE8=;
 b=NYG1UyXBYAcxliDGDm94KQrtO5uK9/CAlISbj6LNiMK8qp6DziD17YfIr7qyJiPyWmEFtQ
 hKpjA0ySFsRvyHihSm3IBLVCPzL+Erc/f2wxi5JOSv7ZzOqaNXQ07xwYZolu9IXmE13MXN
 2UhIGeZGiJmRVd3s30RYW4AZfcN58sQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-qRkF318kObie_3S6PiCiEA-1; Wed, 13 Oct 2021 01:34:34 -0400
X-MC-Unique: qRkF318kObie_3S6PiCiEA-1
Received: by mail-pl1-f197.google.com with SMTP id
 y13-20020a1709029b8d00b0013dc7c668e2so535247plp.16
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 22:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WtrlVoKuLfOYKsehm561O/XQVc6V0dbs6gDvvYnszE8=;
 b=q49/GXB7ZjY7+IAoraEKb47iw0dMyu8PAAhKMprDgxLxTDqmSGdTxHdWiN1qFhFxRV
 yUgxH84XMP94kZjW0F2R6C1+ZTSXM7rCXV4Y5UuldoXV+bY2S551QgD+ixUSjyczIop1
 0k0KcqyRP4L6ECurgsRp7u6cpxW24IwMOF0q8xUuyUA0vXnnUvUEzrqJybE+7e92FyM/
 RHlLmLLcPpPaC8FRN6HL1kQpk23s2EMgJta/l94m76KCmMC9xqkbIczWtm0QGgRta7uv
 bf5m8zm/wkAjyr4Qes9g2ALKKo8frXvs0aLjBSRatZhq2XCUflsg6f3+SahbjpsaMSxe
 hs+A==
X-Gm-Message-State: AOAM530mmsRDwwhqHQBiU9CcGJVBrqKKcNJWmgsnQIevaYMeE2j2YAou
 y+eB+SAy3rpIErsr1gT0PjE0JZYFFP0xkAiLj0H66G6UQ0lsdwgChSc7M8q9FmG4qqYw7F/AWa7
 Hm7pF0VYgqqbbFao=
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr10977213pjn.216.1634103273001; 
 Tue, 12 Oct 2021 22:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHf8rcqcR4Ua0QADtIf4MOVkKSeYHcO3YHVjN5ZW38uP45MMYzjDvCLUgIciPTQ71i8oVxng==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr10977200pjn.216.1634103272757; 
 Tue, 12 Oct 2021 22:34:32 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u2sm12401401pfi.120.2021.10.12.22.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 22:34:32 -0700 (PDT)
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
Date: Wed, 13 Oct 2021 13:34:19 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-21-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:06, Eugenio Pérez 写道:
> Use translations added in VhostIOVATree in SVQ.
>
> Now every element needs to store the previous address also, so VirtQueue
> can consume the elements properly. This adds a little overhead per VQ
> element, having to allocate more memory to stash them. As a possible
> optimization, this allocation could be avoided if the descriptor is not
> a chain but a single one, but this is left undone.
>
> TODO: iova range should be queried before, and add logic to fail when
> GPA is outside of its range and memory listener or svq add it.
>
> Signed-off-by: Eugenio Pérez<eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
>   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++-----
>   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
>   hw/virtio/trace-events             |   1 +
>   4 files changed, 152 insertions(+), 23 deletions(-)


Think hard about the whole logic. This is safe since qemu memory map 
will fail if guest submits a invalidate IOVA.

Then I wonder if we do something much more simpler:

1) Using qemu VA as IOVA but only maps the VA that belongs to guest
2) Then we don't need any IOVA tree here, what we need is to just map 
vring and use qemu VA without any translation

Thanks


