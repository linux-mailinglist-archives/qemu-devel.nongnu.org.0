Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E62667C7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 19:51:50 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGnDA-0001om-Sx
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGnCE-0001HO-1v
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 13:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGnCB-0003qW-Vs
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 13:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599846646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Galy2uYGN+7NY75HVH5l+lttnp9ml+eumgADoIq1m5Y=;
 b=FqF8ch45y/xxpSa0ANPRB/0fmSXvuATvmjCx4ah6u76uaSOjt0De0ikuAfaDMfG3ttazHu
 m7CrLjbXQ8/A74hkt077yAeWw9UWUUrbIaPIknJqkLvZsu3cZi57MkKaw+pZf5h8/ROM+m
 qZkHY8TavsDzzbkaOnpAAubsIRIPlHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-0qpJZ9ZcO5Cmlp7x_s-RiQ-1; Fri, 11 Sep 2020 13:50:43 -0400
X-MC-Unique: 0qpJZ9ZcO5Cmlp7x_s-RiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 493BD81F028;
 Fri, 11 Sep 2020 17:50:42 +0000 (UTC)
Received: from work-vm (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB73F19C78;
 Fri, 11 Sep 2020 17:50:20 +0000 (UTC)
Date: Fri, 11 Sep 2020 18:50:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH V1 10/32] kvmclock: restore paused KVM clock
Message-ID: <20200911175018.GP3310@work-vm>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-11-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1596122076-341293-11-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 23:26:59
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Sistare (steven.sistare@oracle.com) wrote:
> If the VM is paused when the KVM clock is serialized to a file, record
> that the clock is valid, so the value will be reused rather than
> overwritten after cprload with a new call to KVM_GET_CLOCK here:
> 
> kvmclock_vm_state_change()
>     if (running)
>         ...
>     else
>         if (s->clock_valid)
>             return;         <-- instead, return here
> 
>         kvm_update_clock()
>            kvm_vm_ioctl(kvm_state, KVM_GET_CLOCK, &data)  <-- overwritten
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/i386/kvm/clock.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
> index 6428335..161991a 100644
> --- a/hw/i386/kvm/clock.c
> +++ b/hw/i386/kvm/clock.c
> @@ -285,18 +285,22 @@ static int kvmclock_pre_save(void *opaque)
>      if (!s->runstate_paused) {
>          kvm_update_clock(s);
>      }
> +    if (!runstate_is_running()) {
> +        s->clock_valid = true;
> +    }
>  
>      return 0;
>  }
>  
>  static const VMStateDescription kvmclock_vmsd = {
>      .name = "kvmclock",
> -    .version_id = 1,
> +    .version_id = 2,
>      .minimum_version_id = 1,
>      .pre_load = kvmclock_pre_load,
>      .pre_save = kvmclock_pre_save,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(clock, KVMClockState),
> +        VMSTATE_BOOL_V(clock_valid, KVMClockState, 2),
>          VMSTATE_END_OF_LIST()

We always try and avoid bumping version_id unless we're
desperate because it breaks backwards migration.

Didn't you already know from the stored migration state
(in the globalstate) if the loaded VM was running?

It's also not clear to me why you're avoiding reloading the state;
have you preserved that some other way?

Dave

>      },
>      .subsections = (const VMStateDescription * []) {
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


