Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9B3446D0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:12:08 +0100 (CET)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLHr-0005rE-Cx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOL2A-0006lB-ID
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOL28-0001Jl-QG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616421352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufjCVgkloKh99R/n/E/khvAq8OxZdbzci6YY9jXkhE8=;
 b=ROlMjSlDofy+sb9RZ6PyKLpIaIz90T6436wRa+LCO4vWIQRpXKOmkCNQWHkb5DswmsCWE+
 XvYw6RI/pxelaDDh30iVUShFwBlkE67bdqJwSrld+gh+SzmFKVeUzX31GqbXzAc8UMr61s
 ukX9f3sLo3HMgX4gJ20F7ZeLbqAsxYM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-Q0_LiCi6MP21623drp-FgQ-1; Mon, 22 Mar 2021 09:55:47 -0400
X-MC-Unique: Q0_LiCi6MP21623drp-FgQ-1
Received: by mail-wr1-f72.google.com with SMTP id x9so25875948wro.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ufjCVgkloKh99R/n/E/khvAq8OxZdbzci6YY9jXkhE8=;
 b=qrvMqKw14ywD5X/P9JVsSWQUnEZyYRO261rp8lWPH0EfexAuF7ChXPzoKwNECZBpRl
 nxZ1iKnwnL3yJMLMJi7QbSGHrw02kjSvv/C+SqDvAf8uVWOvnnp1D0X7fcdIPD0RmYE5
 lLqGGplDM4y0y2d8qJVec4O1hhoAEYX2DjhNTMrgDyQoGi1Lum45ietZHs8Pp4kgNWGG
 LU32BjHqiSZ+heeskv6J2np5/P633yjAWgrjnmg72FNJpKscPEEvhPzQrG8qGkxmWOXz
 plaAple56ZoGUFxGGQ23eB6Qean8fvXqV2WXyCq6yzCFUJQomAidTM+pD1zpmi4JaNqO
 Q/kA==
X-Gm-Message-State: AOAM532hEYf8Cs7Np77qRmrqefUqQ3DxnQyhwDEDRnJwqGXTp2kDcKee
 D/c8f3S4mSSp1NiMPeMgfqB0byKwHQy6bly7QOKRk1LEyZSUR8b3icLrkCzi5rbvHfCoKjGpf3D
 NbmOmKKNkukF1qN4=
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr15897197wme.63.1616421346282; 
 Mon, 22 Mar 2021 06:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC+vyLBUPWJTDlUykBCZghbmh6m/eUgvNGOJi83rC86SinX+26VrDKUqJvWPA399uItWNdWA==
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr15897192wme.63.1616421346143; 
 Mon, 22 Mar 2021 06:55:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm18812019wme.9.2021.03.22.06.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:55:45 -0700 (PDT)
Subject: Re: [PATCH v5 09/10] KVM: Disable manual dirty log when dirty ring
 enabled
To: Keqian Zhu <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-10-peterx@redhat.com>
 <c49abf47-412c-26b8-0a28-c1007eed0159@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <47bfae75-9e2e-50da-a944-a45f64f41514@redhat.com>
Date: Mon, 22 Mar 2021 14:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c49abf47-412c-26b8-0a28-c1007eed0159@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 10:17, Keqian Zhu wrote:
> Hi Peter,
> 
> On 2021/3/11 4:33, Peter Xu wrote:
>> KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
>> useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.
>>
>> More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
>> initially, which is against how kvm dirty ring is used - there's no way for kvm
>> dirty ring to re-protect a page before it's notified as being written first
>> with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
>> with dirty ring, we'll see silent data loss after migration.
> I feel a little regret that dirty ring can not work with KVM_DIRTY_LOG_INITIALLY_SET ...
> With KVM_DIRTY_LOG_INITIALLY_SET, we can speedup dirty log start. More important, we can
> enable dirty log gradually. For write fault based dirty log, it greatly reduces the side
> effect of dirty log over guest.
> 
> I hope we can put forward another similar optimization under dirty ring mode. :)

Indeed, perhaps (even though KVM_GET_DIRTY_LOG does not make sense with 
dirty ring) we could allow KVM_CLEAR_DIRTY_LOG.

Paolo


