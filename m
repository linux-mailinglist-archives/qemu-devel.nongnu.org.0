Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB449200315
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 09:58:12 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmBud-00086d-Tf
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 03:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jmBti-0007at-TR
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:57:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jmBtg-00076G-F0
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592553430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZS8Av5nU8LCpINa7iUoD00iOdUgBF/9pcrAleS/20w=;
 b=iJ1I8v9aruQRfxKP/+Z3N6U/LDKZtpz/momrAkKFD6ZkmBLHysFBrq51yWDC1TCF0BzrqH
 zm//mmU84//m5ngaXWpDVLNwHkDJvscGJH1x/X4jgD/rAI9nY6J/jRj9d9mocDn1+CHyRb
 mftc4pnyzgHKCm/2RK3iDf4zPs/w4W0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-g1J_svwOOnWwV_sMTzPHsQ-1; Fri, 19 Jun 2020 03:57:08 -0400
X-MC-Unique: g1J_svwOOnWwV_sMTzPHsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3C419200C0
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 07:57:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB03919C79;
 Fri, 19 Jun 2020 07:57:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E3F9716E16; Fri, 19 Jun 2020 09:57:06 +0200 (CEST)
Date: Fri, 19 Jun 2020 09:57:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: Understanding initialization order for spice in qemu
Message-ID: <20200619075706.ovi5cauic4zufewz@sirius.home.kraxel.org>
References: <1D26F746-92AA-4BA4-BF92-A498DA2C67C9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1D26F746-92AA-4BA4-BF92-A498DA2C67C9@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Thu, Jun 18, 2020 at 01:11:44PM +0200, Christophe de Dinechin wrote:
> Hi Gerd,
> 
> 
> When I build qemu on master with moduels enabled, and run with spice, I occasionally see:
> 
>  qemu-system-x86_64: util/module.c:136: module_load_file: Assertion `QTAILQ_EMPTY(&dso_init_list)' failed.

Never saw that one.

I've noticed though the qemu build system doesn't rebuild code on cflags
changes, and switching object files from -y to -m (which adds -fPIC to
cflags) can cause build errors which go away when you rm -rf the build
tree (or at least the subdirectory where I'm hacking on) and try again.

> Asking because I don't recall ever seeing that on a clean build.

Yea, that hints it is the same problem.

HTH,
  Gerd


