Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB04ED8C0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:56:09 +0200 (CEST)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtPM-0008AT-Am
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:56:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZtLt-0005hz-5i
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZtLq-0008R7-N0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648727550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wMOEYkhNm5VD1Tm+wxetpkBGT+vZnKuoVHR9f27UCk=;
 b=Uo1JY33s0FQsarHilc5VqvwFTlk8dVAzkWN3E98WEOCdxrIuHJzfbOZvTe6Y2xcA2eUpKh
 /x8b4rii3rR/QaIxvNFDUjAslrp6iR8SrDIv7dkGfZiLMSl6JbEyWdq9dv3f9N0f6aPAVJ
 BM5lI7t+5mhPQszyKA8Y+aFt/xEvxzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-f4Gg0sn_M1GU_f1KQkEgMg-1; Thu, 31 Mar 2022 07:52:26 -0400
X-MC-Unique: f4Gg0sn_M1GU_f1KQkEgMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A328A1802A1E;
 Thu, 31 Mar 2022 11:52:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AFB2C28103;
 Thu, 31 Mar 2022 11:52:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4484121E691D; Thu, 31 Mar 2022 13:52:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com> <YjC2+F2SkNEDOXTe@redhat.com>
Date: Thu, 31 Mar 2022 13:52:24 +0200
In-Reply-To: <YjC2+F2SkNEDOXTe@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 15 Mar 2022 15:55:36 +0000")
Message-ID: <871qyiqqyv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Mar 15, 2022 at 03:50:26PM +0100, Kevin Wolf wrote:

[...]

>> ...using C++ in coroutine code means that all of the block layer would
>> suddenly become C++ and would be most affected by this effect. I'm not
>> sure if that's something I would like to see, at least until there is a
>> clear tree-wide policy (that preferably limits it to a subset that I
>> understand).
>
> Expecting maintainers to enforce a subset during code review feels
> like it would be a tedious burden, that will inevitably let stuff
> through because humans are fallible, especially when presented
> with uninspiring, tedious, repetitive tasks.
>
> Restricting ourselves to a subset is only viable if we have
> an automated tool that can reliably enforce that subset.

Concur.  We're talking about a complex subset of an even more complex
whole, where few to none of us will fully understand either.

>                                                          I'm not
> sure that any such tool exists, and not convinced our time is
> best served by trying to write & maintainer one either.
>
> IOW, I fear one we allow C++ in any level, it won't be practical
> to constrain it as much we desire. I fear us turning QEMU into
> even more of a monster like other big C++ apps I see which take
> all hours to compile while using all available RAM in Fedora RPM
> build hosts.

While I'm certainly concerned about the often poor ergonomics of
compiling C++ code, I'm even more concerned about the poor ergonomics of
*grokking* C++ code.

> My other question is whether adoption of C++ would complicate any
> desire to make more use of Rust in QEMU ? I know Rust came out of
> work by the Mozilla Firefox crew, and Firefox was C++, but I don't
> have any idea how they integrated use of Rust with Firefox, so
> whether there are any gotcha's for us or not ?

Good question.


