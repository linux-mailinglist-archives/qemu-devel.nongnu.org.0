Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54652480D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 10:44:54 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4RI-0008Ac-Mv
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 04:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np44Y-00073f-QL
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np44W-0004eC-P1
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652343674;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdgNZt/rQpUcoPLXVRdG0YvOOQZJjBQGmJFjPdtyntU=;
 b=R193ADxO1F/ul8gFLcMM2YkgsLTfEXw1QcjPdfUdcZHS21espy1/5Ey3XXQuiv5/PKlAzK
 sNCeW1l4hng6pjUGujfNBVAQjkrWCtwfdH7sPAH9aWukMLgJqs0TI1KFp77YbVOmLDoTyv
 ycWN32xiAh0tIXd0nLRGugPlyEiEcs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-2ogykoPDOQmAbuoStqIq9w-1; Thu, 12 May 2022 04:21:13 -0400
X-MC-Unique: 2ogykoPDOQmAbuoStqIq9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F6AC185A7B2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:21:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF252166B2D;
 Thu, 12 May 2022 08:21:01 +0000 (UTC)
Date: Thu, 12 May 2022 09:20:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
Message-ID: <YnzDa/Nzu9TfpQpN@redhat.com>
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220511175147.917707-3-thuth@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 07:51:46PM +0200, Thomas Huth wrote:
> The "-display sdl" option still uses a hand-crafted parser for its
> parameters since some of them used underscores which is forbidden
> in QAPI. Now that the problematic parameters have been removed, we can
> switch to use the QAPI parser instead.
> 
> This introduces the new "DisplaySDL" QAPI struct that is used to hold
> the parameters that are unique to the SDL display. The only specific
> parameter is currently "grab-mod" which is modeled as a string, so that
> it could be extended for other arbitrary modifiers later more easily.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/ui.json            | 17 +++++++++-
>  include/sysemu/sysemu.h |  2 --
>  softmmu/globals.c       |  2 --
>  softmmu/vl.c            | 70 +----------------------------------------
>  ui/sdl2.c               | 13 ++++++++
>  5 files changed, 30 insertions(+), 74 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


