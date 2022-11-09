Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E081E62250F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 09:07:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osg5n-0005cy-NM; Wed, 09 Nov 2022 03:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osg55-0005YH-2x
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osg4x-0005ko-9w
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667981098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvtr7Yn66qh/ZrSaluxOBlyBawBZU/0+hOV77++24uQ=;
 b=J5+5oQN5VYO86WEBo6Tdo2OtTjFB4XJTb8QwhI6cCIeeuQ+iFR6AoyVI2rxuVKxeA7FWhq
 FBu64DCK46Nh8cSLBnCFcK+2xIgLIYMTLi1CrB72HWC7l6B+5zm6eHkc9TKlbWQa4fP8PW
 2uiGfp/Kx8vLCUZXr7OhsSX7+xaf1pE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-5SQb94iSOK6TzJgA7NKFlQ-1; Wed, 09 Nov 2022 03:04:54 -0500
X-MC-Unique: 5SQb94iSOK6TzJgA7NKFlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E19F101A56D;
 Wed,  9 Nov 2022 08:04:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD5018EB4;
 Wed,  9 Nov 2022 08:04:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C811F18000B2; Wed,  9 Nov 2022 09:04:52 +0100 (CET)
Date: Wed, 9 Nov 2022 09:04:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
Message-ID: <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
References: <20221108162324.23010-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108162324.23010-1-cfontana@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 05:23:24PM +0100, Claudio Fontana wrote:
> The GTK Clipboard implementation may cause guest hangs.
> 
> Therefore implement a new configure switch --enable-gtk-clipboard,
> disabled by default, as a meson option.

Hmm, I was thinking about a runtime option, add 'clipboard' bool to
DisplayGTK in qapi/ui.json) and just skip the call to
gd_clipboard_init() unless the option is explicitly enabled ...

I don't feel like vetoing a compile time option though, so in case you
prefer to stick with this:

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


