Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A95B1B91
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:35:39 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFon-0004tq-Jl
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oWFjy-00016n-Go
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oWFjm-0005Kr-MT
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662636625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rHVOog4GCPvSGZhhcG0onC+OQ+pwwUtQkGhihOeB8Q=;
 b=iSl1oqm2lsyR2j8ekWFYe+XwbFKc3SxRpuoRRPiqajQOq9DRG0vDdSQkNI733gM61F9j4Z
 OOBm+nkTQfcDUp6C/d7zaLjS2PQkIHuV27YI7TX34PbxGSvESPxh4dRIGbX1UfjICML4VA
 b7f02/fmMj5Of9ZT2gjqZHOJq58KwAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-7xe-R9PIMjG617T2Arg4BQ-1; Thu, 08 Sep 2022 07:30:22 -0400
X-MC-Unique: 7xe-R9PIMjG617T2Arg4BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C60C811E83;
 Thu,  8 Sep 2022 11:30:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.195.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 004A52026D4C;
 Thu,  8 Sep 2022 11:30:18 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
 <20220906064500-mutt-send-email-mst@kernel.org>
 <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
 <YxcwCQ0vymro0vbu@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d45be9dc-b6e7-293a-7033-f2ca84fa387d@redhat.com>
Date: Thu, 8 Sep 2022 13:30:17 +0200
MIME-Version: 1.0
In-Reply-To: <YxcwCQ0vymro0vbu@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/22 13:33, Daniel P. Berrangé wrote:
> On Tue, Sep 06, 2022 at 01:14:50PM +0200, Ard Biesheuvel wrote:
>> (cc Laszlo)
>>
>> On Tue, 6 Sept 2022 at 12:45, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
>>>> On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>
>>>>> On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
>>>>>> It's only safe to modify the setup_data pointer on newer kernels where
>>>>>> the EFI stub loader will ignore it. So condition setting that offset on
>>>>>> the newer boot protocol version. While we're at it, gate this on SEV too.
>>>>>> This depends on the kernel commit linked below going upstream.
>>>>>>
>>>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>>>> Cc: Laurent Vivier <laurent@vivier.eu>
>>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>>> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>> Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
>>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>>>>
>>>>> BTW what does it have to do with SEV?
>>>>> Is this because SEV is not going to trust the data to be random anyway?
>>>>
>>>> Daniel (now CC'd) pointed out in one of the previous threads that this
>>>> breaks SEV, because the image hash changes.
>>>>
>>>> Jason
>>>
>>> Oh I see. I'd add a comment maybe and definitely mention this
>>> in the commit log.
>>>
>>
>> This does raise the question (as I mentioned before) how things like
>> secure boot and measured boot are affected when combined with direct
>> kernel boot: AIUI, libvirt uses direct kernel boot at guest
>> installation time, and modifying setup_data will corrupt the image
>> signature.
> 
> IIUC, qemu already modifies setup_data when using direct kernel boot.
> 
> It put in logic to skip this if SEV is enabled, to avoid interfering
> with SEV hashes over the kernel, but there's nothing doing this more
> generally for non-SEV cases using UEFI. So potentially use of SecureBoot
> may already be impacted when using direct kernel boot.

Yes,

https://github.com/tianocore/edk2/commit/82808b422617

Laszlo

> I haven't formally
> tested this myself though. I just saw that earlier versions of this
> RNG patch broke SEV hashes and later versions addressed that problem
> for SEV when the code was re-arranged.
> 
> With regards,
> Daniel
> 


