Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDB450957
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:12:28 +0100 (CET)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmeap-0005Px-Fk
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmeYc-0003nO-P2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmeYb-0001Bd-0x
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636992607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GA0pzK+zlXsowHLYW+yGnFRoOQRZ+3mKHYwnCD0UIkM=;
 b=LeTWRgmQwksFoSaTWPT8DtEQmnf/ftSFUELPDaKnHYzFv2IFc6ATMoVFS+J88DRG2xP8L7
 lFIbxrhA9Qs25JWvalmruI8Fe3c4QRh/SmIMqkOneExMLlhAfyATQvBN0+6EGayET/woXR
 rEw1oMmABRGSxB9DFPE5tDyT2m8Er08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-JUSvt6nPOLiUozCQgd3EBQ-1; Mon, 15 Nov 2021 11:10:04 -0500
X-MC-Unique: JUSvt6nPOLiUozCQgd3EBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4771410247A8;
 Mon, 15 Nov 2021 16:10:02 +0000 (UTC)
Received: from [10.39.194.77] (unknown [10.39.194.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742C35D6BA;
 Mon, 15 Nov 2021 16:09:59 +0000 (UTC)
Message-ID: <a1d797e7-a05f-cd39-80cf-3125e7522503@redhat.com>
Date: Mon, 15 Nov 2021 17:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Alistair Francis <alistair23@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org>
 <CAKmqyKN9FWkNd2WpBsW8sdDdiQsmw-AVvG-kowiBigj5kRyZFQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
In-Reply-To: <CAKmqyKN9FWkNd2WpBsW8sdDdiQsmw-AVvG-kowiBigj5kRyZFQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/2021 08.12, Alistair Francis wrote:
> On Mon, Nov 15, 2021 at 3:32 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
>>>>
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 03/11/2021 09.41, Markus Armbruster wrote:
>>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>>>
>>>>>>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
>>>>>> Short answer: hell, no!  ;)
>>>>>
>>>>> Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
>>>>> to avoid such mistakes in the future?
>>>>
>>>> Worth a try.
>>>
>>> You need to fix the sifive_u_otp device first :-)
>>
>> And for that, we may want Hao Wu's "[PATCH v4 5/7] blockdev: Add a new
>> IF type IF_OTHER" first.
> 
> I can fixup sifive_u_otp, just let me know what the prefered solution is

What kind of device is that OTP exactly? If it is some kind of non-serial 
flash device, maybe you could simply use IF_PFLASH instead?

  Thomas


