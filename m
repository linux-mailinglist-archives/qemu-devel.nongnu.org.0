Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358E477BA6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:37:17 +0100 (CET)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvcx-00059r-SP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxvbL-0003iV-Db
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxvbI-0007CM-KC
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639679726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0fytyxwoXOOiWYXcnMWpHkvdD8aQw9J0oUlJ4K+GOI=;
 b=izsrQ/9M5x/E+Yd8WtpP+farf/eWQ9a+TAY3NNKuObbfBkK4TfNNVu9nPj+PKOvYyaaEQi
 7XmmaQug6wILF8LUZcNY/ZU+sZXfWe77g5QmTj5zlLdYrix7qbDbpN5mmhyXsmcUecOqG5
 7hHhmGJJkNclckk/SHKn+EUudu89ckU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-owJT-hbqPUeKh19p7pdzfg-1; Thu, 16 Dec 2021 13:35:25 -0500
X-MC-Unique: owJT-hbqPUeKh19p7pdzfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so1673588wma.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P0fytyxwoXOOiWYXcnMWpHkvdD8aQw9J0oUlJ4K+GOI=;
 b=xTLYTMVphYKxdW0KcgKKzs62hF6l/ASew0gm03K3lRC1ycMwiEEKbFuGLZbI3SYbRe
 EuPRs1JMyKeEGqV/ZJYRXkLzay+Rs2Ohi22hCZbvdY3dL7F0+BxkSN7/0klIXBRDgdiO
 1xLMpR8zX7i4rgAfZ8CfdIqf8e6DThD5ShVDViJTQwU9GXQ8LwRFZas2Jnqmd66od+b+
 o99p2BkVJ1Yqc1AlTcTDxjAlYKY87yXV0RfftB5ExGjocd139DvELAv2HtwLrpyQXT8a
 c+PdAt4bCR/2VsmsCQqMXPLHzWo+608MbmnVrFQz9AGfO1LbCcY1e9IlUZ/lTwAIyfnL
 S/GA==
X-Gm-Message-State: AOAM532wk8WLjO7oYKIQvmov8fHgLIXU5SN0JRetnVGbTxA8kBVeQXxC
 3cR1ARvAh5r/vMaIfJ5QjnK+QrUvRpidD3LHz/LrsodwLilZQ5vaYMI0qbq9iZdMaAEVBOq5O3/
 5Gu0sXFkRxEwkuBs=
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr10555862wrz.282.1639679724120; 
 Thu, 16 Dec 2021 10:35:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyciRfbxfMYiJh+wpfHBzsZ8TVPvA+wvPG757/Pk7SJ/Ig8nP42N27t71rSWVi0Ir3ZWPHjyA==
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr10555846wrz.282.1639679723883; 
 Thu, 16 Dec 2021 10:35:23 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 138sm8554580wma.17.2021.12.16.10.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:35:23 -0800 (PST)
Message-ID: <0e38d05c-829d-d827-30de-9019a9fb60c3@redhat.com>
Date: Thu, 16 Dec 2021 19:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@redhat.com>
References: <20211021161047.578751-1-jmaloy@redhat.com>
 <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
 <d8f0ab15-de92-4286-485f-dff907ac0762@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <d8f0ab15-de92-4286-485f-dff907ac0762@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 16:51, Jon Maloy wrote:
> On 12/16/21 04:36, Philippe Mathieu-Daudé wrote:
>> Hi Jon,
>>
>> On 10/21/21 18:10, Jon Maloy wrote:
>>> The fact that the MMIO handler is not re-entrant causes an infinite
>>> loop under certain conditions:
>>>
>>> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
>>>
>>> We now eliminate the effect of this problem locally in e1000, by adding
>>> a boolean in struct E1000State indicating when the TX side is busy. This
>>> will cause any entering new call to return early instead of interfering
>>> with the ongoing work, and eliminates any risk of looping.
>>>
>>> This is intended to address CVE-2021-20257.
>>>
>>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>>> ---
>>>   hw/net/e1000.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>> I can not find the reproducer in the repository, have you sent one?
>>
> No, I did not add it to the repo.
> It was referenced from the tracker BZ, but I was unable to get access
> back then.
> It ended up with that I had it sent by mail to me directly.
> 
> What is your question? Is it that it should be in the repo, or that you
> cannot find it?

Well I'd like to reproduce the bug, but first I can not find it ;)
Having such reproducer committed along with the fix help catching
future regressions if we refactor code elsewhere.


