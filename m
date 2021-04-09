Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FD359893
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:06:03 +0200 (CEST)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUn5W-0001MR-FO
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUn3O-0000uY-KS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:03:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUn3L-0007Lq-Ft
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617959022;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1kiNFFCQ/rdAoNS+s6jmRhr1E4aZFCmjvhYqn9zlss=;
 b=f5fsMaeLdZ1yyCmAgY2k1tbbAK1OIBuC/mhF0fwAIpgG8TX5fQA91EX81e0R4teH0K6OAU
 WQ2Yy12xREkpzFwUueqN66ipDGseh9jd58cMB/yOdwXgHkhEjQfiErvI6ym+2ZInGvLQAS
 lb1Xaa3r83gzFccjAnjpv5pRHCUCeEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-HIvhsKNeNtyoCXyW5nAnqw-1; Fri, 09 Apr 2021 05:03:37 -0400
X-MC-Unique: HIvhsKNeNtyoCXyW5nAnqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9314D1876586
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:03:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5789660BE5;
 Fri,  9 Apr 2021 09:03:31 +0000 (UTC)
Date: Fri, 9 Apr 2021 10:03:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 1/5] channel-socket: Only set CLOEXEC if we have
 space for fds
Message-ID: <YHAYYAXan+tXimI1@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <20210408191159.133644-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408191159.133644-2-dgilbert@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 08:11:55PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> MSG_CMSG_CLOEXEC cleans up received fd's; it's really only for Unix
> sockets, but currently we enable it for everything; some socket types
> (IP_MPTCP) don't like this.
> 
> Only enable it when we're giving the recvmsg room to receive fd's
> anyway.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  io/channel-socket.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


