Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6A369D81
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:39:10 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5O9-0004vg-7x
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5M2-0003sh-DI; Fri, 23 Apr 2021 19:36:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5M0-0007gQ-U9; Fri, 23 Apr 2021 19:36:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso2002502wmi.2; 
 Fri, 23 Apr 2021 16:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SYGlQayWmd2E9SkzHPVRB+o26E4LvvaDIWzQKpcwkNo=;
 b=QHqvBD7JqO/pFI++a//VPkdqKlFTwe2b6Ps2pp6hGHLun210StyBiWvvxx6v9cKfoU
 PqeERxViFgI76IeoOCDPEqlAhiSv1xGWwSwJNAHsQ10HTPxf46DxYJk9+tLsLWQbx7lr
 QgpEGwMcv0QjONMtuksWxLzBGFWQIFPiLbYEjjnOjYjoFRd7I3Iqt87FMAvnJQ9G99tC
 GCahLmCk3J9/uxbC1R65Dm5HFl751gjNxkQeKQ+6H5VPEPNMjtNrMazuLWxtq0elHcb4
 2tCnnIlzQxjMtk3iWNXeumKJYZYHkKBtBhgMsBHWqCTXskNH8OOmvNvXYQCDuzVAL2U1
 WdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SYGlQayWmd2E9SkzHPVRB+o26E4LvvaDIWzQKpcwkNo=;
 b=btuEi4/LqmLjt/U3IK4ZaalxUxcwhgMUqMCsW7Nxf0rOJG1mK9mEMFq2JGbMpVLNaA
 IiXiT4sjWSKIVctESGHtjkyTZu6jZyPn/UrCLjyA1ZfWhdlgHrlfGvPKHN5mg/+xRRDC
 4mA8bjr2vwmS8uKctVek0/Q0+zLwgLyIt3w6pJBDVpwwIOpgABTbvRYormekCEFIftTb
 e3ZZ54mwKXnuQhc3I4W0McqlVpfaYXNBDg+35PbA9PDAL9yIQSTWAyD97wzQGqeQjHZK
 Bx6JJxnGdmlBibFjbmF9BtnCKK5qJryuOInHLpYpytBBrPCrMu0q/SM4+aqoAe2tf8EV
 l2vQ==
X-Gm-Message-State: AOAM530yhjOPfUmbl2jPL5K64ukBjkvA9URFUb1gOFOGpM6hS03RO1K2
 mEq5M4i7JO8VHX0mkvB5QXFg8mKKlyB7ng==
X-Google-Smtp-Source: ABdhPJwfw4xqMorIrpIdPif15HkdAPLP/99tD/C67dmG1bmWkBjpKs3VJDv/DvFk9xLXGktxHxgHNg==
X-Received: by 2002:a1c:2b44:: with SMTP id r65mr7843222wmr.57.1619221014556; 
 Fri, 23 Apr 2021 16:36:54 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm10766413wrt.57.2021.04.23.16.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 16:36:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw: Qdev'ify reset() for mc146818rtc & etraxfs_timer
Date: Sat, 24 Apr 2021 01:36:50 +0200
Message-Id: <20210423233652.3042941-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove qemu_register_reset() when a qdev type has a qbus parent.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/timer/etraxfs_timer: Qdev'ify reset()=0D
  hw/rtc/mc146818rtc: Qdev'ify reset()=0D
=0D
 hw/rtc/mc146818rtc.c     | 35 +++++++++++++++--------------------=0D
 hw/timer/etraxfs_timer.c |  6 +++---=0D
 2 files changed, 18 insertions(+), 23 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

