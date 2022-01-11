Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65848B16B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:56:40 +0100 (CET)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JVn-0007nH-5M
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7JTW-0006dF-9H
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7JTT-00035q-Nr
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641916454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh9aqkSf8PxMBLOsYh+2fO/rjzB4m1rstepdDOIYFYc=;
 b=RXi1VK132/HjpuZhRjgDFMAuJ5hoLcfTKXfuUrGYsuCg3doNh7ubMq6K3YgBMZ9KKDHAWf
 qPf5iE4QLfS8rGwM80dIHh+EFG0RX7ms8S5DXliU+oxP20vmXgifB/2ceFYTGDx6mLl/SH
 gpsb4EgpFgZSdvktVtfEs/uZW2oS9vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-_bkW1l2IMB2W_3qKOxwcyA-1; Tue, 11 Jan 2022 10:54:11 -0500
X-MC-Unique: _bkW1l2IMB2W_3qKOxwcyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59708523D;
 Tue, 11 Jan 2022 15:54:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F74D838C1;
 Tue, 11 Jan 2022 15:54:08 +0000 (UTC)
Date: Tue, 11 Jan 2022 16:54:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/3] block: Minor vhost-user-blk fixes
Message-ID: <Yd2oH+I1cz1HFeJC@redhat.com>
References: <20220107105420.395011-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220107105420.395011-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.01.2022 um 11:54 hat Philippe Mathieu-Daudé geschrieben:
> - Add vhost-user-blk help to qemu-storage-daemon,
> - Do not list vhost-user-blk in BlockExportType when
>   CONFIG_VHOST_USER_BLK_SERVER is disabled.

Thanks, applied to the block branch.

Kevin


