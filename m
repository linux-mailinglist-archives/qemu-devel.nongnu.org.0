Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13ED6A553F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWw2J-0008QE-G8; Tue, 28 Feb 2023 04:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWw2F-0008Pe-Ll
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWw2D-0006xs-Gh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677575552;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKCQf4S95USPNTjk2Op394RCcv0X/TUXD9vbWIAq7b0=;
 b=GUZbDnkWdGB3W063hKKdAktIGRJatwFewOtVIQeJ/4WfkE1fTCo7FayynekNUXF53B3nU4
 GogFHDmdqCt9QgfSbquOY5+GlwON1bj5ckM/sbcg69ZejURwGb2+d+Id0UnmJERz5NG9+6
 9x5IXOKh5ZehrIzwCAYNik7lRTveyX0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-hf8VfQsMMEetnPz_bhUh0A-1; Tue, 28 Feb 2023 04:12:29 -0500
X-MC-Unique: hf8VfQsMMEetnPz_bhUh0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C32101A52E;
 Tue, 28 Feb 2023 09:12:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 903A0C15BAD;
 Tue, 28 Feb 2023 09:12:26 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:12:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, dgilbert@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, rjones@redhat.com,
 marcandre.lureau@redhat.com, armbru@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v3] test-vmstate: fix bad GTree usage, use-after-free
Message-ID: <Y/3FeKPQYJzVl/uH@redhat.com>
References: <20230228090352.339466-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228090352.339466-1-eric.auger@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 10:03:52AM +0100, Eric Auger wrote:
> According to g_tree_foreach() documentation:
> "The tree may not be modified while iterating over it (you can't
> add/remove items)."
> 
> Since glib2 has removed its custom slice allocator and has switched
> to using system malloc, a SIGSEGV can be observed while running
> test-vmstate. With glibc + MALLOC_PERTURB_, malloc is able to detect
> this kind of bugs. The relevant glib2 change that causes the problem
> is:

IMHO this somewhat reads like we're blaming glib2 for a causing
a bug in our own code. Can we change that paragraph to something
more like

  By missing the requirement to not modify the tree, the QEMU
  test case has been using memory after it was freed. Historically
  GLib2 used a slice allocator for the GTree APIs which did not
  immediately release the memory back to the system allocator.
  As a result QEMU's use-after-free bug was not visible. With
  GLib > 2.75.3, the slice allocator has been removed, such that
  all allocations/frees are directly handled by the system
  allocator, exposing the problematic iteration code.

> https://gitlab.gnome.org/GNOME/glib/-/commit/45b5a6c1e56d5b73cc5ed798ef59a5601e56c170
> 
> Get rid of the node removal within the tree traversal. Also
> check the trees have the same number of nodes before the actual
> diff.
> 
> Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1518
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Tested-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - Enhance the commit message with Rich's explanations
> 
> v1 -> v2:
> - respin of Marc-André's patch from Aug 2020, which can be
> found at
> https://lore.kernel.org/qemu-devel/20200827161826.1165971-1-marcandre.lureau@redhat.com/
> This fell through the cracks and now we hit a SIGSEGV
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


