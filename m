Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F433AC4A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:31:39 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLhhS-0001lQ-6w
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLhfd-0000lI-Dp
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLhfb-00040H-U1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615793383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQpUtyeTHLGdGGWOAb4d3z2Li45XSVH2JV6VbL4MPuk=;
 b=hVDIHkQwISRR8a5hbGNbraen0D9txupILPXoLVIKwKd1BLU8h/NsE1LyExWj8IpESkPAbR
 eej6Ve4TyjeqK4Fku95vneMZutBiscuI7gbccPOj2jIguyzq/EG/Q7IY4+aWGeD6MDQJBV
 hCty7mXCXdkeVXCJDbOW1i+zK/NwZOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253--w8t8iTtMmSYp-7sn7ouRg-1; Mon, 15 Mar 2021 03:29:41 -0400
X-MC-Unique: -w8t8iTtMmSYp-7sn7ouRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65DDF18D6A2A;
 Mon, 15 Mar 2021 07:29:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBBD6BC0C;
 Mon, 15 Mar 2021 07:29:39 +0000 (UTC)
Subject: Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
To: Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-6-ma.mandourr@gmail.com>
 <dfa393ed-88ba-9c4b-e991-aeb9e73050a4@redhat.com>
 <CAD-LL6hQuCFkzwnRGh1QLA8xsrTZoLYfNfXbKaU+E=UZAcozOA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3bff00dd-34e7-10bb-ee74-45a7856be030@redhat.com>
Date: Mon, 15 Mar 2021 08:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAD-LL6hQuCFkzwnRGh1QLA8xsrTZoLYfNfXbKaU+E=UZAcozOA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 07.43, Mahmoud Mandour wrote:
>     If it's unrelated, then maybe better do it in a separate patch.
> 
> 
> I thought so but I didn't know whether it was a so-small change
> that it didn't require its own patch or not. I will amend that.
> 
>     Since this is only a very small allocation, I think it would be better to
>     use g_malloc() here and then simply remove the "if (info == NULL) ..." part.
> 
> 
> I was thinking of always maintaining the semantics of the existing
> code and since g_malloc() does not behave like malloc() on
> error, I refrained from using g_malloc() anywhere, but of course
> I'll do it since it's the better thing to do.

Keeping the semantics is normally a good idea, but the common sense in the 
QEMU project is to rather use g_malloc() for small allocations (if 
allocating some few bytes already fails, then the system is pretty much dead 
anyway), and only g_try_malloc() for huge allocations that really might fail 
on a healthy system, too.

We should likely add some text to our coding style document to make this 
more obvious...

> I will split the patches to a two-patch series regarding the
> util/compactfd.c file (one for the style change and one for
> changing the malloc() call into g_malloc()) and send them
> again, is that ok?

Sounds good, thanks!

  Thomas



