Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2A2CAB7F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:12:24 +0100 (CET)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB4Z-0005cl-4O
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB2r-0004EV-A6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB2o-00018u-BY
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F0PdNq6OI7jCU/4e7K4T7awyTqVIN7LsLzWIIqNpxm0=;
 b=NN7JN85b73Cd81MELTuTel/uBuOa2hmFlWobd0baijpfRetaTh4WJ9buL0o/fiDbqTR7RJ
 SEUEpIjgT+N7E831Ayv5YdOqLjB5Da4IpQxLI8ZfEYRhJlr3X4VJ1DNdyDlaN1c0l4JhhE
 g78D1mlGDNObLfqQwMuM17jnSN653+8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-2ceTv77IM-mkhR0s4ss68w-1; Tue, 01 Dec 2020 14:10:31 -0500
X-MC-Unique: 2ceTv77IM-mkhR0s4ss68w-1
Received: by mail-wr1-f69.google.com with SMTP id b12so1420664wru.15
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jq3EEd3gendQSCNpHcdHdg66bYVPNJ80Z+E4czmT9lA=;
 b=p+LGnaijB3mkKxrUBIuB1jUIV1VVLIWb9oE6IEhmJClLHmQJtPbnZ71IMIU+Vhm1Vd
 IFPwC5PrOrLDPd2Xcx/3IN7AFfcPH2wgjupxBy0iHp26P9cQp9hriaJu+ahcdRNPiKus
 4gJ8Ti8vx6YqbjHwfrR2QLRGlLb9v/88aJ988aPuqAikeuj+7Ydk/jGEu5UipsQXJ3SJ
 McElh6ap5l1240LoBNoIt2u+D89akp+CM2FLXA06YNJRvou7MAPqrwzFPddUeFTQkM8S
 sHWzE3liVkttjQXhBwCESLjm7vY1s/E3iixYKhMR4vK32YZY/4x9eJFS6A/FVZ2ZTNSH
 k3yQ==
X-Gm-Message-State: AOAM531ugOMl8vpEFfSV3zzuhnGGM1v8M0th3Br496QS+7+v0hoKJMWL
 TESbad/AQQhqxOS/tZnv8UxOv8Z7VPfOwF2Eqrwi+q2VVyFczx5ExPpniDrhFcV+LLOW33501Lp
 vDGOPKv6E0ya6T3em9qjXwKE5EzOGwksqteOejoSEu/rNyDEXxLWGzJy4WjVVqRrN
X-Received: by 2002:a1c:2502:: with SMTP id l2mr4159578wml.40.1606849829533;
 Tue, 01 Dec 2020 11:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2y2uvouQKQpQzJahdRySosHLVUH9uovx1dZKtha+yYpGttdkkTCU7ysydmSzlnTpUBTTSbA==
X-Received: by 2002:a1c:2502:: with SMTP id l2mr4159553wml.40.1606849829293;
 Tue, 01 Dec 2020 11:10:29 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b12sm12437192wmj.2.2020.12.01.11.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/scsi/megasas: Avoid buffer overrun in
 megasas_handle_scsi()
Date: Tue,  1 Dec 2020 20:10:22 +0100
Message-Id: <20201201191026.4149955-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW megasas is not use by KVM.=0D
=0D
Not sure what is the proper fix, but at least we=0D
have a reproducer.=0D
=0D
Since v1:=0D
- Fix assert() condition=0D
- Extract reproducer in different patch for git-bisect (thuth)=0D
- Add simpler reproducer from Alex=0D
- Try better scsi error=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  tests/qtest/fuzz-test: Quit test_lp1878642 once done=0D
  hw/scsi/megasas: Assert cdb_len is valid in megasas_handle_scsi()=0D
  tests/qtest/fuzz-test: Add test_megasas_cdb_len_zero() reproducer=0D
  hw/scsi/megasas: Have incorrect cdb return MFI_STAT_ABORT_NOT_POSSIBLE=0D
=0D
 hw/scsi/megasas.c       | 13 +++++++++++++=0D
 tests/qtest/fuzz-test.c | 20 ++++++++++++++++++++=0D
 2 files changed, 33 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


