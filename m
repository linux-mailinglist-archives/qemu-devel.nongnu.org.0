Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5B2FFDAA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 08:56:31 +0100 (CET)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2rIz-0005LQ-Uv
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 02:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2rIB-0004nf-V9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 02:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2rI6-00042G-Q9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 02:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611302127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zARW+/z2bBINDhCCCOZzXgIoOEWqMoKt5NM7l5lms0=;
 b=CIoP1VgXhCDHD44gVyID0EbLEHVdGW19EooAXgIsYU4XNzhlCyzMmJkpzjfQao0wuiARix
 tzH0bquvEHDMToP6JZm8zCTRQJHZzBe8+PvLuYMAz/VtV6pde+Cm1cwtRp5uy8YLXlADr0
 tgUTaY2nrfqDZBLxKytH6wm5zy9QvLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-oqH2KYsyN1m5T3QmcTy-Sg-1; Fri, 22 Jan 2021 02:55:23 -0500
X-MC-Unique: oqH2KYsyN1m5T3QmcTy-Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C948B1800D42
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1DB260BF3;
 Fri, 22 Jan 2021 07:55:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F1D0113865F; Fri, 22 Jan 2021 08:55:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Thread safety of coroutine-sigaltstack
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
Date: Fri, 22 Jan 2021 08:55:18 +0100
In-Reply-To: <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com> (Paolo
 Bonzini's message of "Thu, 21 Jan 2021 16:14:21 +0100")
Message-ID: <87r1mde789.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 21/01/21 10:27, Max Reitz wrote:
>> Sure, I can do that.
>> I agree that there probably are better solutions than to wrap
>> everything in a lock.=C2=A0 OTOH, it looks to me like this lock is the
>> most simple solution.=C2=A0 If Daniel is right[1] and we should drop=20
>> coroutine-sigaltstack altogether (at some point...), perhaps it is
>> best to go for the most simple solution now.
>> [1]
>> https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00808.html
>
> Yes, between coroutine-ucontext and the upcoming coroutine-asm[1]
> (which I have shelved because it was mostly a requirement for x86 CET;
> but it will come back some day), sooner or later there will be no
> reason to keep coroutine-sigaltstack.  Porting coroutine-asm to a new
> architecture is easy, I even managed to do it for s390. ;)

POSIX dropping ucontext without a replacement was shortsighted.  Yes,
ucontext is warty, but that's no excuse for letting your users fend for
themselves.  Standard building blocks for coroutines are clearly needed.
Without them, everybody gets to build from scratch or with ill-suited
blocks like sigaltstack.

> Paolo
>
> [1] https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@redhat.com/


