Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78D2BA612
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:27:52 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2hq-0004nv-PH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kg2go-0004K8-Fv
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:26:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kg2gk-0005jx-Ao
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605864400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up7xL3kAHBYMIMTHd6pOC2EIDEeFpHYrztH+d8f2xno=;
 b=IUeAo0P8dFZbyQEXmmxtY+ZF4gLLRt0xiMa1Bbt6KKzb4Vu41cdVsr75kcZmlHX2EXM2ho
 lEnBajl1Q9iJBGArd6VT4SgYLTOfnyBo0gP3IX2kZqny2Sn32eDTPrQgWy+57h9E27fRJy
 iskTCrO4v2o5kKyMNZD6nI9nqJmfwCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ynrIXCN7MHOjBlcsYF39Jw-1; Fri, 20 Nov 2020 04:26:38 -0500
X-MC-Unique: ynrIXCN7MHOjBlcsYF39Jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9884890AF9;
 Fri, 20 Nov 2020 09:26:32 +0000 (UTC)
Received: from gondolin (ovpn-112-250.ams2.redhat.com [10.36.112.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92EC36A907;
 Fri, 20 Nov 2020 09:26:29 +0000 (UTC)
Date: Fri, 20 Nov 2020 10:26:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 1/2] pc-bios: s390x: Ensure Read IPL memory is clean
Message-ID: <20201120102626.45842232.cohuck@redhat.com>
In-Reply-To: <20201119165729.63351-2-farman@linux.ibm.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-2-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 17:57:28 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> If, for example, we boot off a virtio device and chreipl to a vfio-ccw
> device, the space at lowcore will be non-zero. We build a Read IPL CCW
> at address zero, but it will have leftover PSW data that will conflict
> with the Format-0 CCW being generated:
> 
> 0x0: 00080000 80010000
>        ------ Ccw0.cda
>               -- Ccw0.chainData
>                 -- Reserved bits
> 
> The data address will be overwritten with the correct value (0x0), but
> the apparent data chain bit will cause subsequent memory to be used as
> the target of the data store, which may not be where we expect (0x0).
> 
> Clear out this space when we boot from DASD, so that we know it exists
> exactly as we expect.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  pc-bios/s390-ccw/dasd-ipl.c | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


