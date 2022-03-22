Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457B4E44CF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:14:15 +0100 (CET)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWi5F-0005yi-K0
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:14:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWi3c-0004SD-6i
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWi3Y-0004xP-Vj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647969148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDBOwWVg0iozTcp/9SBR119dvAKit3JFSOValJKWGzs=;
 b=CZn8iB4M0tvir5d/VSW7wO/Ufiyp7P6b+AR8LE7WTd4p71KwlL/S32RX5qZcnxGGB7Bprk
 z1dmo8ugqmSomfTU8Gs2uHaem0UmqLtUMAYYD58aUddr4pcRyMiMF3BpH69wwnwq0OOckq
 N5ZYi8q7nTRUmavyFEpW31Z/dUQ94W4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-QQ0pRL_xMTCRi05AfQf9Yg-1; Tue, 22 Mar 2022 13:12:25 -0400
X-MC-Unique: QQ0pRL_xMTCRi05AfQf9Yg-1
Received: by mail-vk1-f199.google.com with SMTP id
 11-20020a1f010b000000b0033f7d226659so66588vkb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rDBOwWVg0iozTcp/9SBR119dvAKit3JFSOValJKWGzs=;
 b=Oo3Mvcg6cJ6E7cgFbL+t2b3szI1bGDJgBno3B4KOlqd6treus/AkrAJL/7HByhy4ON
 dedTwyT911mVt5zPT7INi1Ns7JzLANpTDV8NecD6V9TR8hUDiRv4zftXbk1nV3I6dOLV
 dqhNH5hnBkbDYVR3WTeSq25RzJ75YRqRk0kVV/IlEI9CTb1Bg0c7iRPcrD1Mo7D/gPxo
 6F9kPGiAbybujVPt0i0yjV039Zzo/d7xQycVoIfDX1EDpNqEKTW/hdzdaJuHPIWeHYfq
 gkEtSyQYYh6rLkeMCC1CHVwVXl+7+SK2xRM4I4fdiwIIiizXhZp8eR0tXJVqItKcd4eS
 F8kQ==
X-Gm-Message-State: AOAM532QYl9YuspaEIh8eckpJq0pNSY+XE1aI0qvOeeZenZSdrrsTn4E
 JCeCFKeix44reN6Ds2hTRJxaQzkalkct7O0byuO2kiFGHCo7fDVlan8tTMrrom0D7z8qP5a8z+n
 sb28aYLWtTEcUJHd02bMtMJXZhKnPhI8=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr9064789vsv.35.1647969144432; 
 Tue, 22 Mar 2022 10:12:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcW7VcP+mhVtS0+arepD7vRinWwfmZqHGjyNlCGZU9g5RF7Zcqq30cEuZK9dmN7mKi1zszqDTRMqg8mV2h/SE=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr9064781vsv.35.1647969144243; Tue, 22
 Mar 2022 10:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-13-jsnow@redhat.com>
 <8489d28e-8a4a-b857-560d-4451739d9f2c@redhat.com>
In-Reply-To: <8489d28e-8a4a-b857-560d-4451739d9f2c@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 13:12:13 -0400
Message-ID: <CAFn=p-b3fFLq_s4Y4dbv_yK6DjaYw0BJHtRAtBR88mPTKU+Fog@mail.gmail.com>
Subject: Re: [PATCH 12/15] iotests/migration-permissions: use assertRaises()
 for qemu_io() negative test
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 12:37 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 18.03.22 21:36, John Snow wrote:
> > Modify this test to use assertRaises for its negative testing of
> > qemu_io. If the exception raised does not match the one we tell it to
> > expect, we get *that* exception unhandled. If we get no exception, we
> > get a unittest assertion failure and the provided emsg printed to
> > screen.
> >
> > If we get the CalledProcessError exception but the output is not what w=
e
> > expect, we re-raise the original CalledProcessError.
> >
> > Tidy.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   .../qemu-iotests/tests/migration-permissions  | 28 +++++++++---------=
-
> >   1 file changed, 14 insertions(+), 14 deletions(-)
>
> Just like Eric I don=E2=80=99t find it so tidy that `ctx` exists outside =
of the
> `with` block, but re-raising the exception is indeed better, so:
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

"Sorry about Python."

You still have the object, but __exit__() will have been called, so
resources will have been freed, references to live objects severed,
etc. unittests is designed around this for Exception testing, etc.
It's not a *real* scope. It just looks like one.

I'll add a little note in the commit message for the next person who wonder=
s.

--js


