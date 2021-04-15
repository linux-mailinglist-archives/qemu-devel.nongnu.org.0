Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430AC3609AD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:44:59 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1Mg-0001TE-9q
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Kz-0008HZ-E9; Thu, 15 Apr 2021 08:43:13 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Kx-0006Rh-Ob; Thu, 15 Apr 2021 08:43:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id n2so36616760ejy.7;
 Thu, 15 Apr 2021 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+l7lt09eYsKPa9p0eJhHW5wcRb9BkcCl8a8ZhO9zx8=;
 b=QyMVFLCVnmft70agl8qRRDXxJCxneOXsOhpJJTmbD6VmQmm27KK0PqdTHDhkhYa/L6
 9nFQF855wBAPhE+vv+ttIYWLGx5ljEOq/LFcCnx/optH1oxBnGUEc8T4sF2T2SzqAAHI
 bEpGB3sHiNXatw+ASNlQFutlz5rNMSzVDPsi8aAwtfvkqUSBak+eWD8mekyVVJP5+hN0
 cRlotVeZgkhecy3hZawDVtSEhCWjRlj18kiBQoBdQYD8bw2ymE/1uWrTRgwabwjTGu1K
 HUScr74dS+pTgcRzJuEOJZP14aGXhxSc1xkusrzHY3CJl9ZhmD7WugQ4l4DRSsmnGDtD
 MUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F+l7lt09eYsKPa9p0eJhHW5wcRb9BkcCl8a8ZhO9zx8=;
 b=BDot2jU7C9DJKVkzgEAKTFSsBoaR1jThLelxj2iZao7fNhU2FWnJjQpaOw9fXI4VTG
 jc+OeR1lhoVEy7zYrlvUrVDwgOnqe/kPTAYIwQgr+TzS4+fheBzjORSj86a3QRqKON4U
 c2T3Tcp3Y1XwARMt9ozV6Z928pbzvJl0n4gFijwjAXNqBgBdJXEEGfvsiRCexAMQ6YTE
 zr2gr4uZV0/t48JI791uC454RzkkXSgwZdZ2vea6omU7h8zsLtXR9bEGs+gA8V5SSCgK
 pvFrvxHK78bOej5Bybg3As6U4iTrmCDA5fQJFw2CUOhBPqGBhzDBXX+cr0zZimIefN09
 oT+A==
X-Gm-Message-State: AOAM531d0M/KwPqfZbW756LUU+ifUEYhUp3o6N8amSDcjcdPOgcNSilQ
 Q6qHrq9EvsMMaSkX70/60U6CGAvbWQ0=
X-Google-Smtp-Source: ABdhPJxmmAvyvW3mm31RO9oMtLTojkq0g4J0A6J+J+LcmQYloQNudH/MDBdFkh9bnTdq0cW1j6YtSg==
X-Received: by 2002:a17:906:a0d4:: with SMTP id
 bh20mr3213139ejb.348.1618490589365; 
 Thu, 15 Apr 2021 05:43:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r10sm1862585ejd.112.2021.04.15.05.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:43:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] file-posix: fix refresh_limits for SCSI devices
Date: Thu, 15 Apr 2021 14:43:04 +0200
Message-Id: <20210415124307.428203-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

refresh_limits is not doing anything for block devices, and is retrieving
the maximum number of s/g list entries incorrectly for character devices.

Patches 2-3 fix these problems, while patch 1 is a small improvement to
avoid making the BlockLimits unnecessarily restrictive when SG_IO is not
in use.

Paolo

Paolo Bonzini (3):
  scsi-generic: pass max_segments via max_iov field in BlockLimits
  file-posix: try BLKSECTGET on block devices too, do not round to power
    of 2
  file-posix: fix max_iov for /dev/sg devices

 block/file-posix.c     | 37 +++++++++++++++++++++++--------------
 hw/scsi/scsi-generic.c |  6 ++++--
 2 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.30.1


