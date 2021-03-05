Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1C32F6FD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 00:56:44 +0100 (CET)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKJG-0008Ky-V8
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 18:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKGy-0006mT-Qf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:20 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKGx-0005pt-8I
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n22so2670087wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hOhBYeXVbU9iDoe3oZ1EJaWHxisFx5ag98EkS9/ZKl8=;
 b=E30ch/iNSMgrdblpe+fTnsRsVbf4A6wvXLTlESsGAhG0c7E2BqujX/UOGxHZFfc0nv
 AbSRo3hMF86c2ADGAyoH1YJZvbR0bT7uWg8uZZ9F8tW/+LiPoSXo9YepqD2SXVxc91Tg
 CpugOzO3rmFFQTP+sViDLvQT9K2JQ58PNEFpN72keFyAV6D1RuBCpgb0VJbtWA4oeTP7
 oCDrPIjqIzftF6yp/LO4BPusPAN+Wq0ERN5Jwzhw5ggLb+GibfQlod0r20xJ/OrY7TTp
 ZPKkGwjpfbcOs0+2qQiaWDT+5DgGKD4bv9TsWx7yGgOnBeH4enTl2zaUD+0/0d4kp8/9
 Yugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hOhBYeXVbU9iDoe3oZ1EJaWHxisFx5ag98EkS9/ZKl8=;
 b=jO8tqL1B20SY1naPUpKIKmMY970TW4axl8SwYZC7IwOQIUxfu4DTtcXcujpNiwL1gC
 RC7v/dO0wmmPcS1uKsvMmiiEkCbyZ73wjGWIWwcelamYFPqRJjPhkUWtV1SjAbu2LExH
 ko3gs/fsH5LUmCMy0mwBLMY1XcrfHL/2ziAowdpF9XkMImtmKllra1G0W3sNgU9GN4gq
 iMPBQdU64IrFCHJLYPVmD9cg0sp+EsoBbw6P7Ao1QNLszNdjwNCyHvzxpdwlfhEtspp8
 9NaKiPLHwy182jzV6WgNFu8rLiorYh1xV2/ocDcsDEDgoJJHcUNLGiqv6ZsEcAfgTtrw
 tcfw==
X-Gm-Message-State: AOAM532hRvuRd3K63eioKVZ03B8AlQc/apoNBO8kZ7hgkifzOG95LNTb
 iiInB5mQFH2Q/viq3aJ6UhVztUO7ATE=
X-Google-Smtp-Source: ABdhPJz3ZjoC2I5JIVp5OWhH6ReCn8Tsn5iCwlmzQhDjEH4BBxmoTDG39wcL3g9UgXamwq3tgYXGTQ==
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr11079778wmg.33.1614988456713; 
 Fri, 05 Mar 2021 15:54:16 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s20sm6997103wmj.36.2021.03.05.15.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:54:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] memory: Display AddressSpace zero-based in 'info mtree'
Date: Sat,  6 Mar 2021 00:54:11 +0100
Message-Id: <20210305235414.2358144-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
I have been confused for some years by AddressSpace being displayed=0D
based on the physical address of their first MemoryRegion.=0D
The actual fix is quite trivial for my needs, but I might not see=0D
all the possible side effects. Altough the change are restricted=0D
to mtree_info() which is only available on the monitor.=0D
=0D
Last patch is a minor cleanup. I ended not using it.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  memory: Better name 'offset' argument in mtree_print_mr()=0D
  memory: Provide 'base address' argument to mtree_print_mr()=0D
  memory: Make memory_region_to_absolute_addr() take a const=0D
    MemoryRegion=0D
=0D
 softmmu/memory.c | 22 ++++++++++++----------=0D
 1 file changed, 12 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

