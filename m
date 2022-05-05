Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB751B9A3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:07:30 +0200 (CEST)
Received: from localhost ([::1]:48106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWWH-0000Z6-0b
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWPX-00077v-HC
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:00:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWPQ-0004Yf-0K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651737623;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ez9jLrCnZoNkfXtCu5OMIxT/HF6e0MOJ6DV3q6H3hZ4=;
 b=FBCLUY7m0D7O+EmPkdAGERJOQOhc+iPXkkLqlFkVlDAh3BiPmcDmRejrdBmeOqCkMEH+M6
 m0DF3FjbBha1asl8M+QadZppL8LYeuLPJvreUjOhNzCIM8WQiJvArzxrLWjKL6fLsxVtEq
 CEuwFQR6it7m/nE5hi5GOdtckod/Sag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-jDgxbMKvN7m0u3OyR8x67w-1; Thu, 05 May 2022 04:00:22 -0400
X-MC-Unique: jDgxbMKvN7m0u3OyR8x67w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C83F802819;
 Thu,  5 May 2022 08:00:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEF814A5077;
 Thu,  5 May 2022 08:00:20 +0000 (UTC)
Date: Thu, 5 May 2022 09:00:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 mark.kanda@oracle.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Message-ID: <YnOEEvH44HNyQ8n+@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 09:10:17AM +0200, Paolo Bonzini wrote:
> 
> 
> Il 4 maggio 2022 15:22:27 CEST, Markus Armbruster <armbru@redhat.com> ha scritto:
> >Can you point to existing uses of KVM binary stats introspection data?
> 
> There's none, but Google is using it in house. The same data was
> available before in debugfs and available via the kvm_stat script,
> so you could also refer to Christian Borntraeger's KVM Forum 2019
> talk. The problems with debugfs are basically that it's only
> available to root and is disabled by secure boot (both issues
> are not fixable on general because they are Linux policy).

Libvirt currently uses debugfs to get

 /sys/kernel/debug/kvm/-/halt_poll_success_ns

when we report on CPU usage for VMs. WHen kernel lockdown is enforced
under secure boot we're unable to access this file and even worse
every attempt to access it spams dmesg[1].  We need this query stats
QMP support for that single statistic alone today.


With regards,
Daniel

[1] https://gitlab.com/libvirt/libvirt/-/issues/213
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


