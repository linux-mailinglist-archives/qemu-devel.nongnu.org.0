Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D5415BCC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:12:43 +0200 (CEST)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLiY-00068r-NC
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTLgM-0004fG-5C
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTLgH-0004SC-HL
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632391814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RvknkaKGPZrIPYayE4xKZC7lPYGteXx3OOQyBotk5QI=;
 b=ajgqS4EhOtLetnrX0M8lAn/xTdcKZf7+ZPJDm9h21hGCLP7c7lPI6wMKNw7m1xn94q/6fr
 vyVeyhzvG7bEGd4vbJglMhG+UhMtOTaJ8LQ+XNexA6linv7yRyeLlECHqwVhE2RieOk+Wo
 rAREH9V3FC3E1vuAe2+0358GAvJISJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-0whRvP9eNJ62jKl5WkjYFw-1; Thu, 23 Sep 2021 06:10:12 -0400
X-MC-Unique: 0whRvP9eNJ62jKl5WkjYFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40991005E65;
 Thu, 23 Sep 2021 10:10:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEF9C60BF4;
 Thu, 23 Sep 2021 10:09:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45675113865F; Thu, 23 Sep 2021 12:09:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 8/8] qapi: add blockdev-replace command
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-9-vsementsov@virtuozzo.com>
 <87ilyv4ugk.fsf@dusky.pond.sub.org>
 <08aab083-a8c3-a026-70cb-ac65d378515b@virtuozzo.com>
Date: Thu, 23 Sep 2021 12:09:45 +0200
In-Reply-To: <08aab083-a8c3-a026-70cb-ac65d378515b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 20 Sep 2021 13:02:45 +0300")
Message-ID: <87lf3nfvrq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 dim@virtuozzo.com, igor@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Thanks a lot for reviewing!
>
> 20.09.2021 09:44, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> Add command that can add and remove filters.
>>>
>>> Key points of functionality:
>>>
>>> What the command does is simply replace some BdrvChild.bs by some other
>>> nodes. The tricky thing is selecting there BdrvChild objects.
>>> To be able to select any kind of BdrvChild we use a generic parent_id,
>>> which may be a node-name, or qdev id or block export id. In future we
>>> may support block jobs.
>>>
>>> Any kind of ambiguity leads to error. If we have both device named
>>> device0 and block export named device0 and they both point to same BDS,
>>> user can't replace root child of one of these parents. So, to be able
>>> to do replacements, user should avoid duplicating names in different
>>> parent namespaces.
>>>
>>> So, command allows to replace any single child in the graph.
>>>
>>> On the other hand we want to realize a kind of bdrv_replace_node(),
>>> which works well when we want to replace all parents of some node. For
>>> this kind of task @parents-mode argument implemented.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
>>>   block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 160 insertions(+)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 675d8265eb..8059b96341 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -5433,3 +5433,81 @@
>>>   { 'command': 'blockdev-snapshot-delete-internal-sync',
>>>     'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
>>>     'returns': 'SnapshotInfo' }
>>> +
>>> +##
>>> +# @BlockdevReplaceParentsMode:
>>> +#
>>> +# Alternative (to directly set @parent) way to chose parents in
>>> +# @blockdev-replace
>>> +#
>>> +# @exactly-one: Exactly one parent should match a condition, otherwise
>>> +#               @blockdev-replace fails.
>>> +#
>>> +# @all: All matching parents are taken into account. If replacing lead
>>> +#       to loops in block graph, @blockdev-replace fails.
>>> +#
>>> +# @auto: Same as @all, but automatically skip replacing parents if it
>>> +#        leads to loops in block graph.
>>> +#
>>> +# Since: 6.2
>>> +##
>>> +{ 'enum': 'BlockdevReplaceParentsMode',
>>> +  'data': ['exactly-one', 'all', 'auto'] }
>>> +
>>> +##
>>> +# @BlockdevReplace:
>>> +#
>>> +# Declaration of one replacement.
>> 
>> Replacement of what?  A node in the block graph?
>
> A specific child node in one or in several edges

Spell that out in the doc comment, please.

>> 
>>> +#
>>> +# @parent: id of parent. It may be qdev or block export or simple
>>> +#          node-name.
>> 
>> It may also be a QOM path, because find_device_state() interprets
>> arguments starting with '/' as QOM paths.
>> 
>> When is a node name "simple"?
>> 
>> Suggest: It may be a qdev ID, a QOM path, a block export ID, or a node
>> name.
>
> OK
>
>> 
>> The trouble is of course that we're merging three separate name spaces.
>
> Yes. Alternatively we can also add an enum of node-type [bds, device, export[, job]], and select graph nodes more explicit (by pair of id/path/name and type)
>
> But if we have to use these things in one context, it seems good to enforce users use different names for them. And in this way, we can avoid strict typing.

