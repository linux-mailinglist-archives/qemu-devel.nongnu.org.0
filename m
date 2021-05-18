Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448638792B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:50:20 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizAx-0005eJ-2m
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liz5b-0004yM-EU
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:44:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liz5C-0005tx-59
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09cww3EEd62WEjZRU6sFv7QqtcZmcf9o46ODdG3HtdA=;
 b=XvpZmERwOwB2UhSYyu93JTwp1ZnEL3JAffLyssm+PI+jOhZd4dsW21c0VURltfE6LFbGCN
 Gr0DNiivPaFOIpRDtG/yLto47SZMncKSEnr92B1vBKFesZkvspjQcvbmbtqZ5kSTgDjlTq
 6FvgDYmRyPYSL4fcG3l0Yril72MPlBg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-naslcW04Nmu1sgS-R2mglg-1; Tue, 18 May 2021 08:30:57 -0400
X-MC-Unique: naslcW04Nmu1sgS-R2mglg-1
Received: by mail-wr1-f71.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso5520702wrq.21
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=09cww3EEd62WEjZRU6sFv7QqtcZmcf9o46ODdG3HtdA=;
 b=SRUsAWfrQXuuLT5yZm+THY/gDZey4SBk7MB+lu8dXwNj4kN0xwyi5wudGZAsLHAN7z
 8urhXYZhXA3yqzvZ9QsYnkkwey7soVRlpshFEsh1TVyrD7Yp+eWM9xmcIB3D+pbINAY2
 t6k3R4PKMpQfR8AR6m7AYBGasWGF1wOg7G4di+G1iFT6CmZAWMVQbn6JmqR5HrniYF+V
 00hhp1AOft8aeO3ki6GUOlNbETInQifCNIomjdgqD1DgF55LAnPRfllelfqrE3DKkvoz
 jvXaHT4b3Yc1OAmTf2AcrC2P0aoZIHdl35vULni4Pu4X6VBNXfK+dvVLkiIhdr9TTnu+
 gERw==
X-Gm-Message-State: AOAM533qTyMqrzSoagtVlnRWtI60jnUks3T5nbYZVuxPa00S5jxKRH76
 xIH9jspOhSK9Mhc6Q+ULyG5FfA5lHfFgU1iY98RM61SmwL7tbVMv+XMkTCZS/SV0HCfMC1wqKQN
 kGwk3m54xoBOWTkfPljQG8b6yWb95oCNT2ykcTBuzUoCO5nl4YkpTwJNseR6OL2j1KEk=
X-Received: by 2002:adf:f98f:: with SMTP id f15mr6856577wrr.4.1621341055600;
 Tue, 18 May 2021 05:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycFG7ca9gHfrU0+HeQayTCvfEanb7CYKRF8HApUYUxnNWGJE0RSvf/uXf0/jhF0N4e+ACuDw==
X-Received: by 2002:adf:f98f:: with SMTP id f15mr6856555wrr.4.1621341055348;
 Tue, 18 May 2021 05:30:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d3sm21830530wri.75.2021.05.18.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:30:54 -0700 (PDT)
Subject: Re: [PATCH] remove qemu-options* from root directory
To: Markus Armbruster <armbru@redhat.com>
References: <20210517121908.2624991-1-pbonzini@redhat.com>
 <875yzg776s.fsf@dusky.pond.sub.org>
 <ccfae3ab-e05a-7860-a841-f2aac0169c89@redhat.com>
 <878s4c5mxh.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c641323c-8a40-6123-3fb5-edc2fc667b4b@redhat.com>
Date: Tue, 18 May 2021 14:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s4c5mxh.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 12:57, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 18/05/21 10:54, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> These headers are also included from softmmu/vl.c, so they should be
>>>> in include/.  Removing qemu-options-wrapper.h, since elsewhere
>>>> we include "template" headers directly and #define the parameters in
>>>> the including file, and move qemu-options.h to include/.
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>    qemu-options.h => include/qemu/qemu-options.h |  9 ++++-
>>>>    os-posix.c                                    |  2 +-
>>>>    os-win32.c                                    |  1 -
>>>>    qemu-options-wrapper.h                        | 40 -------------------
>>>>    qemu-options.hx                               |  4 ++
>>>>    softmmu/vl.c                                  | 24 ++++++++---
>>>>    6 files changed, 31 insertions(+), 49 deletions(-)
>>>>    rename qemu-options.h => include/qemu/qemu-options.h (88%)
>>>>    delete mode 100644 qemu-options-wrapper.h
>>>
>>> Much nicer without qemu-options-wrapper.h.
>>>
>>> I'd be tempted to rename qemu-options.def while there (what's .def?),
>>> but that's up to you.
>>>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> I was tempted too, but qemu-options.h is already taken (well,
>> qemu/qemu-options.h) and I didn't have any good ideas about the name.
> 
> qemu-options.inc?

Or .h.inc, in which case it might make sense to rename other files 
generated from HXTOOL.

Paolo


