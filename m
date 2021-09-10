Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AD406D12
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:46:37 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgrU-0004eP-9h
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOgqJ-0003sW-La
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOgqF-0000iC-Vo
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631281518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XW1XIzQebpgdTD0WyyaAOOe8PaoEGDRbCqvFMlVT7oo=;
 b=RBbNamcv+SbktHSqFR9e+uhEzJ8GLXakCXv2kiz0r7x9yjLsmv8uq7kob8H4sgPv0FzoUs
 0EEu2XY/8EAVa2T2Z5LE6Gp9ZpfBHnAhO5zcvRneNCDUgZm0beKYrQU9wdMJp7CQvE3IWa
 7SZ3dLP1PWH0JSJXdzjjP+yGLDE0xkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-OyJu8KowOMuMud1r3tnydQ-1; Fri, 10 Sep 2021 09:45:16 -0400
X-MC-Unique: OyJu8KowOMuMud1r3tnydQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B47791286;
 Fri, 10 Sep 2021 13:45:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5A019811;
 Fri, 10 Sep 2021 13:45:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2624113865F; Fri, 10 Sep 2021 15:45:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/5] docs/devel: document expectations for QAPI data
 modelling for QMP
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-2-berrange@redhat.com>
 <87tuium6u7.fsf@dusky.pond.sub.org> <YTtTwwXjG9/u653o@redhat.com>
Date: Fri, 10 Sep 2021 15:45:11 +0200
In-Reply-To: <YTtTwwXjG9/u653o@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 10 Sep 2021 13:46:59 +0100")
Message-ID: <87sfyca6jc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 09, 2021 at 11:33:20AM +0200, Markus Armbruster wrote:

[...]

>> There are many existing long lines in this file, so I'm not flagging
>> yours, except for this one, because it increases the maximum.
>
> This line is at exactly 80 characters so checkstyle is happy with it.
> We don't have any requirement for a differenet line limit for docs
> afair ?

We don't.  I'm asking for a favour.

Humans tend to have trouble following long lines with our eyes (I sure
do).  Typographic manuals suggest to limit columns to roughly 60
characters for exactly that reason[1].

70 is a reasonable compromise between legibility and "writability".  For
code, we use 80-90, because there the actual width should still be fine
due to indentation.

checkpatch.pl doesn't differentiate betwen code and prose.

This file is already hard to read for me.  Please consider not making it
harder.


[1] https://en.wikipedia.org/wiki/Column_(typography)#Typographic_style


