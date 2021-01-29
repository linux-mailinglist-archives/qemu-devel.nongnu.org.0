Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427F308AC8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:01:48 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X9X-0008Mo-A9
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l5Ww5-0007Rq-9c
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l5Ww2-0005sP-T1
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611938869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPVxtxHxIUq9zEdlN142XeBBUBWg/58YUqpF6UM0V5Y=;
 b=IxCEWEELVy+FntFr18ZMRXMcWGz2eHfou2UJvQ00woE85KAD5hPZPKpZsbxI1FnlOzQB6V
 9oO2os0Dxjhtygx+yo0skmuOXFwY9h3wUjFiUHFZCjMtYPmW5EM/iappTSos0UHv+UFC8L
 YDXA6pESwUFLg2EYvjR4f6//QXo3+9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-uvyfzPXDOL6tZkkSs8luFQ-1; Fri, 29 Jan 2021 11:47:45 -0500
X-MC-Unique: uvyfzPXDOL6tZkkSs8luFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 609D08030A7;
 Fri, 29 Jan 2021 16:47:43 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8035C1B4;
 Fri, 29 Jan 2021 16:47:36 +0000 (UTC)
Date: Fri, 29 Jan 2021 09:47:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Message-ID: <20210129094736.230023cc@omen.home.shazbot.org>
In-Reply-To: <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
 <20210128200223.GJ2951@work-vm>
 <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 08:49:53 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 28/01/21 21:02, Dr. David Alan Gilbert wrote:
> > * Paolo Bonzini (pbonzini@redhat.com) wrote:  
> >> On 11/01/21 08:34, Keqian Zhu wrote:  
> >>> +static void vfio_listener_log_start(MemoryListener *listener,
> >>> +                                    MemoryRegionSection *section,
> >>> +                                    int old, int new)
> >>> +{
> >>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> >>> +
> >>> +    vfio_set_dirty_page_tracking(container, true);
> >>> +}  
> >>
> >> This would enable dirty page tracking also just for having a framebuffer
> >> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
> >> more heavyweight than expected.  
> > 
> > Wouldn't that only happen on emulated video devices?  
> 
> Yes, but still it's not impossible to have both an emulated VGA and an 
> assigned GPU or vGPU.

In fact, that's often the recommended configuration, particularly for
vGPU where we don't have a vBIOS.  Thanks,

Alex


