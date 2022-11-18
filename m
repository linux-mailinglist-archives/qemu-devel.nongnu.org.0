Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F462EC1C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:51:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovrRq-00048b-IT; Thu, 17 Nov 2022 21:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1ovrRo-000487-08
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1ovrRl-0006va-Sy
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668739780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfEgF+YnDcrz58802Bnq+raRdyAza/2VDYqRFW7Z+cA=;
 b=dSo9UEFMrsW1PdIM/46TkYdCRUgZJbSQEw1HSGVNueFddQ70Pdneas/9wbQM9z2ehwmDu0
 URtlHJgMZtdw9AZAvDZUqdFvy/r4Kb1hOsUpK/PNEtdkwRKgQMrRB93dD+9BJsQXjslfLj
 NC2sQC0v9G4vT3segxYfNjg6dJHlI0w=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-5MzCAGUjN3aPa1CFzOSRsg-1; Thu, 17 Nov 2022 21:49:38 -0500
X-MC-Unique: 5MzCAGUjN3aPa1CFzOSRsg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-13cce313cd3so1710229fac.20
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 18:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfEgF+YnDcrz58802Bnq+raRdyAza/2VDYqRFW7Z+cA=;
 b=LondjZNf8pOzzcAplxU2locrvNcxryB3YqWCek0eiNQWMzXWQ8Hmm1nwU16aXsjP0G
 Wl2RZlqSCxGDySKx6GnEIgDFI/JOPQekyvxovOAD4C3jmUB1gswXMlblxq7+QXXC9+KS
 MPtCmUJ6RANQHXc2wfNoeEiVkr4o2Zj+mHGjf9xQg/YV84JIc+7al3tm2xz1ffI3Fqcj
 IXKOuMYmPw5OWb82864kfhqkAmPu99F2/ZmF1YYEUGOrFhgdWqeEzGypmbPOi4r0u+zm
 9FZy8msTD+k+qGyLkZy3bDZfHPtgndxDvGehTaXeX8XjNSCCjiHKnRBEKj7hE28/AtJA
 2KlQ==
X-Gm-Message-State: ANoB5pl5CpXNYHAm5v757x5bRI8S7SSIBiTciwu1jF3vjLsBN14kPzsE
 Hf+Vq542hJYuvcF+DQAhB5SbFjR/MIfiP7zy93jNYt9peAgm6BvC6Cr0NEie1q3Fa5oAuKVNLEp
 jec+cr4QhnogcH6yqiB7Z/TnoiZ5SrBI=
X-Received: by 2002:a05:6808:7dd:b0:35a:cb43:413 with SMTP id
 f29-20020a05680807dd00b0035acb430413mr5585778oij.84.1668739778108; 
 Thu, 17 Nov 2022 18:49:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf74ZE9kqRS5uycMw5CzIXmoXv+bJ5/PDelpEBW4Z1YxKLmFvwlHjgHS4l2C66MIQfi1tRYPyhT4lI4Jc5D8Qxw=
X-Received: by 2002:a05:6808:7dd:b0:35a:cb43:413 with SMTP id
 f29-20020a05680807dd00b0035acb430413mr5585768oij.84.1668739777955; Thu, 17
 Nov 2022 18:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
 <CACGkMEsHccBVEaruA5QKVmSsCsg0agedqrO2K8JEaBSP=Y1-Jg@mail.gmail.com>
 <CAJFLiB+kQ9mjy6V7uKXwoONhJ9-uiw2O3v-7WoM-B5Zaiv-jXg@mail.gmail.com>
In-Reply-To: <CAJFLiB+kQ9mjy6V7uKXwoONhJ9-uiw2O3v-7WoM-B5Zaiv-jXg@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Fri, 18 Nov 2022 10:49:01 +0800
Message-ID: <CAPpAL=wjbwLfzqgg62LZJCNsEOUJmTd+z4CDh4MUw-DPcyWHxw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Endianess and coding style fixes for SVQ event idx
 support
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QE tries to test the parameter "event_idx=3Don". In both environments
"virtio-vdpa + vp_vdpa" and "vhost_vdpa + vp_vdpa", there is no
network connectivity issue after the guest boot up.

Tested-by: Lei Yang <leiyang@redhat.com>


> From: Jason Wang <jasowang@redhat.com>
> Date: Tue, Nov 1, 2022 at 10:42 AM
> Subject: Re: [PATCH 0/4] Endianess and coding style fixes for SVQ
> event idx support
> To: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Cc: <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
> Michael S. Tsirkin <mst@redhat.com>
>
>
> On Sat, Oct 29, 2022 at 12:02 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Some fixes that did not get in time for the last net pull request.
> >
> > Eugenio P=C3=A9rez (4):
> >   vhost: Delete useless casting
> >   vhost: convert byte order on SVQ used event write
> >   vhost: Fix lines over 80 characters
> >   vhost: convert byte order on avail_event read
>
> I've queued this for rc1.
>
> Thanks
>
> >
> >  hw/virtio/vhost-shadow-virtqueue.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
>


