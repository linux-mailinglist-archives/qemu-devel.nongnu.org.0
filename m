Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5C3A45D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:00:03 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrjZi-00027K-T2
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrjYg-0001JP-VL
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrjYf-0002KO-II
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623427136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2pS+Tj8v99AJi4LB6o6gJqgLxOjp5b08D+DuZs3L8U=;
 b=VhfbL45RtWKySBOXkqN/yMj62Gch45l41Le+A52kGnmgfnpv38+NqdZbK2PjPug3BZwd9X
 HcWblrAc+nP6wh+mGhTxhvPuR821Ah2C8v7dbWDhaHsrPgudsQ+NNP9cO68Y7v75iEDTEQ
 BAN5949h4wkDCWkuumM3yUjwNl7Rz8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-fiseoDhGMb2mBwgcEEkGNg-1; Fri, 11 Jun 2021 11:58:55 -0400
X-MC-Unique: fiseoDhGMb2mBwgcEEkGNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6832D9126F;
 Fri, 11 Jun 2021 15:58:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE26B100760F;
 Fri, 11 Jun 2021 15:58:50 +0000 (UTC)
Date: Fri, 11 Jun 2021 10:58:49 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
Message-ID: <20210611155849.44qsumqph25ycozw@redhat.com>
References: <20210609122234.544153-1-pbonzini@redhat.com>
 <0f6e48bc-6c72-63b5-a3d5-ec2696437237@virtuozzo.com>
 <c5ed6cf3-4517-bfc3-ddef-49f4444d2048@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c5ed6cf3-4517-bfc3-ddef-49f4444d2048@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: eesposit@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 01:14:27PM +0200, Paolo Bonzini wrote:
> > > With this change, qemu_mutex_iothread_locked() must be changed from
> > 
> > Did you miss "qemu_mutex_iothread_locked() stub function"?
> 
> Yes, that comment refers to the stub.  Let me resubmit with a testcase and
> I'll fix that too.

Vladimir's v4 series reworking nbd connection depends on this one.
I'll wait for your v3 to land, but once it does, I'm happy to queue it
through my NBD tree along with Vladimir's work, if that makes it
easier.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


