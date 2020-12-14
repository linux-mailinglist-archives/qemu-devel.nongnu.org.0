Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C72D9B46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:41:36 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopyh-0002eV-VN
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kopwv-0001fS-Jx
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kopwq-0007Cv-Ti
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607960380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnkP9eiAhNnK7BFSA0ih5EU2+1jdD0cGG643tsc6N5Y=;
 b=SQul40Et84oNGoV6NpwhCIyXjmUoTu3pbhdjFjyqAYXne/P7gfFoxWKyPfmQkKimT5946/
 AAcJzOh6I6nCOOK8PfAlsbq1A2GThSH5R9UJlgqf3HDA+oQzOjZupHBYKCgeo0mmOTxlW/
 gY+QZXv7dcTG8FqP9mDNkpPCXKqQs7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-5ecd76QWPx6-YR0NY693wA-1; Mon, 14 Dec 2020 10:39:36 -0500
X-MC-Unique: 5ecd76QWPx6-YR0NY693wA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C26107ACE3;
 Mon, 14 Dec 2020 15:39:35 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6F010016FE;
 Mon, 14 Dec 2020 15:39:31 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:39:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2] s390x: pv: Fence additional unavailable SCLP
 facilities for PV guests
Message-ID: <20201214163929.7945a3ca.cohuck@redhat.com>
In-Reply-To: <20201211105109.2913-1-frankja@linux.ibm.com>
References: <20201211105109.2913-1-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 05:51:09 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> There's no VSIE support for a protected guest, so let's better not
> advertise it and its support facilities.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
> v2: added hpma2
> ---
>  target/s390x/cpu_features.c | 39 ++++++++++++++++++++++++++++++++++++-
>  target/s390x/cpu_models.c   | 25 ++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 3 deletions(-)

Thanks, applied.


