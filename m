Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865932D365
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:42:03 +0100 (CET)
Received: from localhost ([::1]:38708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnIn-0002nN-Nc
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnGx-00021g-7g
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnGu-00082Z-8B
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614861602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7DP9b4DgfQRkzHRoxIoT/2G5aSA1ovkOxJLoHCwE5T4=;
 b=ObH1HaE490nrlosiGS9xVcPUSXwqLTQxGNvKRPLXYuB2cXIK0FQrNdrQn363tL+nP3QadY
 sJ6xG1nifydfcYycGPEJSQbUjcm2oKIDOAMoVFGk6hA9UDy0mpoLJ5ocpFc3qZugnun1Oi
 ZP501mgFoG3I5+MwZXNXXd1wTSQ9nh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-unY53evyPXuPSl4Iys6nRA-1; Thu, 04 Mar 2021 07:39:51 -0500
X-MC-Unique: unY53evyPXuPSl4Iys6nRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F14F108BD07;
 Thu,  4 Mar 2021 12:39:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFEB95D9C6;
 Thu,  4 Mar 2021 12:39:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13EC618007BE; Thu,  4 Mar 2021 10:04:32 +0100 (CET)
Date: Thu, 4 Mar 2021 10:04:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 7/7] ui/gtk: add clipboard support
Message-ID: <20210304090432.imh3eeylwtkknr4t@sirius.home.kraxel.org>
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-8-kraxel@redhat.com>
 <CAJ+F1C+7aZyDOGB+CD2CubxzTexJ0kBkMx76Zk4zpHiQZuEx9Q@mail.gmail.com>
 <20210303122014.gmgfgz462aa5vuya@sirius.home.kraxel.org>
 <CAJ+F1CJV=BwYsZ70YVxQC+LXxzq_o3G3XCSa-nf=6V+MSqcQ4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJV=BwYsZ70YVxQC+LXxzq_o3G3XCSa-nf=6V+MSqcQ4g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Well, I want gtk deal with the compatibility stuff like all the
> > different target names we have for text ("STRING", "text/plain", ...),
> > and using gtk_clipboard_set_text() seems to be the only way to do that.
> >
> > I'm open to better ideas.

> Basically implement an async version of the Gtk function:
> https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkclipboard.c#L850

Ah, there is a nice gtk_target_list_add_text_targets() helper.
That helps.

thanks,
  Gerd


