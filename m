Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AC4475DEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:56:12 +0100 (CET)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXZb-0004Jn-GL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:56:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSq-0004SW-KX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSn-0001yU-0t
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3tppH2zBNRNNJnj4Rc4BWo+AoicU3g7HE3f18Vglp7I=;
 b=eQbnWUt9Y54W51WQZHCobfWdQMgRYbEDq6cMr0zKuDdKA9Wa/gepxSwjtLNIxHYSLQ5Hf/
 pq8k25VC+JEcPj6m3Fso+JWCi78jHWAqXAIaWvAMAZh0cuHOeK8iLrEX+D/WKdsmm9aUp4
 Rmrm3D1gDRQuDwyiV6hGKwl4RMT/EP8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-6ldZ7LFcMO6Q4dWbdr-f6g-1; Wed, 15 Dec 2021 11:49:07 -0500
X-MC-Unique: 6ldZ7LFcMO6Q4dWbdr-f6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 g9-20020a1c2009000000b0034569dd335aso967299wmg.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahKnUxlsQgN9HJsIBekI7CNdYZ71EKMUKKNYE6NdEmA=;
 b=1wKyJaZBW8+/ro8BkFtt18vHEEoSZtcWJOz1cIaCqu9UuW+WnrkHXRmMwVv3Hs/d5B
 6WCSRknoFpZpQLjmS8gvGAz5KKxOzglFtK4W+Jc1NcP9B5Ejw7G9UDGxXgc6n5RhCgt6
 7iYz7+nI75QWXK+DVJU8JSrvcpmuLKdzqjexrdjTo+GRHg6oE2QxPwBzPKzUHVrnr+wy
 RqgGdPNayewVT1ARyRDnOr9v0S25AKZuYwGxQ4M75EUTcy30LaD4uakhLZ06lVeuI1Sr
 lwwyTWk+bWr8sZmUD1mIjyMEec2VxdjVjgzX2rPVseGjSX6cfz0i8hF/ssK8qAvJSM9c
 zI6w==
X-Gm-Message-State: AOAM530R+FlnWJQ8VugCqIIBC+bJgIp3nl8X9FNZolJw1sN69SdjH566
 oScs7wEENP6v7EhXvQHDPNu3raQF2T2JBnX5h2binSTLH8Tc3rU9cezBpYilruoZ6bEWmM9qHf1
 +bf84q2p/W7DCkEJuGiTrzc+v3rSVmef1/NVUFZdSjVOtK607YaZjfLUsu9W34Ulp
X-Received: by 2002:a7b:c256:: with SMTP id b22mr721999wmj.176.1639586946236; 
 Wed, 15 Dec 2021 08:49:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL7fI7tAal/V4Qxa6kMcGutfW1GWvfkoK3L/jnAhLqgfqdU3lIIO0W5H/u1CfPMUwCyxAf0g==
X-Received: by 2002:a7b:c256:: with SMTP id b22mr721969wmj.176.1639586945917; 
 Wed, 15 Dec 2021 08:49:05 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id c1sm2426609wrt.14.2021.12.15.08.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/8] tests/unit: Rework test-smp-parse tests
Date: Wed, 15 Dec 2021 17:48:48 +0100
Message-Id: <20211215164856.381990-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v4:=0D
- Rebase (skipping merged patches)=0D
- Renamed tests (Yanan Wang)=0D
=0D
Since v2:=0D
- Restore 'dies_supported' field in test_with_dies (Yanan)=0D
- Add R-b tags=0D
- QOM-ify the TYPE_MACHINE classes=0D
=0D
Supersedes: <20211115145900.2531865-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  tests/unit/test-smp-parse: Pass machine type as argument to tests=0D
  tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid=0D
  tests/unit/test-smp-parse: Add 'smp-with-dies' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-invalid' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-valid' machine type=0D
  tests/unit/test-smp-parse: Simplify pointer to compound literal use=0D
  tests/unit/test-smp-parse: Constify some pointer/struct=0D
  hw/core: Rename smp_parse() -> machine_parse_smp_config()=0D
=0D
 include/hw/boards.h         |   3 +-=0D
 hw/core/machine-smp.c       |   6 +-=0D
 hw/core/machine.c           |   2 +-=0D
 tests/unit/test-smp-parse.c | 181 +++++++++++++++++++++++-------------=0D
 4 files changed, 121 insertions(+), 71 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


