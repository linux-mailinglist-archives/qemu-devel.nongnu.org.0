Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F811EE0F5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:15:06 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jglxp-0002EU-3n
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jglx3-0001nV-AB
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:14:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58781
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jglx0-0006YO-PB
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591262053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SEp4AxFdNSx2fFxAykJV6rTK3hg3WgVbGJvPRrKDxf0=;
 b=gIg0zLds9nJLGbMls5hJwl8pqG84BsWVFwrLScLxmHreeA8z8c72C6Dn5rOBVBcu21K4h7
 Z4dU7mTzkiOQNrB+oLg8wPCuQ0FfXdAMmyBlP5Hf0XPziGiYwS7+NWz26jJQvD7+6Rqwj/
 SmHJdJW8dGHzmBtOpdvDA0/3Fc1Psco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-XfapHthxM_2TwdLiB_L4CQ-1; Thu, 04 Jun 2020 05:14:12 -0400
X-MC-Unique: XfapHthxM_2TwdLiB_L4CQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE75E872FE1;
 Thu,  4 Jun 2020 09:14:10 +0000 (UTC)
Received: from kaapi (ovpn-116-200.sin2.redhat.com [10.67.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 794EC2DE79;
 Thu,  4 Jun 2020 09:14:05 +0000 (UTC)
Date: Thu, 4 Jun 2020 14:44:02 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] ati-vga: check mm_index before recursive call
In-Reply-To: <20200604084536.GB3050580@redhat.com>
Message-ID: <nycvar.YSQ.7.77.849.2006041441270.30592@xnncv>
References: <20200603185522.1173354-1-ppandit@redhat.com>
 <20200604084536.GB3050580@redhat.com>
MIME-Version: 1.0
Content-ID: <nycvar.YSQ.7.77.849.2006041442290.30592@xnncv>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463811718-64378309-1591261911=:30592"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Yi Ren <c4tren@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ren Ding <rding@gatech.edu>,
 Philippe Mathieu Daude <philmd@redhat.com>, Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463811718-64378309-1591261911=:30592
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <nycvar.YSQ.7.77.849.2006041442291.30592@xnncv>

+-- On Wed, 3 Jun 2020, Philippe Mathieu-Daudé wrote --+
| > -        } else {
| > +        } else if (s->regs.mm_index > MM_DATA + 3) {
| >              val = ati_mm_read(s, s->regs.mm_index + addr - MM_DATA, size);
| 
| We usually log unexpected guest accesses with:
| 
|            } else {
|                qemu_log_mask(LOG_GUEST_ERROR, ...
| 
| > -        } else {
| > +        } else if (s->regs.mm_index > MM_DATA + 3) {
| >              ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
| 
| Ditto:
| 
|            } else {
|                qemu_log_mask(LOG_GUEST_ERROR, ...

+-- On Thu, 4 Jun 2020, Daniel P. Berrangé wrote --+
| On Thu, Jun 04, 2020 at 12:25:22AM +0530, P J P wrote:
| > While accessing VGA registers via ati_mm_read/write routines,
| > a guest may set 's->regs.mm_index' such that it leads to infinite
| > recursion. Check mm_index value to avoid it.
| 
| So this is a denial of service security issue. Is there any CVE
| assigned for this ?

Yes, just sent a revised patch v3 with above changes and CVE-ID.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463811718-64378309-1591261911=:30592--


