Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99830270A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:42:14 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l440M-0004QC-0C
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43zA-0003nM-7X
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43z7-0000Hu-Bz
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611589256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67BAhEoz4I7t5lDIvmJBNzbNPh2snyfTWm7fWEHJkyE=;
 b=S7CLi0OqhUfFx6jW0I4DG9PITynr0E3t7xgnMVe0zP4L/b5jYItdYZUlnXtoAzcwtZNVPk
 poXlLua1byLaT9HrzsIogjNe8csTsELMk3zuoWfH2LyszUVc6lnHrJXQTWHeb96/wZOYqr
 /prv5IS6z2tulCCswsokn9tl/ltZdcs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-OQn28xT1OJGuMTOTD3rYMg-1; Mon, 25 Jan 2021 10:40:54 -0500
X-MC-Unique: OQn28xT1OJGuMTOTD3rYMg-1
Received: by mail-ed1-f71.google.com with SMTP id y6so7655618edc.17
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67BAhEoz4I7t5lDIvmJBNzbNPh2snyfTWm7fWEHJkyE=;
 b=Msl9CkzqajtDawtmfhtq0rHSFzbkKVa43bmO0v8yXVbsYiYrwq5bn6sDSpFbBR/dZk
 r/F9LbSxRTiFcDF5ECdUwa0KSClPfGvAjc+4jVDOCtOK5VFSeuiJkRaIYWaNl8YIYsyb
 i3CRxji6zeWo3CSn8Jn56ESt6QiwyNRCERBGK9UbDbMbNmDDWerhN9LTvFdrSyhItbMm
 h9SV3KnfKG1hVCZUZk7Vxj0/qcCuDLyNaBVJZ3dFvpfUawLGAGq1VVJ0Z95W26V8tdLx
 oTzuGFZttswAxCzv7tlgepnRW0KsoJPAttumhMFaAFy0zCi0GGsU7gvU7naHBSvrRYG4
 lQ/g==
X-Gm-Message-State: AOAM5304IbEWq+iLd+zruLKUTmqY4HSvfF1LghrB5zYtW1U/TwHGgPXE
 MJgsres7PWCnDis6YV7uAzldmlciivI2r8hGv/JYTz2qnIoJ3RzwAtKlWwNYXP2QXII/S3R40xu
 R37GUj5E3eiZhzQM=
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr747847ejc.98.1611589253127; 
 Mon, 25 Jan 2021 07:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxvwpSoXjwD8Z31fprkcb9xb2nNVSKQ8OtUQYa09qbRk4ZVHpIhtKmao2y+Kk8smFtHzviJA==
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr747831ejc.98.1611589252953; 
 Mon, 25 Jan 2021 07:40:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id pw28sm4575824ejb.115.2021.01.25.07.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:40:52 -0800 (PST)
Subject: Re: [PATCH v2 2/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210115151126.3334333-1-philmd@redhat.com>
 <20210115151126.3334333-3-philmd@redhat.com>
 <23d35fc5-b7f4-cc7d-247b-5d77f7489ed1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf5e2921-832d-f144-f6b6-f09ac0e17edf@redhat.com>
Date: Mon, 25 Jan 2021 16:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <23d35fc5-b7f4-cc7d-247b-5d77f7489ed1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 6:07 AM, Jason Wang wrote:
> 
> On 2021/1/15 下午11:11, Philippe Mathieu-Daudé wrote:
>> QEMU fuzzer reported a buffer overflow in _eth_get_rss_ex_dst_addr()
>> reproducible as:
> 
> 
> Want to apply but it doesn't apply on master:
> 
> Applying: net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()
> error: sha1 information is lacking or useless (MAINTAINERS).
> error: could not build fake ancestor
> Patch failed at 0002 net/eth: Fix stack-buffer-overflow in
> _eth_get_rss_ex_dst_addr()

From the cover:

Based-on: <20210115150936.3333282-1-philmd@redhat.com>
          "tests/qtest: Fixes fuzz-tests"

I'll check/ping the other series.

Thanks,

Phil.


