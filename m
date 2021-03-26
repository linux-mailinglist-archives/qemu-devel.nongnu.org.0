Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274C34AAD0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:03:21 +0100 (CET)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnzc-0003mL-7e
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnvs-0001KG-Ar
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnvn-0004Kk-9Y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bj0V3qJjPhz1yevFk9n6dsTZ4Sr9PwnMCcD0B4es06E=;
 b=FIacLXm33QAXUGPOfB1TKfFr3Ykp7TDrHKKSgRZc/dyXKfaC2xg3YeBHAwQ/3lKWv7Tc15
 9OZbHZHv7c9gml4L/q13q/Hh82z5wTBGLB4EPfnU4WwtolM3XXbLvD6Ilk47x8TfpxPqHz
 Q7+XIOLvOI/MXZi6dihvl2VEVy5FtDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-qhl-LPsIOWqVcwzTRpUfYA-1; Fri, 26 Mar 2021 10:59:20 -0400
X-MC-Unique: qhl-LPsIOWqVcwzTRpUfYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8111018B9EC4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 14:59:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D820E5DEAD;
 Fri, 26 Mar 2021 14:59:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 631F211327E1; Fri, 26 Mar 2021 15:59:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 3/7] ui/vdagent: add mouse support
References: <20210326092448.367016-1-kraxel@redhat.com>
 <20210326092448.367016-4-kraxel@redhat.com>
Date: Fri, 26 Mar 2021 15:59:11 +0100
In-Reply-To: <20210326092448.367016-4-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Fri, 26 Mar 2021 10:24:44 +0100")
Message-ID: <87czvmhsg0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> This patch adds support for mouse messages to the vdagent
> implementation.  This can be enabled/disabled using the new
> 'mouse' parameter for the vdagent chardev.  Default is on.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
[...]
> diff --git a/qapi/char.json b/qapi/char.json
> index 6e565ce42753..586ef2137368 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -395,10 +395,12 @@
>  #
>  # Configuration info for vdagent.
>  #
> +# @mouse: enable/disable mouse, default is enabled.
> +#
>  # Since: 6.0
>  ##
>  { 'struct': 'ChardevVDAgent',
> -  'data': { },
> +  'data': { '*mouse'    : 'bool' },
>    'base': 'ChardevCommon' }
>  
>  ##

Ah, now ChardevVDAgent isn't the same as ChardevCommon anymore.

Please format like

     'data': { '*mouse': 'bool' },

for consistency with the rest of the file.

Acked-by: Markus Armbruster <armbru@redhat.com>


