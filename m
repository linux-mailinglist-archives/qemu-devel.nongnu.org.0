Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16D1C9602
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 18:08:12 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWj4F-0003GY-6C
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 12:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWirf-0004OL-2D
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:55:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49013
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWird-0007n9-VJ
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588866908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PbKbsmuj+N88lZdRzTZYO6sFx/jx/rHsfhMKbHUddY=;
 b=LdcLzsv9BbMVNEzfQIE+hunFTbQgDHKF2/KSmPtTLDq1NucF1aUuGJqEiuC3ZaYXg2nRK+
 lVXbC7sAnqvc2mtXDNlAKc/HC3tLXuxRMdHudMQuasX8LVup9TzLGklgIRTgQ59bMfV+P8
 tKsosLFMZ8+BvbvYkWUeCGIDece+Yfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-u3i37zZZMTaTfVbfo5QHHQ-1; Thu, 07 May 2020 11:55:07 -0400
X-MC-Unique: u3i37zZZMTaTfVbfo5QHHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39781EC1A3;
 Thu,  7 May 2020 15:55:06 +0000 (UTC)
Received: from work-vm (ovpn-114-224.ams2.redhat.com [10.36.114.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A825D9C5;
 Thu,  7 May 2020 15:55:04 +0000 (UTC)
Date: Thu, 7 May 2020 16:55:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Pan Nengyuan <pannengyuan@huawei.com>
Subject: Re: [PATCH 0/2] migration/multifd: fix two memleaks
Message-ID: <20200507155502.GH17348@work-vm>
References: <20200506095416.26099-1-pannengyuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200506095416.26099-1-pannengyuan@huawei.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, euler.robot@huawei.com,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Pan Nengyuan (pannengyuan@huawei.com) wrote:
> Fix two memleaks in multifd_send_thread/multifd_new_send_channel_async wh=
en error happen.
>=20
> Pan Nengyuan (2):
>   migration/multifd: fix memleaks in multifd_new_send_channel_async
>   migration/multifd: Do error_free after migrate_set_error to avoid
>     memleaks
>=20
>  migration/multifd.c | 5 +++++
>  1 file changed, 5 insertions(+)

Queued

>=20
> --=20
> 2.18.2
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


