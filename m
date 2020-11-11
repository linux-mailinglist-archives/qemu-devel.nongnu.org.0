Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE902AF384
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:27:54 +0100 (CET)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcr6H-0001Wa-60
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4C-0008DO-Nk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4A-0001kR-4p
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605104741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A8ITwIScKLDjB36oOydDFaGkAFGAJhnoRg71WuFFvY0=;
 b=OYM5wLhLitImxcNGCt/kKk5MPozfY0J6Okk70QVtsTSRz0X1opGTEf1qH/X7jDByULzDBa
 0yynIHC5rU50Bza3gxwho2fBgQXNrb6ADZJVMVsSNBJ1L255fmA/67fdNGSa7kgmXmFoqg
 WvVbH8YEqUw1QekJtwclNF1cxQtfWww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-9Jlh68BdPwmGIc1dzM206Q-1; Wed, 11 Nov 2020 09:25:38 -0500
X-MC-Unique: 9Jlh68BdPwmGIc1dzM206Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D458CD808
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:25:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B692060CD0;
 Wed, 11 Nov 2020 14:25:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/12] Remove QemuOpts usage for HMP,
 -object and -readconfig
Date: Wed, 11 Nov 2020 09:25:25 -0500
Message-Id: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is yet another RFC on the command-line parsing overhaul.  Here,
I'm switching HMP, -object and -readconfig away from QemuOpts.  There are
pending QemuOpts and keyval patches that make the syntaxes the same
apart from:

- "implicit value" options (where the lack of value is turned
into "on" or "off"), which will be deprecated

- the processing of invalid, empty or overlong keys which can be considered
bugfixes.

Along the way, the object_add HMP command grows help support.

The plan on top of this is to also keyval-ify -M and -accel.  The reason
for this, in my evil plan, is to allow for compound properties.  These
compound properties would be used for replacements of options like -smp
(-M smp.xxx), -icount (-accel tcg,icount.xxx) and -chardev (as in -object
chardev-socket,addr.host).

Paolo

Paolo Bonzini (12):
  tests: convert check-qom-proplist to keyval
  keyval: introduce keyval_parse_into
  hmp: replace "O" parser with keyval
  qom: use qemu_printf to print help for user-creatable objects
  hmp: special case help options for object_add
  qemu-io: use keyval for -object parsing
  qemu-nbd: use keyval for -object parsing
  qemu-img: use keyval for -object parsing
  qemu-config: add error propagation to qemu_config_parse
  qemu-config: parse configuration files to a QDict
  qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
  qemu: use keyval for -object parsing

 block/blkdebug.c                |   3 +-
 hmp-commands.hx                 |   6 +-
 include/qemu/config-file.h      |   8 +-
 include/qemu/option.h           |   2 +
 include/qom/object_interfaces.h |  45 +-----
 monitor/hmp-cmds.c              |  22 +--
 monitor/hmp.c                   |  20 ++-
 qemu-img.c                      | 258 +++++++-------------------------
 qemu-io.c                       |  42 ++----
 qemu-nbd.c                      |  42 ++----
 qom/object_interfaces.c         |  57 +------
 softmmu/vl.c                    | 113 ++++++++------
 tests/check-qom-proplist.c      |  58 ++++---
 util/keyval.c                   |  39 ++++-
 util/qemu-config.c              |  99 +++++++-----
 util/qemu-option.c              |   3 +-
 16 files changed, 324 insertions(+), 493 deletions(-)

-- 
2.26.2


