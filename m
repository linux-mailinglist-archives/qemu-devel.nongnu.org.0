Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDFE4E6808
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:46:06 +0100 (CET)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRXA-0008PT-Q7
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:46:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXRPK-0006CQ-On
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXRPI-0003JW-IM
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648143475;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cGaIXkcKy5ArnEefYqwhgBTHuaapDOW12hUDI/c1dI=;
 b=UdF57/mbCbhfDa2IYCwpMd2hNE+NID7Sj61DNMfrciS9VX/U22z4+5Z1FXdqqJ8PkegyH9
 +xvdhwKmhrIQQHXal60qGra9Kk6tXHM6WCHKPLsJ3V2Trhph4dZcLekDKoUhuTH3iXyvON
 QRMHBW4TfDiYqP4x9uujyoUfYjOIRYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-z50LjZbMOhewJsYnldRd2g-1; Thu, 24 Mar 2022 13:37:47 -0400
X-MC-Unique: z50LjZbMOhewJsYnldRd2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E268E18E52A3
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:37:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54911C27E8A;
 Thu, 24 Mar 2022 17:37:44 +0000 (UTC)
Date: Thu, 24 Mar 2022 17:37:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: introduce CPU property to work around
 Windows reset bug
Message-ID: <YjysZgWjdWxrZHin@redhat.com>
References: <20220324082346.72180-1-pbonzini@redhat.com>
 <Yjw2KG4y8fK5Dw4F@redhat.com> <Yjw2yvN1OHkmBb2X@redhat.com>
 <e0a39a1e-abef-722b-eed7-8bb79e7c151d@redhat.com>
 <YjxQAKKKBR3oHdRN@redhat.com>
 <6bad2204-4a21-19e7-e2f6-3ef30632bda4@redhat.com>
 <78c4b687-473f-e3db-fcfd-9525e9a5c8f9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <78c4b687-473f-e3db-fcfd-9525e9a5c8f9@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 06:13:03PM +0100, Paolo Bonzini wrote:
> On 3/24/22 12:24, Paolo Bonzini wrote:
> > That said, the VMware kbase does paint a slightly different picture.  It
> > implies that starting with hardware version 11 rebooting Windows is done
> > through a hard reset instead of INIT.  I'm not sure how that would be
> > done, but in the meanwhile our fix should take care of do_cpu_init as
> > well.
> 
> Ok, so here are my findings:
> 
> - Windows resets the system by writing 0xFE to port 0x64.  This is a hard
> reset on QEMU, but presumably it was a soft reset (INIT) on VMware until
> version 10.
> 
> - QEMU _does_ try to write 0 to the TSC on hard reset.  But KVM special
> cases 0 as "somebody is trying to hot-plug a new CPU" and wants to help out,
> so it keeps the CPU synchronized with the previous TSC.
> 
> So this is a pretty clear-cut QEMU bug.  It can be fixed by e.g. writing 1
> to the TSC instead of 0.

Ah, excellant findings, so we won't need a config knob after all.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


