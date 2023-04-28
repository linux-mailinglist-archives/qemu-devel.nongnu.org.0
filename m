Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7F6F108B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 04:53:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psEEH-00055G-Bl; Thu, 27 Apr 2023 22:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEE-00054r-Tx
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:52:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEED-0005a4-7y
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:52:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b51fd2972so7120571b3a.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 19:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650375; x=1685242375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rBdtk+u7U1HZVZUJbyTT+O6cHagFN2jzxc2hnPSk9fE=;
 b=L2MRW3/ZoP2fGOLYVIPpCtvjuCC2k4SI1AEAIKc3IsV6CJmr8E01S4pyjXt635MRco
 hbMfTk5sQaylFOcBGXNS21sBkiFBtcPa5f3wcgQlws8RF06n79bN1QGT08796jAIpnWP
 fzZ7WrJWx171W6zUcrOsWpjCDEkoH8P80iTuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650375; x=1685242375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rBdtk+u7U1HZVZUJbyTT+O6cHagFN2jzxc2hnPSk9fE=;
 b=D9aCeKjQA8vvXenlXKl966Hd3/IvTsWu1UzISm91+VnHefJqNGPD5LOtgu9aSobKWW
 ZQupis6Rqb1VU/DOgluRGHC/M+e4scCNVNbI0rQSQlB6brTH/SvtiSBYksR5S8QaKFkm
 ti3WcK0BU1by2Z4vIVwcX0X+YG5MwnDYZIMeENHjbB64PnEogopIUYc9vF9/8FogOyuu
 6jpITWWHXHyp3rk8+UWYAWJOrM1DudxfpjxKZMrMhd2WUcSO+LLSGWC5Ke0I1vNlM7z4
 ECN30QF+q5Sq8G6MwltbkMw3Yr6O1Sqj4xG/ezuzUsrIZrSv9XctCbNvD7eBTgRm6LIb
 wspQ==
X-Gm-Message-State: AC+VfDwzdTWEXpOdlPIDhpxaVDBOhO7zI/alInpaTPN6ocXco2Y/T/gA
 RQuXeFvAfE/7Nm2I/E0M6VveEieMqdXQw3MvIpc=
X-Google-Smtp-Source: ACHHUZ7SkkXeUm26ND1QBYWZphe8r/O2MHC3YixS3Ia/1uxX0Y/1cPXkSxRxcpzRXW6b1on00gWUwA==
X-Received: by 2002:a05:6a21:398e:b0:f0:6aaf:1abf with SMTP id
 ad14-20020a056a21398e00b000f06aaf1abfmr4637261pzc.4.1682650374758; 
 Thu, 27 Apr 2023 19:52:54 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9f50:6799:fba2:1f53])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a62d115000000b0063d24fcc2b7sm13854437pfg.1.2023.04.27.19.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 19:52:54 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: [PATCH 0/5] virtio-gpu cleanups and obvious definitions
Date: Thu, 27 Apr 2023 19:52:46 -0700
Message-Id: <20230428025251.603-1-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series refactors the virtio-gpu-gl device in the first three
patches.  The 4th and 5th patches are definitions already in the
virtio-spec and can benefit all three of the following proposals:

https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03791.html
https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03972.html
https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04111.html

All have been reviewed, aside from patch 2 (which is code movement).
Hopefully, we can land these to reduce the patch load on all GPU
modernizations attempts?

Antonio Caggiano (1):
  virtio-gpu: CONTEXT_INIT feature

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gurchetan Singh (3):
  hw/display/virtio-gpu-virgl: virtio_gpu_gl -> virtio_gpu_virgl
  hw/display/virtio-gpu-virgl: make GL device more library agnostic
  hw/display/virtio-gpu-virgl: define callbacks in realize function

 hw/display/virtio-gpu-base.c   |   3 +
 hw/display/virtio-gpu-gl.c     | 114 +--------------------------
 hw/display/virtio-gpu-virgl.c  | 138 +++++++++++++++++++++++++++++++--
 hw/virtio/virtio-pci.c         |  18 +++++
 include/hw/virtio/virtio-gpu.h |  11 +--
 include/hw/virtio/virtio-pci.h |   4 +
 6 files changed, 161 insertions(+), 127 deletions(-)

-- 
2.40.1.495.gc816e09b53d-goog


