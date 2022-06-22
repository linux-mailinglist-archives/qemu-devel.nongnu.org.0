Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A765544D6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:23:55 +0200 (CEST)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3waY-0000Rz-6O
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTP-0000Tu-LD
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wT7-0007JF-Kt
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso12862255pjn.2
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XSAHcDbV8paIj3saLygfNUikFx+MzHtA6fVyOl7SRmw=;
 b=72+g6pc22Hu6h+nzy43gEOpkkB2/D3HXukpsAjvHj9pKJYRB8A6w+tWkxfzMftDwY7
 pERPFdnRKrjkaoumouv2I2e0SDn5ueTs+RmeJFSUZ1qbRWW0pxbovnDf4QAf+8NN6ADg
 hZ7PBhRMBPsNMFzU9xDZ7K9TGxuHa4C+EhVAjfWPNM2Y+HRCv9vLxlSEOc40rHF1FQas
 +soZhLOeBJppwJeoLGDcd8GG6jYYde91Fpd+6YiNPmOou+DouVo9qrYrDEKBxd1nIFPt
 UKLKeiLnY7riOxQyBFpOWuKBIQdjhWV76+9cWJGA5bFZUuzvAdist4qIoeWFIPzrfFTc
 p5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XSAHcDbV8paIj3saLygfNUikFx+MzHtA6fVyOl7SRmw=;
 b=onk9YFqXfJniveLlsd/854VfxztaBYtf1uR/HMlhrrHGtH9sDzIAuCkpqdb2HRMm61
 /ogkB1Jd/PeWtNDJznfyYsXJxOfZF+1EJBdpHC42tEuhRVfmJZeosQ0TCLn7DfICnwub
 lTc9beBbB5s9dVMSEIQL33IXQ+c9XLDb4pPJOVBnDE4Hac5t0exDVH8pCgJIJoG8tvaN
 SNf86IJvIimS2pBHMn9UaXPJFRmr6Ut/QE1M5KkUXV0f1Lb5LDe/ar6G+kInT6xBnxdH
 j3DEYc9TofFEGhcBCG1VAiNvUfuoz0TpufGOAJ0z8kIpYDcF10a38S4rxMIkByUSmCM/
 /reg==
X-Gm-Message-State: AJIora9DxDamei8GCA0eVmnIfM0SHY3yMdgI6+PMRcPk2xUPUuQug2uk
 BQTGJi4W2lKh3gpXA0vLbxaSq5UoQ5RQpM4b
X-Google-Smtp-Source: AGRyM1s0yF0yd/5+/BknAbK9dvw156Bha5HYcFVLCuSciORzfJ0LWHA0cAraXH2kgtqdjcOTQXMf6Q==
X-Received: by 2002:a17:902:e888:b0:16a:1b3d:aac4 with SMTP id
 w8-20020a170902e88800b0016a1b3daac4mr18038276plg.80.1655889369574; 
 Wed, 22 Jun 2022 02:16:09 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.234])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b0016a087cfad8sm9833900plb.264.2022.06.22.02.16.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:16:08 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	f4bug@amsat.org
Cc: mst@redhat.com, pizhenwei@bytedance.com, jasowang@redhat.com,
 helei.sig11@bytedance.com
Subject: [PATCH v2 0/7] crypto: Introduce ECDSA algorithm
Date: Wed, 22 Jun 2022 17:15:42 +0800
Message-Id: <20220622091549.31115-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch introduced ECDSA algorithm for crypto.

V1 -> V2:
- The reserved function prefix '_' is no longer used.
- When parsing ECDSA key: 1) set errp as early as possible,
2) use g_autoptr to avoid manually freeing memory, 3) simplified the
code parsing public key for gcrypt.
- When parsing the ECDSA private key, save the public key 
info (if any) so that the private key can also be used for
verification.
- Fixed a bug, gcrypt-ecdsa can truncate digest correctly now,
and a related unit-test is added.
- Fixed a bug, nettle-ecdsa can correctly add leading-zero (if needed)
when encoding the signature now.
- Minor tweaks to code style and typo fix.

V1:
- make the built-in ASN.1 decoder support more ASN.1 types.
- support ECDSA key and signature parsing.
- implement the ECDSA algorithm using nettle and gcrypt respectively.

Lei He (7):
  crypto: Introduce ECDSA algorithm API
  crypto: Support more ASN.1 types
  crypto: Remove "qemu/osdep.h" in rsakey.h
  crypto: Add ECDSA key parser
  crypto: Implement ECDSA algorithm by hogweed
  crypto: Implement ECDSA algorithm by gcrypt
  crypto: Add test suite for ECDSA algorithm

 crypto/akcipher-gcrypt.c.inc      | 409 ++++++++++++++++++++++++++++++++++++++
 crypto/akcipher-nettle.c.inc      | 282 ++++++++++++++++++++++++++
 crypto/der.c                      | 173 ++++++++++++++--
 crypto/der.h                      | 128 +++++++++++-
 crypto/ecdsakey-builtin.c.inc     | 252 +++++++++++++++++++++++
 crypto/ecdsakey.c                 | 118 +++++++++++
 crypto/ecdsakey.h                 |  66 ++++++
 crypto/meson.build                |   1 +
 crypto/rsakey.c                   |   1 +
 crypto/rsakey.h                   |   1 -
 qapi/crypto.json                  |  28 ++-
 tests/unit/test-crypto-akcipher.c | 338 +++++++++++++++++++++++++++++--
 tests/unit/test-crypto-der.c      | 126 ++++++++++--
 13 files changed, 1859 insertions(+), 64 deletions(-)
 create mode 100644 crypto/ecdsakey-builtin.c.inc
 create mode 100644 crypto/ecdsakey.c
 create mode 100644 crypto/ecdsakey.h

-- 
2.11.0


