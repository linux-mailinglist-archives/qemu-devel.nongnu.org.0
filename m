Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A462477D47
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:19:58 +0100 (CET)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxEK-0005Yd-Pu
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mxxDW-0004sY-89
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mxxDS-0005Op-Fn
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639685941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lmyqktEgz1z4WfcA4sq8PbxQjD9NMm3SfWdAlieTVJc=;
 b=SszB/NA3ULHlxAJSFLJQk7s0y3UwlxlG8FRWc8LNRDJQ3VvPiIWbnQfF2YFCmJuQcU48m1
 owTgSFr/lwYsA0OknKUDHNL0aOcOY43i+ETJnbNJz7IeKJAZh4jdKCsPtC/F1w3dOZYfUU
 2jy28wRR6GgnmyzaUeuRdgxLdSRivmc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-_LEKnvB1PWKN8M0k6rsalg-1; Thu, 16 Dec 2021 15:18:58 -0500
X-MC-Unique: _LEKnvB1PWKN8M0k6rsalg-1
Received: by mail-qt1-f197.google.com with SMTP id
 o12-20020a05622a008c00b002aff5552c89so330161qtw.23
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 12:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=xHmDgheOmzYmv7IN3bXgSZmO2dbqVi1JoDR9IOVcitI=;
 b=w5s1IbIbpeeSuDoj5DS68yVuauB4hggTymlWUazCaQx4W9C+go5fLdgXqEkjwjBQE8
 g2UrF26BZZBhxFDu2Mp5JzmPpsbrtbv23Ny/yQJAuDuCOk1x6PpNloBh5TnyAM1QhX1v
 fz8D3DvMWMFgG909TmziwqkwdOE92VmrPcQpoSo4jJuE9+jOBx9xGYgFzqXgVhflstIy
 XFmFgqLrbI82dX4o9lG6ywctJUFWiMmPGy+xQ7Crd/8n3qDgRBdlxSRV32xM6QLFLd3C
 2inFTb4Akdj0cW18L5GfPNFgMVz95zuWIbnTFLL9SS7xsiBmBfamENt5ceqMbyUV4RH4
 jDlQ==
X-Gm-Message-State: AOAM531iYfF/keSApXz5oBixWdwf4vLaN5y1HP0ZvyJtgAfzLkGRezwH
 L4TBY59LQfA93iYFsGT7Tqq2Ht5PCmo7zhJGu0aTGXj5f1vCwFO/WWujqbt5t3qfSamhPZREev5
 YdJlZxr4l5XuD5dU=
X-Received: by 2002:ad4:5744:: with SMTP id q4mr17281727qvx.99.1639685937745; 
 Thu, 16 Dec 2021 12:18:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxre88Pq8awNRFvzTcXd1+DgjYTYP9Py/mXfbrev1ijuWvY4lO7enjn3jTT5Oft5BPEsVhJQQ==
X-Received: by 2002:ad4:5744:: with SMTP id q4mr17281708qvx.99.1639685937477; 
 Thu, 16 Dec 2021 12:18:57 -0800 (PST)
Received: from [10.0.0.96] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id q12sm5188908qtx.16.2021.12.16.12.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:18:56 -0800 (PST)
Message-ID: <593d2751-327c-cc63-e340-e7a8d7da31c5@redhat.com>
Date: Thu, 16 Dec 2021 15:22:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
To: Alexander Bulekov <alxndr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211021161047.578751-1-jmaloy@redhat.com>
 <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
 <d8f0ab15-de92-4286-485f-dff907ac0762@redhat.com>
 <0e38d05c-829d-d827-30de-9019a9fb60c3@redhat.com>
 <20211216190108.z4d7mod4nlar5qwz@mozz.bu.edu>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <20211216190108.z4d7mod4nlar5qwz@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------qi6GV0EIHPGgB4uaefkF1PdC"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------qi6GV0EIHPGgB4uaefkF1PdC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This was the one I received.

///jon


