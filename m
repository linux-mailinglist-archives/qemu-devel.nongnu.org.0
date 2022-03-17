Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570434DCDFD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:51:38 +0100 (CET)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvDl-0000kK-5M
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:51:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUuvd-0002dK-Pa
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUuvb-0007Mx-5A
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryhOdrNjiEyl352fxdN94Mv4y0Dm3gzFInFeH53epUc=;
 b=YoDVb0mRLUcTfBBfceoYncgPqHJfT0kdCeZbM25WN6JVijElnB6MNgkbaKijWuL2gv230p
 10+3A4eoKRsSxnuXHVWlTLEYO/R4eg73ZYZxV6X8lo5bbA7qQsFxml4nuwI5muQEh8+Pgb
 UWN8mbYfg4+qGN3mO2XMk/1TZIgWltY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-WlwNA437PLKBJJuazniN4w-1; Thu, 17 Mar 2022 14:32:48 -0400
X-MC-Unique: WlwNA437PLKBJJuazniN4w-1
Received: by mail-ua1-f69.google.com with SMTP id
 b20-20020ab06654000000b0034b44992839so2791372uaq.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ryhOdrNjiEyl352fxdN94Mv4y0Dm3gzFInFeH53epUc=;
 b=alt59dcwXkBqCBd4ap8AzJSBmeXoMgXvGEgk6pSyvUcZMI8daJRq/3RMJQAVyMqlRM
 WJosJn65JQfFSPHbiq+Yx3joOg6XuF8aC2Wi/wmZvRrsORtbtUi0TpqxznmBf+a1ZmPY
 NStnMf2t7BvAu+JGhNzrNNDKtbqpnHCTmSw20m0t+5Rm6n4EmRufStakMUSVQgN6j4Nt
 7MV/qaJCogYzdR0WTk66qJqxF1oQYuH2zRIdgeRFFO0GWaGPAX5cP2KohBVd1yCU/Tk7
 vPo8BjZuu3vj3gcYt4zo7yBJJkefns66r71an71rN4ClmbDg+lbrzh3r17jw5/FcUfJb
 /WdQ==
X-Gm-Message-State: AOAM5337Y11nYxqoV5HGbQj6lkmhyzta+i/y7WvEw7Ts/zwbimuFJ46a
 tlt3MUw7HivKIT0xYOOaZQbU8I7c+kNh26uN+pARU4U3FFVyKPH9zQCxgqu3Ej8+LrpDfqfK71a
 2GpNrJOjfPfUM7b/9VUwLH2jvIqm25hk=
X-Received: by 2002:a05:6122:988:b0:337:9ac4:2890 with SMTP id
 g8-20020a056122098800b003379ac42890mr2556241vkd.3.1647541968172; 
 Thu, 17 Mar 2022 11:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqwu0qfY7EjBJ3IokvBpRtvu0RfEXHLXFlYcVb6xW9xIFnxVU1vlreauPUlLTusDqb1oHuabapt4gR3ZZ+26k=
X-Received: by 2002:a05:6122:988:b0:337:9ac4:2890 with SMTP id
 g8-20020a056122098800b003379ac42890mr2556230vkd.3.1647541967945; Thu, 17 Mar
 2022 11:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-15-jsnow@redhat.com>
 <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
 <CAFn=p-ab92NRL+E7RytaUo_1S1UB0_eq1EJLjfTGs2Sn_dqSuQ@mail.gmail.com>
 <CAFn=p-YXugb5Qz4VH8OvDMOtqjU=hS54oSo=hjRyn-i02v=dww@mail.gmail.com>
 <c551d045-3e72-2933-2721-b7641edb5b00@redhat.com>
In-Reply-To: <c551d045-3e72-2933-2721-b7641edb5b00@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 14:32:37 -0400
Message-ID: <CAFn=p-b9G8sMeOtV4f-bMDETCi17Gu=RHDKQCJ95k25JiSbM4Q@mail.gmail.com>
Subject: Re: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 2:27 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 17.03.22 18:45, John Snow wrote:
> > On Thu, Mar 17, 2022 at 1:00 PM John Snow <jsnow@redhat.com> wrote:
> >> On Thu, Mar 17, 2022 at 11:39 AM Hanna Reitz <hreitz@redhat.com> wrote=
:
> >>> On 09.03.22 04:54, John Snow wrote:
> >>>> Add configurable filters to qemu_img_log(), and re-write img_info_lo=
g()
> >>>> to call into qemu_img_log() with a custom filter instead.
> >>>>
> >>>> After this patch, every last call to qemu_img() is now guaranteed to
> >>>> either have its return code checked for zero, OR have its output
> >>>> actually visibly logged somewhere.
> >>>>
> >>>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>>> ---
> >>>>    tests/qemu-iotests/iotests.py | 13 +++++++++----
> >>>>    1 file changed, 9 insertions(+), 4 deletions(-)
> >>>   From my POV, this is a regression because before this patch (not th=
is
> >>> series, though, admittedly), `img_info_log()` would throw an exceptio=
n
> >>> on error, and with patch 12 being as it is, it will revert to its
> >>> pre-series behavior of not throwing an exception.  I prefer exception=
s
> > Oh, actually... patch #12 does this:
> >
> > -    output =3D qemu_img_pipe(*args)
> > +    output =3D qemu_img(*args, check=3DFalse).stdout
>
> :(
>
> You=E2=80=99re right, I missed that.
>
> > so I never actually toggled error checking on for this function at
> > all. This isn't a regression.
> >
> > At a glance, img_info_log() calls fail as a matter of course in 242
> > and 266 and ... hm, I can't quite test 207, it doesn't work for me,
> > even before this series.
>
> Ugh, broken in e3296cc796aeaf319f3ed4e064ec309baf5e4da4.
>
> (putting that on my TOFIX list)
>
> > I didn't test *all* qemu_img calls yet either, but ... I'm going to
> > gently suggest that "converting logged calls to qemu_img() to be
> > checked calls" is "for another series" material.
>
> :C
>
> I mean, adding a `check` parameter to `img_info_log()` and
> `qemu_img_log()` would be something like a 9+/5- diff (including 242 and
> 266 changes, but disregarding the necessary comment changes in
> `qemu_img_log()`).  I think that=E2=80=99d be fine, and a bit thin for it=
s own
> =E2=80=9Cseries=E2=80=9D. O:)

You're right. I uh. actually started doing this after I told you I
wasn't going to, because I was surprised by how few calls there were.
so I changed my mind about not wanting to audit them.

Merry Christmas!

--js


