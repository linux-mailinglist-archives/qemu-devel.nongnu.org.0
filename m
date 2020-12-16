Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9E2DC159
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:34:00 +0100 (CET)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWwJ-00033l-5v
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpWuZ-0002Fc-2C
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpWuS-0001G4-D5
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608125520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4F6xKN0JpfDLSNPp0V9okHO+7tx27F5yzEJC4rZmD0=;
 b=RAN9kpj2jR2bipx+j+YP0zpo2H6lMiYyAtEQtylUPqcehWtwkqxWs0HR4cK7DX8JqXabCl
 nwYGyIItelX1Dhhb6JfITWwGeU3IZ/phruO1D9azJeXKkcUsuw2y4QS0Z5M1ZhLO7Sg47U
 AdjM7pifGKr1ADYsJ4ggevTjLhuxIv4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-JC4T8qwWPhugcMf23-HQDA-1; Wed, 16 Dec 2020 08:31:58 -0500
X-MC-Unique: JC4T8qwWPhugcMf23-HQDA-1
Received: by mail-ed1-f69.google.com with SMTP id u18so11738682edy.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4F6xKN0JpfDLSNPp0V9okHO+7tx27F5yzEJC4rZmD0=;
 b=kkf+b9br4cr43/PBBFsC3jK6dsFg1RVi7muoezxrsURoQa1iSzWAKlEM2VHgbN93UA
 0yaDdGzH5RglzW6X4K/wyyr7eN+xe53wQmEY5/lpRLohTTT8qRWF4/wmryUVr+CQW32n
 3WO2FjCaDak/zmhtI50mklfXnN96pUEM/zlXNR6lNPevQZVCw6G0qrhN++pt6p9/VrMs
 i7IihzCxCVJ4NiB+UItGqthn2Mh9YbYUHweAZBx2oPzu0vBqeqQKfEnxJMdWomhY8eMA
 CTgDjjzHzBt2Xx4YOzAcV17OM2YKJwbTPLmFLUgj6e4Yihfq3xhw/DCFJv8B/zWfKiiq
 48PQ==
X-Gm-Message-State: AOAM533EDLZx8kzEo2pDOB9C7mjCy7Ae48dA9a0XMjxRFnC05ztRiNJV
 bEpHNJTC1OBMIr1NeXXxolkIXrnbwp+kMv4nk3mWrZ+oy0es2Ayjkekb/FWuKRJXGgwvklKyb/c
 amTYgWdjczID/tNo=
X-Received: by 2002:a17:906:e24f:: with SMTP id
 gq15mr31438954ejb.256.1608125517653; 
 Wed, 16 Dec 2020 05:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTNLz/9OdcWrGcik0r4soi5dn1iBx4o0odSlMfl2sTktxdsVU+82oeR1//DAkoYxhPyrZ2Ng==
X-Received: by 2002:a17:906:e24f:: with SMTP id
 gq15mr31438942ejb.256.1608125517417; 
 Wed, 16 Dec 2020 05:31:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m7sm1396666ejr.119.2020.12.16.05.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 05:31:56 -0800 (PST)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-3-ehabkost@redhat.com>
 <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] qom: Assert that objects being destroyed have no
 parent
Message-ID: <62956652-6b89-1bc0-d816-e88f6282b9ee@redhat.com>
Date: Wed, 16 Dec 2020 14:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 08:53, Marc-André Lureau wrote:
> 
> On the principle, I fully agree. But the risk is high to introduce 
> regression if objects are manipulated in strange ways.
> 
> I remember I wanted object_unref() to automatically remove itself from 
> the parent when the last ref is dropped. I think there were similar 
> concerns.

unref and unparent are two very different operations; the former means 
*I* am done with this object, the latter means *QEMU* is done with this 
object (even though there may be a few reference held, e.g. on the call 
stack or by RCU).  Since object_unparent operates on global state, you 
can even call object_unparent if you don't own yourself a reference to 
the object and just got the pointer from the caller.

While unref is a "mechanical" operation of dropping a reference and 
possibly freeing the object, unparent is an active operation that 
includes for example dropping reference cycles or in general detaching 
from other places that are known to hold references to this object.

This is not a concept that is specific to QEMU, I think I read somewhere 
that LibreOffice's UI library does something similar, calling it "dispose".

Paolo


