Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8D4FDF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:15:58 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFR7-0006IP-Gz
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFOy-0004u8-NT
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFOw-0001Ms-Lu
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so1643852wmh.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kc14njMSlpkVPu2ugOxWKGqVeaWDjJIFlKF42XjqORY=;
 b=LXgHKAm07VtgzIDF3lz+GPnQsnOE4RJebhAMzT6I5EmLfOSB1/1cYpPNHAdar0Ye9m
 6miRNTvB+z33xuHy4prEj3KogdNyzwY+AiEm2LOxOS3xPm0ZCJ7ZQlvybc8/BKbjAeYl
 m6mpVn93DB1okznOiHMwzlEnEFya66Eh6SrF8tqYVFji0nh3FUASuk/6CegohbLD94sT
 K7XEVdVRTqOndYxVCD8dqne+RGI0MP9fuRslT4MybZ+e0zyX9ot545noirK3V+eZmKcb
 Xc/iyETkafNY6YwT8mGfrPSoHTWYN+odf+iM6D612CBzcSUkrMF2tpUw/6I31T5qL+LW
 DWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Kc14njMSlpkVPu2ugOxWKGqVeaWDjJIFlKF42XjqORY=;
 b=idxy3ArbUHEfrqHlaqOWb0IRTX8FIwk/fQMtdgGgRBrWZ3epnqQVeg3AsXTDbhwQdn
 KAHWKlUHS8nkg/DGpa44GBK7NBID8mEgKzEbCtWNdOdF2btC5k1TXV5zl27apT5VDqAx
 qqw2pUYfbOQ02a1p9wAoIsrpQB1NOQzDvS+rSYcSRYHd4G3gfsOAJm1te+YFYNdhirRX
 GzfQoLeUCFWgQSgaw7SnJGXGLCk03JM4nKMS6fKVskJp6EEikVltSI/pTEvHsyvqYFlg
 46VBsDxaqamuK6tUFLAp7wQbHvlpvjWubNfwjek9ACRiF8LNXCMkfOUSYq4I0izfDatA
 cobg==
X-Gm-Message-State: AOAM530AoR0jiGsxhSpDr7InLLahVcNmsTh6ZZ7Zzihk+sfLT9DoS/5k
 MsU/sEC2gW9j1vtlSmmeonMsAR682Pj4xQ==
X-Google-Smtp-Source: ABdhPJxqzJss6cDd1zoBPfedrCiIhO195XZRZWqWflX50/i+NpjTjlpMnYvvy1gSwP8EJxIxOG0wiA==
X-Received: by 2002:a05:600c:1e17:b0:38e:ba41:2465 with SMTP id
 ay23-20020a05600c1e1700b0038eba412465mr3811908wmb.132.1649765621289; 
 Tue, 12 Apr 2022 05:13:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038e8f9d7b57sm2355805wmq.42.2022.04.12.05.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:13:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] net: support for CFI with libslirp >= 4.7
Date: Tue, 12 Apr 2022 14:13:33 +0200
Message-Id: <20220412121337.207203-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: samuel.thibault@ens-lyon.org, thuth@redhat.com, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A system libslirp (either static or dynamic) cannot be used with QEMU if
QEMU is compiled with control-flow instrumentation, because of the way
timers are implemented in libslirp.   libslirp passes a function pointer
to the timer_new callback but the type information for the callback is
missing; invoking the timer callback produces a CFI false positive.

The fix requires the introduction of new interfaces in
libslirp.  This series is an example of how QEMU would use
the new interfaces introduced by libslirp merge request at
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/117.
It is RFC-only because the new interfaces have not been accepted yet.

Paolo Bonzini (4):
  net: slirp: introduce a wrapper struct for QemuTimer
  net: slirp: switch to slirp_new
  net: slirp: add support for CFI-friendly timer API
  net: slirp: allow CFI with libslirp >= 4.7

 meson.build | 24 +++++++--------
 net/slirp.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 86 insertions(+), 23 deletions(-)

-- 
2.35.1


