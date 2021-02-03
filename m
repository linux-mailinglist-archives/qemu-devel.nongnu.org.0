Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6730DC48
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:10:23 +0100 (CET)
Received: from localhost ([::1]:42488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IrO-0007Oo-VK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7IpY-00064G-KO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7IpT-00016e-R2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612361301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QY9szcQmEU8srxpaknW1+mRSEe0/FuSSqEM918ZENjU=;
 b=RKNhtxdlqHm90VJgxWNZvKnjfru/Muf5lm3RBXUyrej6J6TuLVq3UFcK5AHlz32RdhaYq0
 hOTeoczXwW7ca79wV3i1KckLelkhsob/6+Te8Q5/ECaTSp1qjLeo6+vhEseOCYlJcV6BPV
 XK/bIbvvqVnU18LrdRSTYW2lOuukfxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-84JL0SStPr-ACu0zZD4e_Q-1; Wed, 03 Feb 2021 09:08:18 -0500
X-MC-Unique: 84JL0SStPr-ACu0zZD4e_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615AA801969;
 Wed,  3 Feb 2021 14:08:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB7E709B3;
 Wed,  3 Feb 2021 14:08:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA0DA113865F; Wed,  3 Feb 2021 15:08:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 04/14] qapi/introspect.py: guard against
 ifcond/comment misuse
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-5-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 15:08:15 +0100
In-Reply-To: <20210202174651.2274166-5-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:41 -0500")
Message-ID: <874kitutv4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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

> _tree_to_qlit is called recursively on dict values alone; at such a
> point in generating output it is too late to apply an ifcond. Similarly,
> comments do not necessarily have a "tidy" place they can be printed in
> such a circumstance.
>
> Forbid this usage.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 4749f65ea3c..ccdf4f1c0d0 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -43,6 +43,12 @@ def indent(level):
>          ifobj, extra = obj
>          ifcond = extra.get('if')
>          comment = extra.get('comment')
> +
> +        # NB: _tree_to_qlit is called recursively on the values of a key:value
> +        # pair; those values can't be decorated with comments or conditionals.
> +        msg = "dict values cannot have attached comments or if-conditionals."
> +        assert not suppress_first_indent, msg
> +
>          ret = ''
>          if comment:
>              ret += indent(level) + '/* %s */\n' % comment

This uses @suppress_first_indent as a proxy for "@obj is a value in a
dict".  Works, because we pass suppress_first_indent=True exactly
there.  Took me a minute to see, though.

Do you need this assertion to help mypy over the hump?

Perhaps we'd be better off with two functions, one that takes possibly
annotated @obj, and one that takes only plain @obj.  "Yes, but not now"
woule be one acceptable answer to that.


