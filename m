Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614463E8A14
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:11:22 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhST-0006jX-8A
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhRF-0005wZ-15
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhRC-0004I4-OG
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628662202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt7s6a/ADOsLO3OlJslpQTleS5qgFcdo019Iim0BZnY=;
 b=WMtuo0zA0ppmAeClTzXjWxSLD+7EDPg3mDzvHIArzPpTRszXOsW0Y2QHfV3RxU54+siHci
 sq6yrQQUKZJpG/yLxj1BPnVHIzi/KZZbMCdxsYnx1BLvJkX1rPAOoKigIONfVe929SS5uX
 P0VxMtb8Q2v+uW9ATg5f85Vt5HLkSYo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-VLtTxMJsOsmWVcStlIqEpQ-1; Wed, 11 Aug 2021 02:09:58 -0400
X-MC-Unique: VLtTxMJsOsmWVcStlIqEpQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so329730wru.19
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lt7s6a/ADOsLO3OlJslpQTleS5qgFcdo019Iim0BZnY=;
 b=R/kkYZE2uVlRJDpZbLHlrq592+wDN8x6TjrYqDHwVwXJdpvJPTMOo19DtNydNBsLxj
 ImzyHbWkkorJlhcWD0uoq5iwE6gRn74GPh9oT4mUzezvuln4Z2ajFjGZbUqre/BQzb6l
 XAiN5dZPaH6Ko/3rsCCzWkdUohOzpzsEaaD31ZpVpao3clVTs4zGYR3iDJzP/4QU6wbl
 uRCwjui7u5B0ACc+ysrmOIV44gzN04b6GD4EJktgb8A3puXhPcciHUg0FxVzyUArvlwX
 aOGLBFmBLXOuXh2hbV23DFzdNooIFeCkluGXvXltWDefdjr9kFC8WV6NfmUKR9qD+eml
 s7Yw==
X-Gm-Message-State: AOAM531XFul+t3wuJnFAF/9Ff1jinq3sIKA4swrEdCT3L253IxwLLAcP
 ia28xjfCfpjnJKjhR7l5fQ3t+vI9i99MmtWqCEHNIXZvH+9l2oI3tWjlDBMHlqvoKOQNwxyMGMH
 WBF4ioFKhXrNr4KA=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr25265971wmc.95.1628662197615; 
 Tue, 10 Aug 2021 23:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAjRPWrxT2VPV0q6Mq4630l0CqJLrcYde5bLE6JqFuzM5k1RpHnY4jVZWpcU2E+dDNhKzYiw==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr25265946wmc.95.1628662197428; 
 Tue, 10 Aug 2021 23:09:57 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k31sm7171198wms.31.2021.08.10.23.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:09:56 -0700 (PDT)
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
Date: Wed, 11 Aug 2021 08:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 20.56, Eduardo Habkost wrote:
> On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
>> Is this intended to be a stable interface?  Interfaces intended just for
>> debugging usually aren't.
> 
> I don't think we need to make it a stable interface, but I won't
> mind if we declare it stable.

If we don't feel 100% certain yet, it's maybe better to introduce this with 
a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it's clear 
that this is only experimental/debugging/not-stable yet. Just my 0.02 €.

  Thomas


