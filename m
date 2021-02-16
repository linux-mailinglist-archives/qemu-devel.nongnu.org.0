Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A031C788
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 09:45:00 +0100 (CET)
Received: from localhost ([::1]:49362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBvyc-0001gX-Lp
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 03:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBvxk-00012i-DZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 03:44:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBvxh-0001XT-RF
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 03:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613465040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aeK8/QEEX4vHMfevasJ5kdrww+UkHRWSmk8L0oZaTYU=;
 b=DGLG4OZKhESVZerQankD3jhLRjK98Bm8ZCDSOHdKmKe7xLTimAGmh6l0GFnyNZt5Ukfk7Z
 9g7vH5GJ6Agh+nNzWXx16cKHcVDSEJrTcYYuKVWfmMpVZICB/t7F1nKZe0JGKpK/Dvl0z3
 XaARqlXNaVchEC9/VIwwzLCvJUfKPw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-56v2BJe5MK6PVUklHOzc8g-1; Tue, 16 Feb 2021 03:43:58 -0500
X-MC-Unique: 56v2BJe5MK6PVUklHOzc8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A406D107ACC7;
 Tue, 16 Feb 2021 08:43:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AECB62A24;
 Tue, 16 Feb 2021 08:43:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1ECE113865F; Tue, 16 Feb 2021 09:43:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 01/19] qapi: Replace List[str] with Sequence[str] for
 ifcond
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-2-jsnow@redhat.com>
Date: Tue, 16 Feb 2021 09:43:55 +0100
In-Reply-To: <20210216021809.134886-2-jsnow@redhat.com> (John Snow's message
 of "Mon, 15 Feb 2021 21:17:51 -0500")
Message-ID: <87h7mcpflg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> It does happen to be a list (as of now), but we can describe it in more
> general terms with no loss in accuracy to allow tuples and other
> constructs.
>
> In the future, we can write "ifcond: Sequence[str] = ()" as a default
> parameter, which we could not do with a Mutable type like a List.

Well, we could write "= []", but we shouldn't.  Worth a commit message
tweak?

> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


