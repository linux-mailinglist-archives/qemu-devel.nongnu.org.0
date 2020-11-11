Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C712AF048
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:11:05 +0100 (CET)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcoxs-0003Oc-Ii
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowD-0001Vi-0Q
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowB-0006o0-5u
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Xu+9Huro0EVevX2iV6C9b6ACrTKvzAVhOdFFCLHDtU=;
 b=XziZ4r7ckPpLLYY0+suldO7m/v75b41mH9+bZbEbojx68ple952SUucTreyB6JCeb7KmSc
 anF26c1nlulHkOZfLKkE/r7Q2EVEnF0O6iGjcjmzfK7D+jlRDPs/F8ODooU+/SgsKxtqls
 1/MxUYUpQL6iD/MVig2GcUKHidudvM0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-wYtz9Oj5M5iJ5yFy7phv5A-1; Wed, 11 Nov 2020 07:09:16 -0500
X-MC-Unique: wYtz9Oj5M5iJ5yFy7phv5A-1
Received: by mail-wm1-f72.google.com with SMTP id e15so696180wme.4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeVwpRdwj4q5510ovTjTn3S1RPKIbE/29dTULLSCh7k=;
 b=fRZoqxtgwLER6I6SB1pvjqVozTmK7HO2pwUflLrzpciyIPwmHM3Pp9tgR+SbMXu8Cx
 lAY+VOT8+rnt0xHBaDnENRT2aOeJ9jL5h9ZT6ggUwXPRthZAfjwBJPO6V89laq6yg843
 tOXJpTAF8XNghGiaCX6uCuGdMTxtKFX2y4XT1SI+1XK7eRl0uSxFpZQkVq2zhnbELEsG
 z42X8+Si1M+467H8oXTpASueUSHOhr+srquUbPaCWQwnzCkchizDvSlKAjmKNJcBaGNm
 JFLhlZEeTTDPMP0EmaoAVVj5O5UeoJpGjIoMhDTFf7mE7bM/ivVJ7rnHKjj78BuXyCsh
 Pskw==
X-Gm-Message-State: AOAM530/NfvIFcRezrWXv0VTLd6S+ikH9lyOmDnzbU5iJssEd4eyvalY
 y/3/rlcFGxYHQXf+lg24peVX1I+8McI8YIZq1k9vApWOHVY7Uq07S4I1rK4Ecj5lS2VaCfHdHVk
 iahaxC6N3OlI2bZ2mICFerybiaUJV7s1aBIlw/4sN/Q5wqSqEOYXmaIPmsVbbXSBD
X-Received: by 2002:a1c:6654:: with SMTP id a81mr3935783wmc.104.1605096554851; 
 Wed, 11 Nov 2020 04:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL3bvSS92J8heN8JfHNYwO86EQEtQG/9JxPIfw/ZcTlzXwh5ynByAVo3b52bOjnCbwaOJ9Bw==
X-Received: by 2002:a1c:6654:: with SMTP id a81mr3935749wmc.104.1605096554528; 
 Wed, 11 Nov 2020 04:09:14 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g20sm2327908wmh.20.2020.11.11.04.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:09:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 0/4] vhost-user: Fix ./configure confusion
Date: Wed, 11 Nov 2020 13:09:08 +0100
Message-Id: <20201111120912.3245574-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Respin of Stefan's series. His v1 cover:=0D
=0D
  There was confusion over --disable-vhost-user and the new=0D
  --enable/disable-vhost-user-blk-server ./configure options.=0D
  This series tries to make things more consistent. See the=0D
  commit descriptions for details.=0D
=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely=0D
=0D
001/4:[----] [--] 'meson: move vhost_user_blk_server to meson.build'=0D
002/4:[down] 'meson: Only build vhost-user when system or tools is enabled'=
=0D
003/4:[----] [-C] 'vhost-user-blk-server: depend on CONFIG_VHOST_USER'=0D
004/4:[----] [--] 'configure: mark vhost-user Linux-only'=0D
=0D
Supersedes: <20201110171121.1265142-1-stefanha@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  meson: Only build vhost-user when system or tools is enabled=0D
=0D
Stefan Hajnoczi (3):=0D
  meson: move vhost_user_blk_server to meson.build=0D
  vhost-user-blk-server: depend on CONFIG_VHOST_USER=0D
  configure: mark vhost-user Linux-only=0D
=0D
 configure                | 25 ++++++++-----------------=0D
 meson.build              | 19 +++++++++++++++++++=0D
 block/export/meson.build |  5 ++++-=0D
 meson_options.txt        |  2 ++=0D
 4 files changed, 33 insertions(+), 18 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


