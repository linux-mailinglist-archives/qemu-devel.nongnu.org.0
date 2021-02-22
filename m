Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F299132153C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:41:21 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9ab-0007LN-2b
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE9Yn-0006dZ-6X
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE9Yl-0001JL-16
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613993965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0Ib/6chVB/S1RyLSNZOv1WBtVCCYoC/P0kZuoClTyU=;
 b=F95V4zCmZFPG1gGR6jEk80UCoZml6EQFPfkJEaiYsYA2mCA7IKR68YJJpXK10Qg9TR9Uwl
 L0Dz1hzxLdqcYtWVA85wJlDA4cVU92leeZCUKIYk7eCysQq5FzW6GntewVEq6gAlYYXRV1
 D1H9RghRW6r89wqoOef/9M/Fp4Apgac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-SEwOVxYRN_eaehVlQBgcDg-1; Mon, 22 Feb 2021 06:39:21 -0500
X-MC-Unique: SEwOVxYRN_eaehVlQBgcDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E56885B669;
 Mon, 22 Feb 2021 11:39:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 115A95C290;
 Mon, 22 Feb 2021 11:39:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C42E2180039B; Mon, 22 Feb 2021 12:39:17 +0100 (CET)
Date: Mon, 22 Feb 2021 12:39:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/gtk: vte: fix sending multiple characeters
Message-ID: <20210222113917.mlsal6rmjv4bb4zj@sirius.home.kraxel.org>
References: <161392666438.21706.4757518764617915041@c667a6b167f6>
 <20210221170613.13183-1-zpmarvel@gmail.com>
 <20210221170613.13183-2-zpmarvel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210221170613.13183-2-zpmarvel@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Zack Marvel <zpmarvel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 21, 2021 at 10:06:13AM -0700, Zack Marvel wrote:
> When using the GTK UI with libvte, multicharacter keystrokes are not
> sent correctly (such as arrow keys). gd_vc_in should check the
> CharBackend's can_receive instead of assuming multiple characters can be
> received. This is not an issue for e.g. the SDL UI because
> qemu_chr_be_write is called with len=1 for each character (SDL sends
> more than once keystroke).
> 
> Modify gd_vc_in to call qemu_chr_be_write multiple times if necessary.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1407808
> 
> Signed-off-by: Zack Marvel <zpmarvel@gmail.com>

Added to ui patch queue.

thanks,
  Gerd


