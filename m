Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C976D3D41
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:24:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjDaJ-0007I8-Rj; Mon, 03 Apr 2023 02:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjDaE-0007Fn-2m
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjDaB-0000zy-0v
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680502939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ke0XOLjHyP51AZrx6au9pHWRsLphMBn4QLOm46d90k=;
 b=aLruUzYi35UEtgoVBuslYLnZaOsoVJj0B7D6a5gtoZjy3gtz5rbCZyvSpA8COmQX+70eKZ
 2vZ5n74zHRFrHRO6h1IuMT8wVNMBOXBWhEYrh+TyJAxLyBF7qZQNNmftHSk2v3eFNNbPKo
 kusldfJ0Tv4bkGFOyItOe/VJnZfV3jE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-qz1yvOKfM3ebFQxxURVUQw-1; Mon, 03 Apr 2023 02:22:16 -0400
X-MC-Unique: qz1yvOKfM3ebFQxxURVUQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83D85858289;
 Mon,  3 Apr 2023 06:22:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C67741415117;
 Mon,  3 Apr 2023 06:22:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FC7321E6926; Mon,  3 Apr 2023 08:22:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Ryo ONODERA <ryoon@netbsd.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Kyle
 Evans <kevans@freebsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org>
Date: Mon, 03 Apr 2023 08:22:12 +0200
In-Reply-To: <20230330101141.30199-5-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 30 Mar 2023 11:11:34 +0100")
Message-ID: <871ql1lc2z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We are a bit premature in recommending -blockdev/-device as the best
> way to configure block devices, especially in the common case.
> Improve the language to hopefully make things clearer.
>
> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  qemu-options.hx | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..9a69ed838e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,10 +1143,14 @@ have gone through several iterations as the featu=
re set and complexity
>  of the block layer have grown. Many online guides to QEMU often
>  reference older and deprecated options, which can lead to confusion.
>=20=20
> -The recommended modern way to describe disks is to use a combination of
> +The most explicit way to describe disks is to use a combination of
>  ``-device`` to specify the hardware device and ``-blockdev`` to
>  describe the backend. The device defines what the guest sees and the
> -backend describes how QEMU handles the data.
> +backend describes how QEMU handles the data. The ``-drive`` option
> +combines the device and backend into a single command line options
> +which is useful in the majority of cases.

-drive may look simpler from afar, but it really is a hot mess.  Sadly,
we can't get rid of it until we find a replacement for configuring
onboard block devices.  We might be able to clean it up some if we
accept compatibility breaks.  A new convenience option would be less
confusing, I guess.

>                                            Older options like ``-hda``
> +bake in a lot of assumptions from the days when QEMU was emulating a
> +legacy PC, they are not recommended for modern configurations.
>=20=20
>  ERST

These older options and the non-option argument are simple macros for
-drive:

    IMG-FILE                    -drive index=3D0,file=3DIMG-FILE,media=3Ddi=
sk
    -hda IMG-FILE               -drive index=3D0,file=3DIMG-FILE,media=3Ddi=
sk
    -hdb IMG-FILE               -drive index=3D1,file=3DIMG-FILE,media=3Ddi=
sk
    -hdc IMG-FILE               -drive index=3D2,file=3DIMG-FILE,media=3Ddi=
sk
    -hdd IMG-FILE               -drive index=3D3,file=3DIMG-FILE,media=3Ddi=
sk
    -cdrom IMG-FILE             -drive index=3D2,file=3DIMG-FILE,media=3Dcd=
rom
    -fda IMG-FILE               -drive if=3Dfloppy,index=3D0,file=3DIMG-FILE
    -fdb IMG-FILE               -drive if=3Dfloppy,index=3D1,file=3DIMG-FILE
    -mtdblock IMG-FILE          -drive if=3Dmtd,file=3DIMG-FILE
    -sd IMG-FILE                -drive if=3Dsd,file=3DIMG-FILE
    -pflash IMG-FILE            -drive if=3Dpflash,file=3DIMG-FILE

What assumptions do you have in mind?

I think you need at least Kevin's Acked-by for this.


