Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE26868E6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEN3-0002UY-AU; Wed, 01 Feb 2023 09:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNELL-0001Wk-7g
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:19 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNELG-0005aC-4E
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=QiXt1OM5kpacyF8tyBXmCNV22BZZhGq7XEUXYnI4zw8=; b=n3gXfhm+9WlJSRXkYtrzdBvJrC
 RJ/n48eNm+5xHaPRvMYvilCcqDRCAaZBPy4dQmI5IioF5C2vv4YLI7dO566MqVHBHK9IZBzc/3qjI
 3XYRJJwmq+MIV/VwQR6oO1PW2pwPir8YBH8uwCCin/zJquY99oL+89MjXzMzDrnKUBW6Wm72Z+yWF
 nKDWMxtNEj0NIcT/0mxPtd02s+/Uc04EzziLlvdIKURBCA8CX8lhmfKvn41080pudTsDNXy1w5DJJ
 JxQoNkuhfhBJo+7ncbS3IVOLJGqKHyA9sH6AdCF+Y9vZ7ViBlOaxR3RyYXYjSba6IeGPLb/F0RFGe
 FNGzyMIA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNELA-00CNSF-7l; Wed, 01 Feb 2023 14:44:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNELA-007Jw4-0l; Wed, 01 Feb 2023 14:44:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v1 0/8] Look Ma! We made a XenStore
Date: Wed,  1 Feb 2023 14:43:50 +0000
Message-Id: <20230201144358.1744876-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Starts fairly simple; a node tree with some basic refcounting and copy
on write semantics.

Add in watches to fire when a given subtree gets modified, then 
transactions which *would* have been a fairly trivial case of keeping 
the new one and unreffing the old if it wasn't for the fact that we need 
to fire watches on anything that changes as we commit the transaction.

So on commit, we walk the parts of the tree with a refcount of one, 
since those by definition are the parts which are new and unique to this 
transaction. And fire watches on the ones which have the appropriate 
flag to show that *they* were modified, and they weren't just part of
the CoW bubbling up to the root of the tree.

Watches on nodes that were *deleted* in a transaction are even more fun
since they mean we have to *keep* those nodes with a 'deleted_in_tx' flag
so that we can fire watches on them when we commit. But it all works out
fairly simply in the end.

I'd be particularly interested in thoughts on the way I've handled 
serialization/deserialization, by generating and consuming a GByteArray
and using VMSTATE_VARRAY_UINT32_ALLOC(…vmstate_info_uint8…). It seems
to work.

As we hook up the actual PV back ends to work with this XenStore (which
is fully functional in the part of the tree I haven't posted yet), there
will be a bit more work to ensure a seamless handover on resume from
migration. We *might* end up serializing only the guest nodes under
/local/domain/${domid} and letting the rest be recreated on the QEMU
side just as they were created the first time. But there's plenty here
to heckle even before we tweak those details... 

https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-10-xenstore

David Woodhouse (6):
      hw/xen: Add xenstore wire implementation and implementation stubs
      hw/xen: Add basic XenStore tree walk and write/read/directory support
      hw/xen: Implement XenStore watches
      hw/xen: Implement XenStore transactions
      hw/xen: Watches on XenStore transactions
      hw/xen: Implement core serialize/deserialize methods for xenstore_impl

Paul Durrant (2):
      xenstore perms WIP
      hw/xen: Create initial XenStore nodes


 hw/i386/kvm/meson.build     |    1 +
 hw/i386/kvm/trace-events    |   14 +
 hw/i386/kvm/xen_xenstore.c  |  844 ++++++++++++++++++++-
 hw/i386/kvm/xenstore_impl.c | 1724 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xenstore_impl.h |   68 ++
 tests/unit/meson.build      |    1 +
 tests/unit/test-xs-node.c   |  705 ++++++++++++++++++
 7 files changed, 3347 insertions(+), 10 deletions(-)




