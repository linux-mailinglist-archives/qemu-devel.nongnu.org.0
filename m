Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E74DCAA9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:02:36 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsaA-0006XF-Gi
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:02:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUsWW-0004RC-Oh
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUsWV-0007zM-9w
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647532726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFBRPwNp2i+9sO6u/53dQg6KDJrNrNDXw1XtxUKrPdY=;
 b=R57jksgOgasj05XFdEh5a/meqAwBLkZwq8y7MKFZPunJ82y8bcpxjYXImXJdj/VBPsVCTz
 ouoULrllnQBWjEKR7Pf5TpdJ6cU/NJlrcnIXOkv61sp+na0SlfeF4kZ/wRoUStP/m/Dw69
 KsxM/4E+jh6610kAOjIn7kpGweHaiAk=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-5kntLiflML6xX-qp3A1ejA-1; Thu, 17 Mar 2022 11:58:45 -0400
X-MC-Unique: 5kntLiflML6xX-qp3A1ejA-1
Received: by mail-vs1-f69.google.com with SMTP id
 t25-20020a67c799000000b00324ca44dd41so166990vsk.14
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VFBRPwNp2i+9sO6u/53dQg6KDJrNrNDXw1XtxUKrPdY=;
 b=30bInTaBxlsVzNvHVQcja2eDcWd8BJVvG+ITPX776UzL3fHH1f/Rq3pqbZLWMBZEd2
 UcPA7LSxIwkZCuDkyhFUE01WzJCrtpfdPL/XKqCqbL3BqD0WevgJmqXyZ87Q0Xg2e4u2
 QDxGGM/kpcCjJe3mQ/H6J/XSylydoNhe2qvTmB6d4JYk+A9zVDlPGN5RoOo0SlUcwIU/
 5YfsDxE/CtqudXcar0yoZOUPoEtcraCLmB1KmEvA/YiV9n0aAGLVsSrf5mJkdRoQsPOE
 fFLHWEP4veZSxmruYi4gMVo4jZdhxEXyB+mK8pAa7zV67z0WmNT8+KaARAQG+fH/9r40
 awHg==
X-Gm-Message-State: AOAM531jsKF3BLeABmUCBKEO7kkXeu+l1m90s+9moh9CkwZC3KNN1rBg
 LQuymShRSHOcYl4dW7mkznRaHnxo/vrny2aePgVUuEg/08nQPxwCQU0+3Yt4cLK3cIVsWKYdW0o
 JFFT6hFZJbnDMC0UDKrzDwWQxyp6VQjE=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr2370041vkf.35.1647532724649; 
 Thu, 17 Mar 2022 08:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySLGkmgsiI3OdfanjMheNtm3hdW/a0gNlmteObJPOCuNVWxyNJQDewmq4KT0t0u8NcB724j2RiZ7URjQYpjTQ=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr2370032vkf.35.1647532724475; Thu, 17 Mar
 2022 08:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-13-jsnow@redhat.com>
 <71c3d99f-f273-ac32-d644-4b2d3eee6ffb@redhat.com>
In-Reply-To: <71c3d99f-f273-ac32-d644-4b2d3eee6ffb@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 11:58:33 -0400
Message-ID: <CAFn=p-ZpoF+QVZv0Quq8NmYVSvXOtVMxPmynDFSr7hG54aV-CA@mail.gmail.com>
Subject: Re: [PATCH 12/14] iotests: remove qemu_img_pipe_and_status()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 11:28 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 09.03.22 04:54, John Snow wrote:
> > With the exceptional 'create' calls removed in the prior commit, change
> > qemu_img_log() and img_info_log() to call qemu_img() directly
> > instead.
> >
> > In keeping with the spirit of diff-based tests, allow these calls to
> > qemu_img() to return an unchecked non-zero status code -- because any
> > error we'd see from the output is going into the log anyway.
>
> :(
>
> I=E2=80=99d prefer having an exception that points exactly to where in th=
e test
> the offending qemu-img call was.  But then again, I dislike such
> log-based tests anyway, and this is precisely one reason for it...
>
> I think Kevin disliked my approach of just `assert qemu_img() =3D=3D 0`
> mainly because you don=E2=80=99t get the stderr output with it.  But you=
=E2=80=99ve
> solved that problem now, so I don=E2=80=99t think there=E2=80=99s a reaso=
n why we
> wouldn=E2=80=99t want a raised exception.
>
> Hanna
>

I thought you and Kevin actually preferred diff-based tests, maybe I
misunderstood. I know that there was a strong dislike of the unittest
based tests, and that the new script-style was more preferred. I
thought inherent to that was an actual preference for diff-based
itself, but maybe not?

I'd say negative tests are easier with the diff-based as one benefit.
I'm a little partial to that kind of test. (I noticed that bitmap
tests were the most habitual user of negative tests involving
qemu-img, haha.) Otherwise, I guess I don't really care what the test
mechanism is provided that the error output is informative. Happy to
defer to consensus between you and Kevin.

Anyway, this patch (and the ones that follow it, I haven't read your
feedback on 13-14 yet) doesn't close the door on making everything
Except-by-default, it would just be further work that needs to happen
after the fact. How do you want to move forward?

- Replace calls to qemu_img_log() with qemu_img()
- Make qemu_img_log() raise by default, but log output on success cases
- Something else?

--js


