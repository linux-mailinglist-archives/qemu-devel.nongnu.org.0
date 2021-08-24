Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7E3F58F4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 09:25:45 +0200 (CEST)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQoa-0000Oy-3x
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 03:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQng-0007Zj-8b
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQnb-0003pk-7R
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629789881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmpWDC7/KlM8wcVIjiS2/9mGUxEKKamLJfbPuuyyaFg=;
 b=OZuE2mWcr0SG1lLgbMae0MNpHeET1ae0DQWdYP0IadOg+br+eKLu22jpS6rC666BLawLFS
 zGi5WtYbNPEGnaLtni8tB2r7Cf6wVwz+RBzSr4nJKAedaw/Uf6O9hQ3GXHRw+fcVRl9gFh
 df13bVCtp0NlvaaTXfjlJXU6Yr/E0Dk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-Lnlz65RlM5KJcvEXW1VFhQ-1; Tue, 24 Aug 2021 03:24:38 -0400
X-MC-Unique: Lnlz65RlM5KJcvEXW1VFhQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so533427wme.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 00:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wmpWDC7/KlM8wcVIjiS2/9mGUxEKKamLJfbPuuyyaFg=;
 b=qktlyLbA2KRNwl0JLz54SDSqAD4hW2QcKb2HLwxeczdpNQZoGu9UuYBt6XHLsHeKZq
 MfgTJrDfWCLzbD6qJTn1vCKz0EejQMBAYU6j9pE3Juj7uRFuPEgjjkS4q18geS0EbuW+
 N9ykG1fJsvd2VUDfLMqMlY6j9UStqreL8m6TE1LR/zoZfmQjAaQeCQkSDwCX5T84Xp5H
 gb/3WB6ts9gyVmltJ2bmZpmCAwv/t3VEO0VIgVWv+XcQZ4tWi1zxVINRYl+Zs5D0wmPW
 2QK5A8DQs5wZuMVXjwzHoGDMPZMHRjxmhdWOlgG5wNegZ2YxuSVve7WMEtBnKs4g6AfB
 lIcA==
X-Gm-Message-State: AOAM5303Kh4Mklf/+xTQoO2rvxcOpUzEvAvH73l4czFIXrN+t64hDWKm
 nfRuMKpTjAfjZ3K1NSdhqiClbWg58jZHrkt4YkdUP+Edp7+BjVkc/4/3stcahMJ1mmER9mi9yjf
 4En7XkxZW5JH71lU=
X-Received: by 2002:a5d:6483:: with SMTP id o3mr17740359wri.197.1629789877109; 
 Tue, 24 Aug 2021 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5tiXKDaBDnk6YJgINDAdJvsqgjJ4rTyAyC4RIKPo2RJ7BzVI/tz77Nmq1syJNWTe5gZmGIA==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr17740315wri.197.1629789876792; 
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j1sm13601490wrd.50.2021.08.24.00.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: Alexander Bulekov <alxndr@bu.edu>, Peter Xu <peterx@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s> <20210823222654.4q5prjmqqnukywem@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <91eb2255-a91d-af81-5bc1-ee877d50258c@redhat.com>
Date: Tue, 24 Aug 2021 09:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823222654.4q5prjmqqnukywem@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:26 AM, Alexander Bulekov wrote:
> On 210823 1650, Peter Xu wrote:
>> On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
>>> On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> This series aim to kill a recent class of bug, the infamous
>>>> "DMA reentrancy" issues found by Alexander while fuzzing.
>>>>
>>>> Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
>>>>
>>>> - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
>>>> - MEMTXPERM_UNRESTRICTED (allow list approach)
>>>> - MEMTXPERM_RAM_DEVICE (example of deny list approach)
>>>>
>>>> If a transaction permission is not allowed (for example access
>>>> to non-RAM device), we return the specific MEMTX_BUS_ERROR.
>>>>
>>>> Permissions are checked in after the flatview is resolved, and
>>>> before the access is done, in a new function: flatview_access_allowed().
>>>
>>> So I'm not going to say 'no' to this, because we have a real
>>> recursive-device-handling problem and I don't have a better
>>> idea to hand, but the thing about this is that we end up with
>>> behaviour which is not what the real hardware does. I'm not
>>> aware of any DMA device which has this kind of "can only DMA
>>> to/from RAM, and aborts on access to a device" behaviour...
>>
>> Sorry for not being familiar with the context - is there more info regarding
>> the problem to fix?  I'm looking at the links mentioned in the old series:
>>
>> https://lore.kernel.org/qemu-devel/20200903110831.353476-12-philmd@redhat.com/
>> https://bugs.launchpad.net/qemu/+bug/1886362
>> https://bugs.launchpad.net/qemu/+bug/1888606
>>
>> They seem all marked as fixed now.
> 
> Here are some that should still reproduce:
> https://gitlab.com/qemu-project/qemu/-/issues/542
> https://gitlab.com/qemu-project/qemu/-/issues/540
> https://gitlab.com/qemu-project/qemu/-/issues/541
> https://gitlab.com/qemu-project/qemu/-/issues/62
> https://lore.kernel.org/qemu-devel/20210218140629.373646-1-ppandit@redhat.com/ (CVE-2021-20255)

Also 305, 451, 557.

Issues list tracked here:
https://gitlab.com/qemu-project/qemu/-/issues/556
(Thanks Alex for updating it!)

> 
> There's also this one, that I don't think I ever created a bug report
> for (working on it now):
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33247
> -Alex
> 
>>
>> Thanks,
>>
>> -- 
>> Peter Xu
>>
> 


