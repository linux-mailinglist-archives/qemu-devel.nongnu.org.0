Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A128CBFF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 12:52:35 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSHv0-0001jw-Jf
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 06:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSHta-0001Ff-5M
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSHtX-0005eL-4f
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602586261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=asJVSKtr694AKepeLwI9cAECSAqd/anFUz3F4vmINAw=;
 b=bWkqF0iGjQCXwk0TodF0mjT+HarwC2eNMcDxdSryg9ZuF8o+v3hVPBJFcYes1zTtehuhG2
 JR3B+s+prLtmupnCOxVcHJnCnZehfZj0ksl0YcXyW/RCX36cEEpixZNIJ9c9KeHhKJS8Rw
 ke6rwu2Zy7LTA1jCuQAZJr3BbllWhWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-xJAFojYANyeP47UrQJNhSA-1; Tue, 13 Oct 2020 06:50:59 -0400
X-MC-Unique: xJAFojYANyeP47UrQJNhSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 045421018F65
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 10:50:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039A26EF41;
 Tue, 13 Oct 2020 10:50:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C975E1750A; Tue, 13 Oct 2020 12:50:51 +0200 (CEST)
Date: Tue, 13 Oct 2020 12:50:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 0/3] console: make QMP screendump use coroutine
Message-ID: <20201013105051.qrxty2ma3ysiy2ne@sirius.home.kraxel.org>
References: <20201010204106.1368710-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201010204106.1368710-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Despite the flush, the dump may still have glitches. The graphic
> device may perform some operations during the write on the same
> framebuffer.

That problem exists anyway, even without coroutines.  The guest can
write to vga memory in parallel to iothread writing out the screen
dump.

> Good enough?

I'd say yes.  console bits are:

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

I can take that through ui patch queue, but want an ack from someone who
knows coroutines better than me for that.  Merging through some other
queue (monitor?) is fine with me too.

take care,
  Gerd


