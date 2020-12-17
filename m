Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D592DCE96
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:43:31 +0100 (CET)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppoo-0006R9-Qz
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmE-0004f4-Ur
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:51 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmC-0007hF-Uv
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:50 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j16so5506443edr.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/R1+lR72sXFvAOgt6QuHhVTv3DUHzbJ6zXMZY/lH7ys=;
 b=tcAVk8IjQBXoW13K7onRC06DDyXjDHZ0t9giETQjIn+18hHBSRzVXXVIMSIRcLvdOn
 SEVF8QfMBQ1y4BbZ4peD9P9yT3fAww2fZoG8lYdbN1bFgXbF27DyWPAsRSNtOZ/wp5Vw
 4+7yztL0X+Hxp35rDJAfAKDa5FImFDKhSt4j74biZTZIYmLENxlMf+IF5Th3FJg4AtkS
 8SDfiMP3IgMXd4qyoENa3p7hvmMjRpkPsTqmBB7MD4QM/XpcatrMk2GkA1z5BF03MF7P
 tjPrMVUf6qnVHJLtNPgAtcTs+dv2VP4A5ieHbuzSfEB9whzF1PWMRXUeOmFhwpbR+1+A
 7XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/R1+lR72sXFvAOgt6QuHhVTv3DUHzbJ6zXMZY/lH7ys=;
 b=GGX4KS/GyxrcgaVriGOpCCiPiNQEKW1Ro1yFFdiRj1te7W9y1AEBAd06ihjbANslGL
 c555/LHmz0cYVtFI5sqWSlF6/O/RFy106ZOXf8SXp5qy8PRIOIVDt6nLPtP661acsFKf
 ttw/8iKwvLX44sPUgWvQ3d3b1D/oDo2KBFxN/2vRbwdRU4Z57AoPqqRpQel6yXKU4E9r
 TltAZVYGXbG6MZl6TMxlQi3iX3bGlrNvJ9OxsSsTYnyS4AgkLIlhJ83PNEZRemIm4PXg
 Jp9ykkH2OpRx7CYvwWi9G3S0hw+h5NOwXva6XtRIZ0k87geOxbNui0VQpzdw2aN01B9B
 XDQg==
X-Gm-Message-State: AOAM5315MKQzW/xUWm2WmyjICZfTsfEZQuSMs1Fjo+LaJ+r6KiPjSgmK
 aLlLgciubk3MbaOoTB+8ppF+enN9YlU=
X-Google-Smtp-Source: ABdhPJxeDbngff1HO6Uq+4yYeMOiHQCBW3WZ7fupTRsd782jOEB1b8rjTjoLRHfH+yz932pmnV2GrQ==
X-Received: by 2002:aa7:dc4b:: with SMTP id g11mr39003601edu.379.1608198047213; 
 Thu, 17 Dec 2020 01:40:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] meson: move detection of various libraries to
 meson.build
Date: Thu, 17 Dec 2020 10:40:26 +0100
Message-Id: <20201217094044.46462-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not particularly interesting except for the diffstat and for the removal of
curl compatibility code.

I am sending this in preparation for another RFC around automatically
parsing configure command line options.  This uses Meson build option
introspection data in order to parse --enable and --disable options
that have been converted to Meson.  With a larger number of such options,
the advantages should be more apparent.

Based-on: <20201216162006.433850-1-pbonzini@redhat.com>

Paolo Bonzini (18):
  brlapi: convert to meson
  curl: remove compatibility code, require 7.29.0
  curl: convert to meson
  glusterfs: convert to meson
  bzip2: convert to meson
  libiscsi: convert to meson
  libnfs: convert to meson
  libssh: convert to meson
  rbd: convert to meson
  lzo: convert to meson
  snappy: convert to meson
  lzfse: convert to meson
  zstd: convert to meson
  seccomp: convert to meson
  virtfs: convert to meson
  cap_ng: convert to meson
  libattr: convert to meson
  meson.build: convert --with-default-devices to meson

 block/curl.c                        |  28 --
 block/meson.build                   |   2 +-
 chardev/meson.build                 |   2 +-
 configure                           | 593 +++-------------------------
 contrib/elf2dmp/meson.build         |   2 +-
 contrib/vhost-user-scsi/meson.build |   2 +-
 meson.build                         | 325 ++++++++++++---
 meson_options.txt                   |  43 +-
 migration/meson.build               |   2 +-
 softmmu/meson.build                 |   2 +-
 softmmu/qemu-seccomp.c              |   2 -
 tools/meson.build                   |   6 +-
 12 files changed, 370 insertions(+), 639 deletions(-)

-- 
2.29.2


