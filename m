Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA52DFBCF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:24:02 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKEL-0002OA-4l
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krKCx-0001WW-PE
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:22:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krKCs-0007rT-RP
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608553350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhEpigqA+ipFRIWQ2oBRmxteRGQE79rstM++BnK9vbM=;
 b=T8eUIR+7s50Iby/ys93PyLuqcTj0ZIMLpmFNCjVRfBMT4uWkAbaDinWww3mioSCgjDhXv2
 cBXtWLMb97rpi4Nh0gyO5yADg1aegpF+s4PMyGi/X5aEMY/dmKHp3PNc2QGHPVKtMjNbBU
 28/EIAS4jqphTMspM48cRurl5+QWknY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-fh7xZLFHM2SgMrtO3HoC8g-1; Mon, 21 Dec 2020 07:22:26 -0500
X-MC-Unique: fh7xZLFHM2SgMrtO3HoC8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF731005504;
 Mon, 21 Dec 2020 12:22:24 +0000 (UTC)
Received: from gondolin (ovpn-113-49.ams2.redhat.com [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F308710021AA;
 Mon, 21 Dec 2020 12:22:19 +0000 (UTC)
Date: Mon, 21 Dec 2020 13:22:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] s390x/pci: some pcistb fixes
Message-ID: <20201221132217.4c75b8a6.cohuck@redhat.com>
In-Reply-To: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 17:16:35 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Here are a few fixes pulled out of the 'Fixing s390 vfio-pci ISM support'
> patchset.
> 
> v2:
> - Changed loop pattern for patch 2.  @Thomas to be on the safe side I
> didn't include your RB since I changed code, please have a look.
> 
> If there are further issues/comments I will address them after the
> holidays, these aren't urgent fixes.  Thanks!
> 
> Matthew Rosato (2):
>   s390x/pci: fix pcistb length
>   s390x/pci: Fix memory_region_access_valid call
> 
>  hw/s390x/s390-pci-inst.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Thanks, applied.


