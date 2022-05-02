Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF55171B0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:36:55 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXAT-0005xq-Sl
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlX7w-0004Rs-CY
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlX7t-00025L-Fz
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651502052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y4gHm6z08NyF/GhYmvjiPcdewrvVxbz5blC4iISow9E=;
 b=Qc7NCtvHFQBbkc9c59K8Doada+HitpMXDMBMYSfht8j/8MKWcs9Kcpd4v678yEFGMvCnzS
 OJMl0LP/ua3uZZBYZNApsR91TT5Vz/S+kpnXcCkab7/kHjC57vgyskbJPyjRDgnv9IV9GD
 0nZzgtyPvMCjsUzbAaQVBpas5ph9DWo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-tkZxGK6WNia39MhZuL2Aww-1; Mon, 02 May 2022 10:34:11 -0400
X-MC-Unique: tkZxGK6WNia39MhZuL2Aww-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2f9299dfb81so17652047b3.6
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=y4gHm6z08NyF/GhYmvjiPcdewrvVxbz5blC4iISow9E=;
 b=0gyJVtdxBkcBNDbIBa7rYfAyr9ftdwkFFEKlZV4XNtBuk30Hb+2kouCg+NrQGF/5JU
 pim5bS2TtKt+5A3At2+EGRQ5mYYEVgH8Si8kDnaH2obtydJsh6NMvH95qreE1Myhu9RH
 hhuJtFHcUX4OC2MSk4cEnWcXRAmH5uMOlZX4zLKWvknX5i20+S3o0vUt19kjdJ5WZSdF
 i+giRNRTPcZtJ4lZK8annHvAydjTfpXLQChD/WrpkFuRCM/MkHJF6QmElGpFORHP5+m8
 0R6+5v/crZ3ot2Zwn8vNzxJXvVkcmzdD/u2q52oh1zWjFsP1uOg0nfwVJYOKJGuyTLdL
 PObQ==
X-Gm-Message-State: AOAM530TOQ/iTSTgdPXRpWcZKEkgN5k1a+hRK8I1kUQdAErx6BjLUCrm
 hiBpnfP9czK3OJ2Je0yAssMRRMo15f56hvrrD/OwkJ6z8a/ZecAwp9kYGTQmyzz6WVqAo1v0GPJ
 11p8JmRDRqWuUHqPnF/ExdFpKfUqdMN4=
X-Received: by 2002:a05:690c:110:b0:2ec:2d79:eee1 with SMTP id
 bd16-20020a05690c011000b002ec2d79eee1mr12166815ywb.21.1651502050436; 
 Mon, 02 May 2022 07:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJxtFPEaiBxuHSOIsG3BmCgOEKBMTYw12GaoALwJ/OQj9u3kr726+mLqUv+9WgHorNw5wps1AML5jQqnzaY4w=
X-Received: by 2002:a05:690c:110:b0:2ec:2d79:eee1 with SMTP id
 bd16-20020a05690c011000b002ec2d79eee1mr12166784ywb.21.1651502050198; Mon, 02
 May 2022 07:34:10 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 10:34:09 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
 <20220429154758.354610-7-abologna@redhat.com>
 <874k28s4hs.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <874k28s4hs.fsf@pond.sub.org>
Date: Mon, 2 May 2022 10:34:09 -0400
Message-ID: <CABJz62PTMG6GvZM7nCGxLAb0YhDuA-Yn-q+iNgcZb4=Wpq-Mfw@mail.gmail.com>
Subject: Re: [PATCH 6/7] qapi: Drop unnecessary horizontal spacing in comments
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 10:50:07AM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> > -# @writeback:   true if writeback mode is enabled
> > -# @direct:      true if the host page cache is bypassed (O_DIRECT)
> > -# @no-flush:    true if flush requests are ignored for the device
> > +# @writeback: true if writeback mode is enabled
> > +# @direct:    true if the host page cache is bypassed (O_DIRECT)
> > +# @no-flush:  true if flush requests are ignored for the device
>
> I'm no fan of horizontally aligning descriptions, because when you add a
> longer name, you either realign (I hate the churn) or live with the
> inconsistency (I hate that, too).

We seem to be in violent agreement on the topic, but it's apparent
that other people feel diffently :)

> I doubt changing to a different alignment now is useful.  The next
> patch, however, drops the alignment entirely.  Possibly useful.
>
> Thoughts?

My rationale for splitting things the way I did is that, if dropping
the horizontal alignment entirely was not considered desirable, we
could at least get rid of the extra whitespace. But if you think that
the benefit from the half measure doesn't offset the cost of the
churn it causes, I'm happy to drop these hunks and go straight from
the current status to no horizontal alignment at all in one fell
swoop with the next patch.

> > -# Since:  0.14
> > +# Since: 0.14
>
> This one is TAG: TEXT, whereas the one above is a multiple @NAME:
> DESCRIPTION.  Extra space in the latter can provide alignment.  Extra
> space in the former is always redundant.  I'd take a patch dropping
> these obviously redundant spaces without debate :)

Okay, I'll respin this so that the first patch drops all extra
whitespace in contexts where horizontal alignment is either not
attempted or not possible, and the second one implements the more
controversial changes.

-- 
Andrea Bolognani / Red Hat / Virtualization


