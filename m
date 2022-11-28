Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC863A5F6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbEC-0007bZ-TL; Mon, 28 Nov 2022 05:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozbE0-0007ZM-0v
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozbDy-0005NV-5X
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669630733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BuJzlxicLGjEZYfrD60HqHt+DohhaJrqIZUVzRG9rWg=;
 b=Q0VZ0kPuRY27VP7uqJIvHBUIqg6QZUFqvwQ0DBnBykL2NNbCxZbbCGmyxl8UMoq2TkWis2
 c/ACUd5iS3zeD8u2qIDFKplt+TPIEhhStlUC3FHl6pfnPwxGDjJSeNIbaguc3ffuf3QSkV
 Ove8Ov0gj4cFCg2ub/yYAAWwHK41LEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-s0BhOVxZNvSFsM87DUWpxw-1; Mon, 28 Nov 2022 05:18:52 -0500
X-MC-Unique: s0BhOVxZNvSFsM87DUWpxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16350185A7B0;
 Mon, 28 Nov 2022 10:18:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E76C340C6EC2;
 Mon, 28 Nov 2022 10:18:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C86ED21E6921; Mon, 28 Nov 2022 11:18:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: Fix some return statements in the synth backend
References: <166930551818.827792.10663674346122681963.stgit@bahia>
 <8735a3y1j9.fsf@pond.sub.org> <20221128103728.2001332c@bahia>
Date: Mon, 28 Nov 2022 11:18:48 +0100
In-Reply-To: <20221128103728.2001332c@bahia> (Greg Kurz's message of "Mon, 28
 Nov 2022 10:37:28 +0100")
Message-ID: <87a64bv0tz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Greg Kurz <groug@kaod.org> writes:

> On Mon, 28 Nov 2022 08:35:22 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Greg Kurz <groug@kaod.org> writes:
>> 
>> > The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
>> > currently return a positive errno value on failure. This causes
>> > checkpatch.pl to spit several errors like the one below:
>> >
>> > ERROR: return of an errno should typically be -ve (return -EAGAIN)
>> > #79: FILE: hw/9pfs/9p-synth.c:79:
>> > +        return EAGAIN;
>> >
>> > Simply change the sign. This has no consequence since callers
>> > assert() the returned value to be equal to 0.
>> 
>> Out of curiosity: why is assert() appropriate?
>> 
>
> Most of the code base comes from the original synth backend which
> was designed to expose QEMU internals to the guest using 9p. The
> hope of the virtio-9p authors was that each QEMU subsystem would
> create its own tree using these two functions (note that they
> are declared extern). Of course these never happened and the synth
> backend remained nearly dead code for years, until finally it got
> re-used to implement 9p qtest. In this context, failure to create a
> synthetic directory or file means the related test has a bug (e.g.
> messing with the paths used by some other test). This code likely
> needs improvements but we never got to it.

I was about to suggest putting this in a file comment, but then I saw

    /*
     * Not so fast! You might want to read the 9p developer docs first:
     * https://wiki.qemu.org/Documentation/9p
     */

and behind the link, there's a paragraph "3. synth fs driver".

Perhaps a brief note on the use of assert() in synth_init() would still
make sense.  Up to you.

Thanks!

[...]


