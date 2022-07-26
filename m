Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80791581A51
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:29:43 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQFS-0005fl-Gl
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7y-0003CR-VH
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7x-0002HM-7k
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h8so21433328wrw.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8z58Xs4KkwuADpXX1yAxwgj2F71tRxHCQmLL7We5Ntk=;
 b=bwhHfSqbZleWRvtWGBdPxzt8HpLoCXr7HNbICF5KJqyUuxZk7uTutLqi9PAWNAlVRG
 YY5SsfWf7YsQm7LmhdTD/P5X1WPFr8b+2XjwXRjaxDcRcvZ0MZsaTc2PyqzEHq4TtP4R
 V6IVgpRjSyrfgQ+ZiG1LX4nlvwfd/H/vEfIFmuItYhyODfa+WUbKfuIpOLAQjkZaZSJ/
 F8P6KZqffJp8EBL77FDjEFA8s1z6ALw3ox9xTEcTMBYHEinevt39N7vqVyvp8Bf1KfX6
 ZyP8lE1PSrapno/MeflMQ7iJV5qmDpe5V8Da823IQlr0/c/P8nEQD9ffsEPjdIjz8FHz
 Etew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8z58Xs4KkwuADpXX1yAxwgj2F71tRxHCQmLL7We5Ntk=;
 b=DPtF6ZrDnr0Lb3Y0KKWHDZSW8hjM8rOo6I0JJ2mQFvRpoR01iQ+FUOjBaNyssrLgT7
 vpD3OogPF4atJN1cnAsJ11dsi3LSsAAku4gqz/fkWR6/s1GaTVM+6nkDcZUVfMvj+ms1
 G6VFGncNFXjqy4q6pmwL7cfUrprUJXLRfsDjuBap9fFGPDeifShqzfex8f6AXR6Anb99
 Ycrj+blMZNzrwZfGw1DmS6Q2GO2o06ree8FDUnP7A04g2fgzILqvA+szEVeYfnp0/L97
 82uQUVOVHoHxL/b5YrNVg61OkuKNsEj0EKQha+kwGQPwjcXgrn+6OI4Xd7+U1mjmSgY9
 gchQ==
X-Gm-Message-State: AJIora8lMHTmz0fOWMGSu/Kw3XLPL/kXeQgIifr5DnEpA6LQlykZadIM
 vZuoHqu4q9mHXRk8HNgebMtEyQ==
X-Google-Smtp-Source: AGRyM1uFintp48CfliW9ym+780hEkufl92oUUssGT8ugV2G1/KVhboRkaJm2mHbq29Y0w0OI+T2nRQ==
X-Received: by 2002:a5d:6d0c:0:b0:21e:5391:7a64 with SMTP id
 e12-20020a5d6d0c000000b0021e53917a64mr12200589wrq.498.1658863315689; 
 Tue, 26 Jul 2022 12:21:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b003a2f2bb72d5sm29561064wmq.45.2022.07.26.12.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B9001FFB7;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
Date: Tue, 26 Jul 2022 20:21:29 +0100
Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

