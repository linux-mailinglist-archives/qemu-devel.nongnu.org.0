Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158D1C3918
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:16:44 +0200 (CEST)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVa1b-0001Ij-Af
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVZkW-0004Aa-K0
 for qemu-devel@nongnu.org; Mon, 04 May 2020 07:59:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51787
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVZkU-0002pe-TM
 for qemu-devel@nongnu.org; Mon, 04 May 2020 07:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588593541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sOkjDbv4ky4LriGGoQ+j5WzMVU5Emlrzl3ac24C31dk=;
 b=TCIvbcyrnTvZ3D2EhCHXy8fB+cfytXXFFPS/qgk0WLY6mAwrGr2xaKLVLhCCLZ04j+cOsp
 1nxsD6BrMN2NtmFeEEVy8L4/0iyWHz8lVAAIadMPkkSuOrsYqtTXm1qO/3IU0II3lTA9Xk
 2gePz3f5sFBgJW5THAPZqF51ydlnzcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-HXtpG7SePLySiQS2i_BUJA-1; Mon, 04 May 2020 07:58:59 -0400
X-MC-Unique: HXtpG7SePLySiQS2i_BUJA-1
Received: by mail-wr1-f69.google.com with SMTP id o6so3237107wrn.0
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=wbNj8FiSfG6wixKGichZVJdAjxv9IMp1nX8E329slKI=;
 b=EtQlB1ZpyoiepB2bEkTnVfShdRzMvtKRhhDcH99rkSke5b/Pdfy6ivBSp7Ir6jVSSX
 ol2L/M1wu6txsPefNL1jsob9cErQLqO5IjQZGVnFVC3ZYZLPt1CPua5txJK3AaH6fTE8
 r0fl9J13o/jOg0rjJo+Yge+KNG/bvEMhvFQsNo/7at/tCoWSFT/aFlRm6kfKy7m/umZh
 v6Rt/+eET4Pmn6D66F0siljbi6U3toX0TBCO6WAMR6ozIjZZRQUE9dk4cH3kbG+nTj12
 txLQbTKDUGE7S1Z4hd/IWALSIJB4qZkxcJ2NUYU5YqjXdgZo8Fby9XjDlBfL0oiWr+Ip
 swaA==
X-Gm-Message-State: AGi0PuYOPH7zpOfFLPHMu16Yon4Qy9N2P/SkE8bT+4L24bYHL9fPl+Tk
 0WfyeknzTNYzVG7FkStPu1VTa0bWdIcfFW7xV/fCHVR1OhhPQwn+473aFnw15NU8TsUopDKOvQq
 UI1MBjFGX/Ah2obA=
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr13917412wmf.176.1588593538353; 
 Mon, 04 May 2020 04:58:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/PH2/WwpkxueTSP/jWAyEXA7RUhFcEtrLUJfhNpBtw4oUm88PIH/kKzYU838r3MKUjvTpUg==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr13917399wmf.176.1588593538169; 
 Mon, 04 May 2020 04:58:58 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 60sm18185074wrr.7.2020.05.04.04.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:58:57 -0700 (PDT)
Date: Mon, 4 May 2020 07:58:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] checkpatch: fix handling of acpi expected files
Message-ID: <20200504115848.34410-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of bugs that surfaced.

Michael S. Tsirkin (2):
  checkpatch: fix acpi check with multiple file name
  checkpatch: ignore allowed diff list

 scripts/checkpatch.pl | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

--=20
MST


