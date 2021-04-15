Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E295360682
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:06:11 +0200 (CEST)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyt0-0002cE-BV
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrC-0001pJ-On
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrA-0004vO-0A
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618481055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hD5A+CcqjKcmFViijivIPS8yWFuoVFW33utqLnENkpA=;
 b=gB+/ryrNcsNmKtGKijSjqMuSf6tj+LrlLDjwyga7LUVt+FD/2CdvYN/JNi5wK0q8gRdFV4
 RthGx7SiosiF332E9arzQjuUEVbp+O+E1L4WVrqMK6yH6ITo8DSKUdCd+L8aJ3uSNAi5B7
 VBuluGPtAz435bxbQP8tUDnb3DIiILw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-myrLTCfkNzeOy6E9kjRrtA-1; Thu, 15 Apr 2021 06:04:13 -0400
X-MC-Unique: myrLTCfkNzeOy6E9kjRrtA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m16-20020a0560000250b02900ffde35c102so2506228wrz.20
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=APinoIq8s1673NXMD+nNXdMLC3Fro7uUdGUaBAyi58Q=;
 b=AlZEcwuV+0tQR0aiIP+hyC7FRUVyPQlfO7rCNYxZgRZZWmC+VDxjxOZxWmK/XTOfWu
 cxHJgGHxv/KvZb3fBnfTx6/r1a5FegsM6RXQpXWOz+bg+8ZWeLcXM/4wjZjJ4coiBjBw
 BTgVGEA3dnonJaphSfGEVAeyrxuOIMDTXgslUWLea/sbuT63mVEbkOnltB9TIZafViwg
 q7sHjiobXTtNXe5hXBrgdluoU2PMaWRC13BglA7y7fMsLQa9ljDHWIkJlfb1Bh47Q81U
 kzVO8TlZ612Cj7Jrxm/RjppMG5SLYuKHaf4skj7bgmiTKE5kYqYUw8uJo0b424QPWexj
 3V1Q==
X-Gm-Message-State: AOAM533Q6gcz/1h5wG9S8I+56mwVaik0DTDcPT9DXRrKmCJuSMkowBRI
 bvPPhxhtgV+E6vn8EU8YwXhs1nmhnPyZ7WtyCpj+maOPYi0onPemQd1V5hodRTNjH46bdbOEVau
 r7kM/sVshgXypcCs=
X-Received: by 2002:a1c:a746:: with SMTP id q67mr2359891wme.22.1618481052397; 
 Thu, 15 Apr 2021 03:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1eTf99qAnGzQBaDUrU4ycGQyoIAtDmT1CazYusw/849kHPcaxABOlgOkRqnQskveMXs0Wmw==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr2359870wme.22.1618481052192; 
 Thu, 15 Apr 2021 03:04:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l8sm1834588wme.18.2021.04.15.03.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 03:04:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/elf_ops: clear uninitialized segment space
Date: Thu, 15 Apr 2021 12:04:07 +0200
Message-Id: <20210415100409.3977971-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Respining Laurent's patch, but extracting the address_space_set()=0D
helper.=0D
=0D
Laurent Vivier (1):=0D
  hw/elf_ops: clear uninitialized segment space=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  exec/memory: Extract address_space_set() from dma_memory_set()=0D
=0D
 include/exec/memory.h | 16 ++++++++++++++++=0D
 include/hw/elf_ops.h  | 13 +++++++++++++=0D
 softmmu/dma-helpers.c | 16 +---------------=0D
 softmmu/physmem.c     | 19 +++++++++++++++++++=0D
 4 files changed, 49 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


