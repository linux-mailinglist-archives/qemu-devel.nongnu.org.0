Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37A443133
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:02:54 +0100 (CET)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvJN-00052q-Gk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhuvm-0007Rg-6e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:38:30 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:51438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhuvi-0008NN-7q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:38:28 -0400
Received: from [IPV6:2a01:cb16:2036:6b82:ab3b:b2e8:37cb:ab58]
 (pop.92-184-102-40.mobile.abo.orange.fr [92.184.102.40])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AFD2420780;
 Tue,  2 Nov 2021 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635863904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2bInac/4/YRFutu5nJPDwldNidI/1cifIM92ulCdMw=;
 b=g6dHK3ykGZXgbvQsWpIZ/LbGWF6OR1xYE98mgKkIJVWK5IUdkBvclRzthonB5yR3wihAXJ
 eyuKpm0X9JiNWHxyTkpB8ezt9OLOE8b9b3vhBEy6WfgzRSgw7B5KiUeYHa58b+KJIPFDyy
 YrV1m10ZWVR6ZyoB/zIgaLCzg6IQ7J8=
Message-ID: <024819b5-6108-9d08-6cbc-be3394b57548@greensocs.com>
Date: Tue, 2 Nov 2021 15:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2] generic-loader: check that binary file target location
 exists
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026140311.158151-1-damien.hedde@greensocs.com>
 <CAFEAcA_SbBqvPdEsqCVoKGOqwL_a26xn0b6nuniqOA3+Fi3Ezg@mail.gmail.com>
 <090eac13-0b75-8b7f-d90c-8d1bcd8981a5@greensocs.com>
 <CAFEAcA8WbkD_HiAeykSyFPwoGLmOJce_gqFSmF9q9kXvNtsB4Q@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA8WbkD_HiAeykSyFPwoGLmOJce_gqFSmF9q9kXvNtsB4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/2/21 15:15, Peter Maydell wrote:
> On Tue, 2 Nov 2021 at 14:04, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 11/1/21 11:53, Peter Maydell wrote:
>>> Won't this break the case of loading a file that spans two
>>> consecutive-but-different memory regions ?
>>
>> yes. I did not thought about that.
>>
>>>                                             I think if we want
>>> to catch "we tried to load something to an address not backed
>>> by something" we should do that by making load_image_targetphys_as()
>>> correctly handle errors from the memory accesses it makes and
>>> propagate an error-return to the caller.
>>>
>>
>> The problem is that load_image_targetphys_as() just uses rom_load_...().
>> And these macros/functions only put some "rom to load" objects in a list
>> without doing any real accesses.
> 
> Oh yes, I'd forgotten that this was all using the rom blob
> mechanism underneath.
> 
> I think in that case that whatever we do we should aim
> to be consistent between the different load-image functions;
> we shouldn't add a check to load_image_targetphys_as() which
> we don't do in eg load_elf_as(). That probably means we should
> only be looking to warn or error at the point where we actually
> load the ROM blobs into memory.
> 
> -- PMM
> 

I'll look into that.

Thanks,
Damien

