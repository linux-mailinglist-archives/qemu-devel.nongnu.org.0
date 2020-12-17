Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5252DD697
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:52:32 +0100 (CET)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxS3-0006Mm-Nt
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpxQP-0005OT-71
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:50:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpxQM-0003fu-Uz
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608227444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7u95XguM1VdZRaezxoyuxoxUNzJHLsysV80ejvmag9Q=;
 b=JnXLwtDpkAL3cPcvMibG/KvFg6GRTzg2YVxLTqbHqIEF6lawKw5s85oTCJq7cM9zaL6Y8+
 PHkIXLscEyWbWYsPt5q5dEQ3B0e4iIZjLvjtrLiLtQdRfYF/T8uLykE6cujelcPXokl12I
 1UoF3V4OeuTb9xaaAWnXB1bH6CZO+Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-CYmkCNMHMl21TLuPA9CelQ-1; Thu, 17 Dec 2020 12:50:42 -0500
X-MC-Unique: CYmkCNMHMl21TLuPA9CelQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CEEF59;
 Thu, 17 Dec 2020 17:50:41 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2103818993;
 Thu, 17 Dec 2020 17:50:35 +0000 (UTC)
Date: Thu, 17 Dec 2020 18:50:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201217185034.17efb717.cohuck@redhat.com>
In-Reply-To: <20201208122843.147186-1-cohuck@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  8 Dec 2020 13:28:43 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> v2->v3:
> - do the dmesg cleanout and waiting for messages properly [Thomas]
> 
> Wainer: I dropped your r-b, as there had been too many changes for
>         me to be comfortable with retaining it
> 
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Queued to s390-next.


