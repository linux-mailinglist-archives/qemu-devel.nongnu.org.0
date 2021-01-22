Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04AA300F12
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:43:38 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34DR-0005hm-QB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l34BZ-00047O-Ju
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l34BW-0002ZU-2f
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611351696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G4m+39n7vsq62HScRTUW3P9VLxXK7+KeJZQmsUcZyM=;
 b=aWloScTl6QBKoPMzDOG1wn1g8Vh8Wl79zj4g0ShtQlsmLwSPN6sfzWZ4TyQSiQl2Hh1AuI
 TOVtYYrFFfmaxQOKA0dbRFEgqO2b4O+4gsEnLfQlO6C14BqdKNdyxFKaklzamcv+F8E3jl
 pwZm8WwCcouAI4PPylDetRPcBR/QUjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-sT07sxD5MciTlXwYnmyhKw-1; Fri, 22 Jan 2021 16:41:33 -0500
X-MC-Unique: sT07sxD5MciTlXwYnmyhKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB0AC1005513;
 Fri, 22 Jan 2021 21:41:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E86ED19CBD;
 Fri, 22 Jan 2021 21:41:27 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
From: Laszlo Ersek <lersek@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
 <20210121160733.GP3125227@redhat.com>
 <CAFEAcA-zVvu+16xxjCvXqeZxZMqppUUb7aQkL-5nBTNY+JeyGg@mail.gmail.com>
 <a944d86c-2871-3301-6f42-f5368a122593@redhat.com>
 <7353bcda-6363-6f56-75ad-5e2e9e0dbb16@redhat.com>
 <9f9dbda6-0011-36af-1f5b-22d15c7eb09f@redhat.com>
Message-ID: <794e5195-29f7-d9f5-e45f-88380df0baf0@redhat.com>
Date: Fri, 22 Jan 2021 22:41:26 +0100
MIME-Version: 1.0
In-Reply-To: <9f9dbda6-0011-36af-1f5b-22d15c7eb09f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 22:34, Laszlo Ersek wrote:
> On 01/22/21 21:38, Laszlo Ersek wrote:

>> The behavior of "savemask=0" is a platform trait that platforms are not
>> required to document (the behavior is unspecified, not
>> implementation-defined), so it really boils down to where this code
>> actually runs...
>>
>> NB Linux is more specific:
>>
>> https://man7.org/linux/man-pages/man3/setjmp.3.html
>>
>>    sigsetjmp() and siglongjmp()
>>        sigsetjmp() and siglongjmp() also perform nonlocal gotos, but
>>        provide predictable handling of the process signal mask.
>>
>>        If, and only if, the savesigs argument provided to sigsetjmp() is
>>        nonzero, the process's current signal mask is saved in env and
>>        will be restored if a siglongjmp() is later performed with this
>>        env.
>>
>> Cue "and only if".
> 
> ... I notice commit 6ab7e5465a4d ("Replace all setjmp()/longjmp() with
> sigsetjmp()/siglongjmp()", 2013-02-23) chose the Linux definition, not
> the POSIX one.

My bad: the commit message is correct. While the effect of savemask=0 is
indeed unspecified for sigsetjmp(), it is completely defined for
siglongjmp().

https://pubs.opengroup.org/onlinepubs/9699919799/functions/siglongjmp.html

Commit 6ab7e5465a4d even carries my R-b :/

Sorry about the noise,
Laszlo


