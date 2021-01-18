Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6E2FA5C1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:14:50 +0100 (CET)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XB3-0005R9-CD
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1X9i-0004yw-8h
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:13:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1X9g-00039Q-Qz
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610986403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ji+FmQK9xaeBmOU33XA58YgBGBcG0LW189flv9NjCEc=;
 b=NTCsvZmWhjXUaOxMRBX6Oy4QW7gJ+b8SsfpN0U3stVs5UR5f7nDB943jbRvt5gAKo/3hsX
 r3mqCxovP7RpkYRi1dQfqqWBrUv3V4z0+FvIUYCUpDIytycqlyuGCm/e2yMm7Svtzs6KB4
 bq9eSjQrgYKk1j+KrV5zYbevFIBwCp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-urTl1qJFP-mWJksPbqj_bA-1; Mon, 18 Jan 2021 11:13:19 -0500
X-MC-Unique: urTl1qJFP-mWJksPbqj_bA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 922D218C89C4;
 Mon, 18 Jan 2021 16:13:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8535D9CD;
 Mon, 18 Jan 2021 16:13:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3444B18000BA; Mon, 18 Jan 2021 17:13:16 +0100 (CET)
Date: Mon, 18 Jan 2021 17:13:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
Message-ID: <20210118161316.yptquytrr23yv4bs@sirius.home.kraxel.org>
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
 <87turil3s2.fsf@dusky.pond.sub.org>
 <20210115134710.GH1692978@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210115134710.GH1692978@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: oscar.zhangbo@huawei.com, Zihao Chang <changzihao1@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, xiexiangyou@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Or we could have a more generic  "display-reload" command, which has
> fields indicating what aspect to reload. eg a 'tls-certs: bool' field
> to indicate reload of TLS certs in the display. This could be useful
> if we wanted the ability to reload authz access control lists, though
> we did actually wire them up to auto-reload using inotify.

Maybe we should just use inotify-based reload for the certs too?

take care,
  Gerd


