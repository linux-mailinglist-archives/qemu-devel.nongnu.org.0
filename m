Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1EF50B33C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:49:17 +0200 (CEST)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhoya-00043y-Np
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhon2-0005aE-9O
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhon0-00067a-GK
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSIk7JEe//gy2ETTVJl2PgUsNuh/1zivNi9P97F8NeM=;
 b=NdGDtHKiS4rAgoyHppy0q/ybDWrkWLrW7r4DaZ6H1cRcbFmOFyC+1rtytilyKP0e7J1RCG
 VAcFdZFWF3Jt4IpXWh/zp+KjOSkxH5HQ3W/G1b6ftTRrEHJM1KwTq5IxrDKRfZityrXbyH
 kbXF2JcTEke2IlxTogy6pe9dyHNRzWU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-54hYU2UdPP2RvmfWgkSRdQ-1; Fri, 22 Apr 2022 04:37:16 -0400
X-MC-Unique: 54hYU2UdPP2RvmfWgkSRdQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2ec1914e315so65622977b3.23
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 01:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=vSIk7JEe//gy2ETTVJl2PgUsNuh/1zivNi9P97F8NeM=;
 b=GEUp9mmHiUiysFbuMoaIB2OI01ZVs60c71lkTQmfOEvjWQmYvWVagtnzbt9t/mP49w
 D17BGsSzp52+FLKBmAXX+LLTevJMPONeYjgLV0bOAkVdw2c0YQ+RUtKSpdPyVov2MehA
 kMBp/yqZMLITt1chFr/N5BkT0qNnapfuFqyVpfWG70jDVSOPlZWONe9pJeDMHpJBz8R8
 VnBtAMpjvZ2LYT75BALb0MtgBKqYhxdTW1VrzJG+yHgVxrhj3L5EL+bLQhjDvxj5C/LD
 7UJzcaEIxfSJBhNj3aVTezJHgLw/ba6C9sjN4eAe2ICFwpWucvqc+twEb5hJ5fnRHxmy
 sdjA==
X-Gm-Message-State: AOAM533c/LTSA0le+QyV61pzMQ+GxktsOGJr7IWHwPsFvT+49BOyn2pp
 a5hmGtQWAVAf52h9ocliCUdwZmEVgwzNhTH7fQwwsRP8wXDyv9n92jgCvqdv0TTQgeKgROE8rIK
 wCAgjVTSwsh5X9L181NDff4q7JThocCs=
X-Received: by 2002:a0d:ff05:0:b0:2ea:25ed:d714 with SMTP id
 p5-20020a0dff05000000b002ea25edd714mr3693316ywf.454.1650616636070; 
 Fri, 22 Apr 2022 01:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxlK3Bi+ghj5pFQZN+SmFwNgOig8GUWujoXGsbYiX7Sa5i13e1Bva38B4M+tVUPFgl8VDHfT6qO8LRQmFh4PY=
X-Received: by 2002:a0d:ff05:0:b0:2ea:25ed:d714 with SMTP id
 p5-20020a0dff05000000b002ea25edd714mr3693309ywf.454.1650616635899; Fri, 22
 Apr 2022 01:37:15 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 01:37:15 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
 <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
 <CAFn=p-a4P4c9AcoT4mTmikQYyf=09brMP3D464XgHQUzO+th+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-a4P4c9AcoT4mTmikQYyf=09brMP3D464XgHQUzO+th+A@mail.gmail.com>
Date: Fri, 22 Apr 2022 01:37:15 -0700
Message-ID: <CABJz62Njvm8ibGif87xykZD2cj6SDkAN=6rPVzY9Fen4OpGvgg@mail.gmail.com>
Subject: Re: Create qemu-project/py-qemu.qmp repo
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 05:00:16PM -0400, John Snow wrote:
> On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani <abologna@redhat.com> wrote:
> > I think I would go with "python-qemu-qmp". Having a dot in the name
> > of a git repo is not very common AFAICT, and I wouldn't rule out the
> > possibility of some GitLab feature or other tooling breaking or
> > misbehaving because of it.
>
> The idea is to have the repo name resemble the Python package name, which
> is "qemu.qmp". For Python, it's customary to have the package name match
> the import name. The import name is "qemu.qmp".
>
> I tested this name on GitLab and it appears to work just fine.

I'm concerned about issues that you'd only trigger when using
certain, perhaps less common, features.

Here's an example of such an issue from just a year ago:

  https://gitlab.com/gitlab-org/gitlab/-/issues/224669

There's an epic tracking more issues of the same kind, though
admittedly most were addressed four years ago:

  https://gitlab.com/groups/gitlab-org/-/epics/3740

Up to you whether you feel confident enough that you're not going to
run into issues later.

> > If you're really keen on saving those few extra keystrokes, maybe
> > "pyqemu" is a better prefix than "py-qemu"? I don't know, it just
> > looks more natural to me.
>
> I'd add "py:" as a prefix, but the colon doesn't work as a filename in many
> places, so I suggested "py-".
>
> Thus, all together, "py-qemu.qmp".
>
> (I could spell out "python", I just prefer the shorter prefix because it's
> explanatory enough as-is and I like keeping git checkout names short. My
> favorite color of bike shed is blue.)

You can absolutely have short names locally even when things are
spelled out in GitLab.

Anyway, in this case my taste in names is clearly simply different
from yours and you should absolutely feel free to ignore my opinion
on the matter :)

-- 
Andrea Bolognani / Red Hat / Virtualization


