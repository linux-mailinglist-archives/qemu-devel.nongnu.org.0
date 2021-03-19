Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B4341B11
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:06:52 +0100 (CET)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCxv-0007X6-1w
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCvV-0006zB-KP
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCvT-0005qS-5b
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616151858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCw+AKY3ZQkCm/vHv6qEei+67LDuDGOLGjSslM63/yQ=;
 b=V+J6Vzfn0L5Trehj1QkHIzPK3woMExMyMlxv2RWnOWrAbXH9hE+jHzTYSpkatr1hrdfJ39
 qg4adj77Q3lIH22GRIlaAaaibfxpJPDKMO+w4+fn8Jc8hebWHopXOenGEQnPV8cHeBiMcA
 7qhXrBnfwdgvled/mLjHv5neX3exR2Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-6nBsmbwyMjWRcCkIvSbjHw-1; Fri, 19 Mar 2021 07:04:16 -0400
X-MC-Unique: 6nBsmbwyMjWRcCkIvSbjHw-1
Received: by mail-wr1-f69.google.com with SMTP id s10so21652221wre.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xCw+AKY3ZQkCm/vHv6qEei+67LDuDGOLGjSslM63/yQ=;
 b=EFSvfsa7MRaL+bUyRKlYqQBrYYsO8LTx1wI6nQbieZ5Q48v7pEeMwDiG8Ccq4BmQSd
 OHeVS+fEsqpirOFppvviL5p4AkvcvXj2587F3YNMQMaNevNnWcPySyRjFhqKzatAPBUg
 6VNsUTZmueLDCf741wF/ip2aYq7UfrNm2JERuY1NUWlV55zpyGzmiGoLEbbKG6yXTtk+
 +k6UKOl6u2n3Vzp/B3E+PztVJuPtDtWx1B93NbRk8wIBT5Af1jY16aDoY73EYAprUx09
 7gpy95AKmaNXABeZ7js2oAOpDI+Ga6SroRVxz5Xw4M0V8Kp2VWlGUtCibboyOD2mejXG
 4dcg==
X-Gm-Message-State: AOAM533zHjSwRol1ulWrhABpxX8psevoCFAaCCziQzE7pWp1hFjYIrhZ
 1d0EhSESMHXphY2EWkuftoSrdPVpXusoMP2FUQL1FFGz6Ud6wZYpElTrhFdOiThSqQuIK0DTgxu
 YygCweCsfXSaB/qQ=
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr3146664wmh.153.1616151855102; 
 Fri, 19 Mar 2021 04:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwah6EzIWvRtZ/rm6Vv+xEISzjuwCfRXwDOWXuSuRKkUr29sb2huWoer6Nf4DrsbqNgg5YaqA==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr3146642wmh.153.1616151854884; 
 Fri, 19 Mar 2021 04:04:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j9sm5982953wmi.24.2021.03.19.04.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:04:14 -0700 (PDT)
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com>
 <104d7d27-48b9-d2f0-213f-54853270bcd6@redhat.com>
 <87mtuz5vkp.fsf@vitty.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7acdfa23-da34-c76e-1a44-cf611fe94917@redhat.com>
Date: Fri, 19 Mar 2021 12:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87mtuz5vkp.fsf@vitty.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 10:41, Vitaly Kuznetsov wrote:
>> What I want to achieve is to forbid migration of VMs with
>> reenlightenment, if they don't also specify tsc-khz to the frequency of
>> the TSC on the source host.  We can't check it at the beginning of
>> migration, but at least we can check it at the end.
>>
>> Maybe we're talking about two different things?
> No, your suggestion basically extends mine and I'm just trying to
> understand the benefit. With my suggestion, it is not required to
> specify tsc-khz on the source, we just take 'native' tsc frequency as a
> reference. Post-migration, we require that KVM_SET_TSC_KHZ succeeds (and
> not just 'try' like kvm_arch_put_registers() does so we effectively
> break migration when we are unable to set the desired TSC frequency
> (also at the end).

Oh, okay, I understand the confusion; I was thinking of checking for 
user_tsc_khz in the post-load function for reenlightenment, not in the 
command line processing.

Paolo


