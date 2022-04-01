Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BE4EE81E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 08:19:43 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naAdI-0005TS-BY
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 02:19:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naAX1-0003kn-RR
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 02:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naAWy-0005UJ-Ov
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 02:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648793587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PL7MY0BNVQR7Jei3+AuRxYtexls7fs1oe7ohayOIIEs=;
 b=ah1wUn2rPrAe0geuKaPUDl+6QZuxvF5xJt3VzRWZAZCx5I4Q7muBM8QTVT5gMbmmUPpxhb
 fM/szm8E8ouyhOgIujLmnSAQSsQSbQSKFaE70zgXhmGY/cZfrBMf3lb26jgu6++N5NP+Np
 2LZRTe+nRkCZOduLNY8TOdmV/YkAt6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-5MBntIpEOv6lMDP_VXWPoQ-1; Fri, 01 Apr 2022 02:13:03 -0400
X-MC-Unique: 5MBntIpEOv6lMDP_VXWPoQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 749A285A5BE;
 Fri,  1 Apr 2022 06:13:03 +0000 (UTC)
Received: from [10.39.192.207] (unknown [10.39.192.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE132401E67;
 Fri,  1 Apr 2022 06:13:01 +0000 (UTC)
Message-ID: <5949a880-d383-af09-0812-8ce1c7bfd082@redhat.com>
Date: Fri, 1 Apr 2022 08:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220330134302.979686-1-thuth@redhat.com>
 <ee4c5717-37fb-6053-497d-06925eed8fcc@vivier.eu>
 <25aa0bce-1153-6448-720a-5420385603b1@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <25aa0bce-1153-6448-720a-5420385603b1@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2022 19.31, Richard Henderson wrote:
> On 3/31/22 10:22, Laurent Vivier wrote:
>> Le 30/03/2022 à 15:43, Thomas Huth a écrit :
>>> Seen while compiling on Alpine:
>>>
>>>   In file included from ../linux-user/strace.c:17:
>>>   In file included from ../linux-user/qemu.h:11:
>>>   In file included from ../linux-user/syscall_defs.h:1247:
>>>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro 
>>> redefined
>>>    [-Wmacro-redefined]
>>>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>>>            ^
>>>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>>>   #define TIOCSER_TEMT 1
>>>           ^
>>>   1 warning generated.
>>>
>>> Add the TARGET_ prefix here, too, like we do it on the other architectures.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   linux-user/sh4/termbits.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Thomas,
>>
>> do you think it can wait 7.1?
> 
> It fixes a build problem, so I'd suggest putting it in for 7.0.

It's just a warning, so unless the user compiles with --enable-werror, it 
should be harmless. Anyway, I see that Laurent already picked it up (thanks!).

  Thomas



