Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934845E57D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:43:20 +0100 (CET)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqRCp-0004IW-1C
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRBs-0003cH-Sx
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:42:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRBq-0002mm-3U
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637894537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qC08+PZ7B0QB+chmT4TKLUIbOdl59WjNFA/VgAqZNOM=;
 b=Xtyd/RRf5DwC6MbQRiqf6kBOeFaUK9+62I/0UKl/TEfOg4JsNt53KuHx/XWsVprrvo3G4y
 8iIv8sx1wkL6i2/UQjj8DRrd8LJIdg0zCYtvwUoggGCXe1UxYdotLSSEz1gEK7+3iM/Dk6
 aVcn7PG6gNkHQD2i2yLe6mSVdRaiykw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-9qKtvWjUPw2DqqnQk-hgYQ-1; Thu, 25 Nov 2021 21:42:14 -0500
X-MC-Unique: 9qKtvWjUPw2DqqnQk-hgYQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 r20-20020a2eb894000000b0021a4e932846so2582109ljp.6
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qC08+PZ7B0QB+chmT4TKLUIbOdl59WjNFA/VgAqZNOM=;
 b=dxkLrRckhhTr/ebdEHvMWGQWEIbTFOvh/7WietQh2TcSQZsDPFqKRAGQDBZWX3yCQ1
 hvDKUDRySiH9gWNkGkFSgmjdrUK9H6iJ1Rdb/LGa7cs2zhjSxwjgUbbFWVZptjfS7zK0
 HNHIJZsHbLbFWkQag4UwQP9Molznv0rm+c3iKzpeE04HMT5Wq0OHoPUVvBa9lWZi3upW
 PNqUXuSmOwfFvWzynHaJbTf7C9KhV/QsyBhD1kyRtULsGe3ERSmrvjS3NcLn9daF5W0/
 v/TMiI0d8NKtvizfVNfH0tQCSIoMCPQVaIgnUIzoikmLLmdqWLt9dBEoJnj0Pij++Iy8
 754w==
X-Gm-Message-State: AOAM530NvZa84besWqIUdpBkw/w9cLHmMcC0tl3ymNZudgK3bQ9DzGSk
 J19FDh7ryaA+BQkpdUXxBFc/KHhw/J2zlO2Qk/7x+TOIpefGDpEKnhdF1e2K4LQTZmn7ws5bZdu
 onxBzU1fQrP5fK+NWPum4DXoPDHH54i0=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr29538482ljm.369.1637894533333; 
 Thu, 25 Nov 2021 18:42:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1h9/keqLv82mZ6AEZ4pVucP4MXXCcCSHZjZk8rKK4/YpQ1FMl+ST2Bm5lRqZ7IjE4CNw96pfgJxiLUzSB/SA=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr29538460ljm.369.1637894533070; 
 Thu, 25 Nov 2021 18:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20211125022046.10433-1-jasowang@redhat.com>
 <2250f7d7-09ca-3bfb-4d95-d0c20da7f47f@redhat.com>
 <20211125110959-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211125110959-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:42:02 +0800
Message-ID: <CACGkMEtJC59qso7iAGfNArZrvgm+0j7c+Ka=DUsYYWGhVKMB3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 12:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 25, 2021 at 09:34:32AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 11/25/21 03:20, Jason Wang wrote:
> > > We only process the first in sg which may lead to the bitmap of the
> > > pages belongs to following sgs were not cleared. This may result more
> > > pages to be migrated. Fixing this by process all in sgs for
> > > free_page_vq.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/virtio/virtio-balloon.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > Typo "virtio" in subject.
>
> Yes, it's an annoyingly common typo.  If using vim, I suggest:
>
> ab virito virtio
>
> in your vimrc.

Right, actually I'm using flyspell with emacs. I will add a dedicated
detection like this if it's possible.

Will fix it.

Thanks

>
> --
> MST
>


