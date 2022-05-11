Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B7C523A3E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nop8g-0001sj-4N
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 12:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nop6v-00017g-AE
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nop6s-00082G-9j
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652286164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK09xYnNJ01u/1vgJ+hiiYxJRDCIEvIOlg+956QfvII=;
 b=g7BRfte1eWj5nJMw6x22nSK6W0AQAlzz1xisyRlvJyPr/3fRbt2HVRfJ2pZb465yQuPf3B
 /xLHCdpgrjopVpFAOwJxH7MUj9ViSEk1LcQEtwOadKKotNxP/R2KmX3kv4mt/SkvwG+XAU
 HhO75FRhWQDW2ISHYfjZroVnnp8UMRk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-eRvzKilsOuah3-aUyzbKZg-1; Wed, 11 May 2022 12:22:41 -0400
X-MC-Unique: eRvzKilsOuah3-aUyzbKZg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2f9299dfb81so21840997b3.6
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FK09xYnNJ01u/1vgJ+hiiYxJRDCIEvIOlg+956QfvII=;
 b=lknzwWP0LbbKKZgmwFr8hFLlO2EvUurrXGPs6aZYf1ZWjsl6QQBHOUTudLpfPqwABz
 R8Z6ke1DjGsgklct3JBxxOg3FR7EqzAuZDIswsZZGyC1mMPUYVavhEnzKIMXA6E+qyVz
 LfysXOxhPlpqyxudQq4BG7yu+rtECVHAgWAWyGd9xOG3dvRwn580jAiiC7B1tJ+R5iTF
 UmtKLGOlTFmfvGipjaJHn5r5kvJJWQ/d3CbUpcomGQmpQpAg7w4y8iKd9tNaxBWcyzL0
 uKtr5c3sJRBJS3pOqrjZfU5+IY3R/XTnsrlWPXoa2MaRrInyVRjnIoGqWauG6EzX6uHQ
 14OQ==
X-Gm-Message-State: AOAM530ammOC9wpct5Rpeg/bRSbqk3OjW7fRicpOCzjAlL9wMvgSpU7+
 7Bc/Fd8/Pdc8YdJpc8T2SdKigGOsswIkKdUDwcPNFR0thq3x15+UoG93ykElmPI+V3AejEdcvcU
 vLWySb96xYKjtMeTAxL13rrjU0m5shL8=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr26054922ywh.384.1652286159149; 
 Wed, 11 May 2022 09:22:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIv7j6YtyUYGAyrV5LYKlW5jye1Kgf8R5W+GhB2VcqM58+J30cvSMtA6uRL2F1Yav6g/NCk6Vj+CA/S8A6/nQ=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr26054749ywh.384.1652286157463; Wed, 11
 May 2022 09:22:37 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 09:22:36 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
 <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
 <YnvbS7psaEjkrN65@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YnvbS7psaEjkrN65@redhat.com>
Date: Wed, 11 May 2022 09:22:36 -0700
Message-ID: <CABJz62PdyKGfSge4kQd9gCZFGBaH+K53nYSYb+_xrkeXz=tXyw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Victor Toso <victortoso@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 04:50:35PM +0100, Daniel P. Berrang=C3=A9 wrote:
> This would lead to a situation where every struct is duplicated
> for every version, even though 90% of the time they'll be identical
> across multiple versions. This is not very ammenable to the desire
> to be able to dynamically choose per-command which version you
> want based on which version of QEMU you're connected to.
>
> ie
>
>      var cmd Command
>      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
>         cmd =3D BlockResizeArguments{
>            V700: &BlockResizeArguments700{
>              NodeName: node,
>              Size: 1 * GiB
> 	   }
>          }
>      } else {
>         cmd =3D BlockResizeArguments{
>            V520: &BlockResizeArguments520{
>              Device: dev,
>              Size: 1 * GiB
> 	   }
>          }
>      }
>
> And of course the HasVersion check is going to be different
> for each command that matters.
>
> Having said that, this perhaps shows the nested structs are
> overkill. We could have
>
>      var cmd Command
>      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
>          cmd =3D &BlockResizeArguments700{
>              NodeName: node,
>              Size: 1 * GiB
>          }
>      } else {
>         cmd =3D &BlockResizeArguments520{
>              Device: dev,
>              Size: 1 * GiB
>          }
>      }

Right, making the decision at the import level would require adding a
level of indirection and make this kind of dynamic logic awkward.

We shouldn't force users to sprinkle version numbers everywhere
though, especially since different commands will change at different
points in time. It should be possible to do something like

  if !qmp.HasAPI(600) {
      panic("update QEMU")
  }

  cmd :=3D &BlockResizeArguments600{ // really BlockResizeArguments520
      Device: device,
      Size:   size,
  }

or even

  if !qmp.HasAPI(qmp.API.Latest) {
      panic("update QEMU")
  }

  cmd :=3D &BlockResizeArguments{
      NodeName: nodeName,
      Size:     size,
  }

Should be easy enough to achieve with type aliases.

--=20
Andrea Bolognani / Red Hat / Virtualization


