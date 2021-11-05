Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52934461F5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 11:09:44 +0100 (CET)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miwAI-0008SX-T2
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 06:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miw9M-0007m5-SZ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 06:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miw9H-00071M-0A
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 06:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636106917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCaqMUh9Nka4nfrG0ys3tWlhjOIVp6JPCNu8lLkWA/U=;
 b=OmD+xSqg/dSwbUpu+Uy6Om5M8l/5xv/oc3CIRa7fVIBm1oEH5CUSv+GIllIrAJglAeqPaP
 HG3ycZVamOHeh4sqwxkP4JaZd9zo/Ld0o3eMtOgNTU7VPkL8FW0Brk4TuIMeYvHuL2Jqhg
 LUIGRDeZOaED2VzimyMRgrtzp6NCSzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-rI6AxNuTNmCaYwFGZQCkUg-1; Fri, 05 Nov 2021 06:08:33 -0400
X-MC-Unique: rI6AxNuTNmCaYwFGZQCkUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF2F019611C5;
 Fri,  5 Nov 2021 10:08:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 795C460C13;
 Fri,  5 Nov 2021 10:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA09411380A7; Fri,  5 Nov 2021 11:08:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
Date: Fri, 05 Nov 2021 11:08:29 +0100
In-Reply-To: <YYPwogn87tMf0p7s@redhat.com> (Kevin Wolf's message of "Thu, 4
 Nov 2021 15:39:30 +0100")
Message-ID: <87y2623of6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:
>> The old syntax almost always has its quirks.  Ideally, we'd somehow get
>> from quirky old to boring new in an orderly manner.  Sadly, we still
>> don't have good solutions for that.  To make progress, we commonly
>> combine JSON new with quirky old.
>> 
>> qemu-system-FOO -object works that way.  object_option_parse() parses
>> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
>> the latter in an opts visitor.
>> 
>> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
>> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
>> it handles clashes I don't remember.
>> 
>> Sadly, this means that we get quirky old even for new object types.
>
> For -object in the system emulator (the tools all use the keyval
> visitor, so there it would work as expected), the only reason that we
> need to keep the quirky old code path around is the list handling in
> memory-backend.host-nodes.
>
> The main difficulty there is that the old QemuOpts based code path
> allows specifying the option twice and both of them would effectively be
> combined. Do we have any idea how to replicate this in a keyval parser
> based world?

I can see just two clean solutions, but both involve upending a lot of
code.

We can fuse keyval parser and visitor to get a schema-directed parser.

We can change the abstract keyval syntax to permit repeated keys.  This
means replacing QDict in in the abstract syntax tree, with fallout in
the visitor.

Even if we find a practical solution, I don't like the combination of
"you may give the same parameter multiple times, and the last one wins"
and "for a list-valued parameter, the values of repeated parameters are
collected into a list".  Each makes sense on its own.  The combination
not so much.  Inheriting "last one wins" from QemuOpts may have been a
mistake.

The keyval way of doing lists (inherited from the block layer's usage of
dotted keys?  I don't remember) requires the user to count, which isn't
exactly nice, either.

> If not, do we want to use the remaining time until 6.2 to deprecate
> this? The nasty part is that the only syntax that works both now and in
> the future is JSON. We can't easily accept the new keyval syntax while
> still using the QemuOpts based code.

What exactly do you propose to deprecate?


