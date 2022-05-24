Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C7532A53
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:25:58 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTbp-0000kB-KS
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ntT4E-000874-Kl
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ntT47-000486-KF
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653393066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUPBtXAvW3CgSVsiim3MnCbFervsXUd4IfaLy2+PRIg=;
 b=Q9OzyZ+hCTvfevolAXKCOCbP5yVDMSxo3PoBrTUaUoCHtDn3YcIJknO1M/ZUc2C7YHNsdq
 xqFUN/dDabxsucrp4F/YQKTAIMxzT2g996Y4tNNlDZzTVvRiUIVjn3wXlMDiGNhpSAskXH
 2nDYAcB10KHfwrXen/4dB5rSe4LgvRU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-NntLAmnFNlusBROBA5zzZQ-1; Tue, 24 May 2022 07:51:03 -0400
X-MC-Unique: NntLAmnFNlusBROBA5zzZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B821C299E76A;
 Tue, 24 May 2022 11:51:02 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2414401E4C;
 Tue, 24 May 2022 11:51:01 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: Emulating CPUs with larger atomic accesses
References: <87k0apeor5.fsf@oldenburg.str.redhat.com>
 <37f4c866-4344-37ba-b64b-fd338dc96887@linaro.org>
 <87sfozuvpf.fsf@oldenburg.str.redhat.com>
 <6d4b89e8-452f-521e-3464-7981e89794e0@linaro.org>
Date: Tue, 24 May 2022 13:51:00 +0200
In-Reply-To: <6d4b89e8-452f-521e-3464-7981e89794e0@linaro.org> (Richard
 Henderson's message of "Tue, 24 May 2022 04:48:08 -0700")
Message-ID: <87r14jtahn.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
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

> On 5/24/22 02:27, Florian Weimer wrote:
>> * Richard Henderson:
>> 
>>> On 5/13/22 03:00, Florian Weimer wrote:
>>>> What's QEMU's approach to emulating CPU instructions that atomatically
>>>> operate on values larger than what is supported by the host CPU?
>>>> I assume that for full system emulation, this is not a problem, but
>>>> qemu-user will not achieve atomic behavior on shared memory mappings.
>>>> How much of a problem is this in practice?
>>>
>>> Well, it doesn't work, no.  In practice, x86_64 supports 128-bit
>>> atomic operations, and guest requires more than that.  No one really
>>> cares anymore about 32-bit hosts with smaller atomic operations.
>> Which part doesn't work?  Full-system emulation?
>
> No, user-only.
>
>> Do guests really require wider-than-128 atomics?  That's quite
>> surprising?
>
> Typo there -- "and no guest requires...".

Okay, thanks.  So the overall situation is okay even if we end up with
x86 guests that require CPU support for 128-bit loads.

Florian


