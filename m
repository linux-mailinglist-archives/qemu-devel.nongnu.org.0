Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FE39F76F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:16:05 +0200 (CEST)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbaO-0006xR-Cq
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqbYv-0005H5-Nt
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqbYo-0000NZ-AN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623158064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2P6QPetI1OzITDBK5CWKpoCRL6qWL1pE/EctSd+TFmM=;
 b=IM8N4KWXDWFBdVeqw7PBtrKD1+/yo3JjYKlApm9OxdpfsJNgGA/h8KVtGfzvY0gW8NiXLv
 hE7Pf4ztFb7D8Q3qFjiLXbv+koWQl2rxw7zPRZde/f7+fYfRbWNl5onutI78QvaCxq4KcO
 Iyhoq2GQUEwtY/6VhxY86FZIbSNA5qQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59--UMzx0cJPau8EW25sWVYmw-1; Tue, 08 Jun 2021 09:14:21 -0400
X-MC-Unique: -UMzx0cJPau8EW25sWVYmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61372803627;
 Tue,  8 Jun 2021 13:14:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B945189C7;
 Tue,  8 Jun 2021 13:14:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E452113865F; Tue,  8 Jun 2021 15:14:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 0/3] vl: add -object support back into -readconfig
References: <20210524105752.3318299-1-pbonzini@redhat.com>
Date: Tue, 08 Jun 2021 15:14:18 +0200
In-Reply-To: <20210524105752.3318299-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 24 May 2021 06:57:49 -0400")
Message-ID: <87h7i8zefp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> LXD developers have reported that [object] stanzas have stopped
> working in configuration files.
>
> The problem is that QEMU 6.0 switched the creation of objects from
> qemu_opts_foreach to a bespoke QTAILQ, in preparation for supporting
> JSON syntax in -object.  Entries from the configuration file however
> do not go through object_option_parse, and are thus lost.  Of the many
> fixes that are possible, I chose one that is slightly more invasive but
> more consistent with the plans for keyval-ification of options such as
> -M and -accel.
>
> -set was also broken by the same change.  For simplicity I chose
> not to add it back yet, however this series will report the
> breakage instead of failing silently.
>
> The first two patches of this series are thus a reduced version of
> https://patchew.org/QEMU/20210513162901.1310239-1-pbonzini@redhat.com/
> ([PATCH 00/14] vl: compound properties for machines and accelerators),
> with the -set infrastructure removed.  The third is very simple and
> uses the newly-provided hooks to parse objects from configuration files.
>
> Paolo
>
> Based-on: <20210518131542.2941207-1-pbonzini@redhat.com>

This series is now in master.  It doesn't fix the following regression:

    $ cat bug.cfg
    [chardev "mon0"]
      backend = "stdio"
    $ upstream-qemu -S -display none -readconfig bug.cfg
    upstream-qemu:bug.cfg:2: Invalid parameter 'id'
    [Exit 1 ]

Regressed in commit 3770141139 "qemu-config: parse configuration files
to a QDict".

Regressions are hard to avoid when automated tests are lacking.  You
touched it, you own it, now write the tests, please ;-P


