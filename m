Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9949A4DB5AC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:11:07 +0100 (CET)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWEs-0001ys-7q
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:11:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUW6W-0004No-Nm
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUW6T-0006x9-Ez
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647446544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCoLFs60Vb6bJ3RyXyP35rCR6eFbRULZPEhWCbC+WNs=;
 b=f38OuOK4sRKr1UDDSHWtJdZrcRT9WeqiOwivtYYnc2EpRUf3XeNAJ5Qjsb/u0krRXpuMwy
 aM3XVt8j04+br8sa6OXYqWRMxYys9TKq1KnLwa+G1WVFDkU5jXWRF1JIDbJxB7FI89sB4B
 vVNeXyTLAlsO+NjnJPAM/+1ioX094O4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-YZSb2x8ROLODTn9q7K2ZyQ-1; Wed, 16 Mar 2022 12:02:22 -0400
X-MC-Unique: YZSb2x8ROLODTn9q7K2ZyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50BF1802A5A;
 Wed, 16 Mar 2022 16:02:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50EF5401E7C;
 Wed, 16 Mar 2022 16:02:21 +0000 (UTC)
Date: Wed, 16 Mar 2022 17:02:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PULL 21/50] block/block-backend.c: assertions for block-backend
Message-ID: <YjIKDFSTUJmTq8Tz@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
 <20220304164711.474713-22-kwolf@redhat.com>
 <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
 <cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com>
 <d600ff25-d854-7239-9001-7315b24b9054@redhat.com>
 <b8bc1a54-1eb8-b3b5-c40f-d1cbaa9e69d8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b8bc1a54-1eb8-b3b5-c40f-d1cbaa9e69d8@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.03.2022 um 16:25 hat Philippe Mathieu-Daudé geschrieben:
> On 16/3/22 15:46, Emanuele Giuseppe Esposito wrote:
> > Am 16/03/2022 um 13:53 schrieb Philippe Mathieu-Daudé:
> > > On 16/3/22 13:44, Philippe Mathieu-Daudé wrote:
> > > > Hi,
> > > > 
> > > > On 4/3/22 17:46, Kevin Wolf wrote:
> > > > > From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > > > 
> > > > > All the global state (GS) API functions will check that
> > > > > qemu_in_main_thread() returns true. If not, it means
> > > > > that the safety of BQL cannot be guaranteed, and
> > > > > they need to be moved to I/O.
> > > > 
> > > > I'm getting this crash:
> > > > 
> > > > $ qemu-system-i386
> > > > Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
> > > > block-backend.c, line 552.
> > > > Abort trap: 6
> > > > 
> > > > Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
> > > > block-backend.c, line 552.
> > > > qemu-system-i386 was compiled with optimization - stepping may behave
> > > > oddly; variables may not be available.
> > > > Process 76914 stopped
> > > > * thread #1, queue = 'com.apple.main-thread', stop reason = hit
> > > > program assert
> > > >       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
> > > > at block-backend.c:552:5 [opt]
> > > >      549    */
> > > >      550   BlockBackend *blk_all_next(BlockBackend *blk)
> > > >      551   {
> > > > -> 552       GLOBAL_STATE_CODE();
> > > >      553       return blk ? QTAILQ_NEXT(blk, link)
> > > >      554                  : QTAILQ_FIRST(&block_backends);
> > > >      555   }
> > > > Target 1: (qemu-system-i386) stopped.
> > > 
> > > Forgot to paste the backtrace:
> > > 
> > > (lldb) bt
> > > * thread #1, queue = 'com.apple.main-thread', stop reason = hit program
> > > assert
> > >      frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
> > >      frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
> > >      frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
> > >      frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
> > >    * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at
> > > block-backend.c:552:5 [opt]
> > >      frame #5: 0x00000001003c00b4
> > > qemu-system-i386`blk_all_next(blk=<unavailable>) at
> > > block-backend.c:552:5 [opt]
> > >      frame #6: 0x00000001003d8f04
> > > qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at
> > > qapi.c:591:16 [opt]
> > >      frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined]
> > > addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
> > >      frame #8: 0x000000010003ab04
> > > qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at
> > > cocoa.m:1980:5 [opt]
> > >      frame #9: 0x00000001012690f4 dyld`start + 520
> > 
> > I think Paolo and Peter talked about this a couple of days ago on #qemu,
> > and have already found a solution if I remember correctly.
> > 
> > Maybe it's worth to check with them first.
> 
> Maybe this discussion?
> 
> https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/

Yes, this looks like the right one. Can you give Paolo's patch a try?

The problem is that the main thread didn't hold the BQL while calling
code that requires holding the BQL and that now asserts that the BQL is
held by the thread it's called from.

Kevin


