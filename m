Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50491BA843
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 17:45:18 +0200 (CEST)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT5wb-0003kw-FV
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 11:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jT5vK-0002RU-I1
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jT5vJ-0002ce-MD
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:43:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49886
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jT5vI-0002Vn-P2
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588002234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jn9Oi5ifbhKETVANehVLGxmMZNostLLteI+tpn/P3zk=;
 b=a7RqHgO97g8Au+gacfaeHqEhAFsEMsr1JtPL0sNuMAZWgHTTNqz/r/E1RG+Sn7Cq8HqJ/4
 vokWOA3RDYlRzzOYPEqIVL/JiRzR+2THQE9oKsWYS0uCAdwOM3M7Tb07fjpzVNTjqRRGsj
 ZVi1VpTltpdxTdcswd6YhyXcBrTXJb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-DPcnoOcEOjKdRoNEI94ocQ-1; Mon, 27 Apr 2020 11:43:50 -0400
X-MC-Unique: DPcnoOcEOjKdRoNEI94ocQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E63107ACCA;
 Mon, 27 Apr 2020 15:43:48 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-77.ams2.redhat.com [10.36.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50CE75D9DC;
 Mon, 27 Apr 2020 15:43:47 +0000 (UTC)
Date: Mon, 27 Apr 2020 17:43:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [PATCH v7 00/10] block: Fix resize (extending) of short overlays
Message-ID: <20200427154345.GD21992@linux.fritz.box>
References: <20200424125448.63318-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200424125448.63318-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:33:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: berto@igalia.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.04.2020 um 14:54 hat Kevin Wolf geschrieben:
> v7:
> - Allocate smaller zero buffer [Vladimir]
> - Added missing error_setg_errno() [Max]
> - Code cleanup in the iotest, enabled mapping for 'metadata' [Vladimir]
> - Don't assign to errp twice [Eric]

Thanks for the review, applied to the block branch.

Kevin


