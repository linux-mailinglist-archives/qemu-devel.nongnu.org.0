Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAE35E81
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 15:59:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYWS8-0003Kh-Ao
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 09:59:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hYWR9-0002zU-Bh
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hYWR8-000383-5K
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:58:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hYWR7-00035B-Up
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:58:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E8ED30C120E;
	Wed,  5 Jun 2019 13:58:35 +0000 (UTC)
Received: from [10.40.204.44] (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0335DF4C;
	Wed,  5 Jun 2019 13:58:30 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20190529143106.11789-1-lvivier@redhat.com>
	<87a7ewp4h4.fsf@dusky.pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4601cfa8-732a-3063-7106-da8d3b990410@redhat.com>
Date: Wed, 5 Jun 2019 15:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87a7ewp4h4.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 05 Jun 2019 13:58:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 0/4] rng-builtin: add an RNG backend
 that uses qemu_guest_getrandom()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "=?UTF-8?Q?Daniel_P.Berrang=c3=a9?=" <berrange@redhat.com>,
	Amit Shah <amit@kernel.org>, Kashyap Chamarthy <kchamart@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2019 15:05, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Add a new RNG backend using QEMU builtin getrandom function.
>>
>> v7: rebase on master
>>     Make rng-builtin asynchronous with QEMUBH (removed existing R-b)
> 
> Pardon the ignorant question: why is that necessary?
> 

Because request_entropy() function is called while the request is not in
the requests queue, so the loop on !QSIMPLEQ_EMPTY(&s->parent.requests)
doens't process it. The request is added just after the call.

thanks,
Laurent





