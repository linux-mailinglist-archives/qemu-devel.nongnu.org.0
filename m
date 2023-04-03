Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9596D52D4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjR5V-0004LW-Lk; Mon, 03 Apr 2023 16:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjR5D-0004Cd-Os
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:47:20 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjR5A-0007DX-FG
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:47:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so20278739wmq.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680554835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lQW83CaEFIKTAbTGMK7zJAXx2zCsHH8oRPYKrzlIxPw=;
 b=fNGh2NV6/uj7FXzhYWT2H2X1iMgLhYqx5DQL6GwdoEYEHkvIK7KGPOYxFcq407H4T+
 SPpDo7z8o68YlOOG65fHhKTjYHMuzp3pjBoINet7XgMWmiIsuJq1JC7vZu25hbshHqkm
 4ePpZieKILGkS/7UVLBCblFqD/mw2XE4aUt4Op92vlqL4PkWxCqswfJkmLEw9eJJvlmP
 BOjt3AZDAkZEszXzDqBSBhAJ0++TjQg0Qhn2xutvRsF0zqVsrFK49JBMJ94rsnhv/u5Z
 UHdh2GTjPUtx1NU5SFlV6jvmMTsWTt8WzXQWdclyISmEQ/TtGy22fxDk3RZzbbD9OIHP
 dbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQW83CaEFIKTAbTGMK7zJAXx2zCsHH8oRPYKrzlIxPw=;
 b=H9Oi0g5J9FfsNLKS3u/pA9cB1L1q8Vq4h+W52Ijn+/LWPei2n6hQQ6sYJoZiHqASgx
 XzfVw3MDKn/UlA5Lx7GIp9Tb8sF1dPEhFrbNDpxGREePFGJF/kUcqF4ThwzL8QvLyo8U
 qPySQC9xvzwV81wbQP+vXlmEC2KLZKY0StZJu8b0MLbtsFP0zm6DYcyuVkEX9/hSyY1w
 2+aRJGbDA5Py6gSvtNmBRlnBN6b/Hb1yZoxzT4qere/iLF4j4PY6UYyMgRtQD20EayDM
 a5o5+5aKQSDtyNV/ghQn0UTNv7j7HY7G/eH0RENAyo0N8zmhFgIL/H7QzQxo/YGHSai2
 qdcA==
X-Gm-Message-State: AAQBX9c6hK1jsygmYcT+KRN/djz/NqDivmNpfbBXtIWcNediSAGd5Sp1
 9d9AlpsDfT9o1AUYRg+RwS1mgA==
X-Google-Smtp-Source: AKy350YJckSFRktwO+Ap2UM2V7mr6N7rsDxT5yrMXbEjRUK205rt4FU3Ijr4q2cDcOnc7yvmq+n7YQ==
X-Received: by 2002:a05:600c:3789:b0:3ee:b3bf:5f7c with SMTP id
 o9-20020a05600c378900b003eeb3bf5f7cmr491399wmr.23.1680554835048; 
 Mon, 03 Apr 2023 13:47:15 -0700 (PDT)
Received: from [192.168.69.115] (pas38-h02-176-184-5-132.dsl.sta.abo.bbox.fr.
 [176.184.5.132]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003f0321c22basm19001040wms.12.2023.04.03.13.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:47:14 -0700 (PDT)
Message-ID: <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
Date: Mon, 3 Apr 2023 22:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403183004.347205-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/4/23 20:29, Stefan Hajnoczi wrote:
> Only report a transport reset event to the guest after the SCSIDevice
> has been unrealized by qdev_simple_device_unplug_cb().
> 
> qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> to false so that scsi_device_find/get() no longer see it.
> 
> scsi_target_emulate_report_luns() also needs to be updated to filter out
> SCSIDevices that are unrealized.
> 
> These changes ensure that the guest driver does not see the SCSIDevice
> that's being unplugged if it responds very quickly to the transport
> reset event.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/scsi/scsi-bus.c    |  3 ++-
>   hw/scsi/virtio-scsi.c | 18 +++++++++---------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index c97176110c..f9bd064833 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -487,7 +487,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
>               DeviceState *qdev = kid->child;
>               SCSIDevice *dev = SCSI_DEVICE(qdev);
>   
> -            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
> +            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
> +                qatomic_load_acquire(&dev->qdev.realized)) {

Would this be more useful as a qdev_is_realized() helper?

