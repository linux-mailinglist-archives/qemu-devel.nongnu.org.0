Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ACC4405A7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:04:32 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgavH-0000Xe-WE
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgaso-0005Ix-E9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgask-0006oQ-Pt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MR9VsY1NW7AeabkILCW/dGFYZQhi28L7aU7WMrWfyBs=;
 b=E1TSbNBwT6wnFWIkt9LHORYIE6uy4XLJ0EGQc7JEGCNm8iPNvJVV3eLPHstt8iN7LfHOg3
 ohFD/lDYFC/Y38xmCSaZi0fR5y2IOO8nMxfFe7ILctHYeqwh9f6OJ/3YD6jBy4SP8QW90G
 NLUkcxBDjjfOqjWjwYQT0i8E70XwiY0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-tsd6ZoGRMrOqp7413xXBrA-1; Fri, 29 Oct 2021 19:01:50 -0400
X-MC-Unique: tsd6ZoGRMrOqp7413xXBrA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so2187333wrw.9
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jq4e9v561fKf/LKtD2204ptkeawJlk1au9wBFz67HXQ=;
 b=z6OR0maZNgm0Ck/YqlMd4e6Pk8yjwda9n3M0L9DMLOkiqIJDexsHJG+IwTo3HljRTc
 feIRa9+5nZ6Sa9MB6dPOFanJpSZ669zhJMJJM/y42MF1B2y1hP9Wlvi/glImtZWUGEl3
 LEc/CC4JMxCoxvkUUjLaEn/I1AV3oegDSUfSVbPJpxuq57tmDo0a9eO+mh4j9ZZVlkxw
 AZBn15ikrnuk2WNpKED5Iu3MbRbWgzXCE5U0dd8nA22YGWONAFjaM0/mNJQiv/6wm5lF
 YtNq0D67UHPnEZQJFm0D86zSisFJIadboraWEwyoQl9CPlfZT0UkpKmDAXnnKwd/M+TD
 j6kg==
X-Gm-Message-State: AOAM531y9+G/b2AAKG77TsbBQ+sz5Gt5ZZfi/RupeRe35PVaLmhsoiDM
 +XmqAbeYd0F6oixU7hpcSfOiQT2knurbKfeDkpRWNnYyD0FdJG72+43S/Y23fpYNKlsJesM8eOI
 tjLHE3F2UEVQbV8/w1Fa73n5anya4YTHUxgPQCRaJEV4pLbaUliSMQcz2OGjj6ZMi
X-Received: by 2002:adf:fd90:: with SMTP id d16mr15815928wrr.385.1635548509479; 
 Fri, 29 Oct 2021 16:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm9Liy83+wq/fbwfvfkfuwX5fVfwaEo0U43nFxien7X9XRqGu1EVSn+qhVB3WvJDMOUq0HTA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr15815896wrr.385.1635548509205; 
 Fri, 29 Oct 2021 16:01:49 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm8040682wmg.14.2021.10.29.16.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:01:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/core: Remove uses of obsolete QERR_ definitions
Date: Sat, 30 Oct 2021 01:01:42 +0200
Message-Id: <20211029230147.2465055-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_ definitions are obsolete since 2015... Remove their=0D
uses in hw/core/.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/core: Remove use of QERR_UNSUPPORTED=0D
  hw/core: Remove use of QERR_FEATURE_DISABLED=0D
  hw/core: Remove uses of QERR_DEVICE_NO_HOTPLUG=0D
  hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD=0D
  hw/core: Remove uses of QERR_INVALID_PARAMETER_VALUE=0D
=0D
 include/qapi/qmp/qerror.h        | 6 ------=0D
 hw/core/machine-qmp-cmds.c       | 3 ++-=0D
 hw/core/nmi.c                    | 2 +-=0D
 hw/core/qdev-properties-system.c | 2 +-=0D
 hw/core/qdev-properties.c        | 2 +-=0D
 hw/core/qdev.c                   | 3 ++-=0D
 monitor/misc.c                   | 3 +--=0D
 softmmu/cpus.c                   | 3 +--=0D
 softmmu/qdev-monitor.c           | 9 ++++-----=0D
 target/i386/cpu.c                | 2 +-=0D
 10 files changed, 14 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


