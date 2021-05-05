Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC9374BBB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:11:15 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQfh-0001G5-RQ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leQeC-0000Pd-Vk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leQe5-0008TF-82
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620256171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JF/UzfsLIA6C9wY/FNx0nSiCcVJBqlHwKYYfOXoRcrc=;
 b=MmqKO0XBN3QVuBQYl6AhtNIffz4XhOwD20fxKLHnehEP3nf8jTuHt6tqit3RVZsW53sF1S
 8sTaP0OOAZ7WGDrokV5cYVY7lg4Ylit5UaJ9L5Im5ApMgEYO7RywsdJW/f93cVoQnSBr7V
 mVD5iqKX0J+xou2yBBzdkH1oRAL7Aao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-k_D888p4PJOEpDgWC6OdpA-1; Wed, 05 May 2021 19:09:27 -0400
X-MC-Unique: k_D888p4PJOEpDgWC6OdpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6951D10060C7;
 Wed,  5 May 2021 23:09:25 +0000 (UTC)
Received: from [10.3.113.190] (ovpn-113-190.phx2.redhat.com [10.3.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3AD59460;
 Wed,  5 May 2021 23:09:11 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Keith Busch <kbusch@kernel.org>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
 <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
Message-ID: <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
Date: Wed, 5 May 2021 18:09:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 5:07 PM, Philippe Mathieu-Daudé wrote:
> +Eric
> 
> On 5/5/21 11:22 PM, Keith Busch wrote:
>> On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daudé wrote:
>>> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
>>> a constant! Help it by using a definitions instead.
>>
>> I don't understand.
> 
> Neither do I TBH...
> 
>> It's labeled 'const', so any reasonable compiler
>> will place it in the 'text' segment of the executable rather than on the
>> stack. While that's compiler specific, is there really a compiler doing
>> something bad with this? If not, I do prefer the 'const' here if only
>> because it limits the symbol scope ('static const' is also preferred if
>> that helps).
> 
> Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)
> 
> Both static+const / const trigger:
> 
> hw/block/nvme.c: In function ‘nvme_map_sgl’:
> hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array
> ‘segment’ [-Werror=vla]
>   818 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
>       |     ^~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

C99 6.7.5.2 paragraph 4:
"If the size is an integer constant expression and the element type has
a known constant size, the array type is not a variable length array
type; otherwise, the array type is a variable length array type."

6.6 paragraph 6:
"An integer constant expression shall have integer type and shall only
have operands that are integer constants, enumeration constants,
character constants, sizeof expressions whose results are integer
constants, and floating constants that are the immediate operands of
casts. Cast operators in an integer constant expression shall only
convert arithmetic types to integer types, except as part of an operand
to the sizeof operator."

Notably absent from that list are 'const int' variables, which even
though they act as constants (in that the name always represents the
same value), do not actually qualify as such under C99 rules.  Yes, it's
a pain.  What's more, 6.6 paragraph 10:

"An implementation may accept other forms of constant expressions."

which means it _should_ be possible for the compiler to do what we want.
 But just because it is permitted does not make it actually work. :(

And while C17 expands the list of integer constant expressions to
include _Alignof expressions, it does not add any wording to permit
const variables.

https://stackoverflow.com/questions/62354105/why-is-const-int-x-5-not-a-constant-expression-in-c
helps with this explanation:
"The thing to remember (and yes, this is a bit counterintuitive) is that
const doesn't mean constant. A constant expression is, roughly, one that
can be evaluated at compile time (like 2+2 or 42). The const type
qualifier, even though its name is obviously derived from the English
word "constant", really means "read-only".

Consider, for example, that these are a perfectly valid declarations:

const int r = rand();
const time_t now = time(NULL);

The const just means that you can't modify the value of r or now after
they've been initialized. Those values clearly cannot be determined
until execution time."

And C++ _does_ support named constants, but we're using C, not C++.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


