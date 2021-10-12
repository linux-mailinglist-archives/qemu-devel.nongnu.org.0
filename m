Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41F429F21
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:58:39 +0200 (CEST)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCgI-0003nP-M9
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maCMQ-0000mf-Ox
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maCMD-0005Be-DI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634024272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIztIAc/uu6T3F/7GN3i5xzbPqDStcJa5FI43fqO+Yo=;
 b=b+dEPxLioaqLpTHi2B34DfTBbwK5ce2qX5Z1g6UGo8UzMGGYkglr2ZmDsTvRirQV/eshYc
 Iuuc103To9PYNTVAfE+N1xsnkgVK0LLU+AUUIzVYGzJYaRHpv+/Z7VPOisyl4zlNim7/lM
 Iqj4HlKX8y4BWZ4b2RHWEflwds8Vmtw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-6GyAPLkDPVCq-w99P_FSeA-1; Tue, 12 Oct 2021 03:37:51 -0400
X-MC-Unique: 6GyAPLkDPVCq-w99P_FSeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so4714234wri.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lIztIAc/uu6T3F/7GN3i5xzbPqDStcJa5FI43fqO+Yo=;
 b=CYE+PLj7mKT0RcZnUeI1ma/OS2ZRDajNn/WC/8q217gOl0770SZDaoJjz6AxAr73/M
 ObNCXSQKA7OTc6maSRI5f9VcmqhslowMgDk0+ygqSi6nCSK+YrKOTL9ilv67/uokqIPK
 QJVLgdIfhs4bAyEfss10l72Vp5P1OATYzzrr1LOhuePM9PC/R8CfFy5PKOXrRhVsXada
 AePhuhpOtr3FNzMWh+ApzABuCGpnMyC0rLME2+tpnu511l8zbcOyQQ/CBq9uMX8vQGHP
 1t52AsDgIrXBRzvAvnSBPHuUXL9vBmwuT4cDo/KNw0T8n89GebFLl/6zZBZ8HLu69Irv
 1MiA==
X-Gm-Message-State: AOAM531v/FAmGny9WOrB5X5/Bbx2atvS2mvmfOSImfN1nJ/76LKNUdnJ
 zv3uGH7sbp33z9V7haP2A0dDBDGY1kIxdwTNNkuSKe4eE6Uo2DZc9xjpmQB7O8aVnFj0hlWH0PF
 yo51YuREAiLvQcwA=
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr5500379wrr.323.1634024269899; 
 Tue, 12 Oct 2021 00:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcc6KokrneZXtJomPZS0pkzimCh7YvS8Mb2PBCNKCbsd2Ua2h/R/clvH3ZbOoPlNuU+Xriow==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr5500359wrr.323.1634024269618; 
 Tue, 12 Oct 2021 00:37:49 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id y8sm1590400wmi.43.2021.10.12.00.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 00:37:49 -0700 (PDT)
Message-ID: <dd96f766-26ca-de6d-911f-8352f6b27a5f@redhat.com>
Date: Tue, 12 Oct 2021 09:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qcow2: Silence clang -m32 compiler warning
To: Eric Blake <eblake@redhat.com>
References: <20211011155031.149158-1-hreitz@redhat.com>
 <20211011162402.2wqnhxof2r52637w@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211011162402.2wqnhxof2r52637w@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.21 18:24, Eric Blake wrote:
> On Mon, Oct 11, 2021 at 05:50:31PM +0200, Hanna Reitz wrote:
>> With -m32, size_t is generally only a uint32_t.  That makes clang
>> complain that in the assertion
>>
>>    assert(qiov->size <= INT64_MAX);
>>
>> the range of the type of qiov->size (size_t) is too small for any of its
>> values to ever exceed INT64_MAX.
> Yep, I'm not surprised that we hit that.
>
>> Cast qiov->size to uint64_t to silence clang.
>>
>> Fixes: f7ef38dd1310d7d9db76d0aa16899cbc5744f36d
>>         ("block: use int64_t instead of uint64_t in driver read
>>         handlers")
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> I don't know whether this is the best possible solution, or whether we
>> should care about this at all (I personally think it's basically just
>> wrong for clang to warn about always-true conditions in assertions), but
>> I thought I might as well just send this patch as the basis for a
>> discussion.
> I agree that the compiler is overly noisy, but the fix is simple
> enough that I'm fine with it as written.

Well, I just hope clang won’t become even more clever in the future and 
realize the cast has no real effect...

> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> Since the original went through my tree, I'm happy to take this one
> through my NBD tree as well.

Thanks!

Hanna


