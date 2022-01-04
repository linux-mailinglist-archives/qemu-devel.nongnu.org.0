Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A6484781
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:10:46 +0100 (CET)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oGj-0001G5-D0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDE-0004I4-ES; Tue, 04 Jan 2022 13:07:08 -0500
Received: from [2a00:1450:4864:20::32f] (port=34624
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDD-0006NZ-1H; Tue, 04 Jan 2022 13:07:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1157408wmb.1; 
 Tue, 04 Jan 2022 10:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=UIiB3E5g0YPP4u8yJXVFpeg41sztKfqN0/FNGgh9bwY=;
 b=IhDN/zLDgTRYpIxa6QvGIzbscue03EZJwyabnDgo5Er0rEMQrRrj9bHiCRawZOoU3A
 wyCdvbRCMUX5Z3+gNXNjjB/HiyV6wtL5mOrzkJxp9yhR+iSWgIthDQAzyDqgQwZRbUXH
 uk5XPI9WJb+vBLb7MlBrJT2vHOoNXPJL5I/X79yMY5ZMiCHm2TyhGnVKDW/3gKQGOQyq
 BJgJb3EUFIS1cpFwejlyk2dRdYJ4jMyAE9TrnJP3UskjOAwWG/03PEymtDgPiBX0n2q3
 snTC/CEQZ/1X9LSEGvCFoqLigBzVx58n+/vtTFYH8PToElsyJR8uDj4o/hhMplV6ScBT
 UB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=UIiB3E5g0YPP4u8yJXVFpeg41sztKfqN0/FNGgh9bwY=;
 b=HsIg+N85ed1T8Eix4Q8sUAh6Komd/iPHMwbzPdhHs5Q7DbVI5zryIdSNsSHRnkGDf1
 mUuJ1YV5V0ZAEHZiecwLp6s11Vyw3R9U/mR3W0mQQG7KE9Bskk6CqKjI02y9Z4lP3W53
 pWsnYKW2kNiOH8x9BVYVdu2b9sA8U03jRLewl/E8JStwJ/iZEp6aadxjHePSGV3RjkPU
 h+crDF4mtyOCAIi/OqDkE/HhyuNyoV9o7hbuIuACRN9WVlgQe7LtI8DW4jP72DCo8RVY
 MgXav5xJ75TTx6GclN+Odz2E0OJC9Pfxyns3sUhELlRYgJXw+q+1Qfw6VEUp1fvRbZzI
 n6qA==
X-Gm-Message-State: AOAM531IIjb1Lqo820q2pHQ7oukMh7A8xlldXLa6jf5zlZq8+/0vi3Td
 PbwohiUy1aFjh8ujzqdw1r0MGt4yLGk=
X-Google-Smtp-Source: ABdhPJxMST/oXVKFigO5gjyRIUxlqXc3azu1Mo6sXIR56lnG5v0CIp/OriGPPjD1r2DXnWXFYcnUbw==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr43973572wml.0.1641319625525; 
 Tue, 04 Jan 2022 10:07:05 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id o11sm121997wmq.15.2022.01.04.10.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:07:05 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] use trace events and fix garbled output
Date: Tue,  4 Jan 2022 18:06:57 +0000
Message-Id: <20220104180659.91619-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset supersedes the earlier submission and incorporates
feedback from Laurent Vivier and Gerd Hoffmann.

There are two patches addressing the following in the vmware vga display
code

 - use of fprintf to log debug output to STDERR

   This has been replaced with trace events.

 - garbled display due to lost display updates

   This prevents an issue that can cause garbled display output when
   a high number of screen updates are being requested.

   The queue is now flushed when it reaches capacity.

   The code traversing the queue when updates are being applied to the
   display has also been simplified, since we always start the traversal
   at the beginning of the queue to ensure that all updates are applied.

Carwyn Ellis (2):
  hw/display/vmware_vga: replace fprintf calls with trace events
  hw/display/vmware_vga: do not discard screen updates

 hw/display/trace-events |  4 +++
 hw/display/vmware_vga.c | 63 +++++++++++++++++++++--------------------
 2 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.34.1


