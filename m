Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE843C928
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:03:58 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhew-00049Z-1K
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfhaZ-0001KB-Au
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfhaW-00057q-TJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635335963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZcSN/7cFgEUzIYurNgspUaUzm2mgwSizxOJusvEGD4=;
 b=EDJo5tKhwvN8ofPmmo3PTBf8Obu7n338nqDyyrQC/5C75wtRK21UtGZXDJ4NsD6iZn4qZl
 edJI7hTSmotEWut4OW8GI1Jg2tajEKg1rjkplPCxInN2tq0k1cRS3d3M0qq4xCvm8iB32T
 XpPdBDr9ADAZV23xlRr4E4o/2kwofPk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-RjRdKrpVMwquabMII2UpOw-1; Wed, 27 Oct 2021 07:59:20 -0400
X-MC-Unique: RjRdKrpVMwquabMII2UpOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i187-20020a1c3bc4000000b0032ccd252cf3so1153367wma.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kZcSN/7cFgEUzIYurNgspUaUzm2mgwSizxOJusvEGD4=;
 b=6iLflrpT9Lwjlln+WgWOk/w8dkr5wkCtr2WVfn5253YM7rwI1n098YXMKbWeqVhO43
 zXqJoYaLcRKDTvBmCGwIOLBSkHE7HOIx6xv84UK8RjBfQqcEzSMhp3fpYG25w/Lpb+OK
 JjvapMK6GLqrCBMJz3XNN19GELk04pjgySRPA7oV0mRLeJHSN1Zj3dbFdDh8PNMKAsuR
 vlji2yQLlnpQO1slegc62eDaqdJJ/A4K/MtQhmLoraOJASbWquc+Ibp7fM3Fvzs71eFy
 aPKceZR8gSN4M4U9jRHzHNvXJBH4lUuNhnuGgjrFN3iVGlWWzl0OZ+h9kjChoLLqGxp4
 ba9w==
X-Gm-Message-State: AOAM530xkZG1JGu0vtgHrMcP2BpfPQjE+cfCVoWisTEN/ybbepWG/6XT
 EoCp8nvxlgCqMbwGpv2Zij/NA4nQHb10oWYQ2jDL2KfG1Jm9pMw1UOxwM3eM8U4LBsYqRCqNSMa
 dJK8B9OI3uK9Km2k=
X-Received: by 2002:adf:aa96:: with SMTP id h22mr39850159wrc.405.1635335959639; 
 Wed, 27 Oct 2021 04:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbyyxG9OVIh8jfYQ3fDnxhkpYb1H8UFQEcSlW/oBgP/4XsYd8KtSCwOXeQjBjU7BAonvUlGA==
X-Received: by 2002:adf:aa96:: with SMTP id h22mr39850123wrc.405.1635335959452; 
 Wed, 27 Oct 2021 04:59:19 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id f18sm21147482wrg.3.2021.10.27.04.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 04:59:19 -0700 (PDT)
Message-ID: <00c6f307-4bcc-d9f7-3abb-bde6615eadcd@redhat.com>
Date: Wed, 27 Oct 2021 13:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v8 5/8] qmp: decode feature & status bits in virtio-status
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.21 13:41, Jonah Palmer wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> Display feature names instead of bitmaps for host, guest, and
> backend for VirtIODevice.
> 
> Display status names instead of bitmaps for VirtIODevice.
> 
> Display feature names instead of bitmaps for backend, protocol,
> acked, and features (hdev->features) for vhost devices.
> 
> Decode features according to device type. Decode status
> according to configuration status bitmap (config_status_map).
> Decode vhost user protocol features according to vhost user
> protocol bitmap (vhost_user_protocol_map).
> 
> Transport features are on the first line. Undecoded bits
> (if any) are stored in a separate field. Vhost device field
> wont show if there's no vhost active for a given VirtIODevice.
> 
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/block/virtio-blk.c          |  28 ++
>  hw/char/virtio-serial-bus.c    |  11 +
>  hw/display/virtio-gpu-base.c   |  18 +-
>  hw/input/virtio-input.c        |  11 +-
>  hw/net/virtio-net.c            |  47 ++++
>  hw/scsi/virtio-scsi.c          |  17 ++
>  hw/virtio/vhost-user-fs.c      |  10 +
>  hw/virtio/vhost-vsock-common.c |  10 +
>  hw/virtio/virtio-balloon.c     |  14 +
>  hw/virtio/virtio-crypto.c      |  10 +
>  hw/virtio/virtio-iommu.c       |  14 +
>  hw/virtio/virtio.c             | 273 ++++++++++++++++++-
>  include/hw/virtio/vhost.h      |   3 +
>  include/hw/virtio/virtio.h     |  17 ++
>  qapi/virtio.json               | 577 ++++++++++++++++++++++++++++++++++++++---

Any particular reason we're not handling virtio-mem?

(there is only a single feature bit so far, a second one to be
introduced soon)


-- 
Thanks,

David / dhildenb


