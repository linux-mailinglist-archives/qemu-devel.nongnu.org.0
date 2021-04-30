Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1236FEDE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:47:26 +0200 (CEST)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWIX-0000tR-Lk
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxL-0001Ln-Ux
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxJ-0004GX-9m
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T8dvx4iyoOXdP7V/LqUtnB4ryKe1DVa9wEsj+yBERxY=;
 b=gORCy3fNHLDO6tLF/6hWXGsiYJopq2SDdRSGNxLjlYUBnBn7s4aghskxxE5mua9SBHpAEI
 t7STo8SGLXMC1cOm0RbMcCltwm6KNBshMPRva7xzyiQnQPLc8e1jf2VtyRJILeOuxIrZpS
 DRp8yv4ORUGKzCY7r6sPETT70MPNGc4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-DqG7tk2xP-634u0S4fUqzg-1; Fri, 30 Apr 2021 12:25:23 -0400
X-MC-Unique: DqG7tk2xP-634u0S4fUqzg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j72-20020adf914e0000b02901073cdd9d65so16161863wrj.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lR+hCOTlOH3HPAtYzHtUyEqCX+6XlaEqsluCtJEVxVU=;
 b=R7EpjnDFTgtfvLZiptLH1zFRHS4YgqXhfDRgiEoQeHm6p2dvRhNEOkoQdqESukbj1W
 zaygDAawIz55buXnvHU0IiHLequIVsJIvampV3c2OD1DV6b1etPwUsb7pGO0V8ZW+wR4
 Y2+aHguUUqKLmxJDlQYrU3Y0Q4JelMAHO+8H3paGekvdCyMANvlJMAW3P19/su45uBXg
 FnUBnv6n1kf421fgzqOgF8OcT+s37zhXizN6Lfu6N+eMi8aIZaHTh04Z1D8kOC3N8YOs
 V60QVD2ZCE9gjDtlMkHL5kzwPpmc2SgvADuOpBvSbbHJ7+6bqm3/Da2vi1CveKFq6pVV
 Yc4w==
X-Gm-Message-State: AOAM533mdGoMYmZTjnbmizj4dTCBFT81Nl3O5aAcgHOS+ZCVSYhEW/p2
 QHUiLRKVqB8JKwfma51MZnbxd/qlB2It8U6/SMnqq94xmn4lnhHJHyYDQoKtuQzzk3I9ew4TaOF
 P7RqxeQN8OvKt/H+BFO+lyKPlPuH1yjaxbNX8ofwibcUqmrnmpEd+bR9AagRYCGqD
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4306363wmc.131.1619799922128; 
 Fri, 30 Apr 2021 09:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1wb9Z7fv6znJvDUpi8NKWRXjjBUFHvUatPBk4+3WZff8H/Pde3jghXSZ32I8tAkHgx2aSPw==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4306341wmc.131.1619799921886; 
 Fri, 30 Apr 2021 09:25:21 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o10sm2734430wrx.35.2021.04.30.09.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:25:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] block/vvfat: Fix leaks and out of bounds writes
Date: Fri, 30 Apr 2021 18:25:15 +0200
Message-Id: <20210430162519.271607-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Johannes Schindelin <johannes.schindelin@gmx.de>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first 3 patches are trivial leak fixes, the last=0D
one is a RFC since I have no clue about this code.=0D
=0D
Johannes, you wrote this 18 years ago, do you still=0D
remember? =3D)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  block/vvfat: Fix leak of BDRVVVFATState::qcow_filename=0D
  block/vvfat: Fix leak of BDRVVVFATState::used_clusters=0D
  block/vvfat: Fix leak of mapping_t::path=0D
  block/vvfat: Avoid out of bounds write in create_long_filename()=0D
=0D
 block/vvfat.c | 12 +++++++++++-=0D
 1 file changed, 11 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


