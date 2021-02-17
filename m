Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0531DA69
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:29:56 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMtv-0003lV-Io
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMrZ-0003DN-N6
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMrU-00034U-PC
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613568443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bIYNhR7ZnqJhF6CvMhxjgjoOM4wGFsoFzKH2+vWMdW4=;
 b=QpoW5OLr1KOZxu2i58I898RFxR1G7Hz7CPMu1+pAF7c1C45pQYWzCAYWVHeognbjsipjTD
 pmhTfGF9GOP5h1ne/vnlis5Fnrinhua5tuQYL2chSR6K9vGYMJJ0Lrh7HQVfQ+yihYTVfW
 id06thMVq+BtTovX+9GDJaqUMweYpQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-AnaXUdB8NKiiDL0wkSPxrQ-1; Wed, 17 Feb 2021 08:27:21 -0500
X-MC-Unique: AnaXUdB8NKiiDL0wkSPxrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D0A419611A9;
 Wed, 17 Feb 2021 13:27:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E3C5D746;
 Wed, 17 Feb 2021 13:27:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E292D1800398; Wed, 17 Feb 2021 14:27:15 +0100 (CET)
Date: Wed, 17 Feb 2021 14:27:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bruce Rogers <brogers@suse.com>
Subject: Re: [PATCH] spice-app: avoid crash when core spice module doesn't
 loaded
Message-ID: <20210217132715.dptkbqi4kfspev2e@sirius.home.kraxel.org>
References: <20210213032318.346093-1-brogers@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210213032318.346093-1-brogers@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 08:23:18PM -0700, Bruce Rogers wrote:
> When qemu is built with modules, but a given module doesn't load
> qemu should handle that gracefully. When ui-spice-core.so isn't
> able to be loaded and qemu is invoked with -display spice-app or
> -spice, qemu will dereference a null pointer. With this change we
> check the pointer before dereferencing and error out in a normal
> way.
> 
> Signed-off-by: Bruce Rogers <brogers@suse.com>

Added to UI queue.

thanks,
  Gerd


