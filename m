Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D243985B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:19:06 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0oa-0003vv-SE
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mf0lI-0001mB-Iu
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mf0lE-0004Gv-5w
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171335;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fjZLqrSmsERo2JEm8Ya/N0rqhRybtpyGBTRkFm9DbZY=;
 b=XhsqCB8JFymOZb5Ji5zUXZSEHEmk3Ou0O+x/ba9EHGSSYsE8PL8PAQ1XRY08D6F8r9Oqpn
 bcTQ8fla+5uBpRoBKGBaQsrQkL7CbhZYJk+9wSAJpcH7kn08mYpaYoApXNjWrCSEjwQLBm
 RrurDUZXGGPoTUVtvHugHV6cnPypT2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-kXcXTUCrOA63TeYrK2b1Fw-1; Mon, 25 Oct 2021 10:15:32 -0400
X-MC-Unique: kXcXTUCrOA63TeYrK2b1Fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 957EB101F01F;
 Mon, 25 Oct 2021 14:15:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A2C179451;
 Mon, 25 Oct 2021 14:14:38 +0000 (UTC)
Date: Mon, 25 Oct 2021 15:14:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXa7zMZG2saNHInI@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025140716.166971-2-stefanha@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 03:07:15PM +0100, Stefan Hajnoczi wrote:
> Compiler optimizations can cache TLS values across coroutine yield
> points, resulting in stale values from the previous thread when a
> coroutine is re-entered by a new thread.
> 
> Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> it with clang and gcc. I formatted his idea according to QEMU's coding
> style and wrote documentation.
> 
> These macros must be used instead of __thread from now on to prevent
> coroutine TLS bugs.

Does this apply to all  __thread usage in the QEMU process that can
be used from coroutine context, or just certain __thread usage ?

Mostly I'm wondering if this is going to have implications on external
libraries we use. eg if block layer is using librbd.so APIs, is librbd.sp
safe to use __thread directly in any way it desires ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


