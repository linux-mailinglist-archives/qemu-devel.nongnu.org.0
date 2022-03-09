Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C24D2CCB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:07:59 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtEc-00074N-Eg
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nRtDE-0005zG-Eh
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:06:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nRtDA-0003uB-Tb
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646820387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BbdUKP6NTQORj3bn0C1AfDyDBaiFAf0W+jmRXWiqhEg=;
 b=fIEp+0c2opq7uncoyqGjRfryycocemWAzEtiorZYxfYGxDVrM77DO+M5nCCGmDx/PLBkph
 /fnZv0HaaaNXlh6gif4OK/uuQzmIv66dpmrkFaBGCrVf/PzcJKHvO8FQFfv7MVEpPRGl//
 PsoS8ln+7j57/86RwNyHhlhnyrJRtkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-GKNufuHHOz6trPuzEaTkbg-1; Wed, 09 Mar 2022 05:06:24 -0500
X-MC-Unique: GKNufuHHOz6trPuzEaTkbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2DA71006AA8;
 Wed,  9 Mar 2022 10:06:22 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D101059144;
 Wed,  9 Mar 2022 10:06:20 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Tom Tromey <tom@tromey.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87sfrtakce.fsf@oldenburg.str.redhat.com> <87fsnt1xhg.fsf@tromey.com>
Date: Wed, 09 Mar 2022 11:06:19 +0100
In-Reply-To: <87fsnt1xhg.fsf@tromey.com> (Tom Tromey's message of "Mon, 07 Mar
 2022 10:30:35 -0700")
Message-ID: <87ilsn784k.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Stefan Hajnoczi via Gdb <gdb@sourceware.org>, pedro@palves.net,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Tromey:

> Florian> I'm a bit surprised by this.  Conceptually, why would GDB need to know
> Florian> about stack boundaries?  Is there some heuristic to detect broken
> Florian> frames?
>
> Yes, the infamous "previous frame inner to this frame" error message.  I
> think this is primarily intended to detect stack trashing, but maybe it
> also serves to work around bad debuginfo or bugs in the unwinders.
>
> This error was disabled for cases where the GCC split stack feature is
> used.  There's been requests to disable it in other cases as well, I
> think.

Is there a user-level command to disable the check manually?

Thanks,
Florian


