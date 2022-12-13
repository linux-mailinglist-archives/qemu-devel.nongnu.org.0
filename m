Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890664B8F4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:51:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57XU-0005AJ-Q1; Tue, 13 Dec 2022 10:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p57XQ-00059T-UP
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p57XO-0006eo-Qp
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670946584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TE3eD2n/PgxDdAw9MnTS3qq5g+e5GqH5Nl2v85gh8k=;
 b=QZzOt42ZWWNg9VSTCyZYjbO8H8wRm9j2LgaOuFNCXJGDwsgnbnCGohig0Zn/bPNVC6Gaqd
 nrx64lO6I7koZ+yfhAjl04uR5/wZnU8qs678QLPQVkk5l2I6HiOPY88BaSytepCnFa6b8R
 JRcB/L5q6DANpw09cjJwDOcMtL85dzI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-1uZiUN6XNM2rlKpvdIC2Zw-1; Tue, 13 Dec 2022 10:49:43 -0500
X-MC-Unique: 1uZiUN6XNM2rlKpvdIC2Zw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso3189181wml.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0TE3eD2n/PgxDdAw9MnTS3qq5g+e5GqH5Nl2v85gh8k=;
 b=TEvNndaTT+ff0VHX835/Crf63glIPRTEDHfNUHI1/UUur93AfkEPwEq25bnqribjr9
 A+R5sUGlJ+zDM2cJuWwxos4NbfrUhTexgG7CtETOp7ywhl9RsZo16IUJKQeWyfNtQbTN
 j1HSIyheMr0sxayQZtLnfEIrbxqcUZIvwYWnVco8qVcwlan4i1V0ElaROSMk2G8bn+aj
 bm3JepuKdTLTqDAROb1NV+Tfz19/rXa1j7/rtNLs2RJwi9WDNlFW+VmcRujhbOhjG/nD
 M7aO/nU8K+/J8K4SW5XM0BzEpdh59KIgajQMet+1jTMnOwDjqSvUnARznR4cllYJJbEc
 C2Wg==
X-Gm-Message-State: ANoB5pk/g1ow5vZ7xtn2rH6cSqtOBbKJN6Pbk5UPGQzqgCgTjQdBoxUs
 Ez5z4rK4LAsY1nyBPpsvNvE4SeR0vzq89x8VwjsCQihEdHCD0TtxEhMc5nbsZRn6hXImyC9xiut
 BZzYCWd7vjrTxnDM=
X-Received: by 2002:a05:600c:a56:b0:3d1:d396:1adc with SMTP id
 c22-20020a05600c0a5600b003d1d3961adcmr19746781wmq.14.1670946582006; 
 Tue, 13 Dec 2022 07:49:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BOMdJPAAEBKz/ie3lLZNh2jY3acaam5ZivZgU2+S3Cb8sDz1ZEwWyzDOvy6EtgmkuHkxA2g==
X-Received: by 2002:a05:600c:a56:b0:3d1:d396:1adc with SMTP id
 c22-20020a05600c0a5600b003d1d3961adcmr19746757wmq.14.1670946581764; 
 Tue, 13 Dec 2022 07:49:41 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 f24-20020a1c6a18000000b003b3307fb98fsm13089707wmc.24.2022.12.13.07.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 07:49:41 -0800 (PST)
Date: Tue, 13 Dec 2022 16:49:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221213154936.libw4pquwtwsvu3v@sgarzare-redhat>
References: <20221205084943.2259-1-longpeng2@huawei.com>
 <20221205084943.2259-6-longpeng2@huawei.com>
 <20221213143511.awu6ibpavokxrghv@sgarzare-redhat>
 <c4bb4aca-d09f-b419-5d0b-dc7044a0c8fb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4bb4aca-d09f-b419-5d0b-dc7044a0c8fb@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Dec 13, 2022 at 11:37:35PM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>在 2022/12/13 22:35, Stefano Garzarella 写道:
>>On Mon, Dec 05, 2022 at 04:49:43PM +0800, Longpeng(Mike) wrote:
>>>From: Longpeng <longpeng2@huawei.com>
>>>
>>>Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>---
>>>.../devices/vhost-vdpa-generic-device.rst     | 66 +++++++++++++++++++
>>>1 file changed, 66 insertions(+)
>>>create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>>>
>>>diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst 
>>>b/docs/system/devices/vhost-vdpa-generic-device.rst
>>>new file mode 100644
>>>index 0000000000..7d13359ea1
>>>--- /dev/null
>>>+++ b/docs/system/devices/vhost-vdpa-generic-device.rst
>>>@@ -0,0 +1,66 @@
>>>+
>>>+=========================
>>>+vhost-vDPA generic device
>>>+=========================
>>>+
>>>+This document explains the usage of the vhost-vDPA generic device.
>>>+
>>>+Description
>>>+-----------
>>>+
>>>+vDPA(virtio data path acceleration) device is a device that uses 
>>>a datapath
>>>+which complies with the virtio specifications with vendor 
>>>specific control
>>>+path.
>>>+
>>>+QEMU provides two types of vhost-vDPA devices to enable the vDPA 
>>>device, one
>>>+is type sensitive which means QEMU needs to know the actual device type
>>>+(e.g. net, blk, scsi) and another is called "vhost-vDPA generic 
>>>device" which
>>>+is type insensitive.
>>>+
>>>+The vhost-vDPA generic device builds on the vhost-vdpa subsystem 
>>>and virtio
>>>+subsystem. It is quite small, but it can support any type of 
>>>virtio device.
>>>+
>>
>>Maybe we can also add a minimum requirement section (e.g. we needs 
>>at least Linux v5.18 for VHOST_VDPA_GET_VQS_COUNT)
>>
>Ok.
>
>>>+Examples
>>>+--------
>>>+
>>>+1. Please make sure the modules listed bellow are installed:
>>>+    vhost.ko
>>>+    vhost_iotlb.ko
>>>+    vdpa.ko
>>>+    vhost_vdpa.ko
>>>+
>>>+
>>>+2. Prepare the vhost-vDPA backends, here is an example using 
>>>vdpa_sim_blk
>>>+   device:
>>>+
>>>+::
>>
>>Should we add also a `modprobe vhost-vdpa` step?
>>
>This is already described in Step 1.

Ah sorry, I had interpreted it as having those modules compiled and 
available, not loaded.
Maybe better to replace "installed", with "loaded".

Although IMHO we can remove "Step 1" and add "modprobe vhost-vdpa" here.
The others are all dependencies that are automatically loaded.

Thanks,
Stefano


