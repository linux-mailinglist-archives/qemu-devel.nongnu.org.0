Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7451BED1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:05:32 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmaEd-0006Z9-6C
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmaCG-0004vz-0c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:03:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmaCD-0004DF-CD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651752179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2iSH6xkfKUjinrWuKmMviU+Y/48wSR/OaBiIiSpbvI=;
 b=eFv8Yez14P9wHSNZd80D1bsfYQXhRaUJZaU/g8PDLEIHFkypr2pDhwgFe+dhT27EFbFP6N
 xEVxEFIG5cwz51brlG4nMKb1YzAOORAqvp/qPVtVmUjG96LmfZ9NnVcK7FEhufp7IrPV29
 M9mWuI7M+uUL7bfITSYYYQf1NVj02fA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-bwK6-PeUOnqjWd4imBeTAw-1; Thu, 05 May 2022 08:02:51 -0400
X-MC-Unique: bwK6-PeUOnqjWd4imBeTAw-1
Received: by mail-pg1-f200.google.com with SMTP id
 64-20020a630843000000b0039d909676d5so2077882pgi.16
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 05:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S2iSH6xkfKUjinrWuKmMviU+Y/48wSR/OaBiIiSpbvI=;
 b=oS20iViKp+VW9O61CmcXVb3QJ+faiYsykG+eJPa/Q3KcD/x360JDP1KhlMKqJi4VRq
 p1V1ZmPetyw3feYrMHLpPJA7YlEvJfK1kaCS13RCoZOKqmr5iUD/p4tJRwUpyu9KKKlz
 q2c8Qr4bDN3wFzWzQVHhRfTBZ3bnNmhWnhMmoztlhTyOyivRjpaAtjcjQoKYgnRTczU7
 lxQRSNwFVnpS4KJKgjpTgoxXMqBAfVVh3YH4QJ5rUGByNGF1qI904VvGeX9UMRqRnc3D
 WXIP10+X9pykQ3AAcSutlSebCzpIbKltY21t8EOiO3JdWn36L/PDMINpO7JN/94qftp5
 M99A==
X-Gm-Message-State: AOAM531US0vXxSBFqckipLPuUABg0EXQKa4Xl7oQYgAfD0p8+TAonxRo
 kTgVjRj3ux/bR0GlW5xBBKZBe25D/40Jq6TefCqtmbrarK7+FWcqxJrKza+64h0pEbZBuer434R
 55wAxqdu8I0bRAj7FZvVQOVn8XplbK0U=
X-Received: by 2002:a63:5355:0:b0:3aa:2752:1553 with SMTP id
 t21-20020a635355000000b003aa27521553mr22116092pgl.254.1651752169834; 
 Thu, 05 May 2022 05:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl7Z1/4orpXFu9uNRzHmDV/SjYrL1n5zkhTqJCMX1W5LftC7i+gb9664E8qDElBeWc6op5ZTyBDsBi9r2lTB8=
X-Received: by 2002:a63:5355:0:b0:3aa:2752:1553 with SMTP id
 t21-20020a635355000000b003aa27521553mr22116074pgl.254.1651752169566; Thu, 05
 May 2022 05:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-4-pbonzini@redhat.com>
 <CAJ+F1CLyTN90uBhc5W8i8i_Vre+FsMU3O-OXUy53kf-4EWxRiQ@mail.gmail.com>
 <CABgObfZaucTwU5vo5JKLabiBEKg7dEPhqYv+vSDvbHS72bDk1A@mail.gmail.com>
 <YnOh0To8iqUfjlnu@redhat.com>
In-Reply-To: <YnOh0To8iqUfjlnu@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 May 2022 14:02:37 +0200
Message-ID: <CABgObfZf-NmTEfN95tcSL2SHkqnLjF7+8oOavZkFypGvGLRL4A@mail.gmail.com>
Subject: Re: [PATCH 3/5] net: slirp: switch to slirp_new
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

On Thu, May 5, 2022 at 12:07 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> > > It was introduced in v4.1.0, but I don't see a minimum libslirp versi=
on check.
> >
> > In fact 4.3.0 is needed for version 3 of the struct
>
> Adding a dep on version 4.3.0 is not desirable. Ubuntu 20.04 has
> version 4.1.0, and we want to be able to drop slirp submodule
> when we drop Ubuntu 18.04 (hopfully in this dev cycle).

Ok; slirp_init's functionality corresponds to version 1, so I'll use either
version 1 of the struct or 4.

Paolo


