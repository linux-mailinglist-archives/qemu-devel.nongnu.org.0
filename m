Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E87387FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:40:43 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4e2-0004Dn-9w
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ab-0001H0-T3
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4aY-0007s2-83
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WHkvPFD//n3XyifbSKR/dgJ7Gu38+QgXPJS4UldoQSw=;
 b=Z4OqFXdEaDxOzcjfZorBj77kJA9Or4TCwXbp3ksBagYV9mtvlpFI/+aT0M2cXUTb0NWf/O
 vtyE/gZro8scPHLkfeddfhPc1/bLNC+y4m+BI809cEj4x+NM97UK7u69+Gb/Nt2Q+ALhSs
 OOsj0mWnOYfnFT4JRRbLv1ae+Dn1ZXc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-sldaB4KAMYeGzO7L7Y0Wpg-1; Tue, 18 May 2021 14:36:59 -0400
X-MC-Unique: sldaB4KAMYeGzO7L7Y0Wpg-1
Received: by mail-ej1-f71.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso2736999ejn.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kXJIRH7HmUKq7wtXGg/obNyPaxCUq/yvm0M1k6PfB2Y=;
 b=FamXl6m7vYP8Bs1VLQcrcJkTlmRivcCgP4OVlWUTjlLSIndmBNk/A/DlGdAHbjZov/
 Bz15EKnKp5/sDJu5FGOlsx5YA4OQun2KfeF2htPKPLj5sy9t2Dm43h3/X7WZIkgNS+n6
 XILcrIUY1Y3nQe7J9kYcVkSn4SLTuPjGxy2r6/7PGAQYceheuYrQ2F3wVew2S+Flds/2
 J7HyYJ8AJM5ime0ZUdWREPaDLoLPxONAkTBZ/w822KnZ6TtC+f9c/Gnf/aKhbrVkcAoa
 vHP/aAnf2zh3GPlc7VU+Fi3SEe9vpEaTti9t2fqzcHr4F9kz1re6E/0rSIoqzbR0WAR/
 UEUA==
X-Gm-Message-State: AOAM530evzlkhENgxh5PrpbuA1Pykc2Fym7sY2+Ii2hJHNN2UNVAZyqz
 oYdhBU47gRqg43oNYSKpPrTkn1mF6fgHVwVDrF6p6XgHp+RZzV4KEzKKXpy+MSGkoJDnlrmG1XO
 9FCuZ77nlCX9uuDn9EVwxrhSfSW05iirJ8zop/4r4QdedFKmQlhcm8xYNZ2U3r3k6
X-Received: by 2002:aa7:c349:: with SMTP id j9mr8589290edr.135.1621363018062; 
 Tue, 18 May 2021 11:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3S1jK5s4esvhpLzxG7/aLhqa/nIkggY+AucoYKIdUE2wMKmPlI9R0Vi0QcKvoni5Bqy2kbw==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr8589266edr.135.1621363017863; 
 Tue, 18 May 2021 11:36:57 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i5sm6978293edt.11.2021.05.18.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:36:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/25] exec: Add load/store API for aligned pointers
Date: Tue, 18 May 2021 20:36:30 +0200
Message-Id: <20210518183655.1711377-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is the result of a chat with Stefan after looking at=0D
Peter response to Bibo on a problem with unoptimized memcpy()=0D
leading to atomic issues:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg808209.html=0D
=0D
MIPS R6 (32/64-bit) does support unaligned accesses, but for the=0D
older releases the compiler can't optimize the __builtin_memcpy().=0D
=0D
When a pointer is known to be aligned, we can skip the checks for=0D
misalignment and directly access the data. The pair of virtio vring=0D
fields happen to be aligned.=0D
=0D
To be able to call the aligned functions from the virtio layer, we=0D
have to fill the gap in multiple API layers.=0D
=0D
The series is decomposed as:=0D
- cleanups (1-6)=0D
- clean ldst API using macros (7-13)=0D
- add aligned ldst methods (14)=0D
- add aligned memory methods (15-16)=0D
- similar changes in virtio (17-24)=0D
- use the new methods on vring aligned values (25)=0D
=0D
There are some checkpatch errors related to the macro used.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (25):=0D
  exec/memory_ldst_cached: Sort declarations=0D
  exec/memory_ldst_phys: Sort declarations=0D
  exec/memory_ldst: Use correct type sizes=0D
  exec/memory_ldst_phys: Use correct type sizes=0D
  exec/memory_ldst_cached: Use correct type size=0D
  exec/memory: Use correct type size=0D
  qemu/bswap: Introduce ST_CONVERT() macro=0D
  qemu/bswap: Use ST_CONVERT() macro to emit 16-bit load/store functions=0D
  qemu/bswap: Introduce LD_CONVERT() macro=0D
  qemu/bswap: Use LD_CONVERT macro to emit 16-bit signed load/store code=0D
  qemu/bswap: Use LD_CONVERT macro to emit 16-bit unsigned load/store=0D
    code=0D
  qemu/bswap: Use LDST_CONVERT macro to emit 32-bit load/store functions=0D
  qemu/bswap: Use LDST_CONVERT macro to emit 64-bit load/store functions=0D
  qemu/bswap: Introduce load/store for aligned pointer=0D
  exec/memory: Add methods for aligned pointer access (address space)=0D
  exec/memory: Add methods for aligned pointer access (physical memory)=0D
  hw/virtio: Use correct type sizes=0D
  hw/virtio: Introduce VIRTIO_LD_CONVERT() macro=0D
  hw/virtio: Use LD_CONVERT macro to emit 16-bit unsigned load/store=0D
    code=0D
  hw/virtio: Introduce VIRTIO_ST_CONVERT() macro=0D
  hw/virtio: Use ST_CONVERT() macro to emit 16-bit load/store functions=0D
  hw/virtio: Use LDST_CONVERT macro to emit 32-bit load/store functions=0D
  hw/virtio: Use LDST_CONVERT macro to emit 64-bit load/store functions=0D
  hw/virtio: Add methods for aligned pointer access=0D
  hw/virtio: Optimize accesses on vring aligned pointers=0D
=0D
 docs/devel/loads-stores.rst           |  27 +--=0D
 include/exec/memory.h                 |  18 +-=0D
 include/hw/virtio/virtio-access.h     | 239 +++++++++-----------------=0D
 include/qemu/bswap.h                  | 149 ++++++----------=0D
 include/exec/memory_ldst.h.inc        |  16 +-=0D
 include/exec/memory_ldst_cached.h.inc |  66 ++++---=0D
 include/exec/memory_ldst_phys.h.inc   |  72 ++++----=0D
 hw/virtio/virtio.c                    |  13 +-=0D
 memory_ldst.c.inc                     |  20 +--=0D
 9 files changed, 270 insertions(+), 350 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


