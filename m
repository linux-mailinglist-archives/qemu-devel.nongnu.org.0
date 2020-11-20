Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6922BA90F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:27:27 +0100 (CET)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4ZZ-0003L5-Nh
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg4Y5-0002di-6w
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg4Y2-0006ZL-Ci
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605871548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eovKtpOe+FU+7rd+WAlTNK8nbznKFbjg6qvWruGvROo=;
 b=NYNMXqlb0oxj8VcFB060me2Mqnx/ukurpwCD0jjwdgpa1MRJQfoCbGICDDrecLwJZAMPLz
 Y1Md2DQndPM0s0gw/24/0ZbSNwdTF2qgi/zSX+2xigCZsAi3XFJYIEvK3sb4OlRjreXiyx
 3s8XyrnLedpmiGG6dxQT+Wi4BDXoDjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-eT5qfLXPOCKveDWAsjdlNw-1; Fri, 20 Nov 2020 06:25:46 -0500
X-MC-Unique: eT5qfLXPOCKveDWAsjdlNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B6B18144E1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 11:25:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEDED60853;
 Fri, 20 Nov 2020 11:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7CD1817535; Fri, 20 Nov 2020 12:25:39 +0100 (CET)
Date: Fri, 20 Nov 2020 12:25:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Guess I'll go dig into the meson documentation, this looks more like a
> build system than a tracing problem to me.

Looking at https://mesonbuild.com/Syntax.html ...

"all objects are immutable".

So "var2 = var1" creates a copy not a reference I guess?

Which implies that ...

	foo_ss.add(something)

... is different from ...

	bar_ss = foo_ss
	bar_ss.add(something)

... which in turn explains why the patch doesn't work at all.

Now I'm wondering how I can make trace/meson.build add the trace
objects to the module source sets if I can't pass around references
to the module source sets?

Paolo?  Any hints how to tackle this the meson way?

thanks,
  Gerd


