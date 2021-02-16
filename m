Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5A31CCC7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:18:44 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC27f-0003oY-P2
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC26F-0002vL-QW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC26D-0007jb-7Y
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zi5Yn5Bv6XHMbOOkwGInN4BKyLnJl4IfIm5dQ0Qfuf4=;
 b=KPG4NSxm9/Fnv+KNS+MXP9aAIDBoRhy/rTiA9jrh+gSSu/HKAtXfMzjhVSiMN8Se8vJAoz
 Ctt1N5Daqx9PR2BMultZ4Y3pQoZSRM8S9Ki/GdQeuNgthTrx86buZEsL7fJRIwQlfGfRIu
 L3FtbvFw8+S6ukRCdJaGkwNfPQqCX6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-K5VbyGVONe2cMwEkyDQ4Zw-1; Tue, 16 Feb 2021 10:17:09 -0500
X-MC-Unique: K5VbyGVONe2cMwEkyDQ4Zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 713EE80403B;
 Tue, 16 Feb 2021 15:17:08 +0000 (UTC)
Received: from gondolin (ovpn-113-145.ams2.redhat.com [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 179EB5C26D;
 Tue, 16 Feb 2021 15:17:06 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:17:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
Message-ID: <20210216161705.5e4c6952.cohuck@redhat.com>
In-Reply-To: <20210216154010.3691880f.pasic@linux.ibm.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 15:40:10 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 16 Feb 2021 12:00:56 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > According to the virtio specification, a memory barrier should be
> > used before incrementing the idx field in the "available" ring.
> > So far, we did not do this in the s390-ccw bios yet, but recently
> > Peter Maydell saw problems with the s390-ccw bios when running
> > the qtests on an aarch64 host (the bios panic'ed with the message:
> > "SCSI cannot report LUNs: response VS RESP=09"), which could
> > maybe be related to the missing memory barriers. Thus let's add
> > those barriers now. Since we've only seen the problem on TCG so far,
> > a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
> > in the TCG translate code.
> > 
> > (Note: The virtio spec also talks about using a memory barrier
> > *after* incrementing the idx field, but if I understood correctly
> > this is only required when using notification suppression - which
> > we don't use in the s390-ccw bios here)  
> 
> I suggest to the barrier after incrementing the idx field for two
> reasons. First: If the device were to see the notification, but
> not see the incremented idx field, it would effectively loose
> initiative. That is pretty straight forward, because the
> notification just says 'check out that queue', and if we don't
> see the incremented index, miss the buffer that was made available
> by incrementing idx.
> 
> Second: We are in the bios, and I hope even an unnecessary barrier
> would not hurt us significantly.

Yes to both, I think that is worth a try.

> 
> Conny, what do you think?
> 
> Regards,
> Halil
> 


