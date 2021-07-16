Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9953CB525
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:23:56 +0200 (CEST)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4K4Z-0000JZ-Ei
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4K3G-00082x-Kk
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4K3F-0007PY-0f
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626427352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PwEHeAUm3TK4/4MmcbvfIM7C3NTimmJ8yt7ShmuJ/70=;
 b=MOBr3GpQrXb7TKXwNuYRbj+aHANJWPpkbTjThRvD9+D+9qwc1vVH8GE0wexpxcjv7L4DtE
 0J7CctpVJeRPV/lmQz82dnehVlC99SbfumNpJgGg3wh6XfplW/fLO9u4SXMV9lwkjCpJY8
 ZEsjJ1LW47vgGra/mAIKcYES/UcQ/7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-EpwkwzRFPESZuC_gDaKSww-1; Fri, 16 Jul 2021 05:22:29 -0400
X-MC-Unique: EpwkwzRFPESZuC_gDaKSww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C69E1100C661;
 Fri, 16 Jul 2021 09:22:27 +0000 (UTC)
Received: from localhost (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EFB55C1A1;
 Fri, 16 Jul 2021 09:22:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 6/9] s390x: kvm: topology: interception of PTF
 instruction
In-Reply-To: <1626281596-31061-7-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-7-git-send-email-pmorel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 16 Jul 2021 11:22:21 +0200
Message-ID: <87v95aboky.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:

> Interception of the PTF instruction depending on the new
> KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

Wasn't that the capability that you dropped?

Is PTF supposed to be always intercepting? If that isn't configurable,
wouldn't older QEMUs generate exceptions for it? I'm a bit confused.

>
> A global value is used to remember if a Topology change occured since
> the last interception of a PTF instruction with function code 0.
>
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/s390x/cpu-topology.c            | 19 +++++++++++
>  include/hw/s390x/cpu-topology.h    |  8 +++++
>  include/hw/s390x/s390-virtio-ccw.h |  1 +
>  target/s390x/cpu.c                 |  4 +++
>  target/s390x/cpu.h                 |  1 +
>  target/s390x/kvm/kvm.c             | 52 ++++++++++++++++++++++++++++++
>  6 files changed, 85 insertions(+)


