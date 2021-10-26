Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3343ADB7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:59:07 +0200 (CEST)
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHMQ-0001nU-CZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfHJf-0006eo-D2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfHJc-0001Sr-AA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635234970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=neT8NWZw9UcUieYnaV4NuX+nMHH+7zWs4PfZiHnwXuQ=;
 b=GexWqrts7HTLlP1Ls/yU7o8XTm78oBGVpMeMQ5jgI7lkVAXMCznI/EYG00pWjMxlwgp+nW
 m5Q4NONcOv9Of/fkp2aHVWta1IWqXnJca6rmQdt8xFpz6AN18b5C49soSy6e0dLNLTDEVI
 RV7wvjyxmIFmP0TOLTUCzwJ41yir90I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-aCW584thMoea16OBb-sYXA-1; Tue, 26 Oct 2021 03:56:09 -0400
X-MC-Unique: aCW584thMoea16OBb-sYXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9601680A5C0;
 Tue, 26 Oct 2021 07:56:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6DF5DD68;
 Tue, 26 Oct 2021 07:56:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF9A611380A7; Tue, 26 Oct 2021 09:56:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
 <CAFn=p-bkEhAMknmKm_242Yb6RkDyhjuPtWxmQUEfsexgx9PHaw@mail.gmail.com>
Date: Tue, 26 Oct 2021 09:56:06 +0200
In-Reply-To: <CAFn=p-bkEhAMknmKm_242Yb6RkDyhjuPtWxmQUEfsexgx9PHaw@mail.gmail.com>
 (John Snow's message of "Mon, 25 Oct 2021 15:05:01 -0400")
Message-ID: <877de06wyx.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Add special feature 'unstable' everywhere the name starts with 'x-',
>> except for InputBarrierProperties member x-origin and
>> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
>> because these two are actually stable.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/block-core.json | 123 +++++++++++++++++++++++++++++++------------
>>  qapi/migration.json  |  35 +++++++++---
>>  qapi/misc.json       |   6 ++-
>>  qapi/qom.json        |  11 ++--
>>  4 files changed, 130 insertions(+), 45 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 6d3217abb6..ce2c1352cb 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -1438,6 +1438,9 @@
>>  #
>>  # @x-perf: Performance options. (Since 6.0)
>>  #
>> +# Features:
>> +# @unstable: Member @x-perf is experimental.
>> +#
>>
>
> It'd be a lot cooler if we could annotate the unstable member directly
> instead of confusing it with the syntax that might describe the entire
> struct/union/command/etc, but ... eh, it's just a doc field, so I'm not
> gonna press on this. I don't have the energy to get into a doc formatting
> standard discussion right now, so: sure, why not?

By design, we have a single doc comment block for the entire definition.

When Kevin invented feature flags (merge commit 4747524f9f2), he added
them just to struct types.  He added "feature sections" for documenting
features.  It mirrors the "argument sections" for documenting members.
Makes sense.

Aside: he neglected to update qapi-code-gen.rst section "Definition
documentation", and I failed to catch it.  I'll make up for it.

Peter and I then added feature flags to the remaining definitions
(commit 23394b4c39 and 013b4efc9b).  Feature sections make sense there,
too.

I then added them to struct members (commit 84ab008687).  Instead of
doing something fancy for documenting feature flags of members, I simply
used the existing feature sections.  This conflates member features with
struct features.

What could "something fancy" be?  All we have for members is "argument
sections", which are basically a name plus descriptive text.  We'd have
to add structure to that, say nest feature sections into argument
sections.  I have no appetite for that right now.

>
>
>>  # Note: @on-source-error and @on-target-error only affect background
>>  #       I/O.  If an error occurs during a guest write request, the
>> device's
>>  #       rerror/werror actions will be used.
>> @@ -1452,7 +1455,9 @@
>>              '*on-source-error': 'BlockdevOnError',
>>              '*on-target-error': 'BlockdevOnError',
>>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
>> -            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
>> +            '*filter-node-name': 'str',
>> +            '*x-perf': { 'type': 'BackupPerf',
>> +                         'features': [ 'unstable' ] } } }
>>
>>  ##
>>  # @DriveBackup:

[...]

> Seems OK, but I didn't audit for false positives/negatives. Trusting your
> judgment here. (It looks like Phil started to audit this in his reply to
> your previous commit, so I'll trust that.)

I'm pretty sure the x- names that don't get feature 'unstable' are
actually stable; see my reply to Kashyap.

I did check git history for each that does get feature 'unstable'.
Double-checking is of course welcome.

> Acked-by: John Snow <jsnow@redhat.com>

Thanks!


