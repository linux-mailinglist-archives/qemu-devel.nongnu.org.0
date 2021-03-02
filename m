Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C732A04E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:17:12 +0100 (CET)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4tj-0004px-5w
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH4rA-00048e-BM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH4r0-00086p-5w
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614690860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uft5RuB5hvJEn3VDjDKLac7psIfy8piU8dMk5AtdqU=;
 b=D1vRv+0xgBl4ukIWoGGaP45Zl7xTFwl1Vpp5pgTfwL3SoP0DFYXNdotSa4Ci4Ixi20xEwD
 T/SYN39julZ0l1WGxXqbUCUgx3Ie1JTE3y57e2hdvZ0q03X94Wrq+Cbl47S4Izcwjys6/f
 irbiyKu6SG/DNOn4JxVwrmjlp8DHC2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-s9FgzkGcOXCRcduVsUb8bw-1; Tue, 02 Mar 2021 08:14:18 -0500
X-MC-Unique: s9FgzkGcOXCRcduVsUb8bw-1
Received: by mail-wm1-f72.google.com with SMTP id r21so536265wmq.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 05:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6uft5RuB5hvJEn3VDjDKLac7psIfy8piU8dMk5AtdqU=;
 b=fTvZzpbk58NjR0PkLSUTbIjAtVL4o/ET+ZRtAB9O8Voca78mwXH799IrIatUrIrdw4
 9PDgyht8tZMQA/QKoOHyAEeilPjRAcX3QAqmkISb4OwV9EvHjCOpgToP/eVcVg4OzIjf
 hQLodFS0h2vgi4yKDHy497WyAsB1EwezdtLUuu+3rZi60JLySSJX5GZqb0g0fUsevSb8
 y1gcyxUBydN95tG9nETBo6OtT0xem6LW84cUWTZUqVsItDDRtKVAWUz2GxehjfFN/vhQ
 2oAqZ/oXlDiJTbkgVfufY+PZAfCW903b+R5n6Ho0Zf7RF8Zo7SqDRxr4O6I3y435iTy2
 oc0g==
X-Gm-Message-State: AOAM532D4coxKXDzhsGickAabjuFEfk9S5Rc5C1erM4zJp2LxBfgLmvz
 fRA4hbf6xGLcx1g/O7AkdSIO23RQM7YI3AqkY005wBVJbincxk2LrRK34dzw9u8pdctJL88sC2i
 AzR0srfFw9ZmnFFo=
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr22267212wru.401.1614690857389; 
 Tue, 02 Mar 2021 05:14:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxISHDTV4IRRU7IgdTQop/E3dbkmXzIWaFrr9uUGOqhmRSbZTsUoZWr0LZMvLokWZ3JHZ9jjw==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr22267177wru.401.1614690857080; 
 Tue, 02 Mar 2021 05:14:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u63sm2569835wmg.24.2021.03.02.05.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 05:14:16 -0800 (PST)
Subject: Re: [PING] accel: kvm: Some bugfixes for kvm dirty log
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <a67939bc-7fd2-092b-c36a-c130b1321c37@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9a1e3b4-6dd6-df85-f882-460d35f888e1@redhat.com>
Date: Tue, 2 Mar 2021 14:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a67939bc-7fd2-092b-c36a-c130b1321c37@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-arm@nongnu.org, jiangkunkun@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 12:43, Keqian Zhu wrote:
> Hi,
> 
> This patch is still not queued. Who can help to do this? Thanks :)
> 
> Keqian
> 
> On 2020/12/17 9:49, Keqian Zhu wrote:
>> Hi all,
>>
>> This series fixes memory waste and adds alignment check for unmatched
>> qemu_real_host_page_size and TARGET_PAGE_SIZE.
>>
>> Thanks.
>>
>> Keqian Zhu (2):
>>    accel: kvm: Fix memory waste under mismatch page size
>>    accel: kvm: Add aligment assert for kvm_log_clear_one_slot
>>
>>   accel/kvm/kvm-all.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
> 

Queued, thanks.

Paolo


