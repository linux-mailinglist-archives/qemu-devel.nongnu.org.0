Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FC668F43
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEXH-00025X-18; Fri, 13 Jan 2023 02:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGEXB-00024x-J9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGEX9-0004tb-FO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673595086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOIBTcu1YyH83kZ66grCiT8P2p0B5r/FaExFj5hF6eA=;
 b=AGiy2FacME7J/5BBm4p9AQaVy4qJXtH+8BrhquFNHq1bqndw7BtSF/7UEiRzgmLmwY8iiu
 om3Xa7jZgA99RVbzF49azQ3cEEoiCu2CyZPV12eraSYxaOYavIDhRmzh13EhJPvUIp4szG
 TLJ3y93E6wx6kzceZpqZHM2bv44EQlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-MxfAaoAbOBKmNLmsy7N0zw-1; Fri, 13 Jan 2023 02:30:53 -0500
X-MC-Unique: MxfAaoAbOBKmNLmsy7N0zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A80EB803903;
 Fri, 13 Jan 2023 07:30:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 760A240C2064;
 Fri, 13 Jan 2023 07:30:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2589521E6806; Fri, 13 Jan 2023 08:30:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org,  hreitz@redhat.com,  aesteve@redhat.com,
 nsoffer@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image
References: <20230112191454.169353-1-kwolf@redhat.com>
Date: Fri, 13 Jan 2023 08:30:52 +0100
In-Reply-To: <20230112191454.169353-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Jan 2023 20:14:50 +0100")
Message-ID: <874jsu51sj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Drive-by comment...

Kevin Wolf <kwolf@redhat.com> writes:

> This series addresses the problem described in these bug reports:
> https://gitlab.com/qemu-project/qemu/-/issues/1330
> https://bugzilla.redhat.com/show_bug.cgi?id=2147617
>
> qcow2 can fail when writing back dirty bitmaps in qcow2_inactivate().
> However, when the function is called through blk_unref(), in the case of
> such errors, while an error message is written to stderr, the callers
> never see an error return. Specifically, 'qemu-img bitmap/commit' are
> reported to exit with an exit code 0 despite the errors.

After having tead the "potential alternative" below, I figure this
failure happens within blk_unref().  But I can't see a call chain.  Am I
confused?

> The solution taken here is inactivating the images first, which can
> still return errors, but already performs all of the write operations.
> Only then the images are actually blk_unref()-ed.
>
> If we agree that this is the way to go (as a potential alternative,
> allowing blk_unref() to fail would require changes in all kinds of
> places, many of which probably wouldn't even know what to do with the
> error),

blk_unref() could fail only when it destroys @blk (refcnt goes to zero).
Correct?

We have a bunch of "unref" functions in the tree, and, as far as I can
tell from a quick grep, none of them can fail.  Supports your apparent
preference for not changing blk_unref().

>         then I suppose doing the same for other qemu-img subcommands
> would make sense, too.

I was about to ask whether there could be more silent failures like the
ones in commit and bitmap.  This suggests there are.

Say we do the same for all known such failures.  Would any remaining (or
new) such failures be programming errors?

[...]


