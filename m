Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA366D9B78
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:00:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkR5p-0003U1-Ef; Thu, 06 Apr 2023 11:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkR5k-0003Sl-PP
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkR5i-0006u9-KT
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680793197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GsBZizno2+kCs81VDujlKZCRielGCfaY1O/eHf9F93o=;
 b=guDA+I3+yRTsv8/IAeDKf829vELcMh6Lj5eIQaRpo0cw7gVagKIeSGT1uMJyfWdluuvgO1
 rF/pNcwa1oHs4yVbiPQo52rHcxOeKGeXvhLhngkHs08nTbd0MFdB03Sc8V+tOKk9YaxLYN
 jpFt2a3/HIbkudbaW+cM3jlMr0Nhwrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-ir5Jt2QQNFKbmug3gbDDlA-1; Thu, 06 Apr 2023 10:59:56 -0400
X-MC-Unique: ir5Jt2QQNFKbmug3gbDDlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7EDD8996E7;
 Thu,  6 Apr 2023 14:59:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0208D2166B26;
 Thu,  6 Apr 2023 14:59:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1AC921E6926; Thu,  6 Apr 2023 16:59:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Michael Tokarev <mjt@tls.msk.ru>,  Thomas Huth
 <thuth@redhat.com>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3] qemu-options: finesse the recommendations around
 -blockdev
References: <20230406095317.3321318-1-alex.bennee@linaro.org>
Date: Thu, 06 Apr 2023 16:59:53 +0200
In-Reply-To: <20230406095317.3321318-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 6 Apr 2023 10:53:17 +0100")
Message-ID: <87pm8hm4ye.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
> way to configure block devices. It seems there are times the more
> human friendly -drive still makes sense especially when -snapshot is
> involved.
>
> Improve the language to hopefully make things clearer.
>
> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>
>
> ---
> v3
>   - more re-wording to try and approach consensus
>   - add explicit warning to -snapshot option
> ---
>  qemu-options.hx | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..4b8855a4f7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,10 +1143,22 @@ have gone through several iterations as the featu=
re set and complexity
>  of the block layer have grown. Many online guides to QEMU often
>  reference older and deprecated options, which can lead to confusion.
>=20=20
> -The recommended modern way to describe disks is to use a combination of
> +The most explicit way to describe disks is to use a combination of
>  ``-device`` to specify the hardware device and ``-blockdev`` to
>  describe the backend. The device defines what the guest sees and the
> -backend describes how QEMU handles the data.
> +backend describes how QEMU handles the data. It is the only guaranteed
> +stable interface for describing block devices and as such is
> +recommended for management tools and scripting.
> +
> +The ``-drive`` option combines the device and backend into a single
> +command line option which is a more human friendly. There is however no
> +interface stability guarantee although some older board models still
> +need updating to work with the modern blockdev forms.
> +
> +Older options like ``-hda`` are essentially macros which expand into
> +``-drive`` options for various drive interfaces. The original forms
> +bake in a lot of assumptions from the days when QEMU was emulating a
> +legacy PC, they are not recommended for modern configurations.
>=20=20
>  ERST
>=20=20
> @@ -1639,6 +1651,14 @@ SRST
>      the raw disk image you use is not written back. You can however
>      force the write back by pressing C-a s (see the :ref:`disk images`
>      chapter in the System Emulation Users Guide).
> +
> +    .. warning::
> +       snapshot is incompatible with ``-blockdev`` (instead use qemu-img
> +       to manually create snapshot images to attach to your blockdev).
> +       If you have mixed ``-blockdev`` and ``-drive`` declarations you
> +       can use the 'snapshot' property on your drive declarations
> +       instead of this global option.
> +
>  ERST
>=20=20
>  DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,

Works for me.  Kevin, what do you think?

Should QEMU warn when -snapshot and -blockdev are used together?


