Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF85E934F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:14:47 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRT4-00065l-SA
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5b-0002I9-3b; Sun, 25 Sep 2022 05:38:19 -0400
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101]:34496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5Y-0007A0-Bp; Sun, 25 Sep 2022 05:38:18 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Mb15r3N7Wz9sRG;
 Sun, 25 Sep 2022 11:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DjJbl5EVoWbzZ8OAW5JMiNs1ClT0FUVqaw04YT0vbo=;
 b=LGRsx6QdH+4YV+X6ofO3Irut+F2kFUz57CKjjpEnbEeGQ2ripmsPGT5cm0tuo3cKDIsc7G
 lYcjFRlh3biUAqFQ2A2L/iKCZkBujuSiAE6yN12uk0m208UBn/jZ05uqgnSGckPkgh64Y4
 HmH2eg3nYFGuOPDObBFf4W7SkpyuxQB1NDM1a/TLzHf86raoHGiNJClaUDkT+ipWa142Lg
 i+SGC/8EpozH/u1QTFEWo8XynPN1Q9mwsbQwM5srWEA5FflXyp4Wr4FzQ5a1RajqcFSG62
 Ly5QJ/zsgsguRDvn7UEgHF7qX5LVaThsDe+5RIGS4f9Twu+fizvzejEwVCJpcw==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DjJbl5EVoWbzZ8OAW5JMiNs1ClT0FUVqaw04YT0vbo=;
 b=NhYvARiJk7D/juFSnBs8/exWNlVZnG+I5RQbd/Ov8STXJiJOXS5H5dPfv8gbI6O+ltb6yU
 rb54H5d34yp+rl0yM0C5WBUfoHtUPCePs7g9D5pfZb0DKCFDAPH38tqJZ0TE4mMiQfV82K
 JIVDLvS977hC5Hp9DD31fIpp9tNhSgQo2AYD88dmM6iaQZsOr1z5NzO0thhq2KXSluL56W
 0bBxeHHtdrCwOFpKTmPTYSRV8IUXo9fPl4MMcZOvm1WxD5KItJQWtUu0Ude9r+m0b5p+cP
 ilcBMFIN5Y3NMTw6KR3nJe3cJlN8Q9eSmijy+8zIkGnj/zkViHLYmd6FfSy3TQ==
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH v3 0/2] Re: hw/ide/piix: Ignore writes of hardwired PCI
 command register bits
Date: Sun, 25 Sep 2022 09:37:57 +0000
Message-Id: <20220925093759.1598617-1-lkujaw@mailbox.org>
In-Reply-To: <20220922060325-mutt-send-email-mst@kernel.org>
References: <20220922060325-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9uf48qaz9uc3t9s7gbpm1mj11kpsdqnn
X-MBO-RS-ID: f7af932fc6f220dc75b
X-Rspamd-Queue-Id: 4Mb15r3N7Wz9sRG
Received-SPF: pass client-ip=2001:67c:2050:0:465::101;
 envelope-from=lkujaw@mailbox.org; helo=mout-p-101.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Sep 2022 09:07:54 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Tue, Sep 06, 2022 at 10:23:57AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jun 02, 2022 at 08:47:31PM +0000, Lev Kujawski wrote:
> > > ---
> > > This revised patch uses QEMU's built-in PCI bit-masking support rather
> > > than attempting to manually filter writes.  Thanks to Philippe Mathieu-
> > > Daude and Michael S. Tsirkin for review and the pointer.
> >
> > But pls note I wrote:
> >
> > 	Might need machine compat machinery
> > 	for this.
> >
> > without said machinery, if guest set one of the other
> > bits, migration will fail.
>
> I assume v3 will be forthcoming, right?

Thanks for your review and my apologies for the delay.  I hope this revised
patch appropriately handles the machine state migration case.

Kind regards,
Lev Kujawski

Lev Kujawski (2):
  qpci_device_enable: Allow for command bits hardwired to 0
  hw/ide/piix: Ignore writes of hardwired PCI command register bits

 hw/ide/pci.c             |  5 +++++
 hw/ide/piix.c            | 39 +++++++++++++++++++++++++++++++++++++++
 include/hw/ide/pci.h     |  7 ++++++-
 tests/qtest/ide-test.c   |  1 +
 tests/qtest/libqos/pci.c | 13 +++++++------
 tests/qtest/libqos/pci.h |  1 +
 6 files changed, 59 insertions(+), 7 deletions(-)

-- 
2.34.1