Is there precedence in QMP for merging ID name spaces, or for selecting
a name space?

>> Aside: a single name space for IDs would be so much saner, but we
>> screwed that up long ago.

Throwing some of the multiple name spaces together some of the time
feels like another mistake.

>> 
>>>                         If id is ambiguous (for example node-name of
>>> +#          some BDS equals to block export name), blockdev-replace
>>> +#          fails.
>> 
>> Is there a way out of this situation, or are is replacement simply
>> impossible then?
>
> In my idea, it's simply impossible. If someone want to use this new interface, he should care to use different names for different things.

Reminds me of device_del, which simply could not delete a device without
an ID.  Made many users go "oh" (or possibly a more colorful version
thereof), until daniel fixed it in commit 6287d827d4 "monitor: allow
device_del to accept QOM paths" for v2.5.

>> 
>>>                     If not specified, blockdev-replace goes through
>>> +#          @parents-mode scenario, see below. Note, that @parent and
>>> +#          @parents-mode can't be specified simultaneously.
>> 
>> What if neither is specified?  Hmm, @parents-mode has a default, so
>> that's what we get.
>> 
>>> +#          If @parent is specified, only one edge is selected. If
>>> +#          several edges match the condition, blockdev-replace fails.
>>> +#
>>> +# @edge: name of the child. If omitted, any child name matches.
>>> +#
>>> +# @child: node-name of the child. If omitted, any child matches.
>>> +#         Must be present if @parent is not specified.
>> 
>> Is @child useful when @parent is present?
>
> You may specify @child and @parent, to replace child in specific edge. Or @parent and @edge. Or all three fields: just to be strict.
>
>> 
>> What's the difference between "name of the child" and "node name of the
>> child"?
>
> Although we have to deal with different kinds of nodes (BDS, exports, blks, ...),
> children are always BDS.
>
> But, may be in the context, it's better say "id of the child".

I'm confused about the difference between "@edge: name of the child",
and "@child: node-name of the child".

>> 
>>> +#
>>> +# @parents-mode: declares how to select edge (or edges) when @parent
>>> +#                is omitted. Default is 'one'.
>> 
>> 'exactly-one'
>> 
>> Minor combinatorial explosion.  There are four optional arguments, one
>> of them an enum, and only some combination of argument presence and enum
>> value are valid.  For a serious review, I'd have to make a table of
>> combinations, then think through every valid row.
>> 
>> Have you considered making this type a union?  Can turn some of your
>> semantic constraints into syntactical ones.  Say you turn
>> BlockdevReplaceParentsMode into a tag enum by adding value 'by-id'.
>> Then branch 'by-id' has member @parent, and the others don't.
>
>
> OK. Now, after some time passed, I see that some additional clarifications are needed. Even for me :)

Sounds familiar :)

