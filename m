Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9435F4D0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:28:44 +0200 (CEST)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfZT-0007qZ-Bk
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWfXa-0006qf-4V
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWfXX-0002mv-CF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618406801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFyMyfuvPH4Px1FYqG0eqdpeDyzAoXnqY6Xttm858S4=;
 b=RLJu78PxfMMhmaqYWKuVEtLe01TzjgxsJClX+7sbq1qBVV7tPWaXRp6oeYN+RW90X4ePg8
 YqcLb5YZ0ADoWuuvHwMUCuAfEvDCaBH40qHY1AkcIhHJiOedwLA6/xM8+/kTYKsgWPF71r
 2ceObOeT6iaEm1Ny17Z6hUsuGGuDldg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Z5esgfvCPB2bXFHK_mJF6w-1; Wed, 14 Apr 2021 09:26:38 -0400
X-MC-Unique: Z5esgfvCPB2bXFHK_mJF6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E6C88C45A8;
 Wed, 14 Apr 2021 13:26:37 +0000 (UTC)
Received: from localhost (ovpn-114-144.rdu2.redhat.com [10.10.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1896610AF;
 Wed, 14 Apr 2021 13:26:31 +0000 (UTC)
Date: Wed, 14 Apr 2021 09:26:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v2] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
Message-ID: <20210414132631.ilnasigkxcjoi2px@habkost.net>
References: <20210331113948.333461-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210331113948.333461-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My apologies, this was lost under the noise in my mail inbox.
(I promise I'm trying to improve)

On Wed, Mar 31, 2021 at 01:39:48PM +0200, Vitaly Kuznetsov wrote:
> Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
> was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
> has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
> explicitly on the command line. This works but the migration fails late and
> this may come as an unpleasant surprise. To make things more explicit,
> require 'tsc-frequency=' on the command line when 'hv-reenlightenment' was
> enabled. Make the change affect 6.0+ machine types only to preserve
> previously-valid configurations.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Even if the 6.0 release gets delayed, I wouldn't be comfortable
including this in a -rc4.

What if the user does not plan to live migrate the machine at
all?  Why is this case different from the ~25
migrate_add_blocker() calls in QEMU, where we block migration but
still let the VM run?

-- 
Eduardo


