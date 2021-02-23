Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B96322AB6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:44:51 +0100 (CET)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEX3a-0000I2-Mh
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEX2n-0008JJ-L9
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEX2m-0005Ou-20
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614084239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vydxTNXd6dn7arX6agUk0s9Z+TtMa9H3g+11F1yYhVU=;
 b=Iih6jTiv20uUE4ohcnXB2mJEl7I43URi/Op1FCsEHLFUFnL0PW8Y9Ye7XgbeXfpYArtoZZ
 ApQ0WbC0HbsPJtrlOW1+5v4LzuBvMmk9cExvuzpgkEs/bWR40yyIKPsficIfuhr3ONgr03
 jXJ6Tp8kDC9bZ2aHP9PQ8ADZ53J8qAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-CZ_KlHSbPiivCuBLtwySuQ-1; Tue, 23 Feb 2021 07:43:57 -0500
X-MC-Unique: CZ_KlHSbPiivCuBLtwySuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C4EC292;
 Tue, 23 Feb 2021 12:43:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F9B60C17;
 Tue, 23 Feb 2021 12:43:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 957F1113860F; Tue, 23 Feb 2021 13:43:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <YDPv7Bk6/DNq/lCn@redhat.com> <87o8gbf7uc.fsf@dusky.pond.sub.org>
 <CAFEAcA_NNyFM=bqN663o3r49tgpa21U9Easv9=EXzqW1Ygfqhg@mail.gmail.com>
Date: Tue, 23 Feb 2021 13:43:49 +0100
In-Reply-To: <CAFEAcA_NNyFM=bqN663o3r49tgpa21U9Easv9=EXzqW1Ygfqhg@mail.gmail.com>
 (Peter Maydell's message of "Tue, 23 Feb 2021 11:03:19 +0000")
Message-ID: <87sg5nc5tm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Feb 2021 at 09:33, Markus Armbruster <armbru@redhat.com> wrote:
>> Misunderstanding: our JSON interpolation feature is *not* string
>> interpolation!  It interpolates *objects* into the QObject built by the
>> parser.
>
> Given that it's basically undocumented except in a scattered
> handful of comments inside the qjson parser implementation, it's
> not too surprising that people misunderstand it :-)

Yes, that's fair.

I added a fair amount of commentary, but it's heavily geared towards
maintainers, not users.

>                                                     (One surprising
> feature: the parser takes ownership of the object that you pass it
> via the '%p' interpolation, and will qobject_unref() it.)

Yes, %p takes over the reference.


