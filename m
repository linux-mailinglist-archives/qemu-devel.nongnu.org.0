Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254152960AA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVbFt-0004TI-7P
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVbEe-0003on-Jk
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVbEd-0000bn-13
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603375589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vm6a9bvNijwmlmis05BVXyEyH5d3OHRfGpbbWgoHu0c=;
 b=PlzT7xqbb9Jm3KydRs5epupVjpb2t383P7393J02NlgZTWK5xFXrur0hOPxbhWqOQp1S6X
 Mua7kizsAyeoZBmHwxq/WQsvrK3j4c+9ofdXC4v4ouhIHa8kvhJ8kS2VRorEM4IPUlvBQM
 8P7eKEL/wOovqHhCKUkR9n1RN52tzrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-KedXlh01OWWdU_9aNvvz-g-1; Thu, 22 Oct 2020 10:06:28 -0400
X-MC-Unique: KedXlh01OWWdU_9aNvvz-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11BA107ACF5;
 Thu, 22 Oct 2020 14:06:26 +0000 (UTC)
Received: from gondolin (ovpn-112-67.ams2.redhat.com [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 654C35577D;
 Thu, 22 Oct 2020 14:06:21 +0000 (UTC)
Date: Thu, 22 Oct 2020 16:06:18 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] s390x: pv: Diag318 fixes
Message-ID: <20201022160618.177e1d76.cohuck@redhat.com>
In-Reply-To: <20201022103135.126033-1-frankja@linux.ibm.com>
References: <20201022103135.126033-1-frankja@linux.ibm.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mhartmay@linux.ibm.com, walling@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 06:31:33 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Here are two fixes for the diag318 support that fix crashes when
> booting PV guests.
> 
> We're working on extending our testing to catch problems like these
> earlier.
> 
> 
> Branch:
> https://gitlab.com/frankja/qemu/-/commits/bb/frankja/diag318_fixes
> 
> CI:
> https://gitlab.com/frankja/qemu/-/pipelines/206174979
> 
> 
> V2:
> 	* Moved fencing nto cpu model functions
> 	* Added rev-by and acks
> 
> 
> Janosch Frank (2):
>   s390x: pv: Remove sclp boundary checks
>   s390x: pv: Fix diag318 PV fencing
> 
>  hw/s390x/sclp.c             | 5 -----
>  target/s390x/cpu_features.c | 5 +++++
>  target/s390x/cpu_features.h | 4 ++++
>  target/s390x/cpu_models.c   | 4 ++++
>  target/s390x/kvm.c          | 3 +--
>  5 files changed, 14 insertions(+), 7 deletions(-)
> 

Thanks, applied.


