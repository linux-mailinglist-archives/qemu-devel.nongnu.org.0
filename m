Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC403511116
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:23:37 +0200 (CEST)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njb5M-0005ZJ-HC
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1njb3V-0004Vq-R5
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1njb3S-0004h6-2h
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651040496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9fHS3nqPQyHR03iq1g66q6lwIPx8olkIlsR/vHu0bM0=;
 b=SVnkI7vQbHIIPaVusQccB6ewvYB3t8BfspqS6D9d31OA4om8JPjQtt/aJK0oqr37u6o2SH
 25YqlQhc3jsGvLM+/4y2Kj+PTLuAhZ2LVlT2GfrXJr5ie/o0UpItRDgQ5DOJgSx7cyy+Hv
 ILNV1rvPtt1SyVKCbQawXjduHcfp6Hw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-JcjKnsOgMu-KV6WzVk1pLg-1; Wed, 27 Apr 2022 02:21:32 -0400
X-MC-Unique: JcjKnsOgMu-KV6WzVk1pLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5946338041C7;
 Wed, 27 Apr 2022 06:21:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0258E40FF708;
 Wed, 27 Apr 2022 06:21:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E31821E6889; Wed, 27 Apr 2022 08:21:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v22 0/8] support dirty restraint on vCPU
References: <cover.1648748793.git.huangy81@chinatelecom.cn>
 <fb74d6af-49e7-ffd9-6bb0-66acb7407c8c@chinatelecom.cn>
 <YmXHRrZZA21Sxfv7@xz-m1.local>
Date: Wed, 27 Apr 2022 08:21:30 +0200
In-Reply-To: <YmXHRrZZA21Sxfv7@xz-m1.local> (Peter Xu's message of "Sun, 24
 Apr 2022 17:55:18 -0400")
Message-ID: <87h76favx1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> Hi, Yong,
>
> On Mon, Apr 25, 2022 at 12:52:45AM +0800, Hyman wrote:
>> Ping.
>>  Hi, David and Peter, how do you think this patchset?
>>  Is it suitable for queueing ? or is there still something need to be done ?
>
> It keeps looking good to me in general, let's see whether the maintainers
> have any comments.  Thanks,

Whose review is still needed?  Or is this ready?


