Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C52C6070
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:22:56 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiY5n-0004MK-9w
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiY20-0002Zd-Bw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:19:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiY1y-0007my-I5
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606461537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHnppe+mfya8lnZQOvD8Nf2ZNo155lybxrBfrB6ZcqQ=;
 b=QG/7jAktlIcI2kuwAT6O3L9cbtMjqmzkUq+apSDB54EYv2O7GzYmn6iodh3Clz5OFdnTVV
 kIL5rUX37F6giyhRIoKssNUM5bjXOlJ2UlU7euu0pwv3fWxrIAtSiw6DeTr2fjyk5Xx8jT
 IuZw5ArqT2GLLtipcjRyVuw475mEcwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-_plQGLrENaS1mFQU19cJUg-1; Fri, 27 Nov 2020 02:18:52 -0500
X-MC-Unique: _plQGLrENaS1mFQU19cJUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE167805BFB;
 Fri, 27 Nov 2020 07:18:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 752B210013C1;
 Fri, 27 Nov 2020 07:18:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 92D1AA1EE; Fri, 27 Nov 2020 08:18:47 +0100 (CET)
Date: Fri, 27 Nov 2020 08:18:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v3] Fix build with 64 bits time_t
Message-ID: <20201127071847.mvs4wikik6jb5vlh@sirius.home.kraxel.org>
References: <20201126221111.703652-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201126221111.703652-1-fontaine.fabrice@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Changes v2 -> v3 (after review of Gerd Hoffmann):
>  - Replace include on <linux/input.h> by
>    "standard-headers/linux/input.h" to try to fix build on rhel-7

Now it complains about ioctl() not being declared.

/me suggests to create a fork @ gitlab.com and push your branch there,
that'll run it through CI and we have a centos7 build job there which
should catch this ...

take care,
  Gerd


