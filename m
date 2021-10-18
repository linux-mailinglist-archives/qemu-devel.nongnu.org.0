Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D684316AD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:59:59 +0200 (CEST)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQN4-0006d5-Fc
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLc-00053A-65
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLY-0002Lr-Ag
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634554702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yvp0NXiCh8VH373LwuFj8myz7SYa4WOGtYEvQKJ+wYs=;
 b=ZDLdiEMyg3Nq1qsd/KLxQdvxUqClo1kh9hURpla2r8vpu2exjyr4EfybtwbYPWf5d/OQNf
 7jVbtU1aWwrtjxev/hA15yxiAzSzPjdJqQM1qzgKMPA78pT9hxS98Y3K9ujbHIU3NTPEgu
 Yqb6CiKY13mNVjQ92l5iaSg//7c2X44=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-OLR5a6wdPvmpkIew9esm8g-1; Mon, 18 Oct 2021 06:58:20 -0400
X-MC-Unique: OLR5a6wdPvmpkIew9esm8g-1
Received: by mail-wr1-f72.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so8707081wrd.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7E29pV7cBhE+9MnbbC6YsVnxQ5xLXW8wqJtGq41CPt4=;
 b=p6ZXRIIIicgjX7JNZDe1K6x5nQ6flMzd7xQ++K9sN3IWqYVL5Gmnh3Pr+h5is4n8ZB
 HQgpC9LszzVybeuyC06Axj8EqVXSEqK5dY728Mzv9tfCP13BfDuK/qM49gMUWuqptQqS
 5ywvxH8BY03UOokFflQ8qDzkJdm7tTXca7neeU/jItQIHZZRbaPjFZlaSukG5Xqfq9VA
 2fEbhINuhf1TbMGmuOkrCipgk0D45aAEJbR39y9HkyLdMBrjVZkRpJlbqx2Y/BvU4AVE
 lzaZyYQPZ0LQfwkW94ZHD4oLGRZcimbF8udhZWgBKy5dJ+f2qi7T7VvBwVYr1HLkUbbJ
 HdZQ==
X-Gm-Message-State: AOAM531Xo5x4EYOUz5l4gMAJrKR+xBmcDMuFVCjOlvloFVQRzZElM1JW
 p1LXukhjBDknHs+jKSeIXIbEJiudJQaEsAX0Q30n61hL0PANI40EyRTwJUGV0AQ1bNH0bTQca1T
 CItLj9dphdqwumrGWqRbMG2+vkzHjpAOmVDIYEo1zUz5tjTTElm6rWGhURFmxo7Yy
X-Received: by 2002:adf:fd46:: with SMTP id h6mr25144392wrs.251.1634554698235; 
 Mon, 18 Oct 2021 03:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGIgx4MJXBJwtkUA2N8x0Ktbjf0T//O+uniTf3iO4oARlQj8+bbXomUvdCfn6NVkIkQeRziA==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr25144348wrs.251.1634554697962; 
 Mon, 18 Oct 2021 03:58:17 -0700 (PDT)
Received: from x1w.redhat.com (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k17sm12437413wrq.7.2021.10.18.03.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] roms/edk2: Avoid cloning unused cmocka submodule
Date: Mon, 18 Oct 2021 12:58:14 +0200
Message-Id: <20211018105816.2663195-1-philmd@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cmocka website SSL certificate expired, making CI pipelines=0D
fail [*]. However EDK2 images built to test QEMU don't need=0D
cmocka, nor oniguruma. Avoid cloning them.=0D
=0D
Note: scripts/make-release is neither covered in MAINTAINERS=0D
      nor in our CI.=0D
=0D
[*] https://gitlab.com/rth7680/qemu/-/jobs/1685387520=0D
fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': =
server certificate verification failed. CAfile: /etc/ssl/certs/ca-certifica=
tes.crt CRLfile: none=0D
fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submo=
dule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed=0D
=0D
Since v1:=0D
- Fixed typo (thuth)=0D
- Added missing '--' shell separator=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  roms/edk2: Only init brotli submodule to build BaseTools=0D
  roms/edk2: Only initialize required submodules=0D
=0D
 .gitlab-ci.d/edk2.yml | 6 +++++-=0D
 roms/Makefile         | 3 ++-=0D
 roms/Makefile.edk2    | 7 ++++++-=0D
 scripts/make-release  | 7 ++++++-=0D
 4 files changed, 19 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


