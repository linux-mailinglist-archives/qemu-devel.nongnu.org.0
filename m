Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2C2555B9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 09:53:20 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBZCJ-0006oF-DV
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 03:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kBZBR-0006Nl-LW
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 03:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kBZBP-0001Rj-7a
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 03:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598601142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaVJlFJEz4ZKDNkZqdXS2lb0nYvsI8FxISetHofEOSE=;
 b=AIdHVHwyJwMV5fK+NvAyk+srD/mtzu2bD0/chEww1Y+gGDgDg/0itJMBsXvsAvGwB9s4mc
 cMpiRlgrvZJVcOCrTT7FH/aOveoBKQvUFrTp9EP5247E6Try5DH+atrYwV0lnSwbz29eA8
 VCCDeXWP7bno5SuxdJMHDDzvV/P9WbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-5lYkR7JUNIm0Y0ERcWCKjg-1; Fri, 28 Aug 2020 03:52:19 -0400
X-MC-Unique: 5lYkR7JUNIm0Y0ERcWCKjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C16E856BE7;
 Fri, 28 Aug 2020 07:52:18 +0000 (UTC)
Received: from [10.36.112.112] (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D80FC5C1C7;
 Fri, 28 Aug 2020 07:52:17 +0000 (UTC)
Subject: Re: [PATCH] test-vmstate: fix bad GTree usage, use-after-free
From: Auger Eric <eric.auger@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20200827161826.1165971-1-marcandre.lureau@redhat.com>
 <c52960c3-d88c-010d-584a-75917bc9b702@redhat.com>
 <CAJ+F1C+f+giaG4ZekLKes0-E64cE+0CX=AMVpNB-qfUMz-vQuw@mail.gmail.com>
 <ea2abc3b-653d-1d0a-61b9-bae337ded638@redhat.com>
Message-ID: <fe899e45-0e50-affd-a63d-f0a5a982a521@redhat.com>
Date: Fri, 28 Aug 2020 09:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ea2abc3b-653d-1d0a-61b9-bae337ded638@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 02:09:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.782, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,

On 8/28/20 9:19 AM, Auger Eric wrote:
> Hi Marc-André,
> 
> On 8/27/20 8:35 PM, Marc-André Lureau wrote:
>> Hi
>>
>> On Thu, Aug 27, 2020 at 8:34 PM Auger Eric <eric.auger@redhat.com
>> <mailto:eric.auger@redhat.com>> wrote:
>>
>>     Hi Marc-Andre
>>
>>     On 8/27/20 6:18 PM, marcandre.lureau@redhat.com
>>     <mailto:marcandre.lureau@redhat.com> wrote:
>>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>>     <mailto:marcandre.lureau@redhat.com>>
>>     >
>>     > According to g_tree_foreach() documentation:
>>     > "The tree may not be modified while iterating over it (you can't
>>     > add/remove items)."
>>
>>     Hum I did not see that.
>>     >
>>     > Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
>>     > Cc: Eric Auger <eric.auger@redhat.com <mailto:eric.auger@redhat.com>>
>>     > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com
>>     <mailto:marcandre.lureau@redhat.com>>
>>     > ---
>>     >  tests/test-vmstate.c | 3 +--
>>     >  1 file changed, 1 insertion(+), 2 deletions(-)
>>     >
>>     > diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
>>     > index f7b3868881..31aefa78f0 100644
>>     > --- a/tests/test-vmstate.c
>>     > +++ b/tests/test-vmstate.c
>>     > @@ -1078,7 +1078,6 @@ static gboolean diff_tree(gpointer key,
>>     gpointer value, gpointer data)
>>     >      struct match_node_data d = {tp->tree2, key, value};
>>     > 
>>     >      g_tree_foreach(tp->tree2, tp->match_node, &d);
>>     > -    g_tree_remove(tp->tree1, key);
>>     it does not test the same thing I am afraid. If one of the trees
>>     contains more elements than the others this won't be detected.
>>
>>
>> -    assert(g_tree_nnodes(tree1) == 0);
>>
>> Was simply checking that all nodes from tree1 were deleted.
>>
>> Whatever else must have been checked elsewhere or differently by new code.
> compare_trees() iterates on tree1 and tries to find a fellow node in
> tree2 for each node in tree1. At least we need to check that the number
> of nodes is the same in both trees otherwise tree2 can have more nodes
> than tree1 and with the change this won't be detected.

Actually since we remove the nodes in tree2 when we find them,
assert(g_tree_nnodes(tree2) == 0) would detect if we have more nodes in
tree2 than in tree1.

On the opposite, if we have more nodes in tree1 than in tree2 the
original code failed to detect that case, - my fault -.
checking
assert(g_tree_nnodes(tree1) == g_tree_nnodes(tree2));
would fix the original algo I think.

Thanks

Eric

>>  
>>
>>     Also there is another case of removal inside the traversal in the
>>     match_node(): in match_interval_mapping_node() and match_domain_node()
>>
>>
>> Yes, but they don't update the traversed tree.
> Hum yes, you mean we exit the loop by returning true in the match
> function so that's OK.
> 
> So your modif + replacing
>     g_tree_foreach(tree1, diff_tree, &tp);
>     assert(g_tree_nnodes(tree1) == 0);
>     assert(g_tree_nnodes(tree2) == 0);
> 
> by
> 
> assert(g_tree_nnodes(tree1) == g_tree_nnodes(tree2));
> g_tree_foreach(tree1, diff_tree, &tp);

> 
> should do the job, no?


> 
> Thanks
> 
> Eric
> 
> 
>>
>>     Thanks
>>
>>     Eric
>>
>>
>>     >      return false;
>>     >  }
>>     > 
>>     > @@ -1088,7 +1087,7 @@ static void compare_trees(GTree *tree1,
>>     GTree *tree2,
>>     >      struct tree_cmp_data tp = {tree1, tree2, function};
>>     > 
>>     >      g_tree_foreach(tree1, diff_tree, &tp);
>>     > -    assert(g_tree_nnodes(tree1) == 0);> +   
>>     g_tree_destroy(g_tree_ref(tree1));
>>     >      assert(g_tree_nnodes(tree2) == 0);
>>     >  }
>>     > 
>>     >
>>
>>
>>
>>
>> -- 
>> Marc-André Lureau