> So, the actual modes I have in mind:
>
> 1. Replacement for backup: we want to inject copy-before-write filter F above some node X, so that all parents of node X start to access X through filter F. But we want automatically skip parents if modifications leads to loops in the graph (so, we can first carete node F with X as a child, than do replacement, and don't replace child of F by F :).
>
> That's  parents-mode=auto & parent=None & edge=None & child=X
>
> 2. Replacement of any specific edge in the graph.
>
> Edge may be specified in different ways: by parent, by child, by edge, and by some combinations of these things. It seems reasonable to allow any combination, if it specifies exactly one field.. Assume we have A -- backing --> B relation in the graph, and want to replace B by filter F in that relation.

An edge always goes from a source node (a.k.a. parent) to a target node
(a.k.a. child).

Each edge from a source node has a unique name in the source node, such
as "backing".

Correct?

The obvious way to identify an edge is (source node name, edge name).

Throwing in the target name is redundant.  Observation, not criticism.

All other ways can be ambigous:

    (source node name, target node name), because multiple edges can
    connect the two.

    (edge name, target node name), because multiple source nodes can use
    the same edge name to connect to the target node.

    ...

Even ways that can be ambigous need not be in a specific graph:

    Just source node name suffices when there is only one edge leaving
    it.

    Even just edge name can theoretically suffice.

    ...

Do we really *need* this much flexibility?  Why can't we simply require
(source node name, edge name), and call it a day?

> 2.1 Specify parent:
>
> We may specify all information bits, to be sure that we do what we want and for high probability to fail if we have wrong impression about what's going on in the graph:
>
> parents-mode=None & parent=A & edge=backing & child=B
>
> We can omit edge:
>
> parents-mode=None & parent=A & edge=None & child=B
>
>   - that should fail as ambiguous if B is "double child" of A, with two edges from A to B. But I think, that's unused combination for now)
>
> Or we can omit child
>
> parents-mode=None & parent=A & edge=backing & child=None
>
>   - that should work well, as node shouldn't have more than one backing child.
>
> and we can omit both edge and child:
>
> parents-mode=None & parent=A & edge=None & child=None
>
>   - that will work only if A has exactly one child and fails otherwise. So, that's bad for format nodes but good for filters and for block devices.
>
> 2.2 Don't specify parent but specify child:
>
> parents-mode=exactly-one & parent=None & edge=backing & child=B
>
>   - works if B has only one parent with B as backing child
>
> parents-mode=exactly-one & parent=None & edge=None & child=B
>
>   - works if B has only one parent
>
> ======================
>
> Now, what's more?
>
> parents-mode=auto & parent=None & edge=root & child=X
>
> - replace only child only for root parents of X  -  may make sense
>
>
> And all other combinations are
>
> parents-mode=ANY & parent=None & edge=ANY & child=None
>
>   - don't specify neither parent nor child. That works bad with any mode.. Theoretically, we still can support it by looking through the whole graph. If edge=backing and we only only one backing edge in the whole graph we can serve the request.. But we can simply fail and not care.
>
> =====================
>
> What's bad, is that 2.1 and 2.2 are not symmetrical. So, right, it seems better to turn it into union:
>
> 1. mode = auto
>
> Replace child in all it's parents where edge match to @edge and avoiding creating loops in the graph
>
> child: required, specify child
> edge: optional, if specified, do replacement only in such edges

This is almost the same as a transaction of one-edge replacements for
all parents, optionally filtered by @edge.

They differ when the parents can change spontaneously.  The transaction
then might be for a stale set of parents.  Can this happen?

The other difference is of course that having to enumerate the edges
could be bothersome.  Some amount of bother is okay.  QMP provides basic
building blocks.  When we try to provide more, we tend to fail.

> 2. mode = one-edge
>
> Replace child in exactly one edge. If more than one edge matches - re[ace nothing and fail.
>
> parent: optional
> edge: optional
> child: optional
>
>   - all fields optional, but user is responsible to not be ambiguous. Still, we can enforce that at least one of @parent and @child should be specified.

Do we really need this much flexibility in edge selection?

>
>> 
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +# Examples:
>>> +#
>>> +# 1. Change root node of some device.
>>> +#
>>> +# Note, that @edge name is omitted, as
>> 
>> Scratch "name".
>> 
>> Odd line break.
>> 
>>> +# devices always has only one child. As well, no need in specifying
>>> +# old @child.
>> 
>> "the old @child".
>> 
>>> +#
>>> +# -> { "parent": "device0", "new-child": "some-node-name" }
>>> +#
>>> +# 2. Insert copy-before-write filter.
>>> +#
>>> +# Assume, after blockdev-add we have block-node 'source', with several
>>> +# writing parents and one copy-before-write 'filter' parent. And we want
>>> +# to actually insert the filter. We do:
>>> +#
>>> +# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
>>> +#
>>> +# All parents of source would be switched to 'filter' node, except for
>>> +# 'filter' node itself (otherwise, it will make a loop in block-graph).
>> 
>> Good examples.  I think we need more, to give us an idea on the use
>> cases for the combinatorial explosion.  I need to know them to be able
>> to review the interface.
>> 
>>> +##
>>> +{ 'struct': 'BlockdevReplace',
>>> +  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
>>> +            '*parents-mode': 'BlockdevReplaceParentsMode',
>>> +            'new-child': 'str' } }
>>> +
>>> +##
>>> +# @blockdev-replace:
>>> +#
>>> +# Do one or several replacements transactionally.
>>> +##
>>> +{ 'command': 'blockdev-replace',
>>> +  'data': { 'replacements': ['BlockdevReplace'] } }
>> 
>> Ignorant question: integration with transaction.json makes no sense?
>
> Recently we allowed do several reopens in one blockdev-reopen. So, it's reasonable to behave same way in blockdev-replace.

I didn't see that going in.  I trust reopening multiple in one
transaction is useful, but commit 3908b7a899 fails to explain why.
Mistake; we should *insist* on capturing the "why" in the commit
message.

I dislike having multiple ways to do the same thing (here:
transactions).  If there are reasons why the transaction command cannot
be used, fine, provide another suitable interface.  But when the
existing interface serves, please don't reinvent it.

> Still, I think combination of different commands in a transaction make sense too. So, in my thought, transaction support for blockdev-* graph modification commands is a TODO.
>
>> 
>> [...]
>> 


