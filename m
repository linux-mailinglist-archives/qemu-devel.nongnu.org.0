Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB90E6E8030
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBQY-0000LQ-SY; Wed, 19 Apr 2023 13:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBQX-0000L9-2K
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBQT-0006ln-MQ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681924620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rD164R9Mu2b4O0uW8m+A+aULJGF7OvXfKXOCFHRpws=;
 b=dU3pZL7cavg23+MBlkUo5cHBMadfDYdYP16pxeHGwOcCMoft436vPnMfcCkm+peyVvjMoW
 PrdWXxzx11yPyGkkqNRL8elPQGtnu18anPI25SFUkJKJDubRQ28fsc6tf2Po1FRq/EyAxi
 cIk+6mYEjOzdvj2o22ddF6NCfoVNrS4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-NvtRmd9eNtGrzAdVnuhdtA-1; Wed, 19 Apr 2023 13:16:59 -0400
X-MC-Unique: NvtRmd9eNtGrzAdVnuhdtA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-54f97aac3d0so3670627b3.15
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 10:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681924618; x=1684516618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rD164R9Mu2b4O0uW8m+A+aULJGF7OvXfKXOCFHRpws=;
 b=cgd2vDzDg9MFo9X6mUp07pGZK0BTXIMt8l1PuycH9XW0z5SZ/GEBopsP+MY9+S5FX0
 M6Kf6lEl1vVRN3h2Zx8p/ISzUQFv1e7LZ7IgBXbWKTO+y6vYb3XNPQejr1WP2ry505To
 GkfhsF6SSN2/Oy/rVYtmlT9lXberRATH6fEq7JMz27StNN0HxmhCzVilVI4vHuHS7oSP
 ZMmYS0pM6i9SvXnHl9be5hDJ761LodHIgow0hv4wPcWcu/SDgTCAhXEoB5WFOwxQXzi9
 JgeWGTNRGqIJPeE0IeCrbxenSFeruENgjuDkkSygj5/SwMwI0ZGNHwJ3hftbDo67tZeU
 JrSw==
X-Gm-Message-State: AAQBX9f70dAKSnCRgrB3MvzakxcqCil68xCGtRqfCbeu3+SdVUbpY67m
 8oqmTGwrj2+2Y33Z2fl3mC6fYEJcQSwUlOcvsFfWgFZgSxHF9WSNOoqxeEXkiYBdrQJnCLX8lHR
 4uCt7Y+SN+ZoDloBrmwudpHP62psHh9g=
X-Received: by 2002:a25:5052:0:b0:b92:259a:efa3 with SMTP id
 e79-20020a255052000000b00b92259aefa3mr87197ybb.32.1681924618452; 
 Wed, 19 Apr 2023 10:16:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZChr7R+LSGq/7SKJKTKZAFBPqACwidoH9de+lkCvOXKo9aOuzLhtiIfri6Q3iiuWCMg7KPxUfwdhTxYxVye4A=
X-Received: by 2002:a25:5052:0:b0:b92:259a:efa3 with SMTP id
 e79-20020a255052000000b00b92259aefa3mr87169ybb.32.1681924617970; Wed, 19 Apr
 2023 10:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681732982.git.yin31149@gmail.com>
In-Reply-To: <cover.1681732982.git.yin31149@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 19:16:21 +0200
Message-ID: <CAJaqyWcmb=LuH4eaJkkGxcAnPrJ+er=Ysp7Yi6RneFGdTNycCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Send all the SVQ control commands in parallel
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: jasowang@redhat.com, 18801353760@163.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 19, 2023 at 1:50=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.com>=
 wrote:
>
> This patchset allows QEMU to poll and check the device used buffer
> after sending all SVQ control commands, instead of polling and checking
> immediately after sending each SVQ control command, so that QEMU can
> send all the SVQ control commands in parallel, which have better
> performance improvement.
>
> I use vdpa_sim_net to simulate vdpa device, refactor
> vhost_vdpa_net_load() to call vhost_vdpa_net_load_mac() 30 times,
> refactor `net_vhost_vdpa_cvq_info.load` to call vhost_vdpa_net_load()
> 1000 times,

Maybe a little bit too high for real scenarios but it gives us a hint
for sure :). Maybe it is more realistic to send ~10 or ~100 commands?

>  to build a test environment for sending
> multiple SVQ control commands. Time in monotonic to
> finish `net_vhost_vdpa_cvq_info.load`:
>
>     QEMU                            monotonic time
> --------------------------------------------------
> not patched                              89202
> --------------------------------------------------
> patched                                  80455
>

Is time expressed in seconds or milliseconds? I'm going to assume ms.

So let's say all the time was spent in the context switch between qemu
and kernel, this is a save of (89202 - 80455)/30000 =3D 0.3 ms per
command?

Thanks!

> This patchset resolves the GitLab issue at
> https://gitlab.com/qemu-project/qemu/-/issues/1578.
>
> Hawkins Jiawei (2):
>   vdpa: rename vhost_vdpa_net_cvq_add()
>   vdpa: send CVQ state load commands in parallel
>
>  net/vhost-vdpa.c | 150 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 112 insertions(+), 38 deletions(-)
>
> --
> 2.25.1
>


