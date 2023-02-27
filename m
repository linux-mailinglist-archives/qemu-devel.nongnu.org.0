Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1DA6A49FB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 19:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWiPV-0000sw-PJ; Mon, 27 Feb 2023 13:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pWiPS-0000sT-7S
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pWiPQ-0005al-3o
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677523175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS37rkq8Z21V0By5n2GoPxi0uAF4vuuBwanfTYY6RSw=;
 b=Ka+YeyAq5LdG4SxrHZUzXmt7o+vNkqHEf/qaB7QaVVbylORYkvCaGGnmUUyTnelQGj+lm1
 tyHroTgw/5DasY23snWsOvDg8XfDgfPjlsC2taBXnOu62y0txo+hPe76P7wMKxGXQGFOvC
 DCXi27CoEglqMEKikk6YMzZ4LkYrsr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-ZA-UFSGcMH6Q0L3lIXPeIw-1; Mon, 27 Feb 2023 13:39:31 -0500
X-MC-Unique: ZA-UFSGcMH6Q0L3lIXPeIw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9CA811E6E;
 Mon, 27 Feb 2023 18:39:31 +0000 (UTC)
Received: from localhost (unknown [10.45.224.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D59492B0E;
 Mon, 27 Feb 2023 18:39:30 +0000 (UTC)
Date: Mon, 27 Feb 2023 18:39:30 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, dgilbert@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 armbru@redhat.com, philmd@linaro.org, berrange@redhat.com
Subject: Re: [PATCH v2] test-vmstate: fix bad GTree usage, use-after-free
Message-ID: <20230227183930.GL7636@redhat.com>
References: <20230227183505.280368-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227183505.280368-1-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 27, 2023 at 07:35:05PM +0100, Eric Auger wrote:
> According to g_tree_foreach() documentation:
> "The tree may not be modified while iterating over it (you can't
> add/remove items)."

It might be worth noting that this bug only happens now because glib2
remove their custom slice allocator and switched to using system
malloc.  With glibc + MALLOC_PERTURB_, malloc will find these kinds of
bugs.  The relevant glib2 change that causes the problem is:

https://gitlab.gnome.org/GNOME/glib/-/commit/45b5a6c1e56d5b73cc5ed798ef59a5601e56c170

> A SIGSEV can be observed while running test-vmstate.

SIGSEGV

> Get rid of the node removal within the tree traversal. Also
> check the trees have the same number of nodes before the actual
> diff.
> 
> Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1518
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>

You can add:

Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

> ---
> 
> This is a respin of Marc-André's patch from Aug 2020, which can be
> found at
> https://lore.kernel.org/qemu-devel/20200827161826.1165971-1-marcandre.lureau@redhat.com/
> This fell through the cracks and now we hit a SIGSEV

SIGSEGV

> ---
>  tests/unit/test-vmstate.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
> index 79357b29ca..0b7d5ecd68 100644
> --- a/tests/unit/test-vmstate.c
> +++ b/tests/unit/test-vmstate.c
> @@ -1073,7 +1073,6 @@ static gboolean diff_tree(gpointer key, gpointer value, gpointer data)
>      struct match_node_data d = {tp->tree2, key, value};
>  
>      g_tree_foreach(tp->tree2, tp->match_node, &d);
> -    g_tree_remove(tp->tree1, key);
>      return false;
>  }
>  
> @@ -1082,9 +1081,9 @@ static void compare_trees(GTree *tree1, GTree *tree2,
>  {
>      struct tree_cmp_data tp = {tree1, tree2, function};
>  
> +    assert(g_tree_nnodes(tree1) == g_tree_nnodes(tree2));
>      g_tree_foreach(tree1, diff_tree, &tp);
> -    assert(g_tree_nnodes(tree1) == 0);
> -    assert(g_tree_nnodes(tree2) == 0);
> +    g_tree_destroy(g_tree_ref(tree1));
>  }
>  
>  static void diff_domain(TestGTreeDomain *d1, TestGTreeDomain *d2)
> -- 
> 2.38.1

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


