Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5472F9A79
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:28:05 +0100 (CET)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OxI-0006Ht-2r
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1OwK-0005np-VH
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1OwH-0002OP-ME
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610954819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Coji9c2FDJ91DV2PUSf2qf+WjtoUooixxMOrwr49BmI=;
 b=hr3uPUgh7QIZnYDXSTm61jFSaw9mCQP4/KLdHwBkdPEQxZ3KF3HMfFxTF9dI6YQ4eW4adf
 xHwUX5is8CWkywxsJ2rnTH84gQEGaEagsjHfJsP4NwHZHneXVpwaOFUmMnR9I2p8WgXW4y
 LkmXa9g3y+e99noqpHstdb0f3s5qwQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-u4ULHPkKMH2BcZmQOu5NDw-1; Mon, 18 Jan 2021 02:26:57 -0500
X-MC-Unique: u4ULHPkKMH2BcZmQOu5NDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46491CC621;
 Mon, 18 Jan 2021 07:26:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00DF770464;
 Mon, 18 Jan 2021 07:26:54 +0000 (UTC)
Subject: Re: [PATCH v2] softmmu/physmem: Silence GCC 10 maybe-uninitialized
 error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117170411.4106949-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5358e757-fa02-59d5-d1d1-81e5ea08e6a9@redhat.com>
Date: Mon, 18 Jan 2021 08:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117170411.4106949-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2021 18.04, Philippe Mathieu-Daudé wrote:
> When building with GCC 10.2 configured with --extra-cflags=-Os, we get:
> 
>    softmmu/physmem.c: In function ‘address_space_translate_for_iotlb’:
>    softmmu/physmem.c:643:26: error: ‘notifier’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      643 |         notifier->active = true;
>          |                          ^
>    softmmu/physmem.c:608:23: note: ‘notifier’ was declared here
>      608 |     TCGIOMMUNotifier *notifier;
>          |                       ^~~~~~~~
> 
> Initialize 'notifier' to silence the warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Remove pointless assert (Peter Maydell)
> 
> Yet another hole in our CI.


I wouldn't call this a hole in the CI. AFAIU we don't support compiling with 
anything else than the default -O2 (and maybe -O0 for debugging?). -O3 is 
known to produce a lot of compiler warnings, and apparently -Os has such 
"problems", too. As far as I can see, it's a false positive warning here, 
"notifier" should always get initialized, the compiler just fails to see it 
correctly. Anyway, initializing the variable also can not hurt, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


