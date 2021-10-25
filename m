Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A85439643
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:23:45 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mez0z-0007VY-30
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1meyxC-0004Gc-EJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1meyx9-0000MV-Vf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635164387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=siDtBdDMKQxOIqXY1erg0DYx8V3vPp0tPCTFu8qUxHo=;
 b=BZgwxQRKkspSvbGEDOTpIBBArroA+KDgtwGayLL4vrr8y8mtwYn2NPcfaPAdL5KR+68Yom
 MaXsKMpkJXO6ndfRXrIglaI1rzXhy94jWixpwCQ3m3eI4IMIlCTYWbPdkl4p2RRoFQcVWK
 KmRVt/PgXmcKuko5o8JT6dB9gfJnuak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-KoF8WAwsPnmouTQ_rwokqA-1; Mon, 25 Oct 2021 08:19:43 -0400
X-MC-Unique: KoF8WAwsPnmouTQ_rwokqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CD2CC621
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:19:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E40219D9D;
 Mon, 25 Oct 2021 12:19:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 036C011380A7; Mon, 25 Oct 2021 14:19:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
Date: Mon, 25 Oct 2021 14:19:40 +0200
In-Reply-To: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 (Michal Privoznik's message of "Mon, 25 Oct 2021 13:08:05 +0200")
Message-ID: <87bl3dfg9v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michal Privoznik <mprivozn@redhat.com> writes:

> The -preconfig option and exit-preconfig command are around for
> quite some time now. However, they are still marked as unstable.
> This is suboptimal because it may block some upper layer in
> consuming it. In this specific case - Libvirt avoids using
> experimental features.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

If I remember correctly, the motivation for -preconfig was NUMA
configuration via QMP.  More uses may have appeared since.

Back then, I questioned the need for yet another option and yet another
state: why not -S?

The answer boiled down to

0. Yes, having just one would be a simpler and cleaner interface, but

1. the godawful mess QEMU startup has become makes -S unsuitable for
   some things we want to do, so we need -preconfig,

2. which is in turn unsuitable for other things we want to do, so we
   still need -S".

3. Cleaning up the mess to the point where "simpler and cleaner" becomes
   viable again is not in the cards right now.

Details in the sub-thread
    Message-ID: <87zi21apkh.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg02447.html

My conclusion was

    My gut's reaction to preconfig is as nauseous as ever.  It adds
    complexity we wouldn't want or need with sanely structured program
    startup.  It might still be the best we can do, and something we need to
    do.  You have to take on technical debt sometimes.  To know for sure
    this is the case here, we'd have to explore alternatives more seriously.
    Like repaying some of the existing technical debt around there.  Sadly,
    I lack the time to take on such a project.

    Since I lack the money to put where my mouth is, I'm going to shut up
    and get out of your way.

    Message-ID: <87tvqx12no.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05584.html

However, we made it experimental:

commit 361ac948a5c960ce7a093cec1744bff0d5af3dec
Author: Markus Armbruster <armbru@redhat.com>
Date:   Thu Jul 5 11:14:02 2018 +0200

    cli qmp: Mark --preconfig, exit-preconfig experimental
    
    Committing to the current --preconfig / exit-preconfig interface
    before it has seen any use is premature.  Mark both as experimental,
    the former in documentation, the latter by renaming it to
    x-exit-preconfig.
    
    See the previous commit for more detailed rationale.
    
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20180705091402.26244-3-armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Acked-by: Eduardo Habkost <ehabkost@redhat.com>
    Acked-by: Igor Mammedov <imammedo@redhat.com>
    [Straightforward conflict with commit 514337c142f resolved]

commit 1f214ee1b83afd10fd5e1b63f4ecc03f9a8115c4
Author: Markus Armbruster <armbru@redhat.com>
Date:   Thu Jul 5 11:14:01 2018 +0200

    qapi: Do not expose "allow-preconfig" in query-qmp-schema
    
    According to commit 047f7038f58, option --preconfig
    
        [...] allows pausing QEMU in the new RUN_STATE_PRECONFIG state,
        allowing the configuration of QEMU from QMP before the machine
        jumps into board initialization code of machine_run_board_init()
    
        The intent is to allow management to query machine state and
        additionally configure it using previous query results within one
        QEMU instance (i.e. eliminate the need to start QEMU twice, 1st to
        query board specific parameters and 2nd for actual VM start using
        query results for additional parameters).
    
    The implementation is a bit of a hack: it splices in an additional
    main loop before machine creation, in special runstate preconfig.  New
    command exit-preconfig exits that main loop.  QEMU continues
    initializing, creates the machine, and runs the good old main loop.
    The replacement of the main loop is transparent to monitors.
    
    Sadly, some commands expect initialization to be complete.  Running
    them in --preconfig's main loop violates their preconditions.  Since
    we don't really know which commands are safe, we use a whitelist.
    This drags the concept of run state into the QMP core.
    
    The whitelist is done as a command flag in the QAPI schema (commit
    d6fe3d02e9a).  Drags the concept of run state further into the QAPI
    language.
    
    The command flag is exposed in query-qmp-schema (also commit
    d6fe3d02e9a).  This makes it ABI.
    
    I consider the whole thing an offensively ugly hack, but sometimes an
    ugly hack is the best we can do to solve a problem people have.
    
    The need described by the commit message quote above is genuine.  The
    proper solution would be a main loop that permits complete
    configuration via QMP.  This is out of reach, thus the hack.
    
    However, even though the need is genuine, it isn't urgent: libvirt is
    not going to use this anytime soon.  Baking a hack into ABI before it
    has any users is a bad idea.
    
    This commit reverts the parts of commit d6fe3d02e9a that affect ABI
    via query-qmp-schema.  The commit did the following:
    
    (1) Add command flag 'allow-preconfig' to the QAPI schema language
    
    (2) Pass it to code generators
    
    (3) Have the commands.py code generator pass it to the command
        registry (so commit 047f7038f58 can use it as whitelist)
    
    (4) Add 'allow-preconfig' to SchemaInfoCommand (neglecting to update
        qapi-code-gen.txt section "Client JSON Protocol introspection")
    
    (5) Set 'allow-preconfig': true for commands qmp_capabilities,
        query-commands, query-command-line-options, query-status
    
    Revert exactly (4), plus a bit of documentation added to
    qemu-tech.info in commit 047f7038f58.
    
    Shrinks query-qmp-schema's output from 126.5KiB to 121.8KiB for me.
    
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20180705091402.26244-2-armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Acked-by: Eduardo Habkost <ehabkost@redhat.com>
    Acked-by: Igor Mammedov <imammedo@redhat.com>
    [Straightforward conflict with commit d626b6c1ae7 resolved]

Before we make it a stable interface, we should ponder:

* Is cleaning up the mess to the point where "simpler and cleaner"
  becomes viable again still impractical?

* If yes, what are the chances of it becoming practical?


