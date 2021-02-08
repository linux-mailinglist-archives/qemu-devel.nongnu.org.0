Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF131417A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:16:25 +0100 (CET)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DtQ-0002nl-A5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l99Fz-0004fp-Ar
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:19:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l99Ft-0006OM-83
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612801154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3Yu58BZwRz2ZbekKcigu2TZofwmWCKARxmEMwyJF4M=;
 b=VvC526Yp80lkGoTnYxMaOHKByLmYzMopkqw6gZ8HkmlVVfHw8C1MaIf/zgXra4yy/gLkgV
 csmuxkqNxxoO3r3yphWwvyxEsKrrjzNOdukFW67LIbujgV7ndD/NyybOF9YWmAWKkZgPMq
 09XvpmWy/IQLRz8FPsWn5FpMPkjwxz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-xfxRdUQ_NLqDyaZJ1nqFdw-1; Mon, 08 Feb 2021 11:19:12 -0500
X-MC-Unique: xfxRdUQ_NLqDyaZJ1nqFdw-1
Received: by mail-wm1-f70.google.com with SMTP id y9so6786947wmj.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+3Yu58BZwRz2ZbekKcigu2TZofwmWCKARxmEMwyJF4M=;
 b=LAFaPuPOt0yVnzrTrH7BCYYSicD/fYc9u2B9DaYbOKWN4S4Lx2GIsu3wXJrEmVGd0F
 HcMx7W8oiEghnAAukfMu46Qn3+PYiRawzLatOVNmoATYbg94XTbnxGIzFEGYap0Cb+n+
 fcplHQgK3uPlR4GBv6chb+6DIAzR/fqpZ+Y7lJsVAO7MwpI6dVfh4I77zIkEzsBPP4sc
 SmCwGxz1xgvoMVybDAokS3m4QVjKFcDfEdXCT/OwlK/vtZqBbWBn1JOLM+eVOmqVd73L
 vL0CsvF0nrZGWhQW2l1HJvebU6zdF/lVpbC7GZVnLEM4oLGVJyqRz/TXeq5ZuEzfikSQ
 PmDw==
X-Gm-Message-State: AOAM532BNxUP55eWe7jhlukPNdVMHWknyzP4y8q1wsx2x4hQuC4rxBSS
 th8WqoSTpiofeS+PrwiFPvdqPQQ7jAKv5CjKXISj9GphQnPLS+9UAOxXh08ahR1lwscCzDHtGrf
 uaFgW3zCrZEXfbZM=
X-Received: by 2002:a1c:c903:: with SMTP id f3mr15211420wmb.69.1612801151203; 
 Mon, 08 Feb 2021 08:19:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2tdAupCpBlQ3eqvVe6b4sqNoN+AiaajWShpq5nKYwhx5OtGEqMwhCpScMW2ul0KJFoh3ZdA==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr15211400wmb.69.1612801151018; 
 Mon, 08 Feb 2021 08:19:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm21778657wmf.15.2021.02.08.08.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 08:19:10 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
 <YCECcyQx8oUVfNvM@apples.localdomain>
 <20210208155436.GD16360@redsun51.ssa.fujisawa.hgst.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <880cbe61-9913-d26f-188f-a0b25c04219d@redhat.com>
Date: Mon, 8 Feb 2021 17:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208155436.GD16360@redsun51.ssa.fujisawa.hgst.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Keith,

On 2/8/21 4:54 PM, Keith Busch wrote:
> On Mon, Feb 08, 2021 at 10:20:51AM +0100, Klaus Jensen wrote:
>> On Feb  8 10:03, Philippe Mathieu-Daudé wrote:
>>> Hi Dmitry, Klaus.
>>>
>>> On 2/8/21 1:32 AM, Dmitry Fomichev wrote:
>>>> Implicitly and Explicitly Open zones can be closed by Close Zone
>>>> management function. This got broken by a recent commit and now such
>>>> commands fail with Invalid Zone State Transition status.
>>>>
>>>> Modify nvm_zrm_close() function to make Close Zone work correctly.
>>>>
>>>> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
>>>> Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
>>>
>>> '053b5a302c3': unknown revision or path not in the working tree.
>>>
>>> If you point at an unmerged commit, why not fix it directly
>>> before merging?
>>>
>>
>> Dmitry, you OK with me squashing this fix and appending
>>
>>     [dmitry: fix broken Close Zone]
>>     Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
>>
>> to the commit message?
> 
> IMO, we should avoid the habit of rebasing and force pushes on staging
> trees once they're public.

Well I had not information this patch was targeting another tree.

If you don't want to send regular pull request, it would be useful
to ask the NVMe contributors to provide an information on which
tree their patch is based.

Regards,

Phil.


