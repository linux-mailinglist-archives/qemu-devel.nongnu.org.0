Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297D44D9CA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:04:51 +0100 (CET)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCZG-00088s-2L
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCH1-0000U8-U8
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCH0-0006Ix-64
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636645557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BgmZqWuawORPKbMGD/FzaULprNW4aRNzQbNCT/3Zu8c=;
 b=h4MwWW4873Cjki7Da5Rrua/w5yfD1UCEvkH2FFFGYfhgSqq5FVgrDcoVqRz8RC4PHIcADo
 kvw2PAVSYCBRmscBaO78jYG6bfk0l8lJHVzV2Vy/Iug8SEdoDbNwlmUosQENrTfksMjKf7
 eRDIs8Jb96k+KLzsRqApy26H+2MPqgQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-M3fMXHFKNdicAlvkDWdF2w-1; Thu, 11 Nov 2021 10:45:56 -0500
X-MC-Unique: M3fMXHFKNdicAlvkDWdF2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so2869854wmr.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vixx/u6dbrIpPMd62KWJXHuqcyBDa6/52vwbsg7nHss=;
 b=WxabS3rJaCRHzJrBHZ/CmNleacu3CT3boNpZR6zoyRAeeKR5njFi84Hgd1H3X6dVfe
 wSEdTAFeOMXvuT6k57xEoaW9/EsWfEkLg3i3H2G/KZIbvUG/CBcp4PfYjLDn5o3lENsc
 73pWiCVq2lw5T1/38RK5prJ68kYhCfuemErMIwaCiUghdu/4BBoqWr0bRqmY2QE6zT0i
 6oCEChfVAxZonFvKKf7Ss+qEHF5f+zTVMBWsEAO4bX+L997wQQUcV9sy4bsmlq/vlld+
 QSBmbxRsup2PlSyscHCn4lfjz61EwEONcp64G3KfU7jhqsY4vPd+FiYD0tzHNqQ5RSz3
 I6tw==
X-Gm-Message-State: AOAM530US869BQhaAfhrT0OZ85eFIGhS07D5FuLpXDFO6xjEU3u41zeq
 Xar+ySEa6DOSSjulQzgij7HtieF3Yn8MHqj/U7ktL80MjELMoHpW3lLyMhxqllz0CWxrKogfLrh
 OqhVPm81q3eUNG/YHXTS4AL+N+KUrI4SD/RwHtbQirJ3A4zjztS734g97/1B0OpGJ
X-Received: by 2002:a7b:c194:: with SMTP id y20mr9541237wmi.61.1636645554478; 
 Thu, 11 Nov 2021 07:45:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdfTVmR/hCq3MtO29qmx6ecJ9UfVzelpvtFKBDb+4jjRR0+jNimzGTlrH4TwBKiJPXLMM1Aw==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr9541202wmi.61.1636645554190; 
 Thu, 11 Nov 2021 07:45:54 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k187sm6885425wme.0.2021.11.11.07.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:45:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 0/2] hw/nvme/ctrl: Buffer types cleanups
Date: Thu, 11 Nov 2021 16:45:50 +0100
Message-Id: <20211111154552.2263410-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some trivial notes I took while reviewing CVE-2021-3947:=0D
https://lore.kernel.org/qemu-devel/20211111153125.2258176-1-philmd@redhat.c=
om/=0D
=0D
Based-on: <20211111153125.2258176-1-philmd@redhat.com>=0D
=0D
*** BLURB HERE ***=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/nvme/ctrl: Have nvme_addr_write() take const buffer=0D
  hw/nvme/ctrl: Pass buffers as 'void *' types=0D
=0D
 hw/nvme/nvme.h |  4 ++--=0D
 hw/nvme/ctrl.c | 12 ++++++------=0D
 2 files changed, 8 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


