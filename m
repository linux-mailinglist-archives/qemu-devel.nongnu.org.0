Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9C36F65B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:24:06 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNVN-0004lV-Hl
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNS0-0001H9-9D
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNRy-0004aS-54
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619767233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mnUoLs2M+w2FtPj4hx3E8DqxPH3f2XmjyIjniFZo0NQ=;
 b=RB7F99fkoqGxekjTJ3tWia6L/AqFQByFMXVk5iIVp3kwmMomvAo+PlEyTo2itAwqs0WGXc
 38ILIU92EDqrPjkm8e5QWDBgvbr6Ytn3E1mxeHeYCuYWgPiGx2Bplr9lphFJU5HmlmufDe
 M6iHXM/q8ZZhiMOu3mJjMBQPYaokIsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-VR_u4AQqNr-JBZ9maJpY3A-1; Fri, 30 Apr 2021 03:20:31 -0400
X-MC-Unique: VR_u4AQqNr-JBZ9maJpY3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3110F1A8A71;
 Fri, 30 Apr 2021 07:20:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72254679E7;
 Fri, 30 Apr 2021 07:20:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAE8B113525D; Fri, 30 Apr 2021 09:20:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
Date: Fri, 30 Apr 2021 09:20:24 +0200
In-Reply-To: <20210429234705.83206-2-gustavo@noronha.eti.br>
 (gustavo@noronha.eti.br's message of "Thu, 29 Apr 2021 20:47:04
 -0300")
Message-ID: <87wnsk5jd3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gustavo@noronha.eti.br writes:

> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
>
> Applications such as Gnome may use Alt-Tab and Super-Tab for different
> purposes, some use Ctrl-arrows so we want to allow qemu to handle
> everything when it captures the mouse/keyboard.
>
> However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> at an earlier part of the event handling chain, not letting qemu see it.
>
> We add a global Event Tap that allows qemu to see all events when the
> mouse is grabbed. Note that this requires additional permissions.
>
> See:
>
> https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> ---
>  qapi/ui.json    | 15 ++++++++++
>  qemu-options.hx |  3 ++
>  ui/cocoa.m      | 73 +++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 89 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..77bc00fd0d 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1088,6 +1088,20 @@
>  { 'struct'  : 'DisplayCurses',
>    'data'    : { '*charset'       : 'str' } }
>  
> +##
> +# @DisplayCocoa:
> +#
> +# Cocoa display options.
> +#
> +# @full-grab:       Capture all key presses, including system combos. This
> +#                   requires accessibility permissions, since it performs
> +#                   a global grab on key events. (default: off)
> +#                   See https://support.apple.com/en-in/guide/mac-help/mh32356/mac

Please indent like this

   # @full-grab: Capture all key presses, including system combos. This
   #             requires accessibility permissions, since it performs
   #             a global grab on key events. (default: off)
   #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac

I hope the link is permanent.

> +#
> +##
> +{ 'struct'  : 'DisplayCocoa',
> +  'data'    : { '*full-grab'     : 'bool' } }
> +
>  ##
>  # @DisplayType:
>  #
> @@ -1153,6 +1167,7 @@
>                  '*gl'            : 'DisplayGLMode' },
>    'discriminator' : 'type',
>    'data'    : { 'gtk'            : 'DisplayGTK',
> +                'cocoa'          : 'DisplayCocoa',
>                  'curses'         : 'DisplayCurses',
>                  'egl-headless'   : 'DisplayEGLHeadless'} }
>  

With indentation tidied up, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


