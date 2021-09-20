Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7A410F9E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:47:59 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD5q-0000T7-Kb
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSD2m-0007LK-EN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSD2j-0007NY-UU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632120285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfRJ/5mZEt2oRiGiVb1lzErPAv38SsO3jaVAxYucYSQ=;
 b=ENMAbR0cnIPl3A0I2856i6Ckh9qJKqISTwT1aklR5zpQfkOAzkZj9djmmjWMwJUqNiz2M/
 /ADbjKz1a48tHAN/QXiXCzfB/UcWW0NiBZfPSk+e9qksGFMUHg+ijM6LDSsYDIy+qR9AVU
 eNUn4USG7KX93/Xnzd+h+L4mYzTYkFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-4viaSuiWMpSuiON4sycqcg-1; Mon, 20 Sep 2021 02:44:43 -0400
X-MC-Unique: 4viaSuiWMpSuiON4sycqcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1E6802C94;
 Mon, 20 Sep 2021 06:44:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78CB05D9D5;
 Mon, 20 Sep 2021 06:44:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0252C113865F; Mon, 20 Sep 2021 08:44:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 8/8] qapi: add blockdev-replace command
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-9-vsementsov@virtuozzo.com>
Date: Mon, 20 Sep 2021 08:44:27 +0200
In-Reply-To: <20210802185416.50877-9-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 2 Aug 2021 21:54:16 +0300")
Message-ID: <87ilyv4ugk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 dim@virtuozzo.com, igor@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add command that can add and remove filters.
>
> Key points of functionality:
>
> What the command does is simply replace some BdrvChild.bs by some other
> nodes. The tricky thing is selecting there BdrvChild objects.
> To be able to select any kind of BdrvChild we use a generic parent_id,
> which may be a node-name, or qdev id or block export id. In future we
> may support block jobs.
>
> Any kind of ambiguity leads to error. If we have both device named
> device0 and block export named device0 and they both point to same BDS,
> user can't replace root child of one of these parents. So, to be able
> to do replacements, user should avoid duplicating names in different
> parent namespaces.
>
> So, command allows to replace any single child in the graph.
>
> On the other hand we want to realize a kind of bdrv_replace_node(),
> which works well when we want to replace all parents of some node. For
> this kind of task @parents-mode argument implemented.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
>  block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 160 insertions(+)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 675d8265eb..8059b96341 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5433,3 +5433,81 @@
>  { 'command': 'blockdev-snapshot-delete-internal-sync',
>    'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
>    'returns': 'SnapshotInfo' }
> +
> +##
> +# @BlockdevReplaceParentsMode:
> +#
> +# Alternative (to directly set @parent) way to chose parents in
> +# @blockdev-replace
> +#
> +# @exactly-one: Exactly one parent should match a condition, otherwise
> +#               @blockdev-replace fails.
> +#
> +# @all: All matching parents are taken into account. If replacing lead
> +#       to loops in block graph, @blockdev-replace fails.
> +#
> +# @auto: Same as @all, but automatically skip replacing parents if it
> +#        leads to loops in block graph.
> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'BlockdevReplaceParentsMode',
> +  'data': ['exactly-one', 'all', 'auto'] }
> +
> +##
> +# @BlockdevReplace:
> +#
> +# Declaration of one replacement.

Replacement of what?  A node in the block graph?

> +#
> +# @parent: id of parent. It may be qdev or block export or simple
> +#          node-name.

It may also be a QOM path, because find_device_state() interprets
arguments starting with '/' as QOM paths.

When is a node name "simple"?

Suggest: It may be a qdev ID, a QOM path, a block export ID, or a node
name.

The trouble is of course that we're merging three separate name spaces.

Aside: a single name space for IDs would be so much saner, but we
screwed that up long ago.

>                        If id is ambiguous (for example node-name of
> +#          some BDS equals to block export name), blockdev-replace
> +#          fails.

Is there a way out of this situation, or are is replacement simply
impossible then?

>                    If not specified, blockdev-replace goes through
> +#          @parents-mode scenario, see below. Note, that @parent and
> +#          @parents-mode can't be specified simultaneously.

What if neither is specified?  Hmm, @parents-mode has a default, so
that's what we get.

> +#          If @parent is specified, only one edge is selected. If
> +#          several edges match the condition, blockdev-replace fails.
> +#
> +# @edge: name of the child. If omitted, any child name matches.
> +#
> +# @child: node-name of the child. If omitted, any child matches.
> +#         Must be present if @parent is not specified.

Is @child useful when @parent is present?

What's the difference between "name of the child" and "node name of the
child"?

> +#
> +# @parents-mode: declares how to select edge (or edges) when @parent
> +#                is omitted. Default is 'one'.

'exactly-one'

Minor combinatorial explosion.  There are four optional arguments, one
of them an enum, and only some combination of argument presence and enum
value are valid.  For a serious review, I'd have to make a table of
combinations, then think through every valid row.

Have you considered making this type a union?  Can turn some of your
semantic constraints into syntactical ones.  Say you turn
BlockdevReplaceParentsMode into a tag enum by adding value 'by-id'.
Then branch 'by-id' has member @parent, and the others don't.

> +#
> +# Since: 6.2
> +#
> +# Examples:
> +#
> +# 1. Change root node of some device.
> +#
> +# Note, that @edge name is omitted, as

Scratch "name".

Odd line break.

> +# devices always has only one child. As well, no need in specifying
> +# old @child.

"the old @child".

> +#
> +# -> { "parent": "device0", "new-child": "some-node-name" }
> +#
> +# 2. Insert copy-before-write filter.
> +#
> +# Assume, after blockdev-add we have block-node 'source', with several
> +# writing parents and one copy-before-write 'filter' parent. And we want
> +# to actually insert the filter. We do:
> +#
> +# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
> +#
> +# All parents of source would be switched to 'filter' node, except for
> +# 'filter' node itself (otherwise, it will make a loop in block-graph).

Good examples.  I think we need more, to give us an idea on the use
cases for the combinatorial explosion.  I need to know them to be able
to review the interface.

> +##
> +{ 'struct': 'BlockdevReplace',
> +  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
> +            '*parents-mode': 'BlockdevReplaceParentsMode',
> +            'new-child': 'str' } }
> +
> +##
> +# @blockdev-replace:
> +#
> +# Do one or several replacements transactionally.
> +##
> +{ 'command': 'blockdev-replace',
> +  'data': { 'replacements': ['BlockdevReplace'] } }

Ignorant question: integration with transaction.json makes no sense?

[...]


