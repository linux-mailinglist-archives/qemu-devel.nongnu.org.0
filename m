Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57667CABA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1Ac-0007KY-AR; Thu, 26 Jan 2023 07:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pL1Aa-0007Jz-4V
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pL1AY-0008JK-OE
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674735353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5EQavsdE/3IYLViHPQWkDrpyC8OTHXrhqf97l3UpJIQ=;
 b=KhQvIaFcSyJ1f/BvG1oILkzB1DEs4qzxYv9pSNNrJs0XnyWc1Q4zYAPdHaJ14DclSxnxna
 6zHdyHE6Ajy6vKUaboq+xLsXXtnNROfWu+xK/cvo4AAEKw1ifwu0uROUBbaZn8KEbMDK5m
 y5OBChxyBW+grzhJ2ug8KC5lnuXmZPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-886ZYJ3kP_iALkext6bJVA-1; Thu, 26 Jan 2023 07:15:50 -0500
X-MC-Unique: 886ZYJ3kP_iALkext6bJVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 251C42802E31;
 Thu, 26 Jan 2023 12:15:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7181C14171BB;
 Thu, 26 Jan 2023 12:15:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
In-Reply-To: <877cx9y0t6.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <44d82d98-6a27-f4d3-9773-670231f82c63@redhat.com>
 <877cx9y0t6.fsf@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 26 Jan 2023 13:15:46 +0100
Message-ID: <874jsdxzil.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Thu, Jan 26 2023, Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Jan 23 2023, Eric Auger <eauger@redhat.com> wrote:
>
>> Hi Connie,
>> On 1/11/23 17:13, Cornelia Huck wrote:
>>>      if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>>>          error_report("mach-virt: %s does not support providing "
>>> -                     "MTE to the guest CPU",
>>> +                     "emulated MTE to the guest CPU",
>> each time I read this message I feel difficult to understand it. Why not
>> replacing by
>> "mach-virt does not support tag memory with %s acceleration" or
>> something alike?
>
> Hmm... well, it does not support tag memory with kvm/hvf, and the
> consequence of this is that kvm/hvf cannot provide support for emulated
> mte... what about
>
> "mach-virt: tag memory not supported with %s, emulated MTE cannot be
> provided to the guest CPU"
>
> Might be a bit long, though.

"mach-virt: %s does not support providing emulated MTE to the guest CPU
(tag memory not supported)" seems to align better with the other error
messages in that function.


>
>>>                       kvm_enabled() ? "KVM" : "HVF");
>>>          exit(1);
>>>      }


