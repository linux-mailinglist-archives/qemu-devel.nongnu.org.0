Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80E694DA4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcE9-0003XE-77; Mon, 13 Feb 2023 12:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDX-0002qp-26
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:22 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcD8-0007Vu-QK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:01 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k3so5330769wrv.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MtWTM0K5tkV+XNFmYaOZt2Z0nk1lvVSTdkNElUqYwac=;
 b=ODjl6QyYnPud3MNFuMKMuU6rgE1dn9yJu9M0pkEBcTDcs4PhOR9ktxoGyEP8sfHA8/
 xd5EkPoBLyggjkPHoJEM31Ps3ia9P1SeriVDb4mxgDa+o51ZjBjhBHLd2Vo/foVqilkU
 zNU3SZJ0o5nImBy1Mhc1e5uJhcQmf1NhSmmlZTMwQAtorU2cl1cdmfmBInMNaMKKSvoL
 B5d0bBQ0qUAAO4VxpDyM1dQ+of5Js5CIKkufzzOz5nJxrTLFUHtjApBWd9gzyCAnJWcW
 J7YComyyECXX80BVpLGhX1YOEk9zzpowtCpR7e6mcH0eRjoijhjIEWmgIQiVIpcsQvbZ
 tlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MtWTM0K5tkV+XNFmYaOZt2Z0nk1lvVSTdkNElUqYwac=;
 b=OREz5lTIxlyUJVdfEaTLLsFaoraTV6IuypYAH+0EKIO9risziMmh+J0641ErINQ0Kn
 yMnTDStCTiEBw4AIoKdac4HB6GBVzU8kdpXtyHN5V27TOZLS7+ZgceFhSQKKcOY9W1nR
 NmfDPRzS1c8xI0XSXpe29JHgBBIjAjhlWThqmV5NN2BPhP1/9MsiBw7y9L+Xx3wgecQe
 gjaI3N3Skfqtc8k7WjqRQhTx4W31rXke/Yh2VMmNkxJS5JTnfIxHzWK6hplYIoJOQjWA
 Xj8Y8qcyvS/hDJDTlz2ZpjO5B9MYenkoqowyWkMkR+xSuVKE9YFTsyhPMDImqbtql6KK
 08fg==
X-Gm-Message-State: AO0yUKXOS/mhS0xyvxueGx9t32itqzJdenXxjPqoWp+kzB+59ueagaiF
 PJ9Rj5Vcfzl90NfXPZNVfNdfQA==
X-Google-Smtp-Source: AK7set/9lKrUcx+3GHh4C/XYWyg7Z+hzArIuBJzBWGAtUEo1XsCgTNTLuI7nEdQBSA7czrEbYly7Ag==
X-Received: by 2002:adf:f249:0:b0:2c5:4ce5:4cd9 with SMTP id
 b9-20020adff249000000b002c54ce54cd9mr7752341wrp.34.1676307708944; 
 Mon, 13 Feb 2023 09:01:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5045000000b002c54d9fbea5sm6813911wrt.73.2023.02.13.09.01.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:01:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/6] hw/vfio/ccw: hw: Use QOM macros and remove DO_UPCAST()
 uses
Date: Mon, 13 Feb 2023 18:01:39 +0100
Message-Id: <20230213170145.45666-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

QOM housekeeping series which replace the DO_UPCAST() macro
uses by equivalent QOM ones (and few more trivial cleanups).

Since v2:
- Split of bigger series
- Split in simpler patches
- Added Eric R-b tags

v2:
https://lore.kernel.org/qemu-devel/20230213070820.76881-17-philmd@linaro.org/

Philippe Mathieu-Daudé (6):
  hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT()
  hw/vfio/ccw: Simplify using DEVICE() macro
  hw/vfio/ccw: Use intermediate S390CCWDevice variable
  hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by S390_CCW_DEVICE()
  hw/vfio/ccw: Remove pointless S390CCWDevice variable
  hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by VFIO_CCW()

 hw/s390x/event-facility.c |  3 +--
 hw/vfio/ccw.c             | 40 ++++++++++++++++-----------------------
 2 files changed, 17 insertions(+), 26 deletions(-)

-- 
2.38.1


