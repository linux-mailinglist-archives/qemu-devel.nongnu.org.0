Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A9265E47
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 12:39:06 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGgSO-0004Qn-RL
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kGgQR-0002Yk-6Z
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 06:37:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kGgQP-0001aV-KP
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 06:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599820620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0k1wdTE7W0bWHLi5fcUGfAHHZ4dmf2oU6zpI6LBQl+Y=;
 b=eTRPviTcMx9R7JHy8WmwLelqvCTRdSbuw4NZm5t9fM3MFH/zbCFXHgmk7O/oB1MUZt77wb
 zyG6UfxP0zkbSA5V7kqSJ5qGdjMGQAI60D7Hu5FYBRWTUpBPdHK61+9vHM5vhq6/kWZI49
 gJjmglbBPffRaSskkVQ1vOUicFaM2Vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-387cxRghNd6UOAaV298V1A-1; Fri, 11 Sep 2020 06:36:56 -0400
X-MC-Unique: 387cxRghNd6UOAaV298V1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DD980EF9C;
 Fri, 11 Sep 2020 10:36:55 +0000 (UTC)
Received: from gondolin (ovpn-112-170.ams2.redhat.com [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1548181C44;
 Fri, 11 Sep 2020 10:36:38 +0000 (UTC)
Date: Fri, 11 Sep 2020 12:36:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v5 5/8] s390/sclp: use cpu offset to locate cpu entries
Message-ID: <20200911123636.04bdfdea.cohuck@redhat.com>
In-Reply-To: <20200910093655.255774-6-walling@linux.ibm.com>
References: <20200910093655.255774-1-walling@linux.ibm.com>
 <20200910093655.255774-6-walling@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:28:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, sumanthk@linux.ibm.com,
 mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Sep 2020 05:36:52 -0400
Collin Walling <walling@linux.ibm.com> wrote:

> The start of the CPU entry region in the Read SCP Info response data is
> denoted by the offset_cpu field. As such, QEMU needs to begin creating
> entries at this address.
> 
> This is in preparation for when Read SCP Info inevitably introduces new
> bytes that push the start of the CPUEntry field further away.
> 
> Read CPU Info is unlikely to ever change, so let's not bother
> accounting for the offset there.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
>  hw/s390x/sclp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


