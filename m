Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D73755CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:40:33 +0200 (CEST)
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefB2-0005gc-CI
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leex8-0000v4-MN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leex4-0003Ds-Sd
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620311165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iuE6eCW+gTRiFvl6fzIAuVjIl3+LmZF9xYYjhbaPYk=;
 b=QLggL/Kle0EorEYDdNTQw6rtwf8RCA9Y/zVqV3b/UYIcc6eJq+jD4eJTeafEAHQs6P2obq
 SXJmblmIrfjbbd/7lPDb82+l5osytK4q7vB2bpMDYqINIWmM9sXu9FwNK7v7xSf+I4p9Dx
 4+36aZ1knWPe4eceW5ihmU0NuICSO4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-VUj96t0uOsKt2Yn_3ajXeQ-1; Thu, 06 May 2021 10:25:57 -0400
X-MC-Unique: VUj96t0uOsKt2Yn_3ajXeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4465818BA281;
 Thu,  6 May 2021 14:25:56 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E70A95D6D7;
 Thu,  6 May 2021 14:25:51 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
Date: Thu, 6 May 2021 09:25:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 9:16 AM, Warner Losh wrote:
> On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daudé <philmd@redhat.com>
> wrote:
> 
>> The ALLOCA(3) man-page mentions its "use is discouraged".
>>
>> Replace it by a g_new() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  bsd-user/syscall.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
>> index 4abff796c76..dbee0385ceb 100644
>> --- a/bsd-user/syscall.c
>> +++ b/bsd-user/syscall.c
>> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
>> abi_long arg1,
>>      case TARGET_FREEBSD_NR_writev:
>>          {
>>              int count = arg3;
>> -            struct iovec *vec;
>> +            g_autofree struct iovec *vec = g_new(struct iovec, count);
>>
> 
> Where is this freed? Also, alloca just moves a stack pointer, where malloc
> has complex interactions. Are you sure that's a safe change here?

It's freed any time the g_autofree variable goes out of scope (that's
what the g_autofree macro is for).  Yes, the change is safe, although
you are right that switching to malloc is going to be a bit more
heavyweight than what alloca used.  What's more, it adds safety: if
count was under user control, a user could pass a value that could cause
alloca to allocate more than 4k and accidentally mess up stack guard
pages, while malloc() uses the heap and therefore cannot cause stack bugs.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


