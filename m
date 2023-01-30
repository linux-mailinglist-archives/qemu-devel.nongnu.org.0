Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AA681573
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWL3-0005Ic-H6; Mon, 30 Jan 2023 10:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pMWL0-0005G0-BD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:44:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pMWKy-0001DO-RM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675093491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVbLt1SgQNM2Zaaks7o51hgb3N5//urqJuNX/n1xX+Y=;
 b=F3X7GDOpmBCO2kToUixv1xWyytSydqzj5mCwr0NOUnMYwutvRLJupTbhLcnmkkBOGhhFGC
 xa/BVDwyxBuCw9qEleMM+uC3o6ke2gWni8eO7llpvhhJNUougAO5k8eWzselOk7q2lqVKN
 h9V1yTWpcjsvngG5PWzjRh1QKP42Jkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-0j2iqF0NOMe7vJrtMsDyvA-1; Mon, 30 Jan 2023 10:44:49 -0500
X-MC-Unique: 0j2iqF0NOMe7vJrtMsDyvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D6478588E0;
 Mon, 30 Jan 2023 15:44:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E664422FE;
 Mon, 30 Jan 2023 15:44:49 +0000 (UTC)
Date: Mon, 30 Jan 2023 15:44:48 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, kwolf@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <20230130154448.GS7636@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
 <Y9fa+Zm5VLNoDDo0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9fa+Zm5VLNoDDo0@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 02:58:01PM +0000, Daniel P. Berrangé wrote:
> Obviously at startup QEMU can trivially inherit the FDs from whatever
> spawned it. The only task is to identify the FDs that are passed into,
> and systemd defined a mechanism for this using LISTEN_FDNAMES. IOW the
> socket activation can fully replace 'getfd' for purpose of initial
> startup. This will get rid of the annoying difference that SocketAddress
> only allows numeric FDs at startup and named FDs at runtime, by making
> named FDs the consistent standard. We could thus deprecate the use of
> non-named numeric FDs in SocketAddress to improve our sanity.
> 
> The question is how to define semantics for the LISTEN_FDNAMES while
> also still remaining back compat with the existing QEMU utilities
> that allow socket activation. Some kind of naming scheme would need
> to be decided upon, as well as handling the use of activation without
> LISTEN_FDNAMES being set. 

If I understand LISTEN_FDNAMES correctly, it's the names of the
protocols to be used (rather clumsily expressed through IANA
registered names from /etc/services).  It would be valid to use
LISTEN_FDNAMES=http:http for example, for a service that must use HTTP
on both sockets.

In other words it's not just names of file descriptors that you can
make up.

However as there is zero documentation for this environment variable,
who knows what it's really supposed to be ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit


