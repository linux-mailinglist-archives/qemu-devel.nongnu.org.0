Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18546EA81
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:01:39 +0100 (CET)
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKvS-0000sn-Dp
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqf-0002XV-22
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:41 -0500
Received: from [2a00:1450:4864:20::32a] (port=45612
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqd-0001XL-2i
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4288986wme.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVK/9hKqxk9TK9qKo9lSrWoYU7MBIbwtjutdopGS4P4=;
 b=rK/zFpxrcT/fz0JW6Ot0oRCI27ESw4sBy5veyZ2qqDmUr7sZjK5tARNQd2Tx3CZQhE
 1uCW4spiQrZvQ6JUaduommMEvEfzxcThoS+uyj5pv5/R46Fm64svtAEOtaK7a/YsPFNs
 TWRlk/SmuxuOOiV/GHMZO6tKLjMX2J74Q3LZc3yxHU0jARGDQ2CHC6iKNyM0JF1kSOr+
 uRZ09K9Z1y7y6rlD27e+NElwAqxFwIshY4EHl2Fhuod3V1fP9NNgarDVjDJs9mhvI5J9
 aYFiUZsmefimSvBrKUhXHWucNbDOCB+wyImAIMyGmKYVN1/8BPXNCQefHd5rfauxZ+v7
 Dpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVK/9hKqxk9TK9qKo9lSrWoYU7MBIbwtjutdopGS4P4=;
 b=JKyM/MuY90jpP438Ee/IeTfESWkqwETIiXciHC3Vs/jdZ41Kja8bTy9/ffQA2qmyCI
 HUJ9gSC+yiZIwZfYmlOm1MC4fT4rybI6GdNzg9MFkWHPJD7p+5fEC8FfgVRLnUElEiYj
 yoMcb+qGFUvM5/0mgt5AruUokQRrmh2GFY2IPDB1W+H2iDAWKNFO71v78H0FV0TwB1kj
 2iHo8uUassy94TVgopiKxykvaZ0c843ygCi6lH6cOKlqe40MtoPzzTnrosqbsFzdRVjf
 APoFchygAHiac7SqHjWcY7y4t98/QWKcwwnPbAZHpmDbpvwRNIs9gdVbeAwWe7wUzEL5
 +m1g==
X-Gm-Message-State: AOAM5327r7SzbY/s1pXMm7gNYcwByG9w60u2XqvuQNLPuUFvfRT63p+u
 +83tu+tLHGZg+pK495v0lhL5RQ==
X-Google-Smtp-Source: ABdhPJyJU3lr8oNk2wc3HJk81oOhw9MAQwidsv1B9nIWIXrsqIwagL5NtI9/pcyLacF15jvOImW/NA==
X-Received: by 2002:a05:600c:2217:: with SMTP id
 z23mr7878814wml.42.1639061796101; 
 Thu, 09 Dec 2021 06:56:36 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:35 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 0/8] virtio: Add vhost-user based Video decode
Date: Thu,  9 Dec 2021 14:55:53 +0000
Message-Id: <20211209145601.331477-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for virtio-video decoder devices in Qemu
and also provides a vhost-user-video vmm implementation.

The vhost-user-video vmm currently parses virtio-vido v3 protocol
(as that is what the Linux frontend driver implements).
It then converts that to a v4l2 mem2mem stateful decoder device.
Currently this has been tested using v4l2 vicodec test driver in Linux
[1] but it is intended to be used with Arm SoCs which often implement
v4l2 stateful decoders/encoders drivers for their video accelerators.

The primary goal so far has been to allow continuing development
of virtio-video Linux frontend driver and testing with Qemu. Using
vicodec on the host allows a purely virtual dev env, and allows for
ci integration in the future by kernelci etc.

This series also adds the virtio_video.h header and adds the
FWHT format which is used by vicodec driver.

I have tested this VMM using v4l2-ctl from v4l2 utils in the guest
to do a video decode to a file. This can then be validated using ffplay
v4l2-compliance tool in the guest has also been run which stresses the
interface and issues lots of syscall level tests

See the README.md for example commands on how to configure guest kernel
and do a video decode using Qemu, vicodec using this VMM.

Linux virtio-video frontend driver code:
https://github.com/petegriffin/linux/commits/v5.10-virtio-video-latest

Qemu vmm code:
https://github.com/petegriffin/qemu/tree/vhost-virtio-video-master-v1

This is part of a wider initiative by Linaro called
"project Stratos" for which you can find information here:

  https://collaborate.linaro.org/display/STR/Stratos+Home

Applies cleanly to git://git.qemu.org/qemu.git master(a3607def89).

Thanks,

Peter.

[1] https://lwn.net/Articles/760650/

Peter Griffin (8):
  vhost-user-video: Add a README.md with cheat sheet of commands
  MAINTAINERS: Add virtio-video section
  vhost-user-video: boiler plate code for vhost-user-video device
  vhost-user-video: add meson subdir build logic
  standard-headers: Add virtio_video.h
  virtio_video: Add Fast Walsh-Hadamard Transform format
  hw/display: add vhost-user-video-pci
  tools/vhost-user-video: Add initial vhost-user-video vmm

 MAINTAINERS                                   |    8 +
 hw/display/Kconfig                            |    5 +
 hw/display/meson.build                        |    3 +
 hw/display/vhost-user-video-pci.c             |   82 +
 hw/display/vhost-user-video.c                 |  386 ++++
 include/hw/virtio/vhost-user-video.h          |   41 +
 include/standard-headers/linux/virtio_video.h |  484 +++++
 tools/meson.build                             |    9 +
 tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
 tools/vhost-user-video/README.md              |   98 +
 tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
 tools/vhost-user-video/meson.build            |   10 +
 tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
 tools/vhost-user-video/v4l2_backend.h         |   99 +
 tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
 tools/vhost-user-video/virtio_video_helpers.h |  166 ++
 tools/vhost-user-video/vuvideo.h              |   43 +
 17 files changed, 5358 insertions(+)
 create mode 100644 hw/display/vhost-user-video-pci.c
 create mode 100644 hw/display/vhost-user-video.c
 create mode 100644 include/hw/virtio/vhost-user-video.h
 create mode 100644 include/standard-headers/linux/virtio_video.h
 create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
 create mode 100644 tools/vhost-user-video/README.md
 create mode 100644 tools/vhost-user-video/main.c
 create mode 100644 tools/vhost-user-video/meson.build
 create mode 100644 tools/vhost-user-video/v4l2_backend.c
 create mode 100644 tools/vhost-user-video/v4l2_backend.h
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
 create mode 100644 tools/vhost-user-video/vuvideo.h

-- 
2.25.1


