Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05E2F7E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:23:00 +0100 (CET)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q0B-0001Jc-RZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0P9u-0004QL-WE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0P9t-00060E-F5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610717336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H3FbVIjp+9dnOSLEBVOwY+GBD3WaDlSBm+MzrdXHEBo=;
 b=b6Ysn/OO5nlICtpqptNwKPhCnj6bZ5+Ur7G1Bua3PeAN6s6QBpJzlGwbZ3NvV+Ey768WEs
 DiZXDSfS+pzHKqrcZLLw9BEU6kdrf5nx4uAi8DSDTmmr9rgty9MFAxaX3JcUfwBV/c8kxF
 89lO/O5WpZ2MbRH98y2aV9nMDIUkpVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-omF2kf-gMbWJTUlzYG814w-1; Fri, 15 Jan 2021 08:28:55 -0500
X-MC-Unique: omF2kf-gMbWJTUlzYG814w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DD08EC1A1;
 Fri, 15 Jan 2021 13:28:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC59608BA;
 Fri, 15 Jan 2021 13:28:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96F2711386A7; Fri, 15 Jan 2021 14:28:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] monitor/qmp-cmds.c: Don't include ui/vnc.h
References: <20210104161200.15068-1-peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 14:28:44 +0100
In-Reply-To: <20210104161200.15068-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 4 Jan 2021 16:12:00 +0000")
Message-ID: <87sg72mir7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Peter Maydell <peter.maydell@linaro.org> writes:

> The qmp-cmds.c file currently includes ui/vnc.h, which (being located
> in the ui/ directory rather than include) is really supposed to be
> for use only by the ui subsystem.  In fact the function prototypes we
> need (vnc_display_password(), etc) are all declared in
> include/ui/console.h, so we can switch to including that instead.
>
> (ui/vnc.h includes include/ui/console.h, so this change strictly
> reduces the quantity of headers qmp-cmds.c pulls in.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Almost missed this one.  Queued, thanks!


