Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EC37265D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:13:21 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpF9-0006dt-LV
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldp0m-0006Vk-P0
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldp0i-0005tW-ED
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620111503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKDYq8EMPxlycFjjiM92WTrhjGBO/Dh5KBvri6sXoH0=;
 b=C1Ns+ymf9T5bdi8bkvsd2dRcFidSTaY7PnOdiIlGod8Ea8ZLs7XTfOfKL+UeiAVIr/YD5C
 Y7afImY3VyArS3o/LpyySnL0RYbQ8DwSjm2oNNx4ZejXQcOQ/eQp/TMd1Rl0OAA3RuvyS0
 TOmSovwgmlHsaEJGv/bWKiLd+oiRhiU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-j5wydAZPNi-eyKTWhS5dWA-1; Tue, 04 May 2021 02:58:21 -0400
X-MC-Unique: j5wydAZPNi-eyKTWhS5dWA-1
Received: by mail-ed1-f72.google.com with SMTP id
 bm3-20020a0564020b03b0290387c8b79486so5924314edb.20
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKDYq8EMPxlycFjjiM92WTrhjGBO/Dh5KBvri6sXoH0=;
 b=dEIUz1nFZS8thqGMHOxZGX2QUEN3rQAht4TG2O4angQjRm1JEvDxYfPoNpNAesp7HB
 RoZgCy6osrk9UUHuN6JIh1v2tGhQ8nVJcQZtKyGENcQDqZ3TfzxA8gK0lAZsIcbqTDWm
 Ups3P/7WtD2DBbpvIIpzvrfFxk57gIFAIW+oixX6fJF1DkO859xUK2g6xgb47Pz2BXO7
 KborRuJE8kx1Lb5/Hi/021jtYNvzLNpnpSCcB+/piqZnajLKoGvtX52O7rq/QhzKdlnM
 ZnjWalETmp3FUxbDQwUvkeinReXrcyKJHJQv3BTRwky4k1u/mWYufBfpxTdj9sMTlj8t
 VqKQ==
X-Gm-Message-State: AOAM531X0CKi9+QsepUKQ2zmDx+dQO6bBcwlNpah/brkTX7WQSD//qVS
 sdHSAu7/CluQW+ItrDoA5LRJwJkIqegUUOMJq491BC4lMmdfzN5nYZRxOQLqC7VtE9sY3onDcbj
 9noL4YOx0ZAAv7Fs=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr25061472edr.357.1620111500437; 
 Mon, 03 May 2021 23:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPlCjESnVTkNV/nMM28uebUrzGvYyNMUnTedcMtz1WbnbxkhR9HiVupBXmPZEb6kA1pQuVYg==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr25061463edr.357.1620111500273; 
 Mon, 03 May 2021 23:58:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n17sm13427202eds.72.2021.05.03.23.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 23:58:19 -0700 (PDT)
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
To: Sean Christopherson <seanjc@google.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
 <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
 <YJCQwXVmS/om2HrW@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0785500-d007-9d96-1ee1-ce0e4a71c88c@redhat.com>
Date: Tue, 4 May 2021 08:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJCQwXVmS/om2HrW@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Yang Zhong <yang.zhong@intel.com>, kai.huang@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/21 02:09, Sean Christopherson wrote:
> Is there a way to process "-device sgx-epc..." before vCPUs are realized?  The
> ordering problem was the only reason I added a dedicated option.

If it's just CPUID, one possibility could be to mark the EPC sections 
specially in KVM_SET_USER_MEMORY_REGION and synthesize the leaves within 
KVM; or even look inside the VMA structs and detect EPC regions that way.

Otherwise, the -M solution would work.

Paolo

>  From the changelog:
> 
>    Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
>    realized prior to realizing the vCPUs themselves, i.e. long before
>    generic devices are parsed and realized.
> 
>    So even though EPC sections could be realized through the generic
>    -devices command, they need to be created much earlier for them to
>    actually be usable by the guest.


