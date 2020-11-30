Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185B2C80D8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:24:06 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfPh-0004z0-IO
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKQ-0000IQ-76
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:18:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKO-0005ol-OD
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3UC1oyj8/069xFHeGJ0mEl8JBkRMaiT6MtX6PBprzbI=;
 b=PDxkCpVqS9qe4BZC5lrRU+/HEHh7VhEaJf6UU5CMzOmbfSGtvat6LTtdWrNSolYoDKp5/6
 zNsdYhtMmu/48Jtmm6Xw8AzmqV/WOSzY3yj1X/i85cl1jcKiQfhKzS7vFAfThqweGxKCKa
 N/ItFa3QTvoitPbxzwLYpAuOWMiqT7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-dfX7JMx9MM2AjPfuSq3eQA-1; Mon, 30 Nov 2020 04:18:33 -0500
X-MC-Unique: dfX7JMx9MM2AjPfuSq3eQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7165556C60;
 Mon, 30 Nov 2020 09:18:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78A8A60867;
 Mon, 30 Nov 2020 09:18:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8726FA1E2; Mon, 30 Nov 2020 10:18:27 +0100 (CET)
Date: Mon, 30 Nov 2020 10:18:27 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v3] Fix build with 64 bits time_t
Message-ID: <20201130091827.eyn4k6qvvy2w53gm@sirius.home.kraxel.org>
References: <20201126221111.703652-1-fontaine.fabrice@gmail.com>
 <20201127071847.mvs4wikik6jb5vlh@sirius.home.kraxel.org>
 <CAPi7W81Qm_Le8E5BH5Cstg_fc9gf9vtDKbhBnXJ2wC0ngTcF-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPi7W81Qm_Le8E5BH5Cstg_fc9gf9vtDKbhBnXJ2wC0ngTcF-g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

> > /me suggests to create a fork @ gitlab.com and push your branch there,
> > that'll run it through CI and we have a centos7 build job there which
> > should catch this ...
> I fixed the issue by including sys/ioctl.h.
> However, I have a test failure due to a timeout on
> check-system-centos:
> https://gitlab.com/ffontaine/qemu/-/jobs/877810804

They timeout now and then, try re-run it.

> It does seem to be related to my patch. Should I send a v4 on the mailing list?

Yes, please.

thanks,
  Gerd


