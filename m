Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B08455ED8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:01:28 +0100 (CET)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniul-0000cm-ND
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqr-0004QE-RH
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqn-0007zt-Rl
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aF/1Cll5GBG0ImCh0+TwhVTfKZmGtPUckb4kW0whpnk=;
 b=dK9E7IzGUFn+yPqyKytzZRV3EwMhE2WjqvqqMBRlGdz+lr05cfRZI2Sf/GsFdJslhTUYNY
 +cFsALwzovu5eiPvkJxeW8sDAS8sIgVo7Bz4VwM47eWWmXF9RdTfzAndKa/jVrIheRCr/o
 z9W3mIIRwVN7oXtGL656i7Bp/zQQHb8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-sMSo0ENHPIqW7MSHdy0dRQ-1; Thu, 18 Nov 2021 09:57:19 -0500
X-MC-Unique: sMSo0ENHPIqW7MSHdy0dRQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so1142221wrd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6JodK9voquTADI6TTHs6hYri+Bty6chl3usVEW7PJU=;
 b=iMDFZIdTq1iham5ATWXh2nOZKMptf5w26kyyYp06oMxtHHid35bVq2IYeblbxQtNOl
 uTqvz/5LxObFTsmSKRBts6CdlCC6uWj7wTgBhtnwkH+NkYRAMF5kTAJPGnafRDA0RHfS
 zSsh6QvufS1tFvPVqypm5bGXZ4d+aclb+QFAKm3v6876TR/EY9xQiYbCXTFwDGZI+g6Q
 uHzT9p5/9+NX+JdqU19l8YJkTKKUuPU5vSE9ujVUflmy7L0zmxiumCFEKtg6OBAW+UWL
 2elrZ0sFPJzyCqFfWA6SGU9ddrlU9eO0qQHtuzMUU4x0YVQ6XWgxt340ljyCVNJFVmwi
 Gsgw==
X-Gm-Message-State: AOAM532gJBFm5iZRmoad26pjrUpU6aYoIZt4PnucObN5G53y7col2v+e
 neSg7Iw8LKoLgEE3+7O3AuNyDBtE3wj2c6xirZuzRkfTONkLGj85e3bKdYTuknmisTbzlhAf1Nl
 yNa7gz+TZTWBuPcidlO8I4ly5SzrtkVlmkI6EFKEtPIWjjpjRdk6rZ5kELb9UdcBe
X-Received: by 2002:a7b:c764:: with SMTP id x4mr10915074wmk.78.1637247437896; 
 Thu, 18 Nov 2021 06:57:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhbgNkoUt20IG4DLMrK+Pqtp3LCqzHaP+gMchNuAWf14mLHrWJKzesBiK8EFXzgQMTwH0oSQ==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr10915041wmk.78.1637247437675; 
 Thu, 18 Nov 2021 06:57:17 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l5sm9880412wms.16.2021.11.18.06.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 0/5] docs/devel/style: Improve rST rendering
Date: Thu, 18 Nov 2021 15:57:11 +0100
Message-Id: <20211118145716.4116731-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various changes in docs/devel/style.rst to improve its=0D
rST rendering (around C types/qualifiers/functions).=0D
=0D
Since v1:=0D
- Addressed Darren Kenny comments on function names=0D
=0D
Based-on: <20211118144317.4106651-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  docs/devel/style: Render C types as monospaced text=0D
  docs/devel/style: Improve Error** functions rST rendering=0D
  docs/devel/style: Improve string format rST rendering=0D
  docs/devel/style: Render C function names as monospaced text=0D
  docs/devel/style: Misc rST rendering improvements=0D
=0D
 docs/devel/style.rst | 222 ++++++++++++++++++++++---------------------=0D
 1 file changed, 113 insertions(+), 109 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


