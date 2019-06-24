Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165250BE0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:23:20 +0200 (CEST)
Received: from localhost ([::1]:51139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfOwJ-0006Vz-1I
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hfOuM-0005Ve-Ht
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hfOuL-0003Vq-Gz
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:21:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hfOuL-0003UO-AQ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:21:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so13887379wrm.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sHJ03sI7umuBVJlzhpXgcVTdFZK9AeOyTCI0Fku2Ujg=;
 b=oOIDkQQ9QAXZGZyQ+qWsRqMch7ADZZSNKo9D+384UY1RUlevGZUR6ukmtZXHBwDyvj
 cZExRnr/kPLLaxKSTr6/n0vTkHVYcze6IgWVSRi0cVKzbMGPDppkwCLZfe9abpUTnOOF
 WephLCIbDKk0J11FKw45m7tRTLXnsA+FXcj4KpPh1zbdN8JXXpNqUCiy0914poSKUsRQ
 rhRmR9USR/CAralvy6TQXnXPT+Hp7w8rGsq3DoZOiDNUcgYSJ91Ma1XUF9kkFsnjkS8B
 1Gv5AZwkp6pSWLXNHbcZDtegUHQhHlNoUWSam6lzWTHpLHVudhHuyqOzZzbyeAs6be1A
 A6mA==
X-Gm-Message-State: APjAAAVvVRKJN0A1I8mmV/517qV7pnD0U6q6Av/dtejlcjf7LPOFCqxM
 Dtp4cdsKbUf/ENgCBCNThyZCHQ==
X-Google-Smtp-Source: APXvYqy6MuARRWfsnU9W4qc+MTat6F0RM5bFb5+Gu9oKxYX4j9lZL4nOUNv4MQUVbVLq1rdxIM9ufw==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr170317wrp.293.1561382475778;
 Mon, 24 Jun 2019 06:21:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7822:aa18:a9d8:39ab?
 ([2001:b07:6468:f312:7822:aa18:a9d8:39ab])
 by smtp.gmail.com with ESMTPSA id j32sm26063644wrj.43.2019.06.24.06.21.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:21:15 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20190624091811.30412-1-peterx@redhat.com>
 <20190624091811.30412-3-peterx@redhat.com>
 <b4e30868-dc87-99ee-0696-a796421b00fc@redhat.com>
 <20190624111013.GL6279@xz-x1>
 <6805f941-55b9-93d9-fbbf-a922e55b5cfe@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e0bacfa-a9aa-5f05-b889-47bc6a5fb295@redhat.com>
Date: Mon, 24 Jun 2019 15:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6805f941-55b9-93d9-fbbf-a922e55b5cfe@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH v2 2/2] intel_iommu: Fix unexpected unmaps
 during global unmap
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
Cc: Jason Wang <jasowang@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/19 14:48, Auger Eric wrote:
>>>> +    if (alignment <= size) {
>>>> +        /* Increase the alignment of start */
>>> I don't really get this comment
>> This comment comes from Paolo, but I'll try to explain - it tries to
>> mean that this "alignment" will be used as an increasement to "start"
>> variable, so finally variable "start" will align with larger mask
>> size.
>>
>> Better comments welcomed... :)
> smallest page mask from @start or gaw?

What it means is that there will be "more 0 bits" at the beginning of
start.  Perhaps "On the next iteration start will be aligned to a bigger
power of two"?  I can do this when applying.

Paolo

