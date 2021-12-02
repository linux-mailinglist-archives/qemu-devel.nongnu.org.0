Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6F466602
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:59:15 +0100 (CET)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnYJ-0008G9-0Z
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1msnX7-0006Ui-Db
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1msnX3-0000VE-Gn
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638457075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5tE9txz+iMyJYFDaMKjSRKXqpgS/EzjfLaZbr7Op8Q=;
 b=e3IcPNckg/iEQXBvBn2r9/Tc+/kzLYMXSY24U8FDby+iYeqOeDaPCfXpu9gmnYdEeXgFH8
 YGOPBGphy2eKX/SJxuUmAF0MmCkUw7zOE2+xIkrUqXBnjdzhvPWzBbvyRkARgOcK3IpJKP
 hJPMPbztUNYMRFA4K7iI7VJ4oYm447g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-G_Sxt0KdOSWAdNB2KHa5aQ-1; Thu, 02 Dec 2021 09:57:53 -0500
X-MC-Unique: G_Sxt0KdOSWAdNB2KHa5aQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0B6618C89CF;
 Thu,  2 Dec 2021 14:57:51 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 846A85D9D5;
 Thu,  2 Dec 2021 14:57:36 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
 <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
 <CAFEAcA9psJ_vpZSduFVCqgisWgJVFnn2Vgap3vezWCrHK8yfjQ@mail.gmail.com>
Date: Thu, 02 Dec 2021 15:57:34 +0100
In-Reply-To: <CAFEAcA9psJ_vpZSduFVCqgisWgJVFnn2Vgap3vezWCrHK8yfjQ@mail.gmail.com>
 (Peter Maydell's message of "Thu, 2 Dec 2021 14:50:46 +0000")
Message-ID: <8735nb3vhd.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell:

> On Thu, 2 Dec 2021 at 14:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>> My compiler-developer colleagues present the following case where
>> 'noinline' is not sufficient for the compiler to definitely
>> use different values of the address-of-the-TLS-var across an
>> intervening function call:
>>
>>   __thread int i;
>>
>>   __attribute__((noinline)) long get_ptr_i()
>>   {
>>     return (long)&i;
>>   }
>>
>>   void switcher();
>>
>>   int g()
>>   {
>>     long a = get_ptr_i();
>>     switcher();
>>     return a == get_ptr_i();
>>   }
>>
>> Trunk clang optimizes the comparison of the two pointers down
>> to "must be always true" even though they might not be if the
>> switcher() function has resulted in a change-of-thread:
>>   https://godbolt.org/z/hd67zh6jW
>>
>> The 'optnone' attribute (clang-specific) seems to be able
>> to suppress this
>
> ...no it doesn't -- although the get_ptr_i() function is
> called both before and after, its return value is ignored
> and g() always still returns 'true'.

__attribute__ ((weak)) would mark get_ptr_i as interposable and should
act as an optimization barrier for any compiler.  Unless the compiler
defaults -fno-semantic-interposition *and* feels very, very strongly
about its meaning (clang 13 doesn't seem to, despite the
-fno-semantic-interposition default even with -fpic).

Thanks,
Florian


