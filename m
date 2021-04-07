Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6C356D2B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:21:46 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU87s-0006qe-KG
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lU85j-0006FP-FF
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lU85b-00053A-C1
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617801559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpnSpOWQ36RrKI7unWAGW5I3lGgrhO3FfpdGO0jVwWo=;
 b=ViVWSDBQia3D5n41ckqa5sgkJ/YtVtFS4Vc4c2BWbJZfBCeIHPS+V72qk29LyfpGf+CQYp
 GVG1EJRkqrb3xCuMV8gjxayhh1XIz+YuV3MXJxZqhAJJFpdXXiv+u83rvz0gUiBBY/+vZo
 p5/5HGo2Ji6GbFNEXni+KYjxFSLmCZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-rweiGcwRND-WcGMSdCA9jA-1; Wed, 07 Apr 2021 09:19:16 -0400
X-MC-Unique: rweiGcwRND-WcGMSdCA9jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3018BBEF1;
 Wed,  7 Apr 2021 13:19:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CAD460C04;
 Wed,  7 Apr 2021 13:19:13 +0000 (UTC)
Date: Wed, 7 Apr 2021 15:19:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Message-ID: <YG2xUD5M7RCuIe+X@merkur.fritz.box>
References: <20210322154024.15011-1-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210322154024.15011-1-s.reiter@proxmox.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.03.2021 um 16:40 hat Stefan Reiter geschrieben:
> The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
> point, where it expects to be rescheduled from the main context. If a
> CHR_EVENT_CLOSED event is received just then, it can race and block the
> main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.
> 
> monitor_resume does not need to be called from main context, so we can
> call it immediately after popping a request from the queue, which allows
> us to drop the qmp_queue_lock mutex before yielding.
> 
> Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
> v2:
> * different approach: move everything that needs the qmp_queue_lock mutex before
>   the yield point, instead of moving the event handling to a different context

The interesting new case here seems to be that new requests could be
queued and the dispatcher coroutine could be kicked before yielding.
This is safe because &qmp_dispatcher_co_busy is accessed with atomics
on both sides.

The important part is just that the first (conditional) yield stays
first, so that the aio_co_wake() in handle_qmp_command() won't reenter
the coroutine while it is expecting to be reentered from somewhere else.
This is still the case after the patch.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


