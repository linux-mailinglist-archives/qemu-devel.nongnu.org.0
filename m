Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD53089B9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:07:49 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VNE-0005Sx-VR
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VK7-0004AJ-QZ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VK3-0001g0-FF
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611932670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOB+RZu2s5/hddLeTpiFLae2L60CCzIyMqqUiCHTStc=;
 b=JL7ile4B+A8I9VWNJwhfOIPPxWgiM0ixev2n6t7llT1tsbEOUQSliGY8eLQmrGKhOg/Fah
 eGkHCqvvqa1roP4RnH8F0n2dBqRjY90gNLXbirqb3MlTIATzYwqoBO1Xqew6L4WVIOrjL8
 4vRXaGWYpXKnPB2MMOkBi3qCr2mpjpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-i-1uGEQ4O4aNz-wORgcE0A-1; Fri, 29 Jan 2021 10:04:28 -0500
X-MC-Unique: i-1uGEQ4O4aNz-wORgcE0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E911005504;
 Fri, 29 Jan 2021 15:04:27 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-45.rdu2.redhat.com [10.10.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8582E5D9C0;
 Fri, 29 Jan 2021 15:04:15 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 243A1220BCF; Fri, 29 Jan 2021 10:04:15 -0500 (EST)
Date: Fri, 29 Jan 2021 10:04:15 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/6] virtiofsd: Drop ->vu_dispatch_rwlock while waiting
 for thread to exit
Message-ID: <20210129150415.GC3146@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-2-vgoyal@redhat.com>
 <20210126165600.7bbe369d@bahia.lan>
 <20210126183336.GB3239@redhat.com>
 <20210129130309.1e769bdc@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210129130309.1e769bdc@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 01:03:09PM +0100, Greg Kurz wrote:
> On Tue, 26 Jan 2021 13:33:36 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> [...]
>  
> > > 
> > > Also, since pthread_rwlock_wrlock() can fail, I think we should
> > > always check it's return value, at least with an assert() like
> > > already done elsewhere.
> > 
> > Will check return code of pthread_rwlock_wrlock() and probably use
> > assert().
> > 
> 
> It turns out that pthread_rwlock_rdlock() and pthread_rwlock_unlock() can
> also fail for various reasons that would likely indicate a programming
> error, but their return values are never checked anywhere.
> 
> I have a patch to address this globally in this file. Should I post it
> now or you prefer this series goes first ?

Please go ahead and post your patch. Your patch can go first and I can
rebase my patches on top of yours.

Vivek


