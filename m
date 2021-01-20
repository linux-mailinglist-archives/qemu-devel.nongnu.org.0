Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B92FD2EF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:45:14 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EjR-0005DB-Gz
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egy-0003zo-AM
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:40 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egw-00047v-PT
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:39 -0500
Received: by mail-ej1-x631.google.com with SMTP id g12so33860903ejf.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HcyXBpkFCXz1O4SquOWagp/D4c/Mvra/tT832SH7OdM=;
 b=hYqdgm9nVQPco0XjnoNCt7ACqC+Ig8a8xzuNlfQjXUrE2cZkI/a48n1FuWKG9vtyNG
 HhX2GydVTykkL2gjwa3i8xpkXjWEM6OJcXExOZZJv3Xc+iwF+gUwRRGP+ymzMvo5VWGP
 T6OKtHt7bBvcs71byC7FyDIg5slLIzcLMokUmfC/SL9CZsEeaF3pEkMJM5+4gznfMCss
 KrwImo3QCk1WZdkZ79AnLygbhCkZP2mZ45HEAsDxFh26nRnnnwStnLa8TQvHER7M6h0q
 QEFDlVFT/hndE7gcTO3uVeno0dlkKgCds4iV0JK3Do8ybGux3nGpm0URvipLIZJEByMf
 Hzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HcyXBpkFCXz1O4SquOWagp/D4c/Mvra/tT832SH7OdM=;
 b=tOfrrA77Fkt/+p3L7W2lZHRF/VkzhzlTTYmuzjLHhbUiJjGJJBpXpQtBFCay+mf7AJ
 7GOiqp1bYFqf0grEXWwcpMwDg2Op93+iSLoGP6xOZ22jNsQJkWT590Nn9hr8jeKdbJQL
 rWvUDGAoAPNl1G/1W0ILYfe09eSMAt+RIQ5V9+pFfw3rAkxOdC3nuHoi6Ey3FeFDjlXW
 vivUFYQ6qD0CoQMpn/xncsXlgJR+DIhFkzVRlvajUJ7CMMZqW2k8VKNOdzIO+7hq7IhT
 gcw58H4EDKrjtW2GNp0iXSC6M4Vyu3kYRfWG2joA8DNJSjSNwcLb0P2XUj5nnx26aDLt
 ymqg==
X-Gm-Message-State: AOAM530qIpTPGRZ8eHalC4ijMa2Z1rygqg+l5JaQwXChGXrSzD4egTOE
 x4XCSUua18luROWjxETdU9rmjoldPZlgiA==
X-Google-Smtp-Source: ABdhPJxrOpStTbkzeiXnI2J/xFMDyJH7t2+UcSvKf+7Wm6/Sav1Rk4dd711PUqQfAuWg+FbKRJoPmw==
X-Received: by 2002:a17:906:2743:: with SMTP id
 a3mr6545937ejd.378.1611153757197; 
 Wed, 20 Jan 2021 06:42:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v9sm965078ejd.92.2021.01.20.06.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:42:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vnc: remove "change vnc TARGET" and QMP change command,
 support "-vnc help"
Date: Wed, 20 Jan 2021 15:42:32 +0100
Message-Id: <20210120144235.345983-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real driver for these patches is to send all QemuOpts user input
to qemu_opts_parse_noisily, for consistency in the command line
parsing code and to effectively outlaw "help" and "?" QemuOpts
suboptions.  vnc_parse is the only function that is still using
qemu_opts_parse.

In order to remove the non-command-line callers of vnc_parse,
I am removing the deprecated QMP change command but also its HMP
veneer "change vnc TARGET", whose usecase is somewhat unclear to
me.  "change vnc password" is still supported.

Finally, by switching to qemu_opts_parse_noisily, it is easy to
print a help message on "-vnc help".


Paolo Bonzini (3):
  hmp: remove "change vnc TARGET" command
  qmp: remove deprecated "change" command
  vnc: support "-vnc help"

 docs/system/deprecated.rst       |  5 ----
 docs/system/removed-features.rst | 11 +++++++
 hmp-commands.hx                  |  6 ----
 include/ui/console.h             |  2 +-
 monitor/hmp-cmds.c               |  7 +++--
 monitor/qmp-cmds.c               | 51 --------------------------------
 qapi/misc.json                   | 49 ------------------------------
 softmmu/vl.c                     |  6 ++--
 ui/vnc-stubs.c                   |  7 ++---
 ui/vnc.c                         |  8 ++---
 10 files changed, 27 insertions(+), 125 deletions(-)

-- 
2.29.2


