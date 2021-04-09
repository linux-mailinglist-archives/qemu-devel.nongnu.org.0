Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1635A006
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:39:32 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrMB-0002HC-8O
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pabeni@redhat.com>) id 1lUnL3-0002PH-9E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pabeni@redhat.com>) id 1lUnL1-0001yW-9E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617960122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXMDtVJ3YZGn2oS2yaFy+ohfW3gJhksxj4mWdaDjWjc=;
 b=NQy/7v/RbCGIAYvhKXuerxy9OvZl9i+tWfOTBMiCepN4+lh2by4tk5G1xyZZy8TWe0OgaN
 hRT+FkvHsR3CoBzC2WR/5ThaPKahtycpIYpK5Z/NP4sZeY6noQRPaLYwFfccPAZWkouALX
 wvmaLo+nTUZpLF19N0EgPA1MHqu3uHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-l0DkMqidPNCi854A_Xp1UA-1; Fri, 09 Apr 2021 05:20:29 -0400
X-MC-Unique: l0DkMqidPNCi854A_Xp1UA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5EB36415E
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:20:28 +0000 (UTC)
Received: from ovpn-115-50.ams2.redhat.com (ovpn-115-50.ams2.redhat.com
 [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C7F360BE5;
 Fri,  9 Apr 2021 09:20:23 +0000 (UTC)
Message-ID: <463a8ffef45cf680d5ccd26bc25fbac06912d286.camel@redhat.com>
Subject: Re: [RFC PATCH 4/5] migration/socket: Close the listener at the end
From: Paolo Abeni <pabeni@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, "Dr.
 David Alan Gilbert (git)" <dgilbert@redhat.com>
Date: Fri, 09 Apr 2021 11:20:22 +0200
In-Reply-To: <YHAZ+mT8Y7qkz2dn@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <20210408191159.133644-5-dgilbert@redhat.com> <YHAZ+mT8Y7qkz2dn@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pabeni@redhat.com;
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
Cc: armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Fri, 2021-04-09 at 10:10 +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 08, 2021 at 08:11:58PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Delay closing the listener until the cleanup hook at the end; mptcp
> > needs the listener to stay open while the other paths come in.
> 
> So you're saying that when the 'accept(2)' call returns, we are only
> guaranteed to have 1 single path accepted, 

when accept() returns it's guaranteed that the first path (actually
subflow) has been created. Other subflows can be already available, or
can be created later.

> and the other paths
> will be accepted by the kernel asynchronously ? Hence we need to
> keep listening, even though we're not going to call accept(2) again
> ourselves ?

Exactly, the others subflows will be created by the kernel as needed
(according to the configuration and the following MPTCP handshakes) and
will _not_ be exposed directly to the user-space as additional fds. The
fd returned by accept() refers to the main MPTCP socket (that is, the
"aggregated" entity), and not to some specific subflow.

Please let me know if the above clarifies in some way.

Thanks!

Paolo


