Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529D3C9754
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:25:28 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3swB-00042h-7f
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3svD-0003Mt-OY
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3svB-0007Y5-S6
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626323065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA0UXtT24+WN9X4+cFzIyBgjbedMYYD4CtMvmMVF4Vg=;
 b=OeI0PhrWFTG0nzmgid1gdBgXcb7pUp1pMt/C8xByGcw3+GY6P0zQgEfJ9cXyl16UdT9DgG
 pjNrpDVCMwi+PLbpgbJ9AGz8+VpaRxNIpbO7r11C62xFvTPP5t4VsCnt8GRZuoLVZH6sKm
 k+Uy9BC63Rv6RaqFwT4ElT9YmCL7SJc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-vppIWZ-eOCaCarGkQpqlzA-1; Thu, 15 Jul 2021 00:24:23 -0400
X-MC-Unique: vppIWZ-eOCaCarGkQpqlzA-1
Received: by mail-pj1-f71.google.com with SMTP id
 dw7-20020a17090b0947b0290173b4d6dd74so2583476pjb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 21:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lA0UXtT24+WN9X4+cFzIyBgjbedMYYD4CtMvmMVF4Vg=;
 b=fr5KL1xfrIE75MQ2M0hFlA9UPbiU1lgoL5NaDReN9+lyXCj7aiNqcgD1gWnqmU2rVU
 MCNCu5yeupbA6ckiuEKIgOw5x/QD2DriQJkc4I3f7HleRdoB7Bjbn4ZxhnA05eauUvVE
 /HgaQw42048bFHdZ+1QLzy9pszEZWGwgijf18xRR8idJptNcAhV80yVdhSiVo4OBThDd
 2kFb217prJ466lZtTZA25cZ0oj5rlF+8YkH18dBZ4heQAyOP5sDM4kthF757QEF6VTMR
 0lyLu5OqIHxFyUhdp5ymrl0Qj+E6LZTULaP6+CkntC+Stea1pVusdHfRiY0PurP8jUw5
 iwxQ==
X-Gm-Message-State: AOAM532rSEtmnL6fKfRtkWDMlhNQtn7K0eYoHE+CnnzT4VZY8c91xKTY
 WooF2CgiOndN2S6Z+0/vI5hhCPGF878d0/YjRsznDHr2J7VrdKQoibpb99tRMefgck1dfR/Rekq
 JijV7D+5xrjjslk0=
X-Received: by 2002:a65:67d6:: with SMTP id b22mr2174634pgs.271.1626323062585; 
 Wed, 14 Jul 2021 21:24:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDGJ70qmmLaOG/UzeaLqZL8jdCRocut4MZjvXKseOtqz265Jhucx4rbJlQ5KNBvsrXDHDQpg==
X-Received: by 2002:a65:67d6:: with SMTP id b22mr2174606pgs.271.1626323062310; 
 Wed, 14 Jul 2021 21:24:22 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n6sm4720687pgb.60.2021.07.14.21.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 21:24:21 -0700 (PDT)
Subject: Re: [PATCH V2 00/18] vhost-vDPA multiqueue
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com
References: <20210706082717.37730-1-jasowang@redhat.com>
 <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
Message-ID: <2bfaf233-f776-f74e-ee17-9b1e388dc1be@redhat.com>
Date: Thu, 15 Jul 2021 12:24:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/12 下午1:44, Jason Wang 写道:
>
> 在 2021/7/6 下午4:26, Jason Wang 写道:
>> Hi All:
>>
>> This patch implements the multiqueue support for vhost-vDPA. The most
>> important requirement the control virtqueue support. The virtio-net
>> and vhost-net core are tweak to support control virtqueue as if what
>> data queue pairs are done: a dedicated vhost_net device which is
>> coupled with the NetClientState is intrdouced so most of the existing
>> vhost codes could be reused with minor changes. With the control
>> virtqueue, vhost-vDPA are extend to support creating and destroying
>> multiqueue queue pairs plus the control virtqueue.
>>
>> Tests are done via the vp_vdpa driver in L1 guest plus vdpa simulator
>> on L0.
>>
>> Please reivew.
>
>
> If no objection, I will queue this for 6.1.


Hi Michael:

So we miss the soft freeze, want to know if the series is fine from your 
side, and if you'd like to merge them (for 6.2 probably?).

Thanks


