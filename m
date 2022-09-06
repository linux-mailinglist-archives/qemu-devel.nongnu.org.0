Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866F5AE55A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:29:16 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVpT-000653-Cd
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVVGx-0006wq-OY
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVVGu-0000qY-Jv
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662458011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhyLfglx+M5vDp85y+kl6jgFKWyDv2/tYrW/E6t+ii0=;
 b=N41Xh5oBz28x33rH340mmQK2UzloL+avO8bwmOluENBi2x9gyl8MAZBbFpvr+jhziM57y7
 u+enoPgCUXN8psVtOuvXxcAlb/8l0udRkf4tTdiB8kobdK3h6DXKBhR3QYDC/56cb9vZxE
 1kBoIOCv7sNrHrZ9Ey2O1M84XYE9Jcs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-KBGwaNnTO4ykTxmc7cyFAg-1; Tue, 06 Sep 2022 05:53:28 -0400
X-MC-Unique: KBGwaNnTO4ykTxmc7cyFAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 011041C14B62;
 Tue,  6 Sep 2022 09:53:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEAE61415137;
 Tue,  6 Sep 2022 09:53:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 780C11800629; Tue,  6 Sep 2022 11:53:25 +0200 (CEST)
Date: Tue, 6 Sep 2022 11:53:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 dinechin@redhat.com
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Message-ID: <20220906095325.5rhnqjyvckjebnmp@sirius.home.kraxel.org>
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
 <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
 <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> In any case, the only thing that "mayfail" seems to control, is in module_load_file, and is a single printf:
> 
>     g_module = g_module_open(fname, flags);
>     if (!g_module) {
>         if (!mayfail) {
>             fprintf(stderr, "Failed to open module: %s\n",
>                     g_module_error());
>         }
>         ret = -EINVAL;
>         goto out;
>     }
> 
> 
> Weird.. Is someone building proprietary modules on top of QEMU?

Nope.

But modules have dependencies to stuff like pci bus, usb bus, vga which
might not be satisfied by some system emulators, and trying to load
those modules will fail then because of unresolved symbols.  If you drop
that 'make check' will log a pile of errors ...

Dropping mayfail and return an 'Error' instead makes sense, then it is
up to the caller to report or not report the failure.  When calling down
from module_load_qom_all() you might want ignore errors for the reasons
outlined above, in most other caes it probably makes sense to report
them.

take care,
  Gerd


