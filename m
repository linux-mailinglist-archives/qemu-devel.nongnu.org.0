Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819D4EE799
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 07:10:22 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na9YD-0003ax-J1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 01:10:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1na9Wa-0002og-VY
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 01:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1na9WX-0005FZ-RN
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 01:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648789716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3baCLLPcOIeO2Pq8hBmeJSuz2QTBu0bEEEXwbF+47xI=;
 b=e1BPCnlM6rVuON4b7MpKf7mbsuw/vUGu6N5/GXYjpna5pbeb9AM1ELdzB5HImJ6TgUx4DK
 iYlKCqEhEyKmE24D93J71kjPXckcJeEi00IY4IowPQ3d0YtOcicGOvUtxDDrCbQ7Pgvp6e
 /t40xUKGRoM8oky+V4+o4BqFHG0WE9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-p8_iunILPtWAj7lGcQuYrA-1; Fri, 01 Apr 2022 01:08:35 -0400
X-MC-Unique: p8_iunILPtWAj7lGcQuYrA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 793CB101A52C;
 Fri,  1 Apr 2022 05:08:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 180885E1941;
 Fri,  1 Apr 2022 05:08:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5667918000AA; Fri,  1 Apr 2022 07:08:18 +0200 (CEST)
Date: Fri, 1 Apr 2022 07:08:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Message-ID: <20220401050818.hbj4qkebwggvc6x3@sirius.home.kraxel.org>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
 <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
MIME-Version: 1.0
In-Reply-To: <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >               if (sev_enabled()) {
> 
>                     ^^^

> Can we remove the SEV check ...

> > +    pc_system_parse_ovmf_flash(ptr, size);
> > +
> > +    if (sev_enabled()) {
> 
> ... because we are still checking SEV here.

Well, the two checks have slightly different purposes.  The first check
will probably become "if (sev || tdx)" soon, whereas the second will
become "if (sev) { ... } if (tdx) { ... }".

We could remove the first.  pc_system_parse_ovmf_flash() would run
unconditionally then.  Not needed, but should not have any bad side
effects.

take care,
  Gerd


