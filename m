Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08A43C234
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:29:15 +0200 (CEST)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbUw-0004VW-Gj
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSr-0002fM-Sa
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSp-0006ra-RJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tNUkMj71ZVn8jmHA3e61AHAHvz+uWT58Gaoet/Aoutw=;
 b=BNj4tfLOpq85C+ZbhhnOj1qZM21PUcSHoP2qWNVwQU42FckweYP97e+TRaNlIgq0zuuoYg
 tUb8Pc8CLJg01juSSvfQN+dbdzrS22sFi2jDo4QOdHkKE2dnqYFMVSVJ5Stf6zqUZYGWtm
 MC7zbpsdPQfdtns9a8dfZti3FASIywk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-s9gDvHg7OC2DVGZGvIKt4w-1; Wed, 27 Oct 2021 01:26:59 -0400
X-MC-Unique: s9gDvHg7OC2DVGZGvIKt4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so1677036wmn.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 22:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vGWMflSbVdTg/jH3GRmUuQs8/GysPLkfteQ8xyoFdYA=;
 b=CLi32uD4osYA4lp/9Q67+pPCF6hwbzAOojYlidrRGijwCFujSFxS8GvoNhZL9tVOHD
 m+mQmo/lH6Tx1VedAo0EJ01oXPj4UdNppMtFT94TKFGO/uSHDSLc11h+o6JJG6VNhqKk
 Ci9OaKjtZgkb/oCgaucUTdHzh9M7n9f0Nh2dT6PL5rgzpPPVAI/xNCCJ5KJ7rhe3dsjL
 FqUaaAtss/ne9zMkFdHoo4Ytbupo+OkXhTK5eaefMaIjmyxK9KhytS6VJRZ61GorSVqH
 TK1845P6cGhICfZ0y5d5M4S36R8T4WM6Fag0MsRH90aFVamkmYvLV48z0sWu9+OLPKNX
 HT7g==
X-Gm-Message-State: AOAM533YwkdXaNJAZ2PCfCmpkhuQs/R1DxNkjqy2dvU2Lzwh0L75j2xN
 UJlM5X41OcJ/FeL7XrwlvAO2phE6f9zgNg8SXMYcEEs2mAtFoSMx6OnnTaOjUR+ug0vq/jGMnQu
 A5dCXerh4I7X+F1mTbMO7eHYKoJGnKbi45lz4OzK3GFWW1pKlG3hqnWMP1icj3oTh
X-Received: by 2002:a5d:6484:: with SMTP id o4mr37563994wri.337.1635312418339; 
 Tue, 26 Oct 2021 22:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+GUaQhXuOQA4Dsl/oIMurBSb7u8WvQ02rhgFonOG5zp4WqC4YWzs114cUFbHO4dwdu5VVaw==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr37563973wri.337.1635312418117; 
 Tue, 26 Oct 2021 22:26:58 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x10sm3031788wrt.76.2021.10.26.22.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 22:26:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0.1 0/2] gitlab-ci: Only push docker images to
 mainstream registry from /master
Date: Wed, 27 Oct 2021 07:26:54 +0200
Message-Id: <20211027052656.1275436-1-philmd@redhat.com>
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
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,=0D
=0D
2 more patches to avoid gitlab-ci mayhem when you push the=0D
stable tags. See this cover for more info:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg846861.html=0D
=0D
Based-on: <20211019140944.152419-1-michael.roth@amd.com>=0D
"Patch Round-up for stable 6.0.1, freeze on 2021-10-26"=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  gitlab: only let pages be published from default branch=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  gitlab-ci: Only push docker images to registry from /master branch=0D
=0D
 .gitlab-ci.d/containers.yml | 11 ++++++++++-=0D
 .gitlab-ci.d/edk2.yml       | 11 ++++++++++-=0D
 .gitlab-ci.d/opensbi.yml    | 11 ++++++++++-=0D
 .gitlab-ci.yml              | 18 ++++++++++++++++++=0D
 4 files changed, 48 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


