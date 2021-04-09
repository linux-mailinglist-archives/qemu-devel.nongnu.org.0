Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677135A018
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrNn-0003xH-Bp
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pabeni@redhat.com>) id 1lUnrH-0007od-6p
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pabeni@redhat.com>) id 1lUnrC-0004xf-AU
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617962117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xk6aPUMoodmF2KTEHFS/QoGPuE+Vc+M1WRBKDoBIZV0=;
 b=EN7KL5JKkZt73D6hTaeSImDAjeek7MO0ZyF+AuZIeeIMWL8PL7lqKVTie8EuIRVvuvfMWs
 ioceFH6G4UTJrujddi2fPDmCRqVAR8I6sRVodmL2MgZrAMoUwbvdXzB3AFIb5UjkGbrhAK
 iAcK9w74m9nI+dELMcI+1/rzJfqALeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Ss_xU0vTPo6S4M8c6SbrCA-1; Fri, 09 Apr 2021 05:55:15 -0400
X-MC-Unique: Ss_xU0vTPo6S4M8c6SbrCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE05F107ACCD
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:55:14 +0000 (UTC)
Received: from ovpn-115-50.ams2.redhat.com (ovpn-115-50.ams2.redhat.com
 [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50E8718400;
 Fri,  9 Apr 2021 09:55:09 +0000 (UTC)
Message-ID: <42751404a70955fcfa894c1251a634e61f112085.camel@redhat.com>
Subject: Re: [RFC PATCH 0/5] mptcp support
From: Paolo Abeni <pabeni@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, "Dr.
 David Alan Gilbert (git)"
 <dgilbert@redhat.com>, quintela@redhat.com, armbru@redhat.com, 
 qemu-devel@nongnu.org, kraxel@redhat.com
Date: Fri, 09 Apr 2021 11:55:07 +0200
In-Reply-To: <YHAhi0YQcZdnsOvl@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <YHAfpndcY5GRUYgN@redhat.com> <YHAhi0YQcZdnsOvl@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pabeni@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 09 Apr 2021 09:37:50 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-04-09 at 10:42 +0100, Daniel P. Berrangé wrote:
> On Fri, Apr 09, 2021 at 10:34:30AM +0100, Daniel P. Berrangé wrote:
> > On Thu, Apr 08, 2021 at 08:11:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >   I had a quick go at trying NBD as well, but I think it needs
> > > some work with the parsing of NBD addresses.
> > 
> > In theory this is applicable to anywhere that we use sockets.
> > Anywhere that is configured with the QAPI  SocketAddress /
> > SocketAddressLegacy type will get it for free AFAICT.
> 
> The caveat is any servers which share the problem of prematurely
> closing the listener socket that you fixed here for migration.

For the records, there is an alternative to that, based on a more
advanced and complex MPTCP configuration available only on even more
recent kernels. MPTCP can be configured to accept additional subflows
on a different listener, which will be managed (created and disposed)
by the kernel with no additional user-space changes (beyond the MPTCP
configuration).

That will require also a suitable firewalld (if enabled) configuration
(keeping the additional port open/accessible from the client).

Finally such configuration can be even more complex e.g. the additional
listener could be alternatively configured on the client side (!!!) and
the server could be configured to create additional subflows connecting
to such port (again no user-space changes needed, "only" more complex
MPTCP configuration).

Cheers,

Paolo




