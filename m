Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDF6C2652
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 01:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pePrQ-0004GD-Oa; Mon, 20 Mar 2023 20:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pePrM-0004Fo-Md
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 20:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pePrK-0004m9-T3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 20:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679358492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRbwWg5rg8YIMGirGci7fxvgL/Eera6inDPnKKJfl5w=;
 b=PLON+UpbNe1jnNNb+H/q2QSXK0uUDPm8NOLL8cHZLa0NToVrKyTPK4oeTYfcZX1FiRm4qM
 sIkz/Y7xAEwBMLww1aDth1/uWrfAURKwOIrewV78Aqo8BEEUQjBpCpXPJD245uMRn53YNQ
 q6i3m93tMNMArvT+dAAAxLu6Uu50NzA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-LXW0Q_q8OVi3kOiJyx51Eg-1; Mon, 20 Mar 2023 20:28:11 -0400
X-MC-Unique: LXW0Q_q8OVi3kOiJyx51Eg-1
Received: by mail-pf1-f200.google.com with SMTP id
 y186-20020a62cec3000000b00627df3d6ec4so3782751pfg.12
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 17:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679358490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRbwWg5rg8YIMGirGci7fxvgL/Eera6inDPnKKJfl5w=;
 b=MIPA2Uv7j3VzerGV6emC8/IM5KCCseNSPzsUIVUNqivs8FuTlmjnBs47BDaB7brm29
 TNg0Kr320MAjh6rnfTrtXv6SCHFUquLjp4u5CGTaeXI9vT0ydWla3po8F59woO9lqZwM
 TzhNs58Rdu7urcSmD/9Gupb4/PmQlxvqBWyKPIctdVVZm9I4oJvO7EikORWRERB8mU49
 qz9oDJG1SO8ETHBy0m1C2kFU99/u4GcYM/50ghoGWYY66yenJuiyOwfu7gEgeNwNDjY1
 939EFm4p5N/eABFhCk2q65SgWL/OyMj6bDcJRmijG4++/Y2Xa/Z3Gd1Owue5mhMa7OZp
 pQ/A==
X-Gm-Message-State: AO0yUKULq+jyAbZ5QbZRthdgMubPf9g2jOYVD9WS9Cn1FYlBGRbcsSFo
 5bJES860yiVaOqE8p2lX0FbQUYc1p+rskKOeY9SjI6VCnvvo3RFDOevxb4m8SzcsBQssqHlbjEG
 mBueKNsbGYYQ8PSnTwb7YB5bFSSIyVBA=
X-Received: by 2002:a65:568c:0:b0:503:77cd:8748 with SMTP id
 v12-20020a65568c000000b0050377cd8748mr142229pgs.8.1679358490149; 
 Mon, 20 Mar 2023 17:28:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8dfW34AFNqh57AClPwUq7MUjeVU1/Ci7bUGCFw/mbCJ5sSWeDTECTw+GEvzxPd6T5r/XoS0Tkw0Ve2gTZwXPE=
X-Received: by 2002:a65:568c:0:b0:503:77cd:8748 with SMTP id
 v12-20020a65568c000000b0050377cd8748mr142220pgs.8.1679358489801; Mon, 20 Mar
 2023 17:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230320105404.637661-1-berrange@redhat.com>
 <00341422-35d7-7091-5be4-808e1431f113@yandex-team.ru>
In-Reply-To: <00341422-35d7-7091-5be4-808e1431f113@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Mar 2023 20:27:58 -0400
Message-ID: <CAFn=p-bFgZYJO5bMbAXXJkdtov5CiEC2YAx6AN_DOF0B_i+OKg@mail.gmail.com>
Subject: Re: [PATCH] python: honour message limit when using pre-opened socket
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Mon, Mar 20, 2023 at 8:20=E2=80=AFAM Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> On 20.03.23 13:54, Daniel P. Berrang=C3=A9 wrote:
> > The default message recv limit in asyncio is smaller than our needs, so
> > when opening connections we override it. This was done when opening a
> > connection using a socket address, but was missed when using a
> > pre-opened socket file descriptor.
> >
> > This latent bug was exposed when the QEMUMachine class was enhanced to
> > use socketpair() when no socket address was passed by:
> >
> >    commit bd4c0ef409140bd1be393407c04005ac077d4574
> >    Author: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >    Date:   Wed Jan 11 12:01:01 2023 +0400
> >
> >      python/qemu/machine: use socketpair() for QMP by default
> >
> > Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>
> Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
> Thanks!
>
> --
> Best regards,
> Vladimir
>

Thanks x3. Will stage in both places.

--js


