Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0A4C8B2C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:57:34 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP18H-0005iz-7v
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nP15u-0004Uv-9G
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nP15s-0005Bu-3o
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646135702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOaqZYn6xahVtYbl1THL2kfFia0e8aRbVVZo8f5Wxf8=;
 b=FWjoYse3Ik8+cAGERtx67fHNdrtn1Q5DNbw5mEaU12NfNId+rfJKvOQFFXro/4ulL8Qfcc
 V3djWu+KR3llhRMTPDDXTRtZbbKkqBvVD8F0L0Lbf3RMh/PPaDxGwWwYRXY5ourP24RfwM
 prri6AJqfiQKheAWpQm9daxhxWAqDys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-j0eCSUs2NOyx5_CCqhgLlQ-1; Tue, 01 Mar 2022 06:54:57 -0500
X-MC-Unique: j0eCSUs2NOyx5_CCqhgLlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC4CD1006AA5;
 Tue,  1 Mar 2022 11:54:56 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8096C2B442;
 Tue,  1 Mar 2022 11:54:51 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
Date: Tue, 01 Mar 2022 12:54:49 +0100
In-Reply-To: <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Thu, 17 Feb 2022 09:28:55 +0000")
Message-ID: <8735k1q452.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

>> But going against ABI and toolchain in this way is really no long-term
>> solution.  You need to switch to stackless co-routines, or we need to
>> provide proper ABI-level support for this.  Today it's the thread
>> pointer, tomorrow it's the shadow stack pointer, and the day after that,
>> it's the SafeStack pointer.  And further down the road, it's some thread
>> state for garbage collection support.  Or something like that.
>
> Yes, understood :(. This does feel like solving an undefined behavior
> problem by adding more undefined behavior on top!
>
> Stackless coroutines have been tried in the past using Continuation
> Passing C (https://github.com/kerneis/cpc). Ideally we'd use a solution
> built into the compiler though. I'm concerned that CPC might not be
> supported or available everywhere QEMU needs to run now and in the
> future.

That seems to be require an entirely different toolchain (based on CIL).
It's one way to solve the ABI issues, but perhaps not the direction
you want to go in.

> I took a quick look at C++20 coroutines since they are available in
> compilers but the primitives look hard to use even from C++, let alone
> from C.

Could you go into details what makes them hard to use?  Is it because
coroutines are infectious across the call stack?

Thanks,
Florian


