Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FD303BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:46:24 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mnf-0004PO-EG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MeZ-0005Nw-S1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:37:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MeV-0006Zm-MY
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611661014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pove2v1xhhJhyUCBQP4axDU3Qhszw5TPZRFIx7jY7tU=;
 b=WBUbMtPtE3g4462Xg3NomfhH+zHqVQV7AEt5PAcSt+lD46cDE34DrDjGrAosPESvfRTi8f
 Sw5W+TbRDnkTOiabst/rE1P7SPjTQJOCTavW8dnWnwqPl12GyVVdMwb0wEPFveQPRhfaCb
 8JihSvWfoL096k1xItqeBasgdK1zrpo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-KhymhXfiO7mffCuXIy0-Vg-1; Tue, 26 Jan 2021 06:36:53 -0500
X-MC-Unique: KhymhXfiO7mffCuXIy0-Vg-1
Received: by mail-ed1-f70.google.com with SMTP id t9so9243547edd.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHAnIN3xsSCKAzXpyhtJmBrcC6Xn2EFUPRQwtKLCtZU=;
 b=T2Ou4kOUHhqCMkEaWree/UvIt0sq6FyQtqx/8GdKmRWs6G7/DGvipaI/QrmT0vprAu
 M8N5jxpvrJgGdKWq96FeQ1stLjzRI2/vXect86HV6XRfgJ3t8RjnuSp1g3cyM0sHv17C
 8P8ApszZuFIohMIFvHJ3UZB7Grv7ppHhxIBcTZ4osrX3/x1WgAHDyFYjAncEqmH5VIZq
 lbtIW6sKKXg/rN+7EkjoXshy2nSxAqg/PPhTPSYDUrj5Rx25qEq49jbQz5orlffejnYZ
 CwYjMp84v8Ih0g7IgCFH2jnj/oBUs8QpozHv0+ePlhnzsV62DbBMQcgqWgJn4jUSOjeo
 m+og==
X-Gm-Message-State: AOAM533OHWDmLcI6CrurNN7XMw38B4MK8RBA1WpdD91d6bn3//KphqU2
 uGLA6i7bZxy5/fkPejuNFCozLIv3KJB+DY5esZzV5qDP7pnYd0We439ClOcefEXbfSyA8st1dL5
 3gnQieoJ3ZKI3IzEyOiMClohf6QtI09HeQe7x4xOmRrwU/gWMxwWhkJjiI9Aw4aYb
X-Received: by 2002:a17:906:1b0d:: with SMTP id
 o13mr3315001ejg.232.1611661012080; 
 Tue, 26 Jan 2021 03:36:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz28clayIUaZylFIE0Qb/dQfVMdhI02gDFCOI8OiIS2kqzXndG76XyFpatXDCS5etHX/gw4BQ==
X-Received: by 2002:a17:906:1b0d:: with SMTP id
 o13mr3314977ejg.232.1611661011843; 
 Tue, 26 Jan 2021 03:36:51 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h19sm9658528ejl.26.2021.01.26.03.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:36:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab-ci: Test Fedora capstone package
Date: Tue, 26 Jan 2021 12:36:47 +0100
Message-Id: <20210126113649.3148417-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job for a supported feature: capstone.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  docker: Install libcastone on Fedora=0D
  gitlab-ci: Test Fedora capstone package=0D
=0D
 .gitlab-ci.yml                         | 7 +++++++=0D
 tests/docker/dockerfiles/fedora.docker | 1 +=0D
 2 files changed, 8 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


