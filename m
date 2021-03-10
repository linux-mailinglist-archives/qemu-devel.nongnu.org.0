Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043273344D2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:10:18 +0100 (CET)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2Lh-00008d-0A
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HF-0004OZ-77
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HB-0008RG-SW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=873HUw0EKgTEAJfBwwHLC61Ir1VOfBmfv5vTnO3vTZY=;
 b=Ah6DM+Yx2ffqe4+RGI2KyMnfBN/iZsJaeNB1gMlq+0AthfSmDMnVM9X/NJH/atVjFl8rYD
 2F44P6zVfDSWIRry+RGZa7dNVM4t4MKFcEnUjvKJIxai6vZV5nt/4ZussjdhKvUewTsNDC
 btFHcdYZ6csMbQ5XWqnYJDChfj69ByI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-_D_VCJdlOAmTLI99oq6MSw-1; Wed, 10 Mar 2021 12:05:33 -0500
X-MC-Unique: _D_VCJdlOAmTLI99oq6MSw-1
Received: by mail-ej1-f69.google.com with SMTP id rl7so7485501ejb.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6teN3SKZBEQpLy1AX6P6YHDHjcglPN0IUo+GFlmKjw=;
 b=pz0Ewo5st3i9Ppm4uKIkIZvEY95/GHJF5H6vUHMUJh87eCPmxtYi7yP46TLdCwt9OC
 WJ5mx859UiMpQSJbQNyFVoYbptoFYJ6Sc7TwNC708CXQ5oMNpATaqCw3mpWVQShphZge
 5evGdPl80dSG46ajJyaZNRilDpgd/asELnofkqdHTgJIsHJHuDrfV+ZR2FLYsFQEKedz
 w4/+sviyWR78B57WIz5UKUcdWhJt+HxGA730XFWf7YiCiFY7OeMfkq4lB2DjUs4rrMu7
 6lLuHlw9k0AO6Y/CQmbGyWqu7i0Dg3ba71ghhzxaqdK2hUQmQE8vO5AMrFnTb/OFzbYQ
 Uv9A==
X-Gm-Message-State: AOAM533EwcLPK7aiwr9I5FeHlKHHcvdP0ngZOc0PQSMAZZGaA2c6BD6f
 463ji+odMarjdWt4iPEHcFjYl0DxcessAEdSs3Qou71DaRY+aWvBESwGgrqASAyC3ehqr88rIYf
 vN6S4RX8I9dzUz4W3e2ygLEfZeUv8Zq+7Z9BL+g0oaYeXgl6G646MthLlkW59Hdy/
X-Received: by 2002:a17:906:5e4a:: with SMTP id
 b10mr4740940eju.116.1615395931530; 
 Wed, 10 Mar 2021 09:05:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ50DYKZuWJoxQkUW0370iS5wpjxPTzTgsV9/V5ejURprl252pp1STfzwK+M5QOp7PvRe6SQ==
X-Received: by 2002:a17:906:5e4a:: with SMTP id
 b10mr4740830eju.116.1615395930533; 
 Wed, 10 Mar 2021 09:05:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x25sm10840995edv.65.2021.03.10.09.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:05:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] hw/block/pflash: Refactors around setting the device
 in read-array mode
Date: Wed, 10 Mar 2021 18:05:16 +0100
Message-Id: <20210310170528.1184868-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I remembered this almost 2 years old series while reviewing=0D
David Edmondson's patches... (which are included at the end).=0D
=0D
Basically we move things around to make the code easier to maintain.=0D
=0D
Since v1:=0D
- Addressed David/Bin comments=0D
- Added R-b=0D
=0D
Missing review: patches 7 & 8=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
David Edmondson (2):=0D
  hw/block/pflash_cfi01: Correct the type of PFlashCFI01.ro=0D
  hw/block/pflash_cfi: Replace DPRINTF with trace events=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  hw/block/pflash_cfi: Fix code style for checkpatch.pl=0D
  hw/block/pflash_cfi01: Extract pflash_cfi01_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Extract pflash_cfi02_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Set rom_mode to true in pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Open-code pflash_register_memory(rom=3Dfalse)=0D
  hw/block/pflash_cfi02: Rename register_memory(true) as mode_read_array=0D
  hw/block/pflash_cfi02: Factor out pflash_reset_state_machine()=0D
  hw/block/pflash_cfi02: Add DeviceReset method=0D
  hw/block/pflash_cfi01: Clarify trace events=0D
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()=0D
=0D
 hw/block/pflash_cfi01.c | 278 ++++++++++++++++++-----------------=0D
 hw/block/pflash_cfi02.c | 316 ++++++++++++++++++++--------------------=0D
 hw/block/trace-events   |  40 +++--=0D
 3 files changed, 329 insertions(+), 305 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


