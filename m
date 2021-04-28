Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C603E36DFE1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:48:21 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqAW-0002eW-QN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbq0H-0000nh-QK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbq0A-0006Sl-9m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619638657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2Hwjc4QseqBTDTxpXDhxGM45pvVV/wasoC53+Tie7Y=;
 b=S7yo9Z9424kvtcYmmgOrw50NvD9OG+9CR2Kh81MV0R0LjemehChF1+jUPUb+Dd7lYbObkf
 waugFAAs0An813sHoFYr0YECSpw7svrzgaiHqEdSNZLbXRqmNzvm5Qxch2NHcu98g3L0gJ
 KjW2w3qOBBtfvHI9etEc7ehgpz0vOCc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-AVZ5BdN0MHiz3v7o0uJIvg-1; Wed, 28 Apr 2021 15:37:35 -0400
X-MC-Unique: AVZ5BdN0MHiz3v7o0uJIvg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i43-20020adf90ae0000b029010a6364cdbaso6314797wri.18
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F2Hwjc4QseqBTDTxpXDhxGM45pvVV/wasoC53+Tie7Y=;
 b=Us+iYGMvDvbwyl66q1diXb1lSWCM2XoMV6PWbyhRUXmqu08GJ5o6xhs8sLiN84YD+A
 FvuyEqQrAcvVKX2iuQ8qxJHpyllLCwgaYCZuU9YS3nYG1/5Yg4miGZSeXJSTrp9RahZ7
 U/hTrxLYmIc0/MlzkZuX1CCqcVPcJcX7zRMHlpr/ljr2BUJxukyx0KHXR1R5ifNZKrir
 4dqFYWUT6QvEPRSfJxITARpNWLDSzJdRNjpWhFHfiDuHwR2eHf03KGWIfcSJI24Em/6Y
 Ej00iqE5NobGc0yXNIlBT5CQEezvKyOuYNVB4pWX9AAJBjT1RBbtNVFG3JsZULlsNGV+
 +xYA==
X-Gm-Message-State: AOAM531oV4Ufvl5+k54RPma/4nLXF3VHWgc9MBJxtPDDSh9hLMIiMY7N
 pyjEXl5DWOuJduhnnvxjiIdZLRIn7VJdamrR75CeZPLoVKXtTjQb2ksb35XmiUoU21O0fOxXxhF
 W/wLnS8Sy1AjRke4=
X-Received: by 2002:a7b:cd8a:: with SMTP id y10mr1803527wmj.9.1619638654009;
 Wed, 28 Apr 2021 12:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyGuYh6xD8MYWIHMtHxEV3cXdGp8ImPXd0r0v1V50yl0Kr/BK+wQlOOX++SBD3FL6cVUmHkg==
X-Received: by 2002:a7b:cd8a:: with SMTP id y10mr1803506wmj.9.1619638653786;
 Wed, 28 Apr 2021 12:37:33 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z14sm1061283wrs.96.2021.04.28.12.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:37:33 -0700 (PDT)
Subject: Re: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-2-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1449ed8d-1334-a69b-ee83-ca3587f11bf9@redhat.com>
Date: Wed, 28 Apr 2021 21:37:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422170221.285006-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: den-plotnikov@yandex-team.ru, raphael.norwitz@nutanix.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 7:02 PM, Kevin Wolf wrote:
> This is a partial revert of commits 77542d43149 and bc79c87bcde.
> 
> Usually, an error during initialisation means that the configuration was
> wrong. Reconnecting won't make the error go away, but just turn the
> error condition into an endless loop. Avoid this and return errors
> again.
> 
> Additionally, calling vhost_user_blk_disconnect() from the chardev event
> handler could result in use-after-free because none of the
> initialisation code expects that the device could just go away in the

TIL initialisation wording.

> middle. So removing the call fixes crashes in several places.
> 
> For example, using a num-queues setting that is incompatible with the
> backend would result in a crash like this (dereferencing dev->opaque,
> which is already NULL):
> 
>  #0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
>  #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
>  #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>  #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
>  #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>  #5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
>  #6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
>  #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
>  #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
>  #9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 54 ++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 41 deletions(-)


