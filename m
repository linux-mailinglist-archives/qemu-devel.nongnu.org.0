Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29C319AEF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 08:58:14 +0100 (CET)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lATLB-0001oK-Ee
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 02:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lATJi-0001N9-Km
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 02:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lATJg-0000X9-IN
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 02:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613116599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLS5wn+rvUR9rsOxFwL7L/S01/3bdXbz9xmwKDa5iGQ=;
 b=Hd0lj7tZB0olRNycGytkg5cfp52RyKKctcv0e9T5eAig24smyViKcR07aVz3l1FiIpjRCQ
 vJ1n3sXEDkZSCWR9D2k0vfmW4r/ASirWBpvblm3on8FymCvRdjdn1NvZGv1hrMDvE63ryu
 X9in2lOefyiVZNuFSxsDxNHfJ76RXNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-7kSO0DPZNfKzbnmPgH-pqw-1; Fri, 12 Feb 2021 02:56:37 -0500
X-MC-Unique: 7kSO0DPZNfKzbnmPgH-pqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D57D8801962;
 Fri, 12 Feb 2021 07:56:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 269671001E73;
 Fri, 12 Feb 2021 07:56:35 +0000 (UTC)
Subject: Re: [PATCH] linux-user/syscall: Silence warning from the undefined
 behavior sanitizer
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210211132959.574168-1-thuth@redhat.com>
 <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
 <5ac6434b-b7af-cf3f-777d-6a2e993c0815@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ff6d6097-79d4-08af-2630-f96f45c40555@redhat.com>
Date: Fri, 12 Feb 2021 08:56:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5ac6434b-b7af-cf3f-777d-6a2e993c0815@vivier.eu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 01.35, Laurent Vivier wrote:
> Le 11/02/2021 à 22:28, Laurent Vivier a écrit :
>> Le 11/02/2021 à 14:29, Thomas Huth a écrit :
>>> When compiling QEMU with -fsanitize=undefined, there is a warning when
>>> running "make check-tcg":
>>>
>>>    TEST    linux-test on m68k
>>> ../linux-user/syscall.c:10499:34: runtime error: member access within
>>>   misaligned address 0x00008006df3c for type 'struct linux_dirent64',
>>>   which requires 8 byte alignment
>>> 0x00008006df3c: note: pointer points here
>>>    00 00 00 00 68 03 28 00  00 00 00 00 5b 96 3e e4  61 4b 05 26 18 00 04 2e  00 00 00 00 da 3f 18 00
>>>                ^
>>>
>>> It's likely not an issue in reality, since I assume that on hosts where
>>> the alignment really matters (like sparc64), the Linux kernel likely
>>> adds the right padding. Anyway, let's use the stw_p() / stq_p() accessor
>>> helpers here to silence the warning and thus to allow to compile the code
>>> with -fsanitize=undefined, too.
> 
> Wait... if the alignment differs between m68k and the host, I guess the size of the structure differs?

No, as far as I understand, the size and layout of the structure are the 
same on all architecture. The problem is that the "dirp = 
lock_user(VERIFY_WRITE, arg2, count, 0)" already ends up in a pointer that 
is only aligned to a 4-byte boundary. Since the m68k code is only restricted 
to a 4-byte alignment, arg2 is only aligned to 4 bytes. But if the host 
needs 8-byte alignment for the struct, we've certainly lost here.

Having said that, I think my patch is still wrong. It silences the ubsan 
warnings, but it won't fix the problem when the code is e.g. running on a 
sparc64 host. There we likely need to make sure that the buffer on the host 
is already aligned to an 8-byte boundary when doing the sys_getdents64() 
call to the host kernel.
So I guess we need a bounce buffer here anyway?

  Thomas


