Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63845080F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:17:00 +0100 (CET)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdj9-0006mA-CW
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:16:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdRr-0006q3-D0
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdRp-0008Sr-Bj
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ezQTEZlIuRIW2K8I7M1nlJ2bK1aWUVEEeF6rwmfJAxw=;
 b=FQbDu8he80JTQIftsrJb/m0jHD2pwLq/HEyPOa4ossmE8SZD0JkXGI6e7kYddN071FVPP2
 Xr3krSQE/bjGB3BMWmUTkaJGXoBDHFvKFAKBeEerx1i070ri8/YJZ+422QU/eHGHbkJXfM
 N2FgGPYcc8XFanQWlmyJBUo9f4KLUCc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-6-sZ1ZlWP3y23YtjZebjlQ-1; Mon, 15 Nov 2021 09:59:03 -0500
X-MC-Unique: 6-sZ1ZlWP3y23YtjZebjlQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso22799wms.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jsXD/xEd/2lB57hIztGMJW9Ov7q4vOc7CYHAGmuXec=;
 b=E+TeMYOQOZb/9nX/t4EDSUGqJSLVHTV426KKtsQP1nOrDwSKKSeIYYpcMhYlMFDvUb
 J1kWb/WC3UvwUUJMVU5u3ab0d8Ew4SqNr62VcI/D1E+1OKX93DxzAmClZyuAXkbtPdAb
 f9Ms9mHClbksv7leXB/vjSqlounPrf+/MYf8fsMm6GDGlZcGgpHwTMxLVJtKbcth4Wz5
 iV8K/a7uUL0dbEusbkF1TBVzwRYSBsTeKPUvKamc6gNPgaF1GCbQjdMj7TbpTjvwE7Km
 IivddJanpe+ikajiEMJDfoauKmDb3pAh5OmUZdtIK1tskDcUsHSXPxoDoj1h7v1RPvd1
 xAkA==
X-Gm-Message-State: AOAM530tkRr5yLeBbzKuFoJwmeiz+OKl/hXh+oI+xh4fqQfaPk7Jn/OO
 6VK5rzcEV7Oo/W1FTjHhqGRy79wgDpCCzAQ5zSKwoxPtMF1URSBPojIBN3CS9qU1+WfukH79J4r
 pvFRguqXlg/RbFGj7241DltcUCulyyG4UHEIFTsMjGbK5UuYRkHLGw5pumx8/zKWU
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr42107053wmb.103.1636988341858; 
 Mon, 15 Nov 2021 06:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2vSs6L1OK7RKsqkyzS89ckxDoM7ytbLepTZd89Ml4E+RFf6vV3DuXxNpMRPbMkKwukHKmHg==
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr42107002wmb.103.1636988341514; 
 Mon, 15 Nov 2021 06:59:01 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k8sm14243240wrn.91.2021.11.15.06.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] tests/unit: Fix test-smp-parse
Date: Mon, 15 Nov 2021 15:58:49 +0100
Message-Id: <20211115145900.2531865-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: patches #4 to #8 (new)=0D
=0D
Yet another approach to fix test-smp-parse.  v2 from Yanan Wang:=0D
https://lore.kernel.org/qemu-devel/20211111024429.10568-1-wangyanan55@huawe=
i.com/=0D
=0D
Here we use the QOM class_init() to avoid having to deal with=0D
object_unref() and deinit().=0D
=0D
Since v3:=0D
- Restore 'dies_supported' field in test_with_dies (Yanan)=0D
- Add R-b tags=0D
- QOM-ify the TYPE_MACHINE classes=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  tests/unit/test-smp-parse: Restore MachineClass fields after modifying=0D
  tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()=0D
  tests/unit/test-smp-parse: Explicit MachineClass name=0D
  tests/unit/test-smp-parse: Pass machine type as argument to tests=0D
  tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid=0D
  tests/unit/test-smp-parse: Add 'smp-with-dies' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-without-dies-invalid' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-without-dies-valid' machine type=0D
  tests/unit/test-smp-parse: Simplify pointer to compound literal use=0D
  tests/unit/test-smp-parse: Constify some pointer/struct=0D
  hw/core: Rename smp_parse() -> machine_parse_smp_config()=0D
=0D
 include/hw/boards.h         |   3 +-=0D
 hw/core/machine-smp.c       |   6 +-=0D
 hw/core/machine.c           |   2 +-=0D
 tests/unit/test-smp-parse.c | 221 +++++++++++++++++++++++-------------=0D
 4 files changed, 148 insertions(+), 84 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


