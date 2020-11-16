Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78662B436A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:15:33 +0100 (CET)
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedPw-0005wN-Ss
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kedNW-00043N-0J
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kedNS-0007Wm-5u
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605528777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7qAjM+vvD3zGLMErXNxfr0+CplMx5z066oS1LTFmdY=;
 b=ZI/D1/fvB42GLSB60TDiNCDkiAVH0tybbOrCuR+gjq9KvL80mdRFWA7PS1YHrbQNy3X70Q
 F+XY2SZiSo1Acwygd4MoIvGOwGs/+Opqg+QzMJgLagqlAdHnGwwrPeWyiL1kqgh7oLFhUy
 SxHtoI2KUKay9jUa/ZOdXJ+FTyLO/Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-yPeInecgPZSzc-yadbbd_g-1; Mon, 16 Nov 2020 07:12:55 -0500
X-MC-Unique: yPeInecgPZSzc-yadbbd_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E638C1084D6F;
 Mon, 16 Nov 2020 12:12:53 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0108A5D9D2;
 Mon, 16 Nov 2020 12:12:44 +0000 (UTC)
Date: Mon, 16 Nov 2020 13:12:41 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v3] s390/kvm: fix diag318 propagation and reset
 functionality
Message-ID: <20201116131241.29a13126.cohuck@redhat.com>
In-Reply-To: <20201113221022.257054-1-walling@linux.ibm.com>
References: <20201113221022.257054-1-walling@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 17:10:22 -0500
Collin Walling <walling@linux.ibm.com> wrote:

[please remember to put qemu-devel on cc: as well]

> The Control Program Name Code (CPNC) portion of the diag318
> info must be set within the SIE block of each VCPU in the
> configuration. The handler will iterate through each VCPU
> and dirty the diag318_info reg to be synced with KVM on a
> subsequent sync_regs call.
> 
> Additionally, the diag318 info resets must be handled via
> userspace. As such, QEMU will reset this value for each
> VCPU during a modified clear, load normal, and load clear
> reset event.
> 
> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
> 
> Changelog:
> 
>         v3:
>         - moved loop outside of switch block
>         - added kvm_s390_set_diag318 function, called by
>             do_cpu_function (this is so other archs do
>             not complain)
> 
>         v2:
>         - added Fixes tag
>         - added CPU feat check in do_cpu function
> 
> ---
>  hw/s390x/s390-virtio-ccw.c |  4 ++++
>  target/s390x/cpu.c         |  7 +++++++
>  target/s390x/cpu.h         |  1 +
>  target/s390x/kvm-stub.c    |  4 ++++
>  target/s390x/kvm.c         | 22 +++++++++++++++++-----
>  target/s390x/kvm_s390x.h   |  1 +
>  6 files changed, 34 insertions(+), 5 deletions(-)

Thanks, queued to s390-fixes.

I plan to send a pull request tomorrow.


