Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43736FD23F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 02:11:44 +0100 (CET)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVQ9G-000800-SC
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 20:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iVQ8W-0007au-Qb
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 20:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iVQ8V-0003lH-7h
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 20:10:56 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36329)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iVQ8U-0003ke-PW
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 20:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=7Yqdh6IMNBAGZYlfDuSuhrQoDwo6sogYevu8F+3povc=; b=u6+FkD3iv1aRxrm2BQ9gUxmc2N
 gd6wdpS0yJ4a02cyHynKBfoLrQI4gK0JF1zbajWU2QyDYa6tPYFkvQkLad6X6AIHBDBqb3G2ePqEN
 w7OgKlY2k+F8ZsFlimVGWLeeF2STj1z0kXgHvoLS8EvFTUFZPR/fNLQcjCLSKQflVGP5dLiJSUIyc
 IV7vJdJSRF6PTvxnNf1SL82MOQAiP48z4/eA7ks2FBwHVjcrTHShs6w0a0LePkuSILyYnUZQzId+0
 TXYIExi4c2GQ0pFVSwvRJnk88ec+d8xSoC0qQ70MhpFdGt7tufLI1y7t11CzZSzfU4nWqUYEWvbtx
 GtX4ZVssz2SalV+IRtP1wB1qh8u/kTiuv8MCgaDnLE4wI0OoT4pfwWMRaVY2Za0FXf+CA/UPpzxx6
 ji57sf5x6XFk8RmMrwOeChqjbshRolKHqRfhEosFlE66qUV0Ci4iXmyM3X4iNyzFRvOD0W9G0kPSy
 FKKGJT7Cpjup3hfCDG7zaYnsH78IynUHWRS2Gv6qJtEEFV3W3n2rk7nPsgRWt6+3aA1ATRI1sGNGt
 lF0rHTtayot7ISHGQkz9WarB9Z6nbLQIPJC3bz2wyciEg8r62kLf3GdrkIoV6guGLT6oyPPxMOs3d
 ESNZrqHOA/3CT9F5e9afzyR95gyuWWXPid9sz1GN0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: 9p: requests efficiency
Date: Fri, 15 Nov 2019 02:10:50 +0100
Message-ID: <1686691.fQlv7Ls6oC@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm currently reading up on how client requests (T messages) are currently 
dispatched in general by 9pfs, to understand where potential inefficiencies 
are that I am encountering.

I mean 9pfs is pretty fast on raw I/O (read/write requests), provided that the 
message payload on guest side was chosen large enough (e.g. 
trans=virtio,version=9p2000.L,msize=4194304,...), where I already come close 
to my test disk's therotical maximum performance on read/write tests. But 
obviously these are huge 9p requests.

However when there are a large number of (i.e. small) 9p requests, no matter 
what the actual request type is, then I am encountering severe performance 
issues with 9pfs and I try to understand whether this could be improved with 
reasonable effort.

If I understand it correctly, each incoming request (T message) is dispatched 
to its own qemu coroutine queue. So individual requests should already be 
processed in parallel, right?

Best regards,
Christian Schoenebeck



