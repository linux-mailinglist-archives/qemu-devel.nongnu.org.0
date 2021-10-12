Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85C42A765
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:38:24 +0200 (CEST)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIv8-0004zk-SF
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maIte-0003f9-N0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maIta-0006EK-LU
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634049404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3PmykkPSRVZ4aqIn1IhuLEihdsg0fqeuPd9tPIPvTA=;
 b=AkDxwLc9gj/DZ40GWIspM8kvqk9uCAaXLmUmOHIaqPMD39H1Q5Le51TfaO526EciO/RpJ7
 FgXplne9j7TYBU90iUELqzlGtVGExNHWKngSIXDE6Igqkrzql+eP8+aRuwo72lhhM3hPK0
 VGgnMpPt5Lchn8w6ypeVjElVAysGonc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-J3RuSIU2O3SdpmEBdP6s1Q-1; Tue, 12 Oct 2021 10:36:41 -0400
X-MC-Unique: J3RuSIU2O3SdpmEBdP6s1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F991100D686;
 Tue, 12 Oct 2021 14:36:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C538163E2;
 Tue, 12 Oct 2021 14:36:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E8A5113865F; Tue, 12 Oct 2021 16:36:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH 1/2] hw/core/machine: Split out smp_parse as an inline API
References: <20211010103954.20644-1-wangyanan55@huawei.com>
 <20211010103954.20644-2-wangyanan55@huawei.com>
 <8735p8xhc4.fsf@dusky.pond.sub.org>
 <b088fc9a-de73-31c9-5caa-de5f758e7a54@huawei.com>
Date: Tue, 12 Oct 2021 16:36:05 +0200
In-Reply-To: <b088fc9a-de73-31c9-5caa-de5f758e7a54@huawei.com> (wangyanan's
 message of "Mon, 11 Oct 2021 15:54:24 +0800")
Message-ID: <87a6je48fe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Andrew Jones <drjones@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"wangyanan (Y)" <wangyanan55@huawei.com> writes:

> Hi Markus,
>
> On 2021/10/11 13:26, Markus Armbruster wrote:
>> Yanan Wang <wangyanan55@huawei.com> writes:
>>
>>> Functionally smp_parse() is only called once and in one place
>>> i.e. machine_set_smp, the possible second place where it'll be
>>> called should be some unit tests if any.
>>>
>>> Actually we are going to introduce an unit test for the parser.
>>> For necessary isolation of the tested code, split smp_parse out
>>> into a separate header as an inline API.
>> Why inline?
> The motivation of the splitting is to isolate the tested smp_parse
> from the other unrelated code in machine.c, so that we can solve
> the build dependency problem for the unit test.
>
> I once tried to split smp_parse out into a source file in [1] for the
> test, but it looks more concise and convenient to make it as an
> inline function in a header compared to [1]. Given that we only call
> it in one place, it may not be harmful to keep it an inline.
>
> Anyway, I not sure the method in this patch is most appropriate
> and compliant. If it's just wrong I can change back to [1]. :)
>
> [1]
> https://lore.kernel.org/qemu-devel/20210910073025.16480-16-wangyanan55@huawei.com/#t

I'd prefer to keep it in .c, but I'm not the maintainer.


