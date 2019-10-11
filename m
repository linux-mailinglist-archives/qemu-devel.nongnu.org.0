Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D7D3E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 13:14:48 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIssh-0004ed-Af
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 07:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iIsre-0004Cv-02
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iIsrc-0006RZ-Sh
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:13:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37772)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iIsrc-0006R6-NF
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:13:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F12BBC05AA57;
 Fri, 11 Oct 2019 11:13:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C262F6012A;
 Fri, 11 Oct 2019 11:13:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81F041138619; Fri, 11 Oct 2019 13:13:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Tianjia Zhang <77389867@qq.com>
Subject: Re: [PATCH] tests: fix counting typo error
References: <20191010121702.90142-1-77389867@qq.com>
Date: Fri, 11 Oct 2019 13:13:37 +0200
In-Reply-To: <20191010121702.90142-1-77389867@qq.com> (Tianjia Zhang's message
 of "Thu, 10 Oct 2019 20:17:02 +0800")
Message-ID: <87y2xredr2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 11 Oct 2019 11:13:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tianjia Zhang <77389867@qq.com> writes:

> Instead of global variables, local variables should be incrementing,
> This is a typo fix.

Impact?

The commit message calls it a "typo", which suggests there is none.  The
patch makes me suspect the bug is more serious than that.

>
> Signed-off-by: Tianjia Zhang <77389867@qq.com>
> ---
>  tests/test-rcu-list.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-rcu-list.c b/tests/test-rcu-list.c
> index 6f076473e0..c0fc47ded4 100644
> --- a/tests/test-rcu-list.c
> +++ b/tests/test-rcu-list.c
> @@ -219,7 +219,7 @@ static void *rcu_q_updater(void *arg)
>              j++;
>              if (target_el == j) {
>                  struct list_element *new_el = g_new(struct list_element, 1);
> -                n_nodes += n_nodes_local;
> +                n_nodes_local++;
>                  TEST_LIST_INSERT_AFTER_RCU(el, new_el, entry);
>                  break;
>              }

