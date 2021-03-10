Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC0333BAF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:44:46 +0100 (CET)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxGf-00088t-F0
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFM-0006yX-Cu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFJ-000351-Th
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5vBF51v7hvLW4LMN39qyWKFLCy5yO1AZnNxcgQi+ZCk=;
 b=D8SPYxzPRGDGvrNZHME39dniR8foqSKtdhErZgEzYMHzFkGlUbstWEbvzLW/PqS9E23Mi3
 7ieZeS5UTGmODwNm0OJYsBS8vmXdo1Q+lp7bZQFkFxBLYYcRknpiai9C+C5Kg5c0ejhqXj
 DF/XdALcxDNqil4TZ2Bn80357fcnNMc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-C46VfU19O9y5xrRSTBjPTQ-1; Wed, 10 Mar 2021 06:43:18 -0500
X-MC-Unique: C46VfU19O9y5xrRSTBjPTQ-1
Received: by mail-ej1-f72.google.com with SMTP id si4so7129954ejb.23
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWV+5/ue9pPXasxsHf9SHtxlDHYFgYbAzQ8mYXwueQU=;
 b=CUaMtVT95VlxrdfymwF1dAzwbqIpTcnnYx3VQBEfNrj7PEClf+E1sdUBpIQouyJY6O
 8KXSF1b3drWjHkpUssdB2TGhnEQK6OWLUhGeCj79JHWP4F/wYQDlveRphNy26EvhPPMs
 8y89i9qr2CW2gky0tIyyXsFr1i0XdBlq9Md69lPVNS+AoRNQd2GCgi3fpEiqMT4NJkny
 mg4CnvpF1DFrRSd+QvOwIdukcFuY0jJI9Ka9+xzf/PsH826WcLLAYoErJ/689udW6yiJ
 D1MlCHRJ2+nbbFvsq07H1QOXVldxesRLSUZCHay6CBuY6KnYRvEO1PlEW1iOMY3yJV2I
 +SCQ==
X-Gm-Message-State: AOAM53148vlZpns/5Rige6mhQ4mGBBfbzU9fyXC4jrUg3Xzt2MwYxR+C
 J0ZTeFuGxy6L8zvL9XVfXU7P5bkcUJEG+HWN01ugm3/iReqyAjGOytVQJczXdQV5Bc9ar8nOHnG
 pqSVaCcULjMp8xui49M0MBEMicOUcNWThRr0TsRW1J0GBd0Nur5skJurPbYHLX0IR
X-Received: by 2002:a17:907:98f5:: with SMTP id
 ke21mr3194188ejc.552.1615376597277; 
 Wed, 10 Mar 2021 03:43:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuTH0W/JAnRuHU4KkzrDxck3d+pu0PnKZGqrh7F0GUI5F5YWCeGpGmxiQQB23XKMnKp/O1Cg==
X-Received: by 2002:a17:907:98f5:: with SMTP id
 ke21mr3194154ejc.552.1615376596958; 
 Wed, 10 Mar 2021 03:43:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jj16sm9783407ejc.19.2021.03.10.03.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 03:43:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help security
 reports
Date: Wed, 10 Mar 2021 12:43:11 +0100
Message-Id: <20210310114314.1068957-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This is an alternative approach to changing null-co driver=0D
default 'read-zeroes' option to true:=0D
https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html=0D
=0D
Instead we introduce yet another block driver with an explicit=0D
name: 'zeroes-co'. We then clarify in secure-coding-practices.rst=0D
that security reports have to be sent using this new driver.=0D
=0D
The 2nd patch is RFC because I won't spend time converting the=0D
tests until the first patch is discussed, as I already spent enough=0D
time doing that in the previous mentioned series.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  block: Introduce the 'zeroes-co' driver=0D
  tests/test-blockjob: Use zeroes-co instead of null-co,read-zeroes=3Don=0D
  docs/secure-coding-practices: Describe null-co/zeroes-co block drivers=0D
=0D
 docs/devel/secure-coding-practices.rst |   7 +=0D
 block/zeroes.c                         | 306 +++++++++++++++++++++++++=0D
 tests/test-blockjob.c                  |   4 +-=0D
 block/meson.build                      |   1 +=0D
 4 files changed, 315 insertions(+), 3 deletions(-)=0D
 create mode 100644 block/zeroes.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


