Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5A4E8703
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 10:48:08 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYOZC-0002yF-Se
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 04:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYOXO-0002Au-0x
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 04:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYOXK-0004lk-TC
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 04:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648370769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFx1qGPdeX96IhTjENRZgxZdOcx2gFo8KkWL2pT+R/k=;
 b=LQB5yYYo9ze485l4DT2+i70buqF+yQDJ1vFOnP3AQihLYo85DG7X1ys3T9UjawiTcloX9x
 b8lfubTlVK5bQ6BMzF/4dc58czZjNTqf8obSUAxB2ikqQRDpwLKY1VHMqW+G9GESYK6ThX
 lJ58pYZxDPCrWVexf9gSCShtiGnP/x4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-Bmqlnpe1NWKmFN5UbSBFlw-1; Sun, 27 Mar 2022 04:46:06 -0400
X-MC-Unique: Bmqlnpe1NWKmFN5UbSBFlw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2e9eb7d669fso25867977b3.14
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 01:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NFx1qGPdeX96IhTjENRZgxZdOcx2gFo8KkWL2pT+R/k=;
 b=gjXHGhHXM3VCzL38SCmRaSFlt30Cd4bLejB/ZW3dpdeO1go4fY/gGpfd3RwejnTQIV
 imHsBQQvVoYbQwPU8YzhlrZawiYXKHCFdcoAkfhrZo2mHFVoJUbqOVKYaoVaFnqSapRi
 pgQ/T312cAESxEYSYvpcXM1bSgR6gsqBt5I8ct+wer+XyiTIXtOLPprzmAUi4JZzIX1H
 tplXibIzWL8U5y1iEAi9zpVbjsLU3JhZCn4KiXIDa8ogCQOOVPYfqNnSX0IPWiVIypH+
 KWe1BrUwElsJFEjlm6d0jtDEIHExjuJbwipZ3yA4Z18kmzvUsVtquw4llLdkTvdgOrru
 IeUQ==
X-Gm-Message-State: AOAM531ZyXVqj2KcYWMTiUGLnydkZL6bkCt027aeT2+64legbIvXWCfK
 cIYST+2oghcXb/P7mEBj9ZweP2gUVUUkR7Jkaa1HQmmdg2Z0r5Cix9+lQHhCT3tMSC+JicrLSmw
 O5Q6KHjw9eHCFg6ur4fvZ5GetqQV6uUo=
X-Received: by 2002:a5b:452:0:b0:637:7583:580 with SMTP id
 s18-20020a5b0452000000b0063775830580mr16412524ybp.559.1648370766040; 
 Sun, 27 Mar 2022 01:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTasnRKO/jDfnC+vdw544147LnbOsZM66LGtAuQpZOYft5rJeJGtJWWXAsd/S++zxyMrw21jntSi3NH5BiZQo=
X-Received: by 2002:a5b:452:0:b0:637:7583:580 with SMTP id
 s18-20020a5b0452000000b0063775830580mr16412510ybp.559.1648370765862; 
 Sun, 27 Mar 2022 01:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-4-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 27 Mar 2022 12:45:55 +0400
Message-ID: <CAMxuvaz5jj1Wyom=ihbRoffgb-GVh3X6MSO0RCYNz9Oov5yb9g@mail.gmail.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Luiz Capitulino <lcapitulino@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Sat, Mar 26, 2022 at 12:04 AM John Snow <jsnow@redhat.com> wrote:
>
> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
>
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
>
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
>
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrang=C3=A9, 81/609
> - Eduardo Habkost, 10/609
> - Marc-Andr=C3=A9 Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
>
> (All of which appear to have been written under redhat.com addresses.)
>
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
>
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
>
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  python/qemu/aqmp/qmp_shell.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.p=
y
> index 35691494d0..c23f1b1928 100644
> --- a/python/qemu/aqmp/qmp_shell.py
> +++ b/python/qemu/aqmp/qmp_shell.py
> @@ -1,11 +1,12 @@
>  #
> -# Copyright (C) 2009, 2010 Red Hat Inc.
> +# Copyright (C) 2009-2022 Red Hat Inc.
>  #
>  # Authors:
>  #  Luiz Capitulino <lcapitulino@redhat.com>
> +#  John Snow <jsnow@redhat.com>
>  #
> -# This work is licensed under the terms of the GNU GPL, version 2.  See
> -# the COPYING file in the top-level directory.
> +# This work is licensed under the terms of the GNU LGPL, version 2 or
> +# later. See the COPYING file in the top-level directory.
>  #
>
>  """
> --
> 2.34.1
>


