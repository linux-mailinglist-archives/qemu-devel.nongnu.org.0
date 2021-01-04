Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300092E9593
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:08:05 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwPad-0005t6-QD
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kwPZT-0005Kw-Ri
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kwPZO-0005yl-Iz
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609765605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PXQT9Jhvqw5BEK/5tYfZHs84aIhuxjhd+AC+TNQbpgk=;
 b=ZdV3kNpRDPsSp0HGlD1PzRtk+u1pN3b/dDXkEc+ahELF/cOBU6iboWvAlRgE3Qr1j8VOvw
 oRUaNUFnxdA0siJyhgRU5mPVONrpoekX1g7mz5Lbigjf0HRAsm0spsOUk3gQ1WYA9SuCT7
 K9QXTLqJ5k/5fi9MLqb6BLoD27LHzaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-9HhIJTZ5MVScM77c85XwhQ-1; Mon, 04 Jan 2021 08:06:43 -0500
X-MC-Unique: 9HhIJTZ5MVScM77c85XwhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA609CC03;
 Mon,  4 Jan 2021 13:06:42 +0000 (UTC)
Received: from work-vm (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B96474AA0;
 Mon,  4 Jan 2021 13:06:40 +0000 (UTC)
Date: Mon, 4 Jan 2021 13:06:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 0/3] Bypass specific network traffic in COLO
Message-ID: <20210104130637.GE2972@work-vm>
References: <20201224010918.19275-1-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201224010918.19275-1-chen.zhang@intel.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 qemu-dev <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> From: Zhang Chen <chen.zhang@intel.com>
> 
> Since the real user scenario does not need to monitor all traffic.

Can you explain the type of real user case where they only need to
compare some connections?

Dave

> This series give user ability to bypass kinds of network stream.
> 
> Zhang Chen (3):
>   qapi/net: Add new QMP command for COLO passthrough
>   hmp-commands: Add new HMP command for COLO passthrough
>   net/colo-compare: Add handler for passthrough connection
> 
>  hmp-commands.hx       | 26 +++++++++++++++++++++++
>  include/monitor/hmp.h |  2 ++
>  monitor/hmp-cmds.c    | 20 ++++++++++++++++++
>  net/colo-compare.c    | 49 +++++++++++++++++++++++++++++++++++++++++++
>  net/colo-compare.h    |  2 ++
>  net/net.c             | 39 ++++++++++++++++++++++++++++++++++
>  qapi/net.json         | 46 ++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 184 insertions(+)
> 
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


