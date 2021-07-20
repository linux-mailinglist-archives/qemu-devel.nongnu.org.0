Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B463D00D5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:49:17 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tro-0007XE-1y
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tlp-0000Dq-Nj
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tll-00032k-Ub
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=BSd/Gifdqs+PriUxdO/c25CsNOsDZPrw0yMsHVzA+cI=;
 b=frSudfG4wYqOUplShPuVBqvp/YkNt8itxp0ja/H5/+mYp3uqHbnZSSBpi/6h/JSq/fhz3Q
 sqoKvPc73uYTfSIdjY9SxIqnk22cvEopuRHQ4/Y0PAaStMe/mW/5SbANGHJG+qZdDw4vv3
 HTjAmoUUAlk7mQxSyX3tdHrOZCCexB4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-LgEviGkBOLW2qLma2k4ctw-1; Tue, 20 Jul 2021 13:42:58 -0400
X-MC-Unique: LgEviGkBOLW2qLma2k4ctw-1
Received: by mail-oi1-f199.google.com with SMTP id
 l3-20020aca19030000b029025c7e6f8b64so12338oii.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BSd/Gifdqs+PriUxdO/c25CsNOsDZPrw0yMsHVzA+cI=;
 b=g/U3r4h2DzmcGv5ZSp7PzQC65SvbO4KH578Jt6ZpzWDSidXIgz5WiT3dy8HtuLlXw8
 lkzo+MhK+y0tetIlECHveshZteuFW/AE2FzaDcQhKSGagW+/FoZ46wphuuhu21FQQA0v
 GujHJCOuWROAjxjHE37LIxqiaRFUFYSAsU5jifahV66qmiB/Zk6OmsZjAQoNkvudpO8l
 xA2QW5ATkXklX8o8a/L2o2TCjcagq6sFCOQJ8Q0irEJTpR1fq0azhl/skNv6Z6SU0ElK
 l+GsKLgdJ0K1GdrnnK6MnmmG8Ot7322+niJQ2KbQYooCHFNPNaV1KEZsm5Z9riYBo1nW
 cqog==
X-Gm-Message-State: AOAM531lr1Dd0HuLb6WhW/i+8RlOE5Yu57yhdC92iYhFytv7zIqblS0d
 LIlVfQmmAGB8IwL9yMZMtXNpn894qJ+pRrNiuDKTInGh27OcxKblO37uq+zhORrQnTrpJQiMYSA
 GkIUxArjWkddMWUhLtKsxzQ1X1X9yYvE=
X-Received: by 2002:a4a:8544:: with SMTP id l4mr21593042ooh.5.1626802977701;
 Tue, 20 Jul 2021 10:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUjxiJsud5EEeIL/b62lr8MuEuTr+TLW3pW749LV+32tT8kxuV6Lrzn3LdA6Py646j2I/+zzDVeWPmawMPqK0=
X-Received: by 2002:a4a:8544:: with SMTP id l4mr21593031ooh.5.1626802977528;
 Tue, 20 Jul 2021 10:42:57 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 13:42:47 -0400
Message-ID: <CAFn=p-bxme1mcs17J2hn04z6E38Hd232aB6n9AVQ94F0hsV2Aw@mail.gmail.com>
Subject: Intermittent failure in build-system-centos
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000986f2405c79195b5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000986f2405c79195b5
Content-Type: text/plain; charset="UTF-8"

I don't know if this one is known yet, but I occasionally see this test
blink out on me and then succeed on retry:
https://gitlab.com/jsnow/qemu/-/jobs/1439046851

On IRC, Dan said that it sounded like a missing meson dependency
accidentally allowing dependent components to build in parallel, which
sounds plausible enough.

--js

--000000000000986f2405c79195b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t know if this one is known yet, but I occa=
sionally see this test blink out on me and then succeed on retry: <a href=
=3D"https://gitlab.com/jsnow/qemu/-/jobs/1439046851">https://gitlab.com/jsn=
ow/qemu/-/jobs/1439046851</a></div><div><br></div><div>On IRC, Dan said tha=
t it sounded like a missing meson dependency accidentally allowing dependen=
t components to build in parallel, which sounds plausible enough.</div><div=
><br></div><div>--js<br></div></div>

--000000000000986f2405c79195b5--


