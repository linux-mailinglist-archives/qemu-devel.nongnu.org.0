Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24331E95F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:56:27 +0100 (CET)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChv0-0002Cd-4Q
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChri-00088U-7b
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:53:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChrc-00056o-Jd
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613649175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7H5jfpgAwMLf3Roe9f4UUB07K5sXBp/Og5MCpfF0lGc=;
 b=LE5M26IVRottlhruUaCBkB4e3KvR9t8cQ+VEe+solr3oSIY4EIsQvz1PAp25pK5fIPvKs9
 d40VRo03D9IoOHU2LLE/CGbVG+QjYpoBDGq3Mm8biP4zFxxT0Q1XQfU01YeBC638Cf/Jw8
 b4BjJXjoZ6yEAkooG8qbtZ2cjMAyn0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-Wh4ZiX-yMMydxcLE6W_5uw-1; Thu, 18 Feb 2021 06:52:54 -0500
X-MC-Unique: Wh4ZiX-yMMydxcLE6W_5uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28200100CCC2;
 Thu, 18 Feb 2021 11:52:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E75865D6A1;
 Thu, 18 Feb 2021 11:52:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5FE3A18000BB; Thu, 18 Feb 2021 12:52:51 +0100 (CET)
Date: Thu, 18 Feb 2021 12:52:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH] usb-host: use correct altsetting in usb_host_ep_update
Message-ID: <20210218115251.c7lgkkcu2hsngvkz@sirius.home.kraxel.org>
References: <20210201213021.500277-1-rosbrookn@ainfosec.com>
 <CAEBZRScKAU3PdbiZQvXou41J+5cFXcOj=KUB0dYnC2y1BCbH-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEBZRScKAU3PdbiZQvXou41J+5cFXcOj=KUB0dYnC2y1BCbH-w@mail.gmail.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 11:05:41AM -0500, Nick Rosbrook wrote:
> Hi,
> 
> Just wanted to ping this. Patchwork link is here:
> https://patchwork.kernel.org/project/qemu-devel/patch/20210201213021.500277-1-rosbrookn@ainfosec.com/.

Pull request sent now.
Not much usb activity these days ...

thanks,
  Gerd


