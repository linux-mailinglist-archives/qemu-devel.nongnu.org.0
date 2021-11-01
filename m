Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D2442126
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:57:46 +0100 (CET)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdRA-0005CE-TK
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcWu-0006vL-81
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcWq-0002F4-8o
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjCfgUuM7riP3j0CjLK3Jx+RvDbRzI6kQxUKdEYPO3E=;
 b=AQ4qGPujBcK2MWEdLmmwP9ZquQP7V7wvAMsZHH3vx16nm1ZOUHK6ZrJfDwCvS4zomP0wDe
 5wev7rbIQ+QuGJXHFt6qHBgWbwUoReOWPg7OX1jPuW0GA0slFvQDc74j5pzm5b42ggLdKk
 K05N1HAjl2OW88FyBvJf5eDRnTX6lSs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-AhF_YP4NMbe52H7F8Xj4vA-1; Mon, 01 Nov 2021 14:59:28 -0400
X-MC-Unique: AhF_YP4NMbe52H7F8Xj4vA-1
Received: by mail-pj1-f69.google.com with SMTP id
 y22-20020a17090a6c9600b001a38db472c0so9474006pjj.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qjCfgUuM7riP3j0CjLK3Jx+RvDbRzI6kQxUKdEYPO3E=;
 b=UZc/D3xEM74x20Il6lC5MLObaVC6XOTTUWE9/lABue1mZp9b+TrIzldJ3JB95XINl4
 IuxIbvkc8qzBtJgz6KRQ9KOIPYjfS6TU/6YpSBR5H54y9dcB3+pdTMF46gyXHO4sB3T5
 nbw3sedQhWT/CRlY/UuEEJW5de5s1kYKkZehQf+caIk95TgkjnfCf50RCGLK6suZg3fe
 nIOY9QRp6p7fdI8lL4Kzm3/cNIamBbfH65YhI9Fh26WDkkiQiyO64yMxwN/e7CXoIYuh
 Aj9vtkrCnVXQ3qAoZwga81oA5kpPYqNOl5RqqpWidEYcQwKjI3PXfqhgOvqIrhWPFOej
 F0ig==
X-Gm-Message-State: AOAM531uFRQM/e84iWyxIXFMjzB+2qFTxua84rB7f8GwsEtoELgN6VN2
 SwDi9C1syIhbGm50OMEqu5xE2p/by16UiZZHwfpMuakdcB51vnY6MLkjaflrwWmsx8RU7fWNNOP
 O/C0dtUTqtEiGD8wCI2RWsIV425Nwj+U=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr31084384pfd.46.1635793167166; 
 Mon, 01 Nov 2021 11:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnek0Lnexlt+dacyhiZAeOIqpp+je3ChhxC2RtK79LZVfhnm5kRSiq9u2bKN5Rr/axUON3JJtId2To4cY6tDU=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr31084349pfd.46.1635793166884; Mon, 01
 Nov 2021 11:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-4-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:59:00 -0300
Message-ID: <CAKJDGDZhVX96L2ncsMHVc=zLi0xfwmF6XmqnqAxsekv=7wR9pQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] tests/acceptance: Introduce QemuUserTest base class
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Similarly to the 'System' Test base class with methods for testing
> system emulation, the QemuUserTest class contains methods useful to
> test user-mode emulation.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 2b9b5dd27fe..2f59e171e49 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -20,6 +20,7 @@
>  from avocado.utils import cloudinit
>  from avocado.utils import datadrainer
>  from avocado.utils import network
> +from avocado.utils import process
>  from avocado.utils import ssh
>  from avocado.utils import vmimage
>  from avocado.utils.path import find_command
> @@ -300,6 +301,23 @@ def tearDown(self):
>          self._sd =3D None
>
>
> +class QemuUserTest(QemuBaseTest):
> +    """Facilitates user-mode emulation tests."""
> +
> +    def setUp(self):
> +        self._ldpath =3D []
> +        super(QemuUserTest, self).setUp('qemu-')

Consider using PEP3135,

super().setUp('qemu-')

> +
> +    def add_ldpath(self, ldpath):
> +        self._ldpath +=3D [os.path.abspath(ldpath)]

The use of the append method is more common here:

self._ldpath.append(os.path.abspath(ldpath))

> +
> +    def run(self, bin_path, args=3D[]):
> +        qemu_args =3D " ".join(["-L %s" % ldpath for ldpath in self._ldp=
ath])
> +        bin_args =3D " ".join(args)
> +        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
> +                                            bin_path, bin_args))
> +
> +
>  class LinuxSSHMixIn:
>      """Contains utility methods for interacting with a guest via SSH."""

Besides some Python related suggestions, the code looks good.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>
> --
> 2.31.1
>


