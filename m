Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C9325271
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:29:39 +0100 (CET)
Received: from localhost ([::1]:54304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIaA-0007AN-C8
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lFIYp-0006EQ-PG
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:28:17 -0500
Received: from oxygen.pond.sub.org ([94.130.129.15]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lFIYk-0004qH-3W
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:28:14 -0500
Received: from blackfin.pond.sub.org
 (p200300d36f2e0300dacb8afffee0c842.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f2e:300:dacb:8aff:fee0:c842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id 522AC2087B;
 Thu, 25 Feb 2021 16:28:06 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8892F113860F; Thu, 25 Feb 2021 16:28:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 15/16] qapi/expr.py: move related checks inside
 check_xxx functions
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-16-jsnow@redhat.com>
Date: Thu, 25 Feb 2021 16:28:02 +0100
Message-ID: <87r1l488vx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=94.130.129.15; envelope-from=armbru@pond.sub.org;
 helo=oxygen.pond.sub.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> There's not a big obvious difference between the types of checks that
> happen in the main function versus the kind that happen in the
> functions. Now they're in one place for each of the main types.
>
> As part of the move, spell out the required and optional keywords so
> they're obvious at a glance. Use tuples instead of lists for immutable
> data, too.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

No objection to changing read-only lists to tuples (applies to previous
patch, too).

No objection to turning positional into keyword arguments where that
improves clarity.

I have doubts on the code motion.  Yes, the checks for each type are now
together.  On the other hand, the check_keys() are now separate.  I can
no longer see all the keys at a glance.

