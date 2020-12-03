Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B069C2CD3DF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:42:24 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkm47-0006wR-QI
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkm1h-0004rS-Bg
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkm1f-0004x8-Gi
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606991989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+wJEiBxe/j7A4G0HHsEuyC95/sZ7RPoeffCuIoiWjKQ=;
 b=aZCWCUJRvhe7y25ixlISkKZWSvqroXWxdLZaxNUGwHkOoWbLb1MFg+GKFbMaBWVpDerZEb
 78uhfTcGvoTmFxHhmO6mvKifeB7gSIA4xXMgztigVGe4zSVrKWxbph1/aCFpuBGwQgoBBS
 VZoNjcUCuzl2lAeGFVfIt36OKcHaUcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-H5Obkg0EMvOZLKH1r2fBrA-1; Thu, 03 Dec 2020 05:39:47 -0500
X-MC-Unique: H5Obkg0EMvOZLKH1r2fBrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B193425ED
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 10:39:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D48719C48;
 Thu,  3 Dec 2020 10:39:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F92311AB8; Thu,  3 Dec 2020 11:39:42 +0100 (CET)
Date: Thu, 3 Dec 2020 11:39:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/4] [RfC] fix tracing for modules
Message-ID: <20201203103942.xe56atxmkzy7xza7@sirius.home.kraxel.org>
References: <20201124160255.28111-1-kraxel@redhat.com>
 <20201130165614.GB474479@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201130165614.GB474479@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

  Hi,

> I noticed an issue with simpletrace: the trace file does not contain
> qxl_* TRACE_RECORD_TYPE_MAPPING records when ./configure
> --enable-modules is used. This happens because st_write_event_mapping()
> is called before the qxl module calls trace_event_register_group().
> 
> (The mapping records describe the integer ID to string name mapping used
> in a simpletrace file.)

It's not the only initialization issue.  "qemu-system-x86_64 -vga qxl
-trace qxl*" doesn't work either for simliar reasons.

> One way to solve this is by modifying trace_event_register_group() to
> call into trace/simple.c (maybe with a TraceEventIter initialized to
> iterate over the newly registered trace events group?).
> 
> Alternatively, simpletrace.c might be able to emit
> TRACE_RECORD_TYPE_MAPPING on demand instead of ahead of time.

I guess I'll have a look at the first option, or more general at
per-group initialization, that looks like the better approach on
a quick glance.

take care,
  Gerd


