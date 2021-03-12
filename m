Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739A233877C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:36:49 +0100 (CET)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdHr-0007Qh-T9
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdGF-0006NR-RW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdGD-00012U-4v
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615538103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8NB6IkmDuJqn16YVO6+F5aDbwq2r7Ua+OWHi/giJB4U=;
 b=hONS4IS0rA9tLkzJ2fc3WfAAJDb3Vp8MnqJ1zD3DeErkc8z8XPpUpcagzBTTn6NsBIdsZv
 6PPPq7XitIGqPugcyZrqHisZt9JVZCYKyFLeigDJITU66IY9c3FqrmYfG/l4HM1RZ0AtuB
 WdyBxXwr1GNXKstVqIQjdr5eBqbOtnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-gQ7Li10XOP6KEMBTq3WqAw-1; Fri, 12 Mar 2021 03:35:01 -0500
X-MC-Unique: gQ7Li10XOP6KEMBTq3WqAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A309192377A
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:35:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0680D60C5F;
 Fri, 12 Mar 2021 08:34:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7346B1132C12; Fri, 12 Mar 2021 09:34:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/3] char: Deprecate backend aliases
References: <20210311164253.338723-1-kwolf@redhat.com>
Date: Fri, 12 Mar 2021 09:34:58 +0100
In-Reply-To: <20210311164253.338723-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Mar 2021 17:42:50 +0100")
Message-ID: <87wnuc6a8d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> A small series from November that has fallen through the cracks...

Glad you remembered!

> These aliases only work the command line, but not in QMP. Command line
> QAPIfication involves writing some compatibility glue for them, which
> I'm doing, but I think it's desirable to unify accepted values of both
> paths. So deprecate the aliases so that we can drop the compatibility
> glue later.
>
> v2:
> - Don't mention deprecated options in the help [Markus]
>
> - Added third patch to simplify the code again. Markus had suggested
>   not complicating it in the first place, but then I would have to merge
>   patches 1 and 2 even though they address different points, so this
>   didn't feel very desirable.

Complicated review a bit, but I'm not sure the alternative would've been
easier.

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!


