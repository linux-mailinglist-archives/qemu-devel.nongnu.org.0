Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B425444BAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:08:24 +0100 (CET)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkfqR-0006Gz-CW
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkfpO-0005XX-3x
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:07:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkfpK-00014a-UE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636520833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tu1Rl712hPRsicuBSaoWk5s8UKye3DblzvpX7gxIqDA=;
 b=JfdBxuh2Z6288GvXskmM3Np/fsQX/9uA8Joj1OnDr0hn6r9H3QfSHimG8E8Pu+P3IxzymJ
 bdyzlgR8QKZugptmSXS4Y3fW7FgTyVl983pv/g/BEOfeWkhIc5wrMnYgeZ8FYEvHV2TMCh
 RSTsWuDi+meRZnxzLUDHXzf85t5nLwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-FxxV80QQPH2sSijRFOiFIg-1; Wed, 10 Nov 2021 00:07:09 -0500
X-MC-Unique: FxxV80QQPH2sSijRFOiFIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A18CE18D6A25;
 Wed, 10 Nov 2021 05:06:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B0867841;
 Wed, 10 Nov 2021 05:06:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F350111380A7; Wed, 10 Nov 2021 06:06:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
References: <20211110023915.3797141-1-chen.zhang@intel.com>
Date: Wed, 10 Nov 2021 06:06:51 +0100
In-Reply-To: <20211110023915.3797141-1-chen.zhang@intel.com> (Zhang Chen's
 message of "Wed, 10 Nov 2021 10:39:15 +0800")
Message-ID: <87czn88uqc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> This patch make filters and colo-compare module support vnet_hdr by
> default. And also support -device non-virtio-net(like e1000.).
> But it can't avoid user manual configuration error between
> different filters when enable/disable virtio-net-pci.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Have you considered backward compatibility?  Can it break usage that now
works?


