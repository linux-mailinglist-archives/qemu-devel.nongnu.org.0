Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130463D392D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:10:14 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6t4G-0001YG-Jf
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2I-0008EI-9t
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2F-0000t5-0X
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627038485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQ3zn2L+jPrprslv0R6hN7dGCXRToVnyl+5MLRgp+7g=;
 b=jCMQM9nc4bs8gPkC/XBLJmfkefplGDDBuHxkvQwnNBZuNONXbTWB+GCY1mYbi54evzL2kr
 l6LjdPmJBl1fY2a5JuSzcVHjo4L/SxZfzH3OZPFV1UWUVpodKmAun2DEnO6YTO1/R6ceh3
 tsbZV0bxDLt2kYiphq+ajp6EECR4WYU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-HJCAyKvtNlC8M8lasm_hTQ-1; Fri, 23 Jul 2021 07:08:04 -0400
X-MC-Unique: HJCAyKvtNlC8M8lasm_hTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfeec70000b0290140ab4d8389so865829wrp.10
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=61GNq1wBmGOY4S6EKJm8reHUz9vEkXbV3DGh7ykkK6M=;
 b=P1RiXCgScuZu3MvtLUScwiQKgxQX6uuSAjlAGkmNlJHpZE7i15SmyTezu/opRtNMVy
 5Du8VaaZMJnMt64pfmo9kguWkwtfJ07VRmNDM0VJaIsN3wS09J76NqB5Y3bRyxA41Mo3
 KtHTNpjGU5k159smDb28mRf+gDuF7CtwjxCDoFlB/zNeWSNI1+6nrGgD2d6Tz/XJ0E/t
 1MWWiR4AGK2qt3HeRwR1dq/SrfkNJCnOJlBbcZi4AwWVQbYxGlJngcS9EyBKvfUDyf4I
 ap8SURJJ+/s7SezTXQp1MRy/fsRiBiyY+SP9C9kCN9Taod9GfAaGlFS31dk/fz7sFwIm
 u4Dg==
X-Gm-Message-State: AOAM531GTidMwRiRjZIkKsqk1RX8Ozu6Oto8/vUSbbofsxffLYI8pSaI
 OIoPydmbwm8OHrxYWHntKDfivjmMHmfjKW5tVoT1GvFNRCSdL7K4lkOPYWGNXmaem0SnDPMtoCw
 wDclDfGArTrVTFtALiaNcouD3h3qzp3VZP/V/KiJUj/BH/3joBwC1+IUsPWc51cq0
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr4716803wrq.90.1627038482656; 
 Fri, 23 Jul 2021 04:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgDrPuHpyODNQKIJYYfSUrazH3DQt5MJ361tDGEoTAXYDDJMa7HNQaINu+rPIOnH+VzYk7uQ==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr4716768wrq.90.1627038482408; 
 Fri, 23 Jul 2021 04:08:02 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 o28sm34536607wra.71.2021.07.23.04.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:08:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 0/4] gitlab-ci: Document custom CI/CD variables,
 fix 'when:' conditions
Date: Fri, 23 Jul 2021 13:07:56 +0200
Message-Id: <20210723110800.855648-1-philmd@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Document custom CI/CD variables (thuth)=0D
- Fix 'when:' condition (danpb)=0D
=0D
Supersedes: <20210722181322.516635-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  docs: Document GitLab custom CI/CD variables=0D
  gitlab-ci: Fix 'when:' condition in acceptance_test_job_template=0D
  gitlab-ci: Fix 'when:' condition in EDK2 jobs=0D
  gitlab-ci: Extract OpenSBI job rules and fix 'when:' condition=0D
=0D
 docs/devel/ci.rst                   | 40 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/buildtest-template.yml |  4 +--=0D
 .gitlab-ci.d/edk2.yml               |  6 ++---=0D
 .gitlab-ci.d/opensbi.yml            | 30 +++++++++++++---------=0D
 .gitlab-ci.yml                      | 19 ++------------=0D
 5 files changed, 65 insertions(+), 34 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


