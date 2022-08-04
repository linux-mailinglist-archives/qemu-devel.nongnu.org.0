Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C8589CE7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:40:08 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJb54-0001UR-T4
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJair-0001kr-1a
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJaio-0002Cw-2a
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659619025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ypqzurt2Pyy7s+6lMjwiDNVD3ZbdEZIlzpq2b3J4RI=;
 b=DlNTMMafPeUw0rsHqZKbpsvveKbuhq3LnfugqQx8TKifcdqNTNlhaUJcC9oqEZREGB9LzO
 FhFVsm2m/qf+Hb6Mbh+dRaOcnt1oYGKzPCcTVHobJGOnvOQl9B3THeN+U2NvDUhn12frZY
 XiMLfy8jUDCkue+APea2T4HZS/O9nZM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-MvvVdjaNOWS0nkh4qVv8MA-1; Thu, 04 Aug 2022 09:17:02 -0400
X-MC-Unique: MvvVdjaNOWS0nkh4qVv8MA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FFC03C11E6C;
 Thu,  4 Aug 2022 13:17:01 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A46492C3B;
 Thu,  4 Aug 2022 13:16:57 +0000 (UTC)
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-efi <linux-efi@vger.kernel.org>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com>
 <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
 <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com>
 <Yuu3YeTRLE/gx6YC@zx2c4.com>
 <CAHmME9qQQZH1+Dy4zY5L-MdxN4kXtujW9XaH1x+RyCn-SjsTOA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5528ca40-50fb-8e92-7f24-80e20c4c983e@redhat.com>
Date: Thu, 4 Aug 2022 15:16:56 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQQZH1+Dy4zY5L-MdxN4kXtujW9XaH1x+RyCn-SjsTOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On 08/04/22 14:47, Jason A. Donenfeld wrote:
> On Thu, Aug 4, 2022 at 2:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hi Laszlo,
>>
>> On Thu, Aug 04, 2022 at 01:31:36PM +0200, Laszlo Ersek wrote:
>>> None of the existing info passing methods seem early enough, generic
>>> enough, and secure enough (at the same time)...
>>
>> Can you look at the v2 patch? It seems to work on every configuration I
>> throw at it. Keep in mind that setup_data is only used very, very early.
>> I can think of a few other places to put it too, looking at the x86
>> memory map, that will survive long enough.
>>
>> I think this might actually be a straightforwardly solvable problem if
>> you think about it more basically.
> 
> And just to put things in perspective here... We only need like 48
> bytes or something at some easy fixed address. That's not much. That's
> *got* to be a fairly tractable problem. If v2 has issues, I can't see
> why there wouldn't be a different easy place to put a meger 48 bytes
> of stuff that then is allowed to be wiped out after early boot.

I've looked at v2. It still relies on passing information from QEMU to
the guest kernel through guest RAM such that the whole firmware
execution takes place in-between, without the firmware knowing anything
about that particular area -- effectively treating it as free system
RAM. Such exceptions are time bombs.

We *have* used hard-coded addresses, sometimes they are unavoidable, but
then they are open-coded in both QEMU and the firmware, and some early
part of the firmware takes care to either move the data to a "safe"
place, or to cover it in-place with a kind of reservation that prevents
other parts of the firmware from trampling over it. I've debugged
mistakes (memory corruption) when such reservation was forgotten; it's
not fun.

In short, I have nothing against the QEMU patch, but then the current
OvmfPkg maintainers should accept a patch for the firmware too, for
protecting the area from later firmware components, as early as possible.

Laszlo


