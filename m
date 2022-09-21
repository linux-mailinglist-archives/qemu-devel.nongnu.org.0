Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE45BFC9B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 12:53:56 +0200 (CEST)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaxMZ-0005vx-3P
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 06:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oaxGY-0002dt-1F
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oaxGU-0005Yv-3b
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663757256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMgHF+IXPSYtW/h3EE90QtGFucPAnLXPtCr53Vo5u4k=;
 b=dewTdsG+OuLGqWflNrKnFEE8qO9tSQ0THU+VNqmTuoY2t+nRg85tzVqQWkeD4Hb6AntK9/
 JsTZToOXgoBQwkoYllKllaoURiHRdkCyS98zF2pTRdiTeJOfgA5TjUG8U1wGQYoUpMKDU9
 vR9VFA296ltPqYCopoEbcGPco0A2OUY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-cOA_ZjKrOe-7pix9k1ZgmQ-1; Wed, 21 Sep 2022 06:47:35 -0400
X-MC-Unique: cOA_ZjKrOe-7pix9k1ZgmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8DCD29DD99C;
 Wed, 21 Sep 2022 10:47:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD26D49BB62;
 Wed, 21 Sep 2022 10:47:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CC1B81800081; Wed, 21 Sep 2022 12:47:28 +0200 (CEST)
Date: Wed, 21 Sep 2022 12:47:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: guest Linux Kernel hangs and reports CPU lockup/stuck gitlab bug
Message-ID: <20220921104728.via2xl7dbqhhdyib@sirius.home.kraxel.org>
References: <7d54c218-fc66-b65f-4cc3-915d2ec23a0e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d54c218-fc66-b65f-4cc3-915d2ec23a0e@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Sep 21, 2022 at 11:55:01AM +0200, Claudio Fontana wrote:
> Hi,
> 
> I think this bug report warrants some attention,
> 
> can Gerd take a look here?
> 
> The GTK Clipboard commit seems involved:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1150

Had a very quick look.  Seems gtk_clipboard_wait_is_text_available()
blocks forever for some reason.  Not sure why.  Possibly a gtk bug.

The options I see are:
  (a) go debug why it hangs.
  (b) rewrite clipboard support to avoid using the
      gtk_clipboard_wait*() functions.
  (c) add a config option to turn off gtk clipboard support.

Don't have the time to dig deeper right now, sorry.

take care,
  Gerd


