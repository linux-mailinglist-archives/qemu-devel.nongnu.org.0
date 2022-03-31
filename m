Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0F4EDEEC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:38:20 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxoR-0007lS-Cr
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:38:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZxnN-0006yn-F0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZxnK-0005W2-Gg
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648744629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmkfwnQHnev0ErYxTAMsDln5YULXjrAvglQfzvzKV6M=;
 b=cokgrIAjjCuIo47t0XBkd0iKxzzwJ05XhN7295KpFObw04Uqxo8rkE0rB6+THTG1W/G/EJ
 rDHD0cv72NephiWgJr6rz3sPtoB56vY8CpWicx/UBtOL2J7yak0AKeFMOreoF7Xs9mWXId
 bvBtc5hvlRh9sKdivrxlfkIk+x3sfbQ=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-1EKb9lLbO36Xs04M4lT0sw-1; Thu, 31 Mar 2022 12:37:08 -0400
X-MC-Unique: 1EKb9lLbO36Xs04M4lT0sw-1
Received: by mail-ua1-f70.google.com with SMTP id
 s13-20020a056130020d00b0034dfb85694dso70164uac.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 09:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FmkfwnQHnev0ErYxTAMsDln5YULXjrAvglQfzvzKV6M=;
 b=7q9KOpVogn2iIpGsup7UPkhmMloFBy70U2gHeZ4noobchpDfaMpgKgthuU//DW7u/y
 vSwp0PrvHdvluTL87Jhymhb7BqtGSbalHFRSDzhW0Wajc85UfNZClEZsouVz3oOtpbeI
 yrsENWphzE002N+vhnbNX536PPqUj6+vjinkmsDJm3i5u1m+qmo3NC/vwLgKYcO/5bZh
 AJa36glRte3PHhgNyFxIVl0/OFV8nRLRg+jssDJ2Cxc8BhtguKW1Hf+Nx0vs5Vad0A+s
 vb2/2Hwf0qAPJdD5ZmAsuhZUgGdOUt7L4rY35IJU1R7SCzGWv3ZG442qfZ5SxXkVcYsa
 ravg==
X-Gm-Message-State: AOAM531mwdPhN064kv2WUU3QIBaAwxS9i25s6RxypghEpYlVQlmM1qUy
 Fe1KjxrLnLVIURlQyBFK4j7KbCfDgxPtZotRKw4HZOncAS9AQfxE9ROA608MMeABDXSiPoLYZz3
 BXNOG80SK70Mr+NAZtwOJd3viSaUYicU=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr23111563vsa.38.1648744627386; 
 Thu, 31 Mar 2022 09:37:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0BMsS7GIvN7orV0MpPjDS4LUBvdyIf1FQYP7RCTSvOSnM1YaJo0FS84xaCSm5vrGcwjxGySgSwA7s2XVUUiA=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr23111552vsa.38.1648744627135; Thu, 31
 Mar 2022 09:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-6-jsnow@redhat.com>
 <20220325013315.draawyxysnfmgejr@redhat.com>
In-Reply-To: <20220325013315.draawyxysnfmgejr@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 31 Mar 2022 12:36:56 -0400
Message-ID: <CAFn=p-Ye5_4dYYrA95xZpFozOe9hHLxpNn_mMoFZ_MEJEEssng@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] iotests/040: Fix TestCommitWithFilters test
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 9:33 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Thu, Mar 24, 2022 at 02:30:06PM -0400, John Snow wrote:
> > Without this change, asserting that qemu_io always returns 0 causes thi=
s
> > test to fail in a way we happened not to be catching previously:
> >
> >  qemu.utils.VerboseProcessError: Command
> >   '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
> >   '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
> >   'read -P 4 3M 1M',
> >   '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
> >   returned non-zero exit status 1.
> >   =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
> >   =E2=94=83 qemu-io: can't open device
> >   =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.i=
mg:
> >   =E2=94=83 Could not open backing file: Could not open backing file: T=
hrottle
> >   =E2=94=83 group 'tg' does not exist
> >   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81
> >
> > Explicitly provide the backing file so that opening the file outside of
> > QEMU (Where we will not have throttle groups) will succeed.
> >
> > [Patch entirely written by Hanna but I don't have her S-o-B]
>
> Yeah, you'll want that.
>
> > [My commit message is probably also garbage, sorry]
>
> No, it was actually decent.
>
> > [Feel free to suggest a better one]
> > [I hope your day is going well]
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> So giving your S-o-b twice makes up for it, right ;)

This happens when I add a '---' myself into the commit message, and
git-publish sees that the end of the commit message doesn't have a
S-o-B and adds one into the ignored region.
Haven't bothered to fix it yet.

>
> Well, you did say v3 would fix this.  But while you're having fun
> fixing it, you can add:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>


