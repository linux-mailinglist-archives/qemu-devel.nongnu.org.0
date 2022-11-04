Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD7619CD1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzM6-0006B8-7b; Fri, 04 Nov 2022 12:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzLg-0005yI-Bc
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzLd-0000eL-Qu
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJR4fddbZOxcPMgQY405ulC488zF4pzggKXH01czHxA=;
 b=RwPRs2Aj+ewqFcj6fDdD//eAT7eFbCq4rF976xqsqPb31njvJYPMHzp3z1T6lCqE7dHxkB
 5mrOIGAYS0PpDndSELe1yNEAy9DLTBWW4JVog2BFPcOHV7rsTwiR45XdBPQl7Uy15DeRhq
 f++bn5OrRQgZxgQXJY0H2StgjL+4t8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-1FWO3MQVMW6y-gIvYp2mAA-1; Fri, 04 Nov 2022 12:15:09 -0400
X-MC-Unique: 1FWO3MQVMW6y-gIvYp2mAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41502185A78B;
 Fri,  4 Nov 2022 16:15:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D4B84EA4C;
 Fri,  4 Nov 2022 16:15:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF8C121E6900; Fri,  4 Nov 2022 17:15:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com,  eblake@redhat.com,  michael.roth@amd.com
Subject: Re: [PATCH v3 00/30] qapi: Elide redundant has_FOO in generated C
References: <20221104160712.3005652-1-armbru@redhat.com>
Date: Fri, 04 Nov 2022 17:15:06 +0100
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 4 Nov 2022 17:06:42 +0100")
Message-ID: <87wn8azofp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> In QAPI, absent optional members are distinct from any present value.
> We thus represent an optional schema member FOO as two C members: a
> FOO with the member's type, and a bool has_FOO.  Likewise for function
> arguments.
>
> However, the has_FOO is actually redundant for a pointer-valued FOO,
> which can be null only when has_FOO is false, i.e. has_FOO == !!FOO.
> Except for arrays, where we a null FOO can also be a present empty
> array.
>
> The redundant has_FOO are a nuisance to work with.  Improve the
> generator to elide them.
>
> PATCH 01+02 are trivial documentation cleanups.
>
> PATCH 03 tweaks an example in documentation so it'll show the change.
>
> PATCH 04 improves the code generator, but nerfs the change for the
> schema modules where handwritten code needs to be updated.
>
> PATCH 05-07,10-29 un-nerf in reviewable chunks.  Their commit messages
> refer back to PATCH 04 for an explanation of the transformation.
> Please read that first.  Note that these patches combine the
> mechanical transformation with obvious, local follow-up
> simplifications.  If you want them separate for easier review, let me
> know.
>
> PATCH 08+09 clean up in preparation for PATCH 10.
>
> PATCH 28 drops the nerfing code.

PATCH 30, of course.


