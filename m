Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B134A784
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:48:40 +0100 (CET)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPltG-0004YA-SK
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlrs-00044q-FR
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlrq-0002E2-Si
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616762829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWyyf42yAZs1wH5EzrUV+efxbY/3EgHY2p18A8/6EqI=;
 b=FoP0kq0XGDSBtoPYLDu0CouD910ppu4yU5f7icPhYN6xTCuowkaYK9ZvV5KC5xW5FgWffE
 2AJwfyGVrUkZJPtdXni0w1GYYYSQd2ur1XUR4ZNWMsJlACYcvt5BlUR8sCjznin/gxPXP2
 iZqgDC7N/go+Sd/FNXGhufIScfEB2jQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-bLlCv2_AMA2y-iuAUunXZQ-1; Fri, 26 Mar 2021 08:47:07 -0400
X-MC-Unique: bLlCv2_AMA2y-iuAUunXZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04C361005D4F
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 12:47:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 045091962F;
 Fri, 26 Mar 2021 12:47:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D5271800385; Fri, 26 Mar 2021 13:47:00 +0100 (CET)
Date: Fri, 26 Mar 2021 13:47:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YFiHnr/uguP8/Vtz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> eg a trace point "dma_map_wait" gets mapped to probes in many
> .stp files, once per target, because we need to match based on
> the executable path:
> 
>   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
>   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-ppc64").mark("dma_map_wait")

Probe qemu.system.ppc64.dma_map_wait = ...

Can I trace qemu started from build directory?
Seems scripts/qemu-trace-stap doesn't support that.

>   qxl.destroy_primary(int qid) "%d"
>   qxl.enter_vga_mode(int qid) "%d"
>   qxl.exit_vga_mode(int qid) "%d"
> 
> this would be backwards compatible, as we can turn the "." back into
> a "_" for all existing trace backends, except stp.

Hmm, not sure I like this inconsistency.  I think names should be the
same no matter which trace backend is used.

take care,
  Gerd


