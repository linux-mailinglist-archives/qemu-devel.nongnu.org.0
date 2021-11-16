Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC8453421
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:26:21 +0100 (CET)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzPg-0004Np-5w
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmzNx-0002gw-VT
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmzNu-0003rD-W3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637072669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEyCDOMvhtYCBeJmaAam0NXK9nQuopPV7rSLqJAaq0M=;
 b=TWbGnyQ8OoMBhyReZRml4hU0Uz+NfJGHm6fJSF05CihsSdAqUWnroQYbw1Yry98IZr/ZX2
 iSlSUDepAhqZrMPAOx8R7KTq2kZ/QIGuM0is6uoJa8/kGPh2b+5li6lD/fPjkL62tnwrBN
 6z8HQcHS0BoR7G26KuZ/NlWN0IYLqkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-Vqq3mioXNTC7nJR0umHZCg-1; Tue, 16 Nov 2021 09:24:27 -0500
X-MC-Unique: Vqq3mioXNTC7nJR0umHZCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F164192296F;
 Tue, 16 Nov 2021 14:24:26 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AACD05C1D5;
 Tue, 16 Nov 2021 14:24:25 +0000 (UTC)
Message-ID: <9b4b6cba-2d68-a4aa-2e1f-50e6532d9916@redhat.com>
Date: Tue, 16 Nov 2021 15:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson: fix botched compile check conversions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211116093834.76615-1-pbonzini@redhat.com>
 <YZOSboL0YCFKYFh3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YZOSboL0YCFKYFh3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:13, Daniel P. Berrangé wrote:
> On Tue, Nov 16, 2021 at 10:38:34AM +0100, Paolo Bonzini wrote:
>> Fix a bunch of incorrect conversions from configure to Meson, which result
>> in different outcomes with --extra-cflags=-Werror.
>>
>> pthread_setname_np needs "#define _GNU_SOURCE" on Linux (which I am using
>> also for the non-Linux check, so that it correctly fails with an error
>> about having too few parameters).
>>
>> Fix struct checks to use has_type instead of has_symbol, and "#define
>> _GNU_SOURCE" too in the case of struct mmsghdr.
> 
> Ok, so relies on fact that passing an incorrect number of arguments
> is a fatal error, when function prototypes are available, even
> without -Werror being set.
> 
> Side note, GCC looks to be trying to make explicit function prototypes
> mandatory at last
> 
>    https://linuxplumbersconf.org/event/11/contributions/1014/

Yes, and that's also why Meson adds the -Werror=implicit-declaration 
option; these days it's simply too dangerous to assume a function is 
present, if it links but you don't really know which header it comes from.

Paolo