On 12/16/21 14:01, Alexander Bulekov wrote:
> On 211216 1935, Philippe Mathieu-Daudé wrote:
>> On 12/16/21 16:51, Jon Maloy wrote:
>>> On 12/16/21 04:36, Philippe Mathieu-Daudé wrote:
>>>> Hi Jon,
>>>>
>>>> On 10/21/21 18:10, Jon Maloy wrote:
>>>>> The fact that the MMIO handler is not re-entrant causes an infinite
>>>>> loop under certain conditions:
>>>>>
>>>>> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
>>>>>
>>>>> We now eliminate the effect of this problem locally in e1000, by adding
>>>>> a boolean in struct E1000State indicating when the TX side is busy. This
>>>>> will cause any entering new call to return early instead of interfering
>>>>> with the ongoing work, and eliminates any risk of looping.
>>>>>
>>>>> This is intended to address CVE-2021-20257.
>>>>>
>>>>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>>>>> ---
>>>>>    hw/net/e1000.c | 7 +++++++
>>>>>    1 file changed, 7 insertions(+)
>>>> I can not find the reproducer in the repository, have you sent one?
>>>>
>>> No, I did not add it to the repo.
>>> It was referenced from the tracker BZ, but I was unable to get access
>>> back then.
>>> It ended up with that I had it sent by mail to me directly.
>>>
>>> What is your question? Is it that it should be in the repo, or that you
>>> cannot find it?
>> Well I'd like to reproduce the bug, but first I can not find it ;)
>> Having such reproducer committed along with the fix help catching
>> future regressions if we refactor code elsewhere.
>>
> Blind guess, but assuming write to TDT == set_tctl, maybe this one?
> https://bugs.launchpad.net/qemu/+bug/1917082
>

--------------qi6GV0EIHPGgB4uaefkF1PdC
Content-Type: text/plain; charset=UTF-8; name="e1000-loop.sh.txt"
Content-Disposition: attachment; filename="e1000-loop.sh.txt"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCgpjYXQgPDwgRU9GID4gaW5wCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19z
dGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCm91dGwgMHhjZjggMHg4MDAwMDgx
MwpvdXRsIDB4Y2ZjIDB4ZmZmZmZmZmUKb3V0bCAweGNmOCAweDgwMDAwODAzCm91dHcgMHhjZmMg
MHg2NmUyCndyaXRlIDB4ZmUwMDAxMDIgMHgxIDB4ZmYKY2xvY2tfc3RlcAp3cml0ZWwgMHhmZTAw
MDAyMCAweDQyMGZmMDAKd3JpdGUgMHhmZTAwMjgwYSAweDMgMHgyODI4ZmYKY2xvY2tfc3RlcApj
bG9ja19zdGVwCmNsb2NrX3N0ZXAKd3JpdGUgMHhmZTAwMjgxNSAweDQgMHgwMzAwZmY0NgpjbG9j
a19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tf
c3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0
ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVw
CmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApj
bG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xv
Y2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2Nr
X3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19z
dGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3Rl
cApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAK
Y2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNs
b2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9j
a19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tf
c3RlcApjbG9ja19zdGVwCmNsb2NrX3N0ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCmNsb2NrX3N0
ZXAKY2xvY2tfc3RlcApjbG9ja19zdGVwCndyaXRlIDB4ZjI3IDB4MSAweGZmCndyaXRlIDB4Zjk4
IDB4MSAweGQ1CndyaXRlIDB4Zjk5IDB4MSAweGQ1CndyaXRlIDB4ZjliIDB4MSAweGQ1CndyaXRl
IDB4MTA2MCAweDEgMHgxNwp3cml0ZSAweDEwNjEgMHgxIDB4MzgKd3JpdGUgMHgxMDYyIDB4MyAw
eDAwZmUwMAp3cml0ZWwgMHhmZTAwMDNmZiAweDhlOGU4ZThlCndyaXRlIDB4ZmUwMDM4MGEgMHgz
IDB4NTI1ZTAzCndyaXRlIDB4ZmUwMDM4MTggMHgxIDB4ZmYKRU9GCgouL3g4Nl82NC1zb2Z0bW11
L3FlbXUtc3lzdGVtLXg4Nl82NCAtZGlzcGxheSBub25lIC1tYWNoaW5lIGFjY2VsPXF0ZXN0IFwK
CS1tIDUxMk0gLU0gcTM1IC1ub2RlZmF1bHRzIC1kZXZpY2UgZTEwMDAsbmV0ZGV2PW5ldDAgXAoJ
LW5ldGRldiB1c2VyLGlkPW5ldDAgLXF0ZXN0LWxvZyBub25lIC1xdGVzdCBzdGRpbyA8IGlucAo=

--------------qi6GV0EIHPGgB4uaefkF1PdC--


