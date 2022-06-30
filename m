Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D804562641
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 00:53:02 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o731w-0005BC-ML
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 18:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o72ye-0003e0-Fv
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o72yb-0002cL-MK
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656629372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw6cJAn1M3aVWcwQqeoAkA0iHvKaezuZzoNKGnIBD1U=;
 b=V5ygDYJbdQggyeo7+N2rW2qzx2Ca56PuC1oAk9VMFDtAa07oH68GaXKud7rpd+Z/noreg8
 2AUVPqNOsyRJSpSvTfydc35hYL+OkeSyJfFqtZhn9zjHrteT7W1rPNTEnH9wcKkS8OjSpX
 1mp+XOuKb5N9H29UVulNm5RYHUEu7+s=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-2Lo6wwJyM_e9dPk49vFxPg-1; Thu, 30 Jun 2022 18:49:30 -0400
X-MC-Unique: 2Lo6wwJyM_e9dPk49vFxPg-1
Received: by mail-ua1-f72.google.com with SMTP id
 cd23-20020a056130109700b0037f725b9345so166177uab.12
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 15:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lw6cJAn1M3aVWcwQqeoAkA0iHvKaezuZzoNKGnIBD1U=;
 b=TL+l6NbD4q3l9zUY4TTPeszn33t5edYMY0OLxEXzYxH3adNjKGs7d87UdQuYeom9tl
 QiZG7+jSUH2sPoyLUwv8BAfHK+jPNuy9OZd1LKwWkSkUQ8oZmQy9IdD5nD64lHse9SYg
 VQoZxhKhtTeSPgJLdLvqsTlwTuPfc47EDZk3KCDTUDHFB4y0Gnhl+VQLlLkfjXL7DRed
 LKFuRkd1GULqB0lmfQUdOJW7jY23WbOywaOle24wsOePhjE3jr0FQyRnx+uv1WXi2guK
 dk73sH6lfXwDikRaXTxcPr2gXvIJgPuu58vIkBpzkcPfDingqXEkErgrryHNl1smWZyv
 0EBA==
X-Gm-Message-State: AJIora8CUXTuelj+Bh+5f5xJSxSquYmWXxa5oNf1L2dOQ5js34P4/YIm
 M9wQWR0WYi6oM76q2h3XzQoi+2ng807yOVA0VvXiKlbpkJhEyFLxh3JFdUFAotOLVxf1JGa+qJD
 dIbplbY0lH0nSpEXg4K+HNiG91Qq+j0s=
X-Received: by 2002:a05:6102:24d:b0:356:6d6b:9e1e with SMTP id
 a13-20020a056102024d00b003566d6b9e1emr9465278vsq.11.1656629370402; 
 Thu, 30 Jun 2022 15:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1siQ5db3+XwWzMm35C9Xt/2PDmFjlT9kj4uOm0GnG9VBmTEBbv1ZzHrEIA3DXiaLJAoj6bXd4iC7t7m6zd5c0o=
X-Received: by 2002:a05:6102:24d:b0:356:6d6b:9e1e with SMTP id
 a13-20020a056102024d00b003566d6b9e1emr9465273vsq.11.1656629370210; Thu, 30
 Jun 2022 15:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Jun 2022 18:49:19 -0400
Message-ID: <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> As reported earlier by Richard Henderson ("virgl avocado hang" thread), a=
vocado
> tests may hang when QEMU exits before the QMP connection is established.
>
> v2:
>  - use a socketpair() for QMP (instead of async concurrent code from v1) =
as
>    suggested by Daniel Berrange.
>  - should not regress (hopefully)
>
> Marc-Andr=C3=A9 Lureau (3):
>   python/qmp/protocol: add open_with_socket()
>   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
>   python/qemu/machine: use socketpair() for QMP by default
>
>  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
>  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
>  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
>  3 files changed, 51 insertions(+), 16 deletions(-)
>
> --
> 2.37.0.rc0
>

For anything that touches python/qemu/qmp/*, may I please ask that you
submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?

(I'll review them in the meantime on-list just in the interest of
moving things along.)

--js


