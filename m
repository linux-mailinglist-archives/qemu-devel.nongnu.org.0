Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3B64D17A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 21:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5YgE-0005gm-Na; Wed, 14 Dec 2022 15:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5YgC-0005gd-Tw
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 15:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5YgA-0001GH-W7
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 15:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671050917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nn+m7LVjnZPNeImADL7be78BYIykwOVH2J6YyLNUeUw=;
 b=bvo+33OcNa1OznM4yBtWSc0mCeDQf51C0vniTydtVDmBbDuMw09Cr5k69K4pYIehxPpyfy
 Hz6jDqEDh6ZtC7mTj0pgwFbYvnJZvxSAxu5j7j4sqbGEojpxlmZ427rLf7UG4MRak/VvHw
 WAChTbhhPL64Hk5H/wlhZ+O7ndTkCsA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-5IMI77gFMam1rFNFiTyf8Q-1; Wed, 14 Dec 2022 15:48:36 -0500
X-MC-Unique: 5IMI77gFMam1rFNFiTyf8Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 c30-20020ab04861000000b00419afefbe3eso383133uad.4
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nn+m7LVjnZPNeImADL7be78BYIykwOVH2J6YyLNUeUw=;
 b=vRwvGhG2IHvhjIj1iHHWrqpS7154aKG7LDhiHa8+QE3bkDx91OFcFfdVoY++cC0b5P
 nJil52Og6xa6xjmRIXJf4S/qW/ibISrlpTiHgsS7KN00UWVQAhl6RB6FcMcBuIMkcCrH
 EFSBO3ppUleACc1MtZk1rpI+UCHvIAc1wQpWaT2bigq0O7MQ6QtaniWOuBw6GoZLCyci
 0HcLF5oH6p+R8D4KyU0S90yQlWVxRGY8zLX5UBcK9qrz940gD/JMnUV0n3ld3+570m+B
 qrBEmYTQxBWmZFS96yjG7S/Qj5rM/TbO6yKFmuu5gXUwoBZ7Yaeacp5nVwIVYfMlUfS+
 tW3w==
X-Gm-Message-State: ANoB5pnWb2DGFw2cTDB/58vKsJnRH3Nf6sYpP51dkQ3JG9lAxHN/iIrx
 PfRmUaLE8uFZNLjA7WiFwZ7dcRMG/shXkYCJL/9Oe3VfyiC6G3aKqW6sqaUYFYB4GbqdX1N+KG8
 HpKuTkh8FqfLGUTNRPMgVAW0hpj1CRbfrmk5gIIaen2L7vUpIw48EiT/gYP5cxhec
X-Received: by 2002:a1f:1681:0:b0:3bd:3a31:d74e with SMTP id
 123-20020a1f1681000000b003bd3a31d74emr16627902vkw.1.1671050914893; 
 Wed, 14 Dec 2022 12:48:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4sI/4q1X+A4rrzo3St0rQ2Fx0qrx1s8bZs6xfADguLEkHZbgUBCj0skFiFnibJAeK+f0zewQ==
X-Received: by 2002:a1f:1681:0:b0:3bd:3a31:d74e with SMTP id
 123-20020a1f1681000000b003bd3a31d74emr16627878vkw.1.1671050914516; 
 Wed, 14 Dec 2022 12:48:34 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca. [70.31.26.132])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a05620a444500b006fc2e2198easm10901821qkp.95.2022.12.14.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 12:48:33 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com
Subject: [PATCH 0/2] test
Date: Wed, 14 Dec 2022 15:48:30 -0500
Message-Id: <20221214204832.1780192-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 +++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 +++++++++++++++++++++++++++++
 migration/channel.h                 |  5 ++++
 migration/migration.c               | 45 +++++++++++++++++++++--------
 migration/multifd.c                 | 12 +++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +---
 migration/postcopy-ram.h            |  2 +-
 migration/rdma.c                    |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 23 files changed, 138 insertions(+), 36 deletions(-)

-- 
2.37.3


