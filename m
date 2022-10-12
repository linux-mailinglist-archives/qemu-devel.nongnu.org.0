Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B445FC28F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:58:26 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXZJ-0000UV-BK
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiXXL-0007Lh-9s
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiXXH-0007nM-Uc
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665564979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dQ2PO+ZwDLRYrAdqppve/5UEWFG0oj7EBUVlJqnNiaE=;
 b=a7l2+1z0bfouB/BAqR37dY9Cfn372w6+RtD3KBwy1rU0374WWjqyS8k4+kccsBn/jOnMma
 BjhKfoZTaWXahaxTxkahOsCA2BYXO4i2qsZmTfdNSeyomCGuCu4vwkR19q+PlMmDHXp//6
 KxmZ5aiMd17BXOq17ZYd1esIVQraiVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-CyUr2gXbN2ahjDHpAUuBxQ-1; Wed, 12 Oct 2022 04:56:18 -0400
X-MC-Unique: CyUr2gXbN2ahjDHpAUuBxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FC0F811E75;
 Wed, 12 Oct 2022 08:56:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 749191121319;
 Wed, 12 Oct 2022 08:56:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79CA621E691D; Wed, 12 Oct 2022 10:56:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bryce Mills <brycemills@proton.me>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2] gtk: Add show_menubar=on|off command line option.
References: <NWO_zx1CT5Aj9vAXsRlqBppXd63gcKwL9V1qM1Meh36M_9tCw-EsCnfpvONXhHjmtKIUoSuCy9OO6cHS7M8b0oHBOCZG6f1jZ4Q2tqgI2Qo=@proton.me>
Date: Wed, 12 Oct 2022 10:56:16 +0200
In-Reply-To: <NWO_zx1CT5Aj9vAXsRlqBppXd63gcKwL9V1qM1Meh36M_9tCw-EsCnfpvONXhHjmtKIUoSuCy9OO6cHS7M8b0oHBOCZG6f1jZ4Q2tqgI2Qo=@proton.me>
 (Bryce Mills's message of "Tue, 11 Oct 2022 13:58:21 +0000")
Message-ID: <87sfjte7yn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing maintainers.  Doing that reduces the risk of maintainers missing
your patch.  You can use scripts/get_maintainer.pl to find them.

Bryce Mills <brycemills@proton.me> writes:

> The patch adds "show_menubar" command line option for GTK UI similar to
> "show_tabs". This option allows to hide menu bar initially, it still can
> be toggled by shortcut and other shortcuts still work.
>
> Signed-off-by: Bryce Mills <brycemills@proton.me>
> ---
>  qapi/ui.json    |  5 ++++-
>  qemu-options.hx |  3 +++
>  ui/gtk.c        | 15 ++++++++++-----
>  3 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 286c5731d1..0abba3e930 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1199,13 +1199,16 @@
>  #               interfaces (e.g. VGA and virtual console character devices)
>  #               by default.
>  #               Since 7.1
> +# @show-menubar: Display the main window menubar. Defaults to "on".
> +#                Since 8.0
>  #
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
>                  '*zoom-to-fit'   : 'bool',
> -                '*show-tabs'     : 'bool'  } }
> +                '*show-tabs'     : 'bool',
> +                '*show-menubar'  : 'bool'  } }
>  
>  ##
>  # @DisplayEGLHeadless:

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


