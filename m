Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E64047E0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:38:12 +0200 (CEST)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGVW-0001fE-VR
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGUT-0000yV-9x
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGUR-0004Np-M8
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631180223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVRPtElpwiBYFVLyJtvaNAFknDJTTjqAeP7URxCglOA=;
 b=h1bYApgvdwtxfEZToCbWG53VH2EHKpuw7bK0zjGvrr9GS7k76ktwEt/RDABTm5GTDkto6J
 dIIr4W47QId2IAEYhYlrYXrlJ7KNMPTzU7SwBxAqxmx+UUar7qVeHlLjZnP1rGcHBsrsOS
 kvwu1II/mI0tn41yXYFsmkvalTrxssU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-F9wqWzFDOXyJpo1vaHPbyg-1; Thu, 09 Sep 2021 05:37:01 -0400
X-MC-Unique: F9wqWzFDOXyJpo1vaHPbyg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so318988wrn.12
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVRPtElpwiBYFVLyJtvaNAFknDJTTjqAeP7URxCglOA=;
 b=am9UcHSBxTwCyhZFnOs0CfRMtVCW2elL6cml7K54nAfok+BYtaDECOunxEGhP7otwp
 Ud+mpOO6MlBPyoBHjcV9sA5qpkQIOp5yU1VSGz+F09GKHVf2M/OyrRlpwc22VIpOyNaz
 /ZByHYs2uE2RNC+vXsF/+KgRlUqBJcHpjLkksjtdzta1CsQMHKGzn8DzU7BRIIwaZEHH
 pzSDWIYU7C3hbxTJD8wTyisWQZCP3vNGbbaZfxXAfiJLAL93A8yQDJHG+reuWC+44Gtl
 go31Ws0YV0I9wZc8wkQfm57FmZnw9LLzvca+hVUqUCpIfeNOzar+m1joqaJZ1aBpNvZW
 YWdg==
X-Gm-Message-State: AOAM533fwJdRH0g8LEU961hUFsZkPOOXe/lEpkP/RUCiyHhkSbxnpQn6
 MTxhXgCMN1hNrn4Q1BZ/Vc2b/ocqQAdZuyoM+D/A2xevfJr1yst1jaUgtoydSMPk/XX6p23l/6k
 Cp7f0ZcyTNjIgwwQ=
X-Received: by 2002:a5d:5262:: with SMTP id l2mr2397222wrc.190.1631180220682; 
 Thu, 09 Sep 2021 02:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxleqTmB5o5DaWQOvFm0VJfW/DuSaAKdQ+iHQ+q0FI7EgFsAVqcozEwbXk74VM/7Tivf+cAQ==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr2397205wrc.190.1631180220489; 
 Thu, 09 Sep 2021 02:37:00 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id 17sm1038152wmj.20.2021.09.09.02.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 02:36:59 -0700 (PDT)
Subject: Re: [PATCH 5/7] qmp: Add the qmp_query_sgx_capabilities()
To: Yang Zhong <yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-6-yang.zhong@intel.com>
 <fe8b02c8-d7f8-c733-9577-311251a5f66d@redhat.com>
 <20210909025105.GC21362@yangzhon-Virtual>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a36ebd16-3cef-7287-9bd3-9a08b99ba1e9@redhat.com>
Date: Thu, 9 Sep 2021 11:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909025105.GC21362@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 4:51 AM, Yang Zhong wrote:
> On Wed, Sep 08, 2021 at 10:38:59AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/8/21 10:19 AM, Yang Zhong wrote:
>>> Libvirt can use qmp_query_sgx_capabilities() to get the host
>>> sgx capabilities.
>>>
>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>>> ---
>>>  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
>>>  include/hw/i386/sgx.h      |  1 +
>>>  qapi/misc-target.json      | 18 +++++++++++
>>>  target/i386/monitor.c      |  5 +++
>>>  tests/qtest/qmp-cmd-test.c |  1 +
>>>  5 files changed, 91 insertions(+)
>>
>>> +SGXInfo *sgx_get_capabilities(Error **errp)
>>> +{
>>> +    SGXInfo *info = NULL;
>>> +    uint32_t eax, ebx, ecx, edx;
>>> +
>>> +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
>>> +    if (fd < 0) {
>>> +        error_setg(errp, "SGX is not enabled in KVM");
>>> +        return NULL;
>>> +    }
>>
>> Is this Linux specific?
> 
>   Philippe, The /dev/sgx_vepc node is used for KVM side to expose the SGX
>   EPC section to guest. Libvirt then use the '-machine none' qemu command 
>   to query host SGX capabilities(especially for host SGX EPC section size)
>   to decide how many SGX VMs will be started in server. If this node doesn't
>   exist, the reason is host can't support SGX or SGX KVM module is not compiled
>   in the kernel. thanks!

Sorry but you didn't answer my question in an obvious way... Yes or no?


