Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C345F5326CA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:48:42 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntR9d-0004kF-RB
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ntQpB-0006rt-IO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ntQpA-0004jl-13
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653384451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H2Qqaef//XkcG+pw5lVlymXwThryn9QBEMiUR3fU8i8=;
 b=H8atpI406kxQXIhcc31JOkbpzuh4viVtfrO16TOHv26TnXeSPseTEUuBcIugYETWgXFbaQ
 TSGPybeJyS4wvMPvKLWt1VNjgjIU3l/VmQ0m10f1vGY0TkXIZHmD8rVodbYGmjcD+W7JVO
 NA8j+KxwpPfT7fYbJhrlBj+Plc5lmpQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-gU6ZymubOGS8llmuI856fw-1; Tue, 24 May 2022 05:27:27 -0400
X-MC-Unique: gU6ZymubOGS8llmuI856fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C19E3C025BB;
 Tue, 24 May 2022 09:27:27 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 853ECC27E8F;
 Tue, 24 May 2022 09:27:26 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: Emulating CPUs with larger atomic accesses
References: <87k0apeor5.fsf@oldenburg.str.redhat.com>
 <37f4c866-4344-37ba-b64b-fd338dc96887@linaro.org>
Date: Tue, 24 May 2022 11:27:24 +0200
In-Reply-To: <37f4c866-4344-37ba-b64b-fd338dc96887@linaro.org> (Richard
 Henderson's message of "Sat, 21 May 2022 18:07:33 -0700")
Message-ID: <87sfozuvpf.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard Henderson:

> On 5/13/22 03:00, Florian Weimer wrote:
>> What's QEMU's approach to emulating CPU instructions that atomatically
>> operate on values larger than what is supported by the host CPU?
>> I assume that for full system emulation, this is not a problem, but
>> qemu-user will not achieve atomic behavior on shared memory mappings.
>> How much of a problem is this in practice?
>
> Well, it doesn't work, no.  In practice, x86_64 supports 128-bit
> atomic operations, and guest requires more than that.  No one really
> cares anymore about 32-bit hosts with smaller atomic operations.

Which part doesn't work?  Full-system emulation?

Do guests really require wider-than-128 atomics?  That's quite
surprising?

Thanks,
Florian


