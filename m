Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811AE210D9D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:22:15 +0200 (CEST)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdcs-0002kg-GR
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jqdb0-0008OW-Ee
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:20:18 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37451
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jqdau-00017Y-Tw
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593613212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ1v28TNYTEpaMxZnehu2p5LtlIqYXq3sD2V0paoKAc=;
 b=MWYvmT1sTbhvYactfeTQIyFVBKNlVVePYoDSE2FKcu2om+UWChp/997zNFV/3VboUfUjB8
 EC3t+7eSZqMaAwhvsc+IC8owkjVf4VEw9UkkMYoswmjrqrfKucS4czxppX+tdP5nLNUE49
 5FdHf/d2cJFuscf4UxhOLmqIj78f3dA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-5Ud3utMcN56Hc8u49H9leA-1; Wed, 01 Jul 2020 10:20:10 -0400
X-MC-Unique: 5Ud3utMcN56Hc8u49H9leA-1
Received: by mail-wr1-f72.google.com with SMTP id f5so20769009wrv.22
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 07:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQ1v28TNYTEpaMxZnehu2p5LtlIqYXq3sD2V0paoKAc=;
 b=DlsIuXNEwp7W5jA9RlRaj5oK8ASgoje2ia9iw/5iZy+BJ71YxWZX93/ySW9kMlNju2
 QicXH1QsD757GiC7rW4r9ReQEasZR/b+ezrLDtu/Zy9yqD9ZgLQ2lPxbkioHmf9FsTWa
 so1gw+pj4pLrLav1iUsoJKxiggKLF6ad0n71oG9ouWx843V1yeW9k7jamfRvqMeiZMiD
 V1QRxFerxRIGBim4NDowlWHiJOAZXpCmjPjxdaZzP8s6FNPDTruNok5ZN+fInq+jZf5Q
 AbL2D8CT7jVl2346kLA+ANWaJpshnVAqQpPEFeVZaz64W/DwIuAI0SUmQVOy56ROcHX8
 6YFA==
X-Gm-Message-State: AOAM532ShvNDkzRroKevwmdKjSwuaD2NR8hxHMDC6NYjtLpuZJqy1oqG
 CPSq8Uo2r09KtNpLIo3bgb44bnVJcznNi8/8Ps3HQLt40R+fqEcPftqTUDAcWx4BD0lOUtrFcNm
 n13eGbI1q9qc94F0=
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr27328740wmk.143.1593613209505; 
 Wed, 01 Jul 2020 07:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLSPmXwsBESVwNT9cXfaBQ5RdgbHlCWF3wRndTM4wqDoAuDmE4zfN3WiuG+rmrlR82OyA0YQ==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr27328723wmk.143.1593613209266; 
 Wed, 01 Jul 2020 07:20:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1142:70d6:6b9b:3cd1?
 ([2001:b07:6468:f312:1142:70d6:6b9b:3cd1])
 by smtp.gmail.com with ESMTPSA id k126sm7639811wmf.3.2020.07.01.07.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 07:20:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] checkpatch: Change occurences of 'kernel' to 'qemu'
 in user messages
To: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
References: <20200620133207.26849-1-aleksandar.qemu.devel@gmail.com>
 <20200620133207.26849-3-aleksandar.qemu.devel@gmail.com>
 <CAFEAcA9T1NGyi0g-DN+KGxpJwepWLfapDaWKVePhMEfeHvk5mA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d507200e-07ca-1849-30cb-9aed70161b2c@redhat.com>
Date: Wed, 1 Jul 2020 16:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9T1NGyi0g-DN+KGxpJwepWLfapDaWKVePhMEfeHvk5mA@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 00:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/06/20 17:04, Peter Maydell wrote:
> On Sat, 20 Jun 2020 at 14:33, Aleksandar Markovic
> <aleksandar.qemu.devel@gmail.com> wrote:
>>
>> It is odd that we inform user that, for example, his current working
>> directory is not kernel root, when, in face, we mean qemu root.
>>
>> Replace that and few other similar odd user messages.
>>
>> Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Regardless of my comments on the cover letter, for user facing
> messages this makes sense, especially since it's only 3 lines.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

Queued, thanks.

paolo


