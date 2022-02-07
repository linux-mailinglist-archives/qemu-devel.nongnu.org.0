Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09EB4AB91A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:54:16 +0100 (CET)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1ex-0005oF-DS
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nH1aK-0004TO-Fr
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:49:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:25440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nH1aH-0003NA-V8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:49:28 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-aP4bT-CQNm-YrKrfHPyTxw-1; Mon, 07 Feb 2022 05:49:21 -0500
X-MC-Unique: aP4bT-CQNm-YrKrfHPyTxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7423E1091DA1;
 Mon,  7 Feb 2022 10:49:19 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE3676D039;
 Mon,  7 Feb 2022 10:49:13 +0000 (UTC)
Date: Mon, 7 Feb 2022 11:49:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <20220207114912.1efe2a27@bahia>
In-Reply-To: <a48d6e38-e420-fb34-899d-7d933b384089@amsat.org>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
 <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
 <20220207094717.5f92da9d@bahia>
 <a48d6e38-e420-fb34-899d-7d933b384089@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, hi@alyssa.is,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>, Vivek <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 11:30:18 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 7/2/22 09:47, Greg Kurz wrote:
> > On Sun, 6 Feb 2022 20:10:23 -0500
> > Will Cohen <wwcohen@gmail.com> wrote:
> >=20
> >> This patch set currently places it in 9p-util only because 9p is the o=
nly
> >> place where this issue seems to have come up so far and we were wary o=
f
> >> editing files too far afield, but I have no attachment to its specific
> >> location!
> >>
> >=20
> > Inline comments are preferred on qemu-devel. Please don't top post !
> > This complicates the review a lot.
> >=20
> > This is indeed a good candidate for osdep. This being said, unless ther=
e's
> > some other user in the QEMU code base, it is acceptable to leave it und=
er
> > 9pfs.
>=20
> virtiofsd could eventually use it.


Indeed but virtiofsd is for linux hosts only AFAICT and I'm not aware of an=
y
work to support any other host OS.

Cc'ing virtio-fs people for inputs on this topic.


