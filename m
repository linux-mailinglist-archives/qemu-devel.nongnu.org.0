Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F56161E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8F-000589-M7; Wed, 02 Nov 2022 07:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7j-000580-Au
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7h-00051c-1c
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmvqNA/UY64lxHCG5EBGJAGWPYY0XDiEjqoLfBB0pmE=;
 b=GbIlp3Ilxm6sGmYokwzXBs7wifkLcsXGL4MNBMwG4C7qGSC0UhrvKJrAFWhFt+CGKT6CIz
 mh9E9TzFslqfBCp39V2JDJitZDjM94vERgOTZLZoogB4WflyD29ZbRFJnt3Qs99mf/EIvg
 Ew9hjUAxNRbGalOW43QhAJJAiKuTsSM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-cQc4kSncMAa8320oiX9WxA-1; Wed, 02 Nov 2022 07:41:29 -0400
X-MC-Unique: cQc4kSncMAa8320oiX9WxA-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz34-20020a1709077da200b007adc8d68e90so5507155ejc.11
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmvqNA/UY64lxHCG5EBGJAGWPYY0XDiEjqoLfBB0pmE=;
 b=BEEtPni64+CWHpPYWFt4CCTqWPp6J44z5F0q4z9DYMbfT9t5kfeEihdbJIYNxbSD+N
 Rosl3X2KqpLb2eL+fRHY0G60I9UI8yjvbuJ1EIYe08Po8XMug4IA8Mf7QCFCxwwp+oW8
 gZs3M0IUVoBr6zdveU5wGrJxGdDi0KVQLuhlgz4bNC7bwpkdV6xr6EsjPcSXnGe2xK8u
 I+nsxMa2avq+aGNT9GTfTGHOGGGFgkcukVMvKKyNQDpa20r+r0zNtwyOxOD+yZL4hUeh
 n8Vg3y12hfN9asYvzdVj4qTcqAKsJ4bdNzWP8RO1QCulXjx8x3Vvw0JZNK8IAtRJQhOR
 XVnQ==
X-Gm-Message-State: ACrzQf1grSzPDZgZ/T01kvnRZk6t/1x/jg5ZzQHa4qutJbYEPDbqBapM
 22PJYZn4TqteCLxdCfp3s+d6mblwqDyqejaj50viC+gPwXTOW+RyLzp8hHN037e5heN+AKsCNiz
 TVx3n+mUuUVGQYV+Hx48ow+NyD26obnFWMKndEQaCPwEDblXOnUcg4vog3d1SkIcTXjE=
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id
 dr13-20020a170907720d00b007a9b7e68612mr22793452ejc.435.1667389288078; 
 Wed, 02 Nov 2022 04:41:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6blj6liQCy5ZfEA0wcBMMrmcuWUhx5fA+NdLFZ0rzLzKC8Dlk3mQLJuuM6LIfXYCP/ntyjew==
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id
 dr13-20020a170907720d00b007a9b7e68612mr22793423ejc.435.1667389287671; 
 Wed, 02 Nov 2022 04:41:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00731582babcasm5409075ejb.71.2022.11.02.04.41.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc patches for QEMU 7.2 soft freeze
Date: Wed,  2 Nov 2022 12:41:20 +0100
Message-Id: <20221102114125.58902-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 03a60ae9cac546d05b076676491ed1606f9d9066:

  target/i386: Fix test for paging enabled (2022-11-02 12:35:16 +0100)

----------------------------------------------------------------
* bug fixes
* reduced memory footprint for IPI virtualization on Intel processors
* asynchronous teardown support (Linux only)

----------------------------------------------------------------
Claudio Imbrenda (1):
      os-posix: asynchronous teardown for shutdown on Linux

Greg Kurz (1):
      util/log: Close per-thread log file on thread termination

Qi Hu (1):
      target/i386: Fix calculation of LOCK NEG eflags

Richard Henderson (1):
      target/i386: Fix test for paging enabled

Zeng Guang (1):
      target/i386: Set maximum APIC ID to KVM prior to vCPU creation

 hw/i386/x86.c                        |   4 +
 include/qemu/async-teardown.h        |  22 +++++
 meson.build                          |   1 +
 os-posix.c                           |   6 ++
 qemu-options.hx                      |  19 +++++
 target/i386/kvm/kvm-stub.c           |   5 ++
 target/i386/kvm/kvm.c                |   5 ++
 target/i386/kvm/kvm_i386.h           |   2 +
 target/i386/tcg/sysemu/excp_helper.c |  10 +--
 target/i386/tcg/translate.c          |   2 +-
 util/async-teardown.c                | 150 +++++++++++++++++++++++++++++++++++
 util/log.c                           |   9 +++
 util/meson.build                     |   1 +
 13 files changed, 230 insertions(+), 6 deletions(-)
 create mode 100644 include/qemu/async-teardown.h
 create mode 100644 util/async-teardown.c
-- 
2.38.1


