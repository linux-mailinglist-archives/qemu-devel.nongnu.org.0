Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE03CFCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:54:10 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5r8L-0007sE-8v
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1m5r7L-0006o2-CK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1m5r7H-0005Cl-DZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626792782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=0F7DSk9qoYqbwMNaDpUp3Nbi26sdAZbQPGvZqGvt5fg=;
 b=JM6l+1b76mPhSvc0C5pcU5oT1kcjalmy2oKM+QX3YHmv03A1VdNMwMbmDNNb3OXMxYcSOF
 z2GliUOwYYjGP2OAoE9/rgBdmnZ5Okkb+X8utNt/PyjUWQZwZBKfje9AKsyW89GuiIwo9u
 OJmtzbiCDWA0Qj+VCyXfEy45+fGizs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-LfBMZTR7OdOJ6ijggVJ--w-1; Tue, 20 Jul 2021 10:53:01 -0400
X-MC-Unique: LfBMZTR7OdOJ6ijggVJ--w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D196804150;
 Tue, 20 Jul 2021 14:53:00 +0000 (UTC)
Received: from oldenburg.str.redhat.com (ovpn-112-73.phx2.redhat.com
 [10.3.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1AA919C44;
 Tue, 20 Jul 2021 14:52:58 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: gcc@gcc.gnu.org, libc-alpha@sourceware.org, qemu-devel@nongnu.org
Subject: Disabling TLS address caching to help QEMU on GNU/Linux
Date: Tue, 20 Jul 2021 16:52:56 +0200
Message-ID: <87im15qbp3.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the GNU/Linux ABI does not really specify whether the thread
pointer (the address of the TCB) may change at a function boundary.

Traditionally, GCC assumes that the ABI allows caching addresses of
thread-local variables across function calls.  Such caching varies in
aggressiveness between targets, probably due to differences in the
choice of -mtls-dialect=gnu and -mtls-dialect=gnu2 as the default for
the targets.  (Caching with -mtls-dialect=gnu2 appears to be more
aggressive.)

In addition to that, glibc defines errno as this:

extern int *__errno_location (void) __attribute__ ((__const__));
#define errno (*__errno_location ())

And the const attribute has the side effect of caching the address of
errno within the same stack frame.

With stackful coroutines, such address caching is only valid if
coroutines are only ever resumed on the same thread on which they were
suspended.  (The C++ coroutine implementation is not stackful and is not
affected by this at the ABI level.)  Historically, I think we took the
position that cross-thread resumption is undefined.  But the ABIs aren't
crystal-clear on this matter.

One important piece of software for GNU is QEMU (not just for GNU/Linux,
Hurd development also benefits from virtualization).  QEMU uses stackful
coroutines extensively.  There are some hard-to-change code areas where
resumption happens across threads unfortunately.  These increasingly
cause problems with more inlining, inter-procedural analysis, and a
general push towards LTO (which is also needed for some security
hardening features).

Should the GNU toolchain offer something to help out the QEMU
developers?  Maybe GCC could offer an option to disable the caching for
all TLS models.  glibc could detect that mode based on a new
preprocessor macro and adjust its __errno_location declaration and
similar function declarations.  There will be a performance impact of
this, of course, but it would make the QEMU usage well-defined (at the
lowest levels).

If this is a programming model that should be supported, then restoring
some of the optimizations would be possible, by annotating
context-switching functions and TLS-address-dependent functions.  But I
think QEMU would immediately benefit from just the simple approach that
disables address caching of TLS variables.

Thanks,
Florian


