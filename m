Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F63422CC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:05:50 +0100 (CET)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNIZI-0001Hl-LF
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNIXj-0000n9-Fi
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNIXg-00051b-Vn
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616173445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqJ0M4AdcvtflBCvBsapazzX3Or/4S0IRIIDGtSr/Uc=;
 b=Q/sp/26sijV/fahgC/XBPrcmqQ5SVjsMdo1BVzl/R8u51BJLzrFHRwmxPEJBPoL0xC/Qeq
 qUBEG+8JsSEHpDZ0uw8MqmSdEpc9JjcsIXbpCB2s+bwcYAOStYYcBnxvD6wWSUoFdfJ1xZ
 M60EaqYeirpqTxqoTwppy0Se7G6tccE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-2HouptVuOyCeM_J_xIAXIA-1; Fri, 19 Mar 2021 13:04:04 -0400
X-MC-Unique: 2HouptVuOyCeM_J_xIAXIA-1
Received: by mail-ej1-f72.google.com with SMTP id en21so18502475ejc.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 10:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jqJ0M4AdcvtflBCvBsapazzX3Or/4S0IRIIDGtSr/Uc=;
 b=eWAj+iR/k8PRKbu/X0lJK9Ytd2j0I6HKosGG2QQRuzbAMq4H3AT1I6hRa4yCzCdMrm
 aH7MlUiwpDQL7C44tSbT4wngB6ocIo+NxnxYk5zXFc2MS/2//b+Okv4BRa9VUHV/dkr8
 +adl4Yzz25RmG6KT4rVmiR+Q5w5iIAwrBvahb+X79MrlgkmvDcQjN7iYxwX2bfW/UsqS
 tGkO8LyeLdMwNzH0DvD6Uy0+lHKJv2v/2R5W2+7uznfk2HawFtq1g2MaL2Vw2pWAd4pe
 sZrGWLk+CtuTp0LqRcB+Czz1KnWUreYBAAUgMd+QdUA4b8yJzC0+aGEUSwYtxzZObth9
 zIHg==
X-Gm-Message-State: AOAM531z14arQMEX032bjUuWwKdX63a/kbb+/NCYaSqGsE14VzmHvdQ/
 6llW0Zk7tCeTfmu0VCrHIL7O0icxWOO6VxyvQxBGhwcoXjUS+IINOZ54s2D/wK2MARhNqhjsliQ
 +t1AJRcD77DpRiHhRp04zvmb83wtWmloqlO4BBsmVI+pv2x5HcllpzigXGmNyH5T0F1Q=
X-Received: by 2002:a05:6402:31e9:: with SMTP id
 dy9mr10906242edb.186.1616173442653; 
 Fri, 19 Mar 2021 10:04:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX09AwEzaUjWkzm1JqwctHgz9CXKzRSK0U8Ckwd0NWQEhzIeNloVTGtJbd9ttqam41c7mOqw==
X-Received: by 2002:a05:6402:31e9:: with SMTP id
 dy9mr10906214edb.186.1616173442468; 
 Fri, 19 Mar 2021 10:04:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c12sm516538edx.54.2021.03.19.10.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 10:04:00 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
Date: Fri, 19 Mar 2021 18:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 15:06, Philippe Mathieu-Daudé wrote:
>> +
>> +/* Search RSDP signature. */
>> +static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>> +{
>> +    uint64_t *rsdp_p;
>> +
>> +    /* RSDP signature is always on a 16 byte boundary */
>> +    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
>> +         rsdp_p += 2) {
>> +        if (*rsdp_p == RSDP_SIGNATURE) {
>> +            return (uintptr_t)rsdp_p;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
> gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
> 
> pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
> pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
> due to limited range of data type [-Wtype-limits]
>     61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>        |                     ^~

This is probably a different bug, but I'll also add that uint64_t is 
supposed to be aligned to 64 bits, so you need either 
__attribute__((packed)), or use char* and memcmp.  If you go for the 
latter, it would fix the issue that Philippe is reporting.

Paolo


