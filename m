Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5BD506A6A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:34:00 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngm7L-0006nu-3b
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ngm6G-0005Nj-2a
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1ngm6C-0005aa-VO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650367967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IzWVUknzT342xWDLAbeGzn+eMKHYH5Od3NPLMPktXmI=;
 b=HcxKhn9Y5xAWi20Y9jobVdsFC7PwpNP/syfHzyUZhJSlhhac1PVdZsV8y6dYoTqJ8jQpeP
 tdqHNk5hljkVcfWkwSdcV0G4wSJf4rLGVDvK32sVusWnFLlcOoQrEfPeYWyvMADEmf7NJM
 EGs6M9oR8jxlkNdJnGEwQIcvbZLGubo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-F-eEY3EtND2C0s6AayR9nQ-1; Tue, 19 Apr 2022 07:32:46 -0400
X-MC-Unique: F-eEY3EtND2C0s6AayR9nQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 022323C02B79;
 Tue, 19 Apr 2022 11:32:46 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B206040CF910;
 Tue, 19 Apr 2022 11:32:44 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <8735k1q452.fsf@oldenburg.str.redhat.com>
 <Yh4iHeb6FsnxLUNn@stefanha-x1.localdomain>
Date: Tue, 19 Apr 2022 13:32:42 +0200
In-Reply-To: <Yh4iHeb6FsnxLUNn@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Tue, 1 Mar 2022 13:39:41 +0000")
Message-ID: <87lew12tr9.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Rodgers <trodgers@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

> On Tue, Mar 01, 2022 at 12:54:49PM +0100, Florian Weimer wrote:
>> > I took a quick look at C++20 coroutines since they are available in
>> > compilers but the primitives look hard to use even from C++, let alone
>> > from C.
>> 
>> Could you go into details what makes them hard to use?  Is it because
>> coroutines are infectious across the call stack?
>
> Here is the simplest tutorial on C++20 coroutines I found:
> https://itnext.io/c-20-coroutines-complete-guide-7c3fc08db89d
>
> The amount of boilerplate for trivial coroutine functions is ridiculous.

Would an execution agent library reduce that usage overhead?

Cc:ing Thomas, who might know the answer.

Thanks,
Florian


