Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88C305F77
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:24:37 +0100 (CET)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mgO-0003EO-9j
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4mew-0002mt-8Y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4met-0007He-OS
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611760982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R/NwL5Iq+Re4T8xuzWr0kCsx0P+SBpDlljfRKvxaTzE=;
 b=bED5+A5t/6KyNJwmo4Omg1Vs4Ji0e+bVTEKkZS+ACzLkYoXs99qhtvy8ULKDkbnk+7ze4J
 M0mPYgO+X9dKMdWIYL7NXxv6fla+rSq63YiGkKDA3K15ozlaGRHiA/AVMNpOw+huhQ/o1J
 7jILbbzarMzUuEfvoZNCg3yZAH5tofE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-N8KQ5jgINhqcWLPk2wV7WQ-1; Wed, 27 Jan 2021 10:23:00 -0500
X-MC-Unique: N8KQ5jgINhqcWLPk2wV7WQ-1
Received: by mail-qk1-f200.google.com with SMTP id i11so1722289qkn.21
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 07:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/NwL5Iq+Re4T8xuzWr0kCsx0P+SBpDlljfRKvxaTzE=;
 b=hYTZ5HTYlnDjvhAUmP551EM/josMv1Ask3iTbUuecRuOSHbO818dxz7rk4jDbrCdRc
 JiV8VpAOZGhXlYG32Y4rXi8M/lxuBiYHdXn6Y/0QHCw1IbqFVaxt/vuJxOu+Xg2zlcYb
 Ok7z9gOnc/01pMWXDyMCbARme1NZjWRXF0gTWxfPdpIHksLrVoyPYCoAGnitp/iZflY6
 Z/CjW9MfPhmRGZSS0fL6c443SK+XcBXjLY5SliPyeb9WYR302GorIxXzbcHiSQBDAAbJ
 oPS3uqPbOdEZ5fvDQ3Y71TTGITBAdNvRxL1uWVDYm2Wm9OYo6X53f+52cWEERfrdA2fJ
 e/2Q==
X-Gm-Message-State: AOAM531HNIpuzoN+8k+XNlwZ6dQdrUzBL/82WcqL6CBx4fny3QV+ryFv
 549EZXzAJEH4mNt2VULCE0d3kvsk8SgsxlOuR/M8KrQCchZtlLD3yr+ngg4EXeDOdwUmbWQ+8He
 0wfz7LAQRsGU++g6OdY2mi/8rX9DbtTA=
X-Received: by 2002:a37:4e05:: with SMTP id c5mr11026226qkb.349.1611760980242; 
 Wed, 27 Jan 2021 07:23:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFK9N/UWg4Svbe14NdVejAuGqVnJ858T2JrL8Yz4HFo20Tg9/ScBfyWRWf5g4ipQvzN6l0IaYMEBRA5JQhP8o=
X-Received: by 2002:a37:4e05:: with SMTP id c5mr11026208qkb.349.1611760980047; 
 Wed, 27 Jan 2021 07:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
 <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
 <20210127144909.22dd778e@bahia.lan>
 <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
 <20210127160920.062e47f0@bahia.lan>
In-Reply-To: <20210127160920.062e47f0@bahia.lan>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 16:22:49 +0100
Message-ID: <CAOssrKc=kSQQLmrAR2VrKfDzkyNDEAAa5qusK1x6+-fCM4+yCA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 4:09 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Wed, 27 Jan 2021 15:09:50 +0100
> Miklos Szeredi <mszeredi@redhat.com> wrote:
> > The semantics of O_CREATE are that it can fail neither because the
> > file exists nor because it doesn't.  This doesn't matter if the
> > exported tree is not modified outside of a single guest, because of
> > locking provided by the guest kernel.
> >
>
> Wrong. O_CREAT can legitimately fail with ENOENT if one element

Let me make my  statement more precise:

O_CREAT cannot fail with ENOENT if parent directory exists throughout
the operation.

I'm sure this property is used all over the place in userspace code,
and hence should be supported in strict coherence (cache=none) mode.

For relaxed coherence (cache=auto) I'm not quite sure.  NFS is usually
the reference, we'd need to look into what guarantees it provides wrt.
O_CREAT and remote racing unlink.

Thanks,
Miklos


