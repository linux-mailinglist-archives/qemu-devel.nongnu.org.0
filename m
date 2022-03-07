Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E04D01E9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:51:24 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREhn-0001tJ-9Z
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nREgV-00018K-Hl
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nREgR-0003OL-5W
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646664597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4oU3swpK55/m2gfZjuNO5cps++qfdC2yYN24S4bUBzo=;
 b=T9Osr3L29V41XLBEPHdK59rFzXlHSIp7kBT390ji3/emniYlNuCsEaWk3S0d4+cpKfOdLx
 hPtoLCnpVPnb5rENfig7LgesoM0Fr3ySxAqA1gX7CPxxcevdhzeuRklQy9cZdi5BuiwA10
 6I30rxjQTDrx+QxhBtiILf3JUI6XW9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-RGBj5D10MOOFT-idO8ADlA-1; Mon, 07 Mar 2022 09:49:54 -0500
X-MC-Unique: RGBj5D10MOOFT-idO8ADlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC50E1006AA5;
 Mon,  7 Mar 2022 14:49:52 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A74383588;
 Mon,  7 Mar 2022 14:49:39 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi via Gdb <gdb@sourceware.org>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
Date: Mon, 07 Mar 2022 15:49:37 +0100
In-Reply-To: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain> (Stefan Hajnoczi via
 Gdb's message of "Thu, 3 Mar 2022 11:22:32 +0000")
Message-ID: <87sfrtakce.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pedro@palves.net, tom@tromey.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi via Gdb:

> The QEMU emulator uses coroutines with separate stacks. It can be
> challenging to debug coroutines that have yielded because GDB is not
> aware of them (no thread is currently executing them).
>
> QEMU has a GDB Python script that helps. It "creates" a stack frame for
> a given coroutine by temporarily setting register values and then using
> the "bt" command. This works on a live process under ptrace control but
> not for coredumps where registers can't be set.
>
> Here is the script (or see the bottom of this email for an inline copy
> of the relevant code):
> https://gitlab.com/qemu-project/qemu/-/blob/master/scripts/qemugdb/coroutine.py
>
> I hoped that "select-frame address ADDRESS" could be used instead so
> this would work on coredumps too. Unfortunately "select-frame" only
> searches stack frames that GDB is already aware of, so it cannot be used
> to backtrace coroutine stacks.
>
> Is there a way to backtrace a stack at an arbitrary address in GDB?

I'm a bit surprised by this.  Conceptually, why would GDB need to know
about stack boundaries?  Is there some heuristic to detect broken
frames?

Thanks,
Florian