After much slogging through the vhost-user code I've gotten the
virtio-gpio device working again. The core change in pushing the
responsibility for VHOST_USER_F_PROTOCOL_FEATURES down to the
vhost-user layer (which knows it needs it). We still need to account
for that in virtio-gpio because the result of the negotiating protocol
features is the vrings start disabled so the stub needs to explicitly
enable them. I did consider pushing this behaviour explicitly into
vhost_dev_start but that would have required un-picking it from
vhost-net (which is the only other device which uses protocol features
AFAICT - but is a measure more complex in it's setup).

As last time there are a whole series of clean-ups and doc tweaks. I
don't know if any are trivial enough to sneak into later RCs but it
shouldn't be a problem to wait until the tree re-opens.

There is a remaining issue that a --enable-sanitizers build fails for
qos-test due to leaks. It shows up as a leak from:

  Direct leak of 240 byte(s) in 1 object(s) allocated from:                                                                                                                    
      #0 0x7fc5a3f2a037 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154                                                                    
      #1 0x7fc5a2e5cda0 in g_malloc0 ../../../glib/gmem.c:136                                                                                                                  
      #2 0x55ce773cc728 in virtio_device_realize ../../hw/virtio/virtio.c:3691                                                                                                 
      #3 0x55ce7784ed7e in device_set_realized ../../hw/core/qdev.c:553                                                                                                        
      #4 0x55ce77862d0c in property_set_bool ../../qom/object.c:2273                 

I'm not entirely sure what the allocation is because it gets inlined
in the virtio_device_realize call. Perhaps it's the QOM object itself
which is never gracefully torn down at the end of the test?

However when I attempted to bisect I found master was broken as well.
For example in my arm/aarch64-softmmu build we see 5 failures:

Summary of Failures:

   3/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test            ERROR          96.15s   killed by signal 6 SIGABRT
   9/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                  ERROR          32.50s   killed by signal 6 SIGABRT
  11/48 qemu:qtest+qtest-arm / qtest-arm/qos-test                          ERROR          26.93s   killed by signal 6 SIGABRT
  20/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test    ERROR           5.17s   killed by signal 6 SIGABRT
  45/48 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test            ERROR           4.97s   killed by signal 6 SIGABRT

Of which the qos-tests are the only new ones. I suspect something must
be preventing the other stuff being exercised in our CI system.

Alex Bennée (19):
  include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
  include/hw: document vhost_dev feature life-cycle
  hw/virtio: fix some coding style issues
  hw/virtio: log potentially buggy guest drivers
  block/vhost-user-blk-server: don't expose
    VHOST_USER_F_PROTOCOL_FEATURES
  hw/virtio: incorporate backend features in features
  hw/virtio: gracefully handle unset vhost_dev vdev
  hw/virtio: handle un-configured shutdown in virtio-pci
  hw/virtio: fix vhost_user_read tracepoint
  hw/virtio: add some vhost-user trace events
  tests/qtest: pass stdout/stderr down to subtests
  tests/qtest: add a timeout for subprocess_run_one_test
  tests/qtest: use qos_printf instead of g_test_message
  tests/qtest: catch unhandled vhost-user messages
  tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
  tests/qtest: add assert to catch bad features
  tests/qtest: implement stub for VHOST_USER_GET_CONFIG
  tests/qtest: add a get_features op to vhost-user-test
  tests/qtest: enable tests for virtio-gpio

Viresh Kumar (2):
  hw/virtio: add boilerplate for vhost-user-gpio device
  hw/virtio: add vhost-user-gpio-pci boilerplate

 include/hw/virtio/vhost-user-gpio.h  |  35 +++
 include/hw/virtio/vhost.h            |   3 +
 include/hw/virtio/virtio.h           |   7 +-
 tests/qtest/libqos/virtio-gpio.h     |  35 +++
 block/export/vhost-user-blk-server.c |   3 +-
 hw/virtio/vhost-user-gpio-pci.c      |  69 +++++
 hw/virtio/vhost-user-gpio.c          | 414 +++++++++++++++++++++++++++
 hw/virtio/vhost-user.c               |  20 +-
 hw/virtio/vhost.c                    |  16 +-
 hw/virtio/virtio-pci.c               |   9 +-
 hw/virtio/virtio.c                   |   7 +
 tests/qtest/libqos/virtio-gpio.c     | 171 +++++++++++
 tests/qtest/libqos/virtio.c          |   4 +-
 tests/qtest/qos-test.c               |   8 +-
 tests/qtest/vhost-user-test.c        | 172 +++++++++--
 hw/virtio/Kconfig                    |   5 +
 hw/virtio/meson.build                |   2 +
 hw/virtio/trace-events               |   9 +
 tests/qtest/libqos/meson.build       |   1 +
 19 files changed, 956 insertions(+), 34 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

-- 
2.30.2


