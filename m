Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18F40B3CF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:55:36 +0200 (CEST)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAmU-0003fw-8K
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQAFP-0002rn-DW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQAFL-0001lf-OQ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631632877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oXC9RKAIxS7S94fOIxgOcFEpLzBymYBPiC3nAluHIOA=;
 b=au5/dRRgCV+9BMETyB6mJgKvMJzZips7lvo4vL8Dig2Ji2rxY1SdKjCtvbc+ViSRDeGOdA
 NC6VgEpMYeJ8xv3l5aiM4TQQt3MQ+E2XHR8Id/Y5zIHt6TQw63CF+591DgxrIlQO2zBtI6
 tdxiDGUCEv6HWbqG1vG8XMfwHkmV34A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-pXPgBQvcND6xH7Qujltn6w-1; Tue, 14 Sep 2021 11:21:11 -0400
X-MC-Unique: pXPgBQvcND6xH7Qujltn6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1FC110151E3;
 Tue, 14 Sep 2021 15:21:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 767E819736;
 Tue, 14 Sep 2021 15:21:07 +0000 (UTC)
Date: Tue, 14 Sep 2021 10:21:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v2 2/2] ui: Add a plain Wayland backend for Qemu UI
Message-ID: <20210914152105.3rjmjvjtmpubvv6e@redhat.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
 <20210913222036.3193732-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210913222036.3193732-3-vivek.kasireddy@intel.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 03:20:36PM -0700, Vivek Kasireddy wrote:
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  configure         |   8 +-
>  meson.build       |  33 +++
>  meson_options.txt |   2 +
>  qapi/ui.json      |   3 +
>  ui/meson.build    |  52 ++++
>  ui/wayland.c      | 628 ++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 725 insertions(+), 1 deletion(-)
>  create mode 100644 ui/wayland.c

UI review:

> +++ b/qapi/ui.json
> @@ -1112,6 +1112,8 @@
>  #                DRI device. Graphical display need to be paired with
>  #                VNC or Spice. (Since 3.1)
>  #
> +# @wayland: The Wayland user interface.

Missing a '(since 6.2)' tag.

> +#
>  # @curses: Display video output via curses.  For graphics device
>  #          models which support a text mode, QEMU can display this
>  #          output using a curses/ncurses interface. Nothing is
> @@ -1135,6 +1137,7 @@
>      { 'name': 'none' },
>      { 'name': 'gtk', 'if': 'CONFIG_GTK' },
>      { 'name': 'sdl', 'if': 'CONFIG_SDL' },
> +    { 'name': 'wayland', 'if': 'CONFIG_WAYLAND' },
>      { 'name': 'egl-headless',
>                'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
>      { 'name': 'curses', 'if': 'CONFIG_CURSES' },

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


