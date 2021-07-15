Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B153CA137
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:13:18 +0200 (CEST)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4337-00036h-OU
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m431i-0002IW-8C
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m431b-00008J-Pw
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626361902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mz4OoIjj6tn0JMo4WVPdKIQqAZLyIlewzLymVjTEzP4=;
 b=fuBkXuNvlfRwf6bLbJDHTSABtvPO2TOknc0SunKYPPDm8mMPKoVUOuZEYyjt4P9gdD9M3N
 iZrI1uWsfYUnXTZQUK4+0PiWWXGXO3XCSGAYcYbmSCg/v/OEpb9XmLw1COYDsV7vB00Jlz
 BZUTVgeJNPVYdhbeJkZeZOYOktbQwf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-m2KkjOH5OxaU_yOh_8zh5w-1; Thu, 15 Jul 2021 11:11:37 -0400
X-MC-Unique: m2KkjOH5OxaU_yOh_8zh5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE56C800D62;
 Thu, 15 Jul 2021 15:11:36 +0000 (UTC)
Received: from [10.10.119.225] (ovpn-119-225.rdu2.redhat.com [10.10.119.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 398A619C45;
 Thu, 15 Jul 2021 15:11:36 +0000 (UTC)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
 <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
 <4cc4bbf6-d856-35ab-3687-3fce79b7f8d7@linaro.org>
 <e37ae8b2-441f-f7e1-b125-78bbd85ad4a2@redhat.com>
 <207d666e-b319-dda4-9707-7fd6905dbc33@linaro.org>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <6e9bc419-1a22-86be-2d3b-be31d92d0e6d@redhat.com>
Date: Thu, 15 Jul 2021 11:11:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <207d666e-b319-dda4-9707-7fd6905dbc33@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 12:56 PM, Richard Henderson wrote:
> On 7/13/21 8:18 AM, Cole Robinson wrote:
>>>    https://bugs.llvm.org/show_bug.cgi?id=51076
> ...
>> Richard can you clarify, do you think the errors are a clang bug as
>> well, or strictly a qemu issue? If it's clang maybe I can get Red Hat
>> llvm devs to help
> 
> There are minor adjustments that can (and perhaps should be) be made to
> qemu, but the major portion seems to me to be a clang bug, reported
> above.  Assistance with clang would be quite welcome.
> 

I tried to summarize the discussion and filed a bug against fedora
rawhide clang: https://bugzilla.redhat.com/show_bug.cgi?id=1982740

Thanks,
Cole


