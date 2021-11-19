Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074894577A4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:14:04 +0100 (CET)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAGo-0000WT-LU
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEf-0007Id-DL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEd-0007ka-1G
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637352706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Tqi8ryHXnIvJKNZ0gDlIarCEWeZGlsWhaOHRmUXopxU=;
 b=AwdXUWZUnqCzlucZ9bgC+wk+KKFs5/w1vFIPi6NZbdBJsWcG1sh5RBVPFn0DbsSsNbCe4E
 sG35pK21W2EtBC6ny5zVDq51gCtmpxDsYvHI2/UVjPsDnL0i1oUYTcVOkSQW/CvXdh3/oJ
 weS9a6aHZkg0Z7Hq3H6gNC9Z/UNy4r4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-fDmERs1aOS6T-m5gkSPmoQ-1; Fri, 19 Nov 2021 15:11:45 -0500
X-MC-Unique: fDmERs1aOS6T-m5gkSPmoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso4537500wmc.8
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 12:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzb6qdECqobK+TzFoWV3L4BBiB0btFIXmA2HAOMa0fc=;
 b=63l4jewzXzSEbWjya894JvVhf4jN7NODb3Q0c/xEH+X1MBWUpIoGRxJBmRHJfuMYYh
 WFxXzFEfOQNpC7L4rTqKPSeJpWKfUSc7UToU8C1BdeHjIpjWqQaaMZvISucaYszTNW3m
 3kDLSjLczbTU3iT2I+FYVah9qUJpDgGVUE0MPgBXafBY4xQkNinoD9zY189E2otEOnz3
 ZVDfwMwFkRY1FlJ6Lln6q8TvJLDy4Gq89UInBTXHfJN7moXSD6OVjXoZhpun2KppQ4C/
 t6PnOVJbv2EgnDwUTu1oO04hO/eX4AW5teLr7ZJG0RHhSCqpgvea6YIpGJ9h97Q1jMPK
 50tA==
X-Gm-Message-State: AOAM533/RBVmhvE6XDlcao2Qo69+Q0MmqUkGlkKhQiA/PK8m4ixD9dBq
 4JTFxsYcttULUKNRAetMpuMZ7H31ppzdrsncgaGu8ko2oWY9Zef7j6a5H5c6N2T3lpoZdRKhIEL
 9DwMxAZb4NEz8mUOXjiqh7Htyhi/xL4M1QaQeHpIDs7EExxt0wRxfiINo+rmhUDoy
X-Received: by 2002:a1c:e918:: with SMTP id q24mr3072683wmc.108.1637352703794; 
 Fri, 19 Nov 2021 12:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy838IPWSm9CILS1Dd+NTYTVtop7mH9AnUDIP85GmXi6oNjMB0C8DXY3Kx7ge2WKBetOA2H+A==
X-Received: by 2002:a1c:e918:: with SMTP id q24mr3072624wmc.108.1637352703510; 
 Fri, 19 Nov 2021 12:11:43 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o9sm739369wrs.4.2021.11.19.12.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 12:11:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] hw/scsi/megasas: Avoid overflowing the SGL buffer
Date: Fri, 19 Nov 2021 21:11:39 +0100
Message-Id: <20211119201141.532377-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix issue #521 reported by Alex some months ago:=0D
https://gitlab.com/qemu-project/qemu/-/issues/521=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/scsi/megasas: Fails command if SGL buffer overflows=0D
  tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521=0D
=0D
 hw/scsi/megasas.c               |  1 +=0D
 tests/qtest/fuzz-megasas-test.c | 30 ++++++++++++++++++++++++++++++=0D
 2 files changed, 31 insertions(+)=0D
=0D
--=20=0D
2.31.1=0D
=0D


