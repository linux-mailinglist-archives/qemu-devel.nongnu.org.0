Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3258A5E7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 08:31:16 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJqra-0000PX-Ff
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 02:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJqnQ-0006WK-Ir
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 02:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJqnM-00047h-8T
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 02:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659680810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xwiSvrOiUXRnX3nh3BnedMFXJaDzagMfpsjIgLW680=;
 b=cAkH5SqkyPqUb/hGaJqqH9Kcbd4G4jJujZZP6ApnAt830QRnbh2MjYBF4SGD2wTw4UF0Us
 +a4rA0QVASOEhpMni5PpgtabbQo4qn3xMkmHV7B++UCypMKLqFDd+GpczsDGjtIm8BxRvI
 PpSwZYbZrLKvBqxYAtQ+JmFlFv8zIRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-4qZRJovFNFKZd7p8WBmyFw-1; Fri, 05 Aug 2022 02:26:44 -0400
X-MC-Unique: 4qZRJovFNFKZd7p8WBmyFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99FCD811E75;
 Fri,  5 Aug 2022 06:26:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C246140EBE3;
 Fri,  5 Aug 2022 06:26:41 +0000 (UTC)
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-efi <linux-efi@vger.kernel.org>
References: <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
 <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
 <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
 <8254819e-d509-59f4-79e6-e8c0ba4eb2a6@redhat.com>
 <YuxOgtykRQb1HU3e@zx2c4.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e003ad22-e5cc-67f4-64a9-6e5a79f6ee89@redhat.com>
Date: Fri, 5 Aug 2022 08:26:40 +0200
MIME-Version: 1.0
In-Reply-To: <YuxOgtykRQb1HU3e@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 08/05/22 00:56, Jason A. Donenfeld wrote:
> Hey Laszlo,
> 
> On Thu, Aug 04, 2022 at 03:56:54PM +0200, Laszlo Ersek wrote:
>> - do we want setup_data chaining work generally?
>>
>> - or do we want only the random seed injection to stop crashing OVMF guests?
> 
> Preferably the first - generally. Which brings us to your point:
>  
>>> Given we only need 48 bytes or so, isn't there a more subtle place we
>>> could just throw this in ram that doesn't need such complex
>>> coordination?
>>
>> These tricks add up and go wrong after a while. The pedantic
>> reservations in the firmware have proved necessary.
>>
>> IIUC, with v2, the setup_data_base address would (most frequently) be 96
>> KB. edk2 does have uses for very low memory. If OVMF's PlatformPei does
>> not reserve away the area, UefiCpuPkg or other drivers might allocate an
>> overlapping chunk, even if only temporarily. That might not break the
>> firmware, but it could overwrite the random seed. 
> 
> Yea, so we don't want an address that something else might overwrite. So
> my question is: isn't there some 48 bytes or so available in some low
> address (or maybe a high one?) that is traditionally reserved for some
> hardware function, and so software doesn't use it, but it turns out QEMU
> doesn't use it for anything either, so we can get away placing it at
> that address? It seems like there *ought* to be something like that. I
> just don't (yet) know what it is...

I don't know of any such "hidden pocket", unfortunately. On the other
hand, low-level edk2 drivers (usually dealing with x86 intricacies, such
as MTRRs, CPU bringup, ...) have repeatedly surprised me with their
handling of low memory.

Laszlo


