Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813242918A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 09:11:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU4M7-0003He-Me
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 03:11:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4Ij-0000jB-TY
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4Ii-0000f5-F6
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:07:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hU4Ii-0000dU-0v
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:07:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB266C05CDFC;
	Fri, 24 May 2019 07:07:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEE55B683;
	Fri, 24 May 2019 07:07:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B712811AB5; Fri, 24 May 2019 09:07:33 +0200 (CEST)
Date: Fri, 24 May 2019 09:07:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kumar Gala <kumar.gala@linaro.org>
Message-ID: <20190524070733.5c35ag2hpyy6j4gz@sirius.home.kraxel.org>
References: <20190517211805.31918-1-kumar.gala@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517211805.31918-1-kumar.gala@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 24 May 2019 07:07:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] configure: Only enable iconv if curses is
 enabled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 17, 2019 at 04:18:05PM -0500, Kumar Gala wrote:
> iconv is only used with if curses is enabled, there's no need to do any
> configure checking for iconv, if curses is disabled.  Also, ignore
> --enable-iconv if curses is already disabled.

How about just doing this ...

--- a/configure
+++ b/configure
@@ -3551,6 +3551,7 @@ EOF
       feature_not_found "curses" "Install ncurses devel"
     fi
     curses=no
+    iconv=no  # curses is the only user
   fi
 fi

... instead?

