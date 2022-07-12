Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895057122C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:15:37 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9BG-000128-13
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oB97B-0006Ow-KU
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:11:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oB978-000729-MO
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657606277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSMp5jB2COhxD+hOVmRQfzHqqFvDAZONVF0lQ9VL4cU=;
 b=aS8Zgq0p+Mc2JAXc/C3WAE2yNDrgO01gEQtu4ruw5Fbp+O/CRaz03+Zi8T2CkkchQjPRwI
 kqpthvLo9hMFDOBzWY+QpI0gPwX2BzFGUWlBf2t9OAhoJ+JqNFyEG+H1sVEhejfpU71lZK
 sIac+PpqMJjVo16Lgn9SobaU8ljW9yE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-1plUTqS-MVmTXNgl2AyPLg-1; Tue, 12 Jul 2022 02:11:10 -0400
X-MC-Unique: 1plUTqS-MVmTXNgl2AyPLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1CCF1D33863;
 Tue, 12 Jul 2022 06:11:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5D32026D64;
 Tue, 12 Jul 2022 06:11:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25BA021E690D; Tue, 12 Jul 2022 08:11:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com,  berrange@redhat.com,
 kraxel@redhat.com,  pbonzini@redhat.com,  f4bug@amsat.org,
 vivek.kasireddy@intel.com
Subject: Re: [PATCH v4 2/2] ui/gtk: a new array param monitor to specify the
 target displays
References: <20220711233959.32219-1-dongwon.kim@intel.com>
 <20220711233959.32219-3-dongwon.kim@intel.com>
Date: Tue, 12 Jul 2022 08:11:08 +0200
In-Reply-To: <20220711233959.32219-3-dongwon.kim@intel.com> (Dongwon Kim's
 message of "Mon, 11 Jul 2022 16:39:59 -0700")
Message-ID: <87ilo2uagz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Dongwon Kim <dongwon.kim@intel.com> writes:

> New integer array parameter, 'monitor' is for specifying the target
> monitors where individual GTK windows are placed upon launching.
>
> Monitor numbers in the array are associated with virtual consoles
> in the order of [VC0, VC1, VC2 ... VCn].
>
> Every GTK window containing each VC will be placed in the region
> of corresponding monitors.
>
> Usage: -display gtk,monitor.<id of VC>=3D<target monitor>,..
>        ex)-display gtk,monitor.0=3D1,monitor.1=3D0
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  qapi/ui.json    |  9 ++++++++-
>  qemu-options.hx |  3 ++-
>  ui/gtk.c        | 30 ++++++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 413371d5e8..ee0f9244ef 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1195,12 +1195,19 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @monitor:     Array of numbers, each of which represents physical
> +#               monitor where GTK window containing a given VC will be
> +#               placed. Each monitor number in the array will be
> +#               associated with a virtual console starting from VC0.
> +#
> +#               since 7.1

I dislike repeating the type (here: array of numbers) in the
description.

Suggest something like

   # @monitor:     List of physical monitor numbers where the GTK windows
   #               containing the virtual consoles VC0, VC1, ... are to be
   #               placed.  (Since 7.1)

Missing: what happens when there are more VCs than list elements.  Can
you tell us?

>  #
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*monitor'       : ['uint16']  } }
>=20=20
>  ##
>  # @DisplayEGLHeadless:

[...]


