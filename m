Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3A3AB1E1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:04:57 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltppQ-0001qW-1s
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltpoE-00015j-L1
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltpoB-0006BW-L9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623927818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v1qUA87naVgmzsQu+98BIeSWjQfZfYV1nTuXGr5pop4=;
 b=J1pebbBZteOEg7qrmpoAm4xKeHzBkUM5U7Ydh97DOqW1tmiJPbuYjzpzGT3ue4+0jqdiAs
 xr+sLKl6PKMpOqh66UgGj6Tw59SiqwMKvgs9ZVrHWfKPkR9tHGrYQkunb356MngLeOTVu6
 ZjKCqkwYx6qpJEsyBs/cHuWYVc98x9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-vkkzIfBzNjCWU8XovpzH2Q-1; Thu, 17 Jun 2021 07:03:35 -0400
X-MC-Unique: vkkzIfBzNjCWU8XovpzH2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9E7A193248F;
 Thu, 17 Jun 2021 11:03:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A208100AE35;
 Thu, 17 Jun 2021 11:03:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30BC9113865F; Thu, 17 Jun 2021 13:03:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org>
 <8f58a8dcb58849dd917deaea2a728358@intel.com>
 <874kdymjkk.fsf@dusky.pond.sub.org>
 <92b342dd48ca4b8c917ff6afd9574dcd@intel.com>
 <87a6nqhrf0.fsf@dusky.pond.sub.org>
 <0cbfa653aabe42fd831f7a721f6ab85b@intel.com>
Date: Thu, 17 Jun 2021 13:03:28 +0200
In-Reply-To: <0cbfa653aabe42fd831f7a721f6ab85b@intel.com> (Chen Zhang's
 message of "Thu, 17 Jun 2021 03:27:35 +0000")
Message-ID: <87im2c3g8v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Daniel =?utf-8?Q?P=2EBerrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You recently started using

    Content-Type: text/plain; charset="utf-8"
    Content-Transfer-Encoding: base64

Please consider anorhter Content-Transfer-Encoding instead.
quoted-printable should do.

"Zhang, Chen" <chen.zhang@intel.com> writes:

[...]

> No, net-filter is an independent module, although colo must use net-filter to build colo-proxy.
> I think we can change the name when enable net-filter support passthrough list.

Changing names of stable interfaces is always awkward.  So, either make
this an unstable interface, or use names that are likely to work for the
foreseeable evolution of the interface.

What about passthrough-filter-add and -del?  Jason?

[...]


