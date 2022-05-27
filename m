Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F2536328
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 15:05:25 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuZee-00039i-GK
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 09:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1nuZWv-0000Kd-TH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 08:57:27 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:37292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1nuZWs-00048Z-BM
 for qemu-devel@nongnu.org; Fri, 27 May 2022 08:57:24 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id D706F2E0ED9;
 Fri, 27 May 2022 15:49:42 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NxeW3RvUzO-ngJKMKS5; Fri, 27 May 2022 15:49:42 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653655782; bh=JM96I5LvuqEk8lIm294IVLUxdDmVW/y5LswXRk6mRf0=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=aht4MVmLGt+EhwpHSHBY1HjKyQ7BwNeWczrhWGwrVvoHbVUNPw0TOIKK6fSrW7ume
 Nb4AaPSwRy811IqmqOywImc53vdSQUIGpDINSIlL8PZx/0BSDwSYIiNO4DrGMm2Z4J
 +n3ZusMqo4GLweTwt9MKWl13yEaPb5ZjT8m4SW5w=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:b081:b5a1::1:24])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Xn3Q1BidW5-nfNWV6Om; Fri, 27 May 2022 15:49:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 27 May 2022 15:49:40 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
Message-ID: <YpDI5IMRzTbDu93A@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>,
 Eric Blake <eblake@redhat.com>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
 <87zgj5hog8.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgj5hog8.fsf@pond.sub.org>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, May 25, 2022 at 12:54:47PM +0200, Markus Armbruster wrote:
> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> writes:
> 
> > This event represents device runtime errors to give time and
> > reason why device is broken.
> 
> Can you give an or more examples of the "device runtime errors" you have
> in mind?

Initially we wanted to address a situation when a vhost device
discovered an inconsistency during virtqueue processing and silently
stopped the virtqueue.  This resulted in device stall (partial for
multiqueue devices) and we were the last to notice that.

The solution appeared to be to employ errfd and, upon receiving a
notification through it, to emit a QMP event which is actionable in the
management layer or further up the stack.

Then we observed that virtio (non-vhost) devices suffer from the same
issue: they only log the error but don't signal it to the management
layer.  The case was very similar so we thought it would make sense to
share the infrastructure and the QMP event between virtio and vhost.

Then Konstantin went a bit further and generalized the concept into
generic "device runtime error".  I'm personally not completely convinced
this generalization is appropriate here; we'd appreciate the opinions
from the community on the matter.

HTH,
Roman.

