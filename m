Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BA4DB08B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:11:10 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTQj-0007GX-2s
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:11:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTGQ-0000qI-6H
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUTGO-0008BH-NN
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647435628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fJ4mDFw3xzZsB1z1DLCj97gII0KwHS8bl4SjBAtNVk=;
 b=bYPwvxsa6ms1NXojV7URmTEmNGAUKmUrI78XTCr6Xv0xvUurLqSTSslAexVqZBNM6LyABy
 cI5WWmRvCvu1afOvSSPcpdp3C25FdB+ko9QSgiaBwG8/5cRQCUn/e1hntz8ULmp9BPf9uS
 gH26CGGhiZ7V66nWobAho3IyKg2rnrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-lHQ6hXP6MhmzRh-nf4kc5w-1; Wed, 16 Mar 2022 09:00:26 -0400
X-MC-Unique: lHQ6hXP6MhmzRh-nf4kc5w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90033811E84
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 13:00:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECA4401E39;
 Wed, 16 Mar 2022 13:00:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0CC921E6821; Wed, 16 Mar 2022 14:00:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 26/27] tests: replace free_all() usage with g_auto
References: <20220316095459.2613885-1-marcandre.lureau@redhat.com>
 <877d8u5b7o.fsf@pond.sub.org>
 <CAMxuvazfG9y4wODW3rHL_Xj9+H1SwDy8aESZKW89hwU=k7LLjg@mail.gmail.com>
Date: Wed, 16 Mar 2022 14:00:24 +0100
In-Reply-To: <CAMxuvazfG9y4wODW3rHL_Xj9+H1SwDy8aESZKW89hwU=k7LLjg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 16 Mar 2022
 16:53:05 +0400")
Message-ID: <87bky6xdav.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Wed, Mar 16, 2022 at 4:33 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Use more idiomatic glib/auto-style code.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> This is a bit of an improvement, but by its own, it's a rather weak
>> justification for the previous patch.  Do you have more uses of
>> g_autoptr in the pipe?
>
>
> There are a lot of similar g_auto cleanups to be done in qemu code
> base for QObject types. But I started with those tests, because they
> use a pretty unorthodox free_all pattern and that shouldn't be
> repeated.

Would it make sense to add this the list of bite-sized tasks?


