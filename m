Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD136EA0D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:09:18 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5To-0000VJ-Vf
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QG-0007TH-24
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QE-0000Af-0I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:35 -0400
Received: by mail-pl1-x630.google.com with SMTP id y1so18975316plg.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U8YdgNecL3YKxiNdN8K93Lt2BPaMhfKUzXRK7oycEA=;
 b=IXOntQBb1CvymefDDGXFxOqzoqudfCGeX+riUr3K9Z2VKkNJntPMV3GclFLvfmi7RC
 3qy9gDWtZ0ocjuv8w9+b/Bvoez7BFsTkRw+JOxdpa8kzEOOhg1Sj3+nfGQcwtRL98r/k
 B//CMnUuMGvFH7SEYQyVGJKtPO+7n8NJU7HKBHUzYUHu+u4zc7rmteS8nEwBX7Q/ign8
 BsDXQJ23OcD3XGz6avAn/shwlIzVuiSji3b8KPW4SXpw7TCbqaOA/8JSywOt1LKl43kK
 XJvJkzDoSsXCTyMQ53M3Yq8QvSB688TLE+AD/6Sj44RG1ctKteN81unukAxREW0BJl8o
 Lb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U8YdgNecL3YKxiNdN8K93Lt2BPaMhfKUzXRK7oycEA=;
 b=bXD1tizeAUq0XHb9RrSg9dL23YAz1oZQXUabPQpKxYP74M+e8Q575k10ne7xeXtvL4
 1me7hKcxhUYBb0zbz5GLsOHSQnrIUt0pfUQtowXvzpIRiVxulv0f5e6G2g5ThYdNE9q0
 B34R56iAPmAADcO0VZSWrMVY6z/4nciinFazYUMRspkCaGGsTJ37oonMEk529+IhChie
 JPizgyA694tBbCpEsst3uQwXuhRt30vhURqB2X9aprXZNWQenH5UIlKDgWrXRRDp9o43
 NjRPn8nz5vhKJ7NgUrv1BVqSdj4S34naIZpnf12vx6Kao8f3Ox2fLp6H9ovNYrssPrz8
 LdEg==
X-Gm-Message-State: AOAM5332TFW+gYGNhp6SeyO11mt9PIE/4yfobQRKYGsAaBgPo3b+ounz
 nzfniDiWM2P6b4F3y9+0Cl0=
X-Google-Smtp-Source: ABdhPJyCo4MxaLjy7Co51LhtmCBegLSMfe4zxoihm5M8KCzf25jYs8kAIj3/6MSAXBE4epCNyproKQ==
X-Received: by 2002:a17:902:864a:b029:ec:a5e0:6373 with SMTP id
 y10-20020a170902864ab02900eca5e06373mr35578508plt.48.1619697931381; 
 Thu, 29 Apr 2021 05:05:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:31 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 00/27] Virtio sound card implementation
Date: Thu, 29 Apr 2021 17:34:18 +0530
Message-Id: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to implement the virtio sound card
as defined in the virtio specs (v8). The specs can be found
at the following github repo:
https://github.com/oasis-tcs/virtio-spec

This patch series is not complete yet, but here is what's
already been done:

    - The device is initialized properly and is recognized
      by the guest as a sound card device.
    - Output stream works but the output is very noisy. (Which
      is what I wanted coments on.)

What remains to be done:

    - Input streams yet to be done.
    - The jacks are initialized with a default config, but
      they are not mapped to any streams for now.
    - Channel maps are yet to be implemented.

I'd like to request some comments on the following points:

    - The output from the sound card is accompanied by periodic
      white noise. I do not know why this is happening. I tried
      debugging it by writing the buffers to a new wav file and
      sure enough the contents of the file were different at
      some places, but I couldn't find what must be causing it.
      (Relevant patches: #19, #20, #21 and #25.) What steps should
      I take for debugging this?

    - If I try and output a wav file of a different size, that
      sets the period_bytes to 4004, I get an assert failure in
      the object_unref function defined in qom/object.c. (Function
      defined on line #681, assert on line #690.)
                assert(obj->parent == NULL);
      I tried taking a look at the stack trace for when this failure
      happens. In the stacktrace I found out that this happened
      when QEMU was trying to unmap the out_sg from the VirtQueue
      element. This failure doesn't happen if I am using a different
      wav file, that sets the period_bytes to something else.
      (Relevant patches: #19, #20, #21 and #25.)
      What could be causing this problem?

    - What is the suggested way of waiting? When the driver issues
      the VIRTIO_SND_PCM_STOP ctrl command I want to wait for the
      buffers existing in tx vq to be consumed before closing the
      stream.

Shreyansh Chouhan (27):
  virtio-snd: Add virtio sound header file
  virtio-snd: Add jack control structures
  virtio-snd: Add PCM control structures
  virtio-snd: Add chmap control structures
  virtio-snd: Add device implementation structures
  virtio-snd: Add PCI wrapper code for VirtIOSound
  virtio-snd: Add properties for class init
  virtio-snd: Add code for get config function
  virtio-snd: Add code for set config function
  virtio-snd: Add code for the realize function
  virtio-snd: Add macros for logging
  virtio-snd: Add control virtqueue handler
  virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
  virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP handler
  virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
  virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
  virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
  virtio-snd: Add default configs to realize fn
  virtio-snd: Add callback for SWVoiceOut
  virtio-snd: Add VIRITO_SND_R_PCM_START handler
  virtio-snd: Add VIRTIO_SND_R_PCM_STOP handler
  virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
  virtio-snd: Replaced goto with if else
  virtio-snd: Add code to device unrealize function
  virtio-snd: Add tx vq and handler
  virtio-snd: Add event vq and a handler stub
  virtio-snd: Add rx vq and stub handler

 hw/audio/Kconfig               |    5 +
 hw/audio/meson.build           |    1 +
 hw/audio/virtio-snd.c          | 1168 ++++++++++++++++++++++++++++++++
 hw/virtio/meson.build          |    1 +
 hw/virtio/virtio-snd-pci.c     |   72 ++
 include/hw/virtio/virtio-snd.h |  393 +++++++++++
 6 files changed, 1640 insertions(+)
 create mode 100644 hw/audio/virtio-snd.c
 create mode 100644 hw/virtio/virtio-snd-pci.c
 create mode 100644 include/hw/virtio/virtio-snd.h

-- 
2.25.1


