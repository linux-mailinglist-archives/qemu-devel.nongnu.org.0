Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6A1BC248
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 17:08:35 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTRqc-0001mN-KW
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTRmg-0005m0-0p
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTRls-00081u-Ms
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:04:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35689
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jTRls-00081d-5z
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588086219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOLmJY67pRZ/tSNHy9478lZSZ0kvPr57xinc5+ugHOM=;
 b=QieUP0byD+PqqE7tx5TPRcXs6f4lWx+OI0Ae8WPo2Aft5zECpfyK4M+YrIFyTqyB75oPkL
 YKHkrUcALJABQinguRVeEW3HjB0asvNM5rfaIGkuf8FQEHz4c1TlMlW7H1TeLXU0JqfZQC
 2juDX4XdBYBJ+qMlR9pkUHJRzq3NwWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-MWnyEaDlPHK5iqhzT2_Juw-1; Tue, 28 Apr 2020 11:03:37 -0400
X-MC-Unique: MWnyEaDlPHK5iqhzT2_Juw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E039BFC7;
 Tue, 28 Apr 2020 15:03:36 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-37.ams2.redhat.com [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B4419C4F;
 Tue, 28 Apr 2020 15:03:34 +0000 (UTC)
Date: Tue, 28 Apr 2020 17:03:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 2/4] block: Use bdrv_make_empty() where possible
Message-ID: <20200428150333.GL5789@linux.fritz.box>
References: <20200428132629.796753-1-mreitz@redhat.com>
 <20200428132629.796753-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200428132629.796753-3-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.04.2020 um 15:26 hat Max Reitz geschrieben:
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


