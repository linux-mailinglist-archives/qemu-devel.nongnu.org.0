Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF53F5117
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:14:08 +0200 (CEST)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFEH-0005Gl-Tk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFCG-0002u6-EU
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFCE-0008Oa-Rb
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ro61zTs4YGXyXe+HqlOBXAB/k4drERQr7JHaZIZZsA=;
 b=LMPtW6q+7wnHfBNETz2TzvFHZn6YJWhOXwKiDQukhNAYAlZe4BqWUXZVXKLCCU8uvqQU76
 fBbw+NjwBaWfg9NHwmwbxpM5XULp6ukyr2aHpBE7gnUeBiHPnj6RA2uYv0yj9/LZ69P91I
 ydXhXrjYBMw8ZsQfbxlWuPuHSYHDuR4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-ulGaKmxzM1mbCxnN5DLnAQ-1; Mon, 23 Aug 2021 15:01:14 -0400
X-MC-Unique: ulGaKmxzM1mbCxnN5DLnAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso65550wma.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Ro61zTs4YGXyXe+HqlOBXAB/k4drERQr7JHaZIZZsA=;
 b=Po7aJdnu+r2eSZQQ6kVpByunnzkGo64WxMciUjX46AT8NYqf85Bi7A/t2SKSO5DUqN
 Jby72v1p1HO/YhP4fQ2kDaNVyFyAIC3LLTXmc6QnHYYpJc0R5yJw28HfhQPM/N1Skmr9
 sOpzxzK/XO84BISLV/tv4kmPUv0JJVIpWzW4QV1ZT2hRnjKI2PAAMNHuvizAwlFanY03
 7OLmJ0RD6pZIzSOEX33Yu0sLB9d2gJpLk4F/CFU8rZQJBIzHV1iWF7f2RtfcG6Fl4f+q
 kDyxOuz8VsxZgDJqVfYqH5qwwG6UpZeF0uvbjT1oku+lkY1gPNJ5a7HlcioifmJBnosP
 2fhA==
X-Gm-Message-State: AOAM5300PlVZQt1YTHRu7cHBDqHWDQ+5cgNTDzCL+PFbobDc9fEQP9iq
 aOvfCWreE/LV1w4sSZlR8NgkDx32Sa5jIfwQlZvwnfJEhUElXYb6UHHf1H/lqUnRrovZYJtqq0U
 MbnyOj9GOv0I0fEw=
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr7339762wrr.382.1629745273156; 
 Mon, 23 Aug 2021 12:01:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBWHb1SgMczOmoZxsfE3gMD2mUq/gfn4nfMPUo9JlVEDVRrkpkq3nZGZScFn9yFyKi6Z1OTQ==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr7339735wrr.382.1629745273016; 
 Mon, 23 Aug 2021 12:01:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 k17sm534858wmj.0.2021.08.23.12.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:01:12 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <cece5f99-82c5-8e5a-a9c5-af691984f9d7@redhat.com>
Date: Mon, 23 Aug 2021 21:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


