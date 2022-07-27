Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29315824E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:55:29 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGehM-0008BP-17
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGedd-00052G-H2
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:51:37 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGeda-0000Mx-Oq
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:51:37 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBDC1206C8;
 Wed, 27 Jul 2022 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658919091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cMmJC6kQinkWWdWqzh2EgHkwV7ZeSMRdfaR+Xfc+7s0=;
 b=qqoj8o9AHpf/PqYmBwm8+B/vUuUZamD7uJ6U0zaz5klbbOaN+9Dz0kiY1J/EOETu3gWUjn
 XUtzD0KOOKlOW3KAN0AFUzEYqlujHml6FA9QqyXybeDE/kQfls8ukyoO9DT6n7EovcDn/U
 drD3kDnGNBgP9qZq7U6frfq6s74Xmps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658919091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cMmJC6kQinkWWdWqzh2EgHkwV7ZeSMRdfaR+Xfc+7s0=;
 b=fe0ruvceGOXRPpe/XP13ldrOkMvI4A6TXirScKzbjDgWgCB4haSrBfbDbTN2xuU3v+nD8g
 Lq1+PI0jgrMwB3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C84DA13A8E;
 Wed, 27 Jul 2022 10:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eTYjL7MY4WIrcQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 27 Jul 2022 10:51:31 +0000
Message-ID: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
Date: Wed, 27 Jul 2022 12:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: virtio: why no full reset on virtio_set_status 0 ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael and all,

I have started researching a qemu / ovs / dpdk bug:

https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/

that seems to be affecting multiple parties in the telco space,

and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
in virtio_set_status, when receiving a status value of 0.

It seems it has always been this way, so I am clearly missing / forgetting something basic,

I checked the virtio spec at https://docs.oasis-open.org/

and from:

"
4.1.4.3 Common configuration structure layout

device_status
The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.

"

and

"
2.4.1 Device Requirements: Device Reset
A device MUST reinitialize device status to 0 after receiving a reset.
"

I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.

Instead, we have just the check:

    if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
        (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
        virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
    }

which just sets the started field,

and then we have the call to the virtio device class set_status (virtio_net...),
but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:

"
    vdev->start_on_kick = false;
    vdev->started = false;
    vdev->broken = false;
    vdev->guest_features = 0;
    vdev->queue_sel = 0;
    vdev->status = 0;
    vdev->disabled = false;
    qatomic_set(&vdev->isr, 0);
    vdev->config_vector = VIRTIO_NO_VECTOR;
    virtio_notify_vector(vdev, vdev->config_vector);

    for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
        ... initialize vdev->vq[i] ...
    }
"

Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
but what am I missing here?

Thanks,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

