Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636642A339
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:27:00 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFvv-00083K-Bl
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFXy-0001Xi-5X
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFXq-0003R5-6h
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8qLCe1tf4uCLl+7w4Wrw01gs+n8MElttKID6FBOM3c=;
 b=SiMBb2dEb5SJMbhHxa97Yt6zCg9n/Zrg2Idor9uojqX4tWcd8fJ8iUFCi31JIWbA1kzIis
 ZNk8VWJpueaSOFJfgfFpfvjAgbX56lDq+t59LgJFqPceIIUUD2n5Zg4TjPHXA5eqCMKDkY
 ar5kFV6KkIfz5Jzmx2h0YxlE0t7yp8s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-oAKjatygPiiXVL5KLgRYug-1; Tue, 12 Oct 2021 07:02:01 -0400
X-MC-Unique: oAKjatygPiiXVL5KLgRYug-1
Received: by mail-wr1-f69.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so14739490wrc.22
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y8qLCe1tf4uCLl+7w4Wrw01gs+n8MElttKID6FBOM3c=;
 b=kW/arsjMFyfX2U2UpFuPDtzqRPC5EeA29qsM2XHHaj85dlmSZj5zApzSR3L8IBPtdd
 oEo/Pu23FJL2F4UiFDhne/FOcIFiJ+vvC9yEpcCYA6d/P4d4lsstNjxs7X5meKYRwMho
 6pOOAJE5NCHGCweEdxUiMog1lU1EDLusGLYf/coCQldc/xeqwYNaieLWnyHajgeHhGlp
 zqoLbyuyAzUrW+ysQ7K+AuEMCx6VlVgg8zo2rOIBQLsdGHsPVvJ83n83yNqLC3BFQnEf
 p45n7RLpNQP+Hjey9qiJEmq/bKpUiDQBPjO8s2HpOAiav/lMQH2CM+elAgwj+oaIdQT6
 esQg==
X-Gm-Message-State: AOAM530JuZFWHy/2fssAOVa7OwPABc3tmoRiHCAHMaFrqvIhdWLFIKBs
 0dEgJtWtppBY6O9q2QOeHeYaRPRy6FHx86f6YF7i/3/bKg7W52vc4odSceOln+iu0Dyn2uETJpS
 1LNhb2RP7gLfb/U8=
X-Received: by 2002:adf:bc42:: with SMTP id a2mr31201900wrh.4.1634036520379;
 Tue, 12 Oct 2021 04:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLKhkgEpIzYWOFo2SH3ZqGl7Ugz2mF4WLX7TARUOPYsgcs3QDAeMrIo2ZLanG76xH379Nwmw==
X-Received: by 2002:adf:bc42:: with SMTP id a2mr31201809wrh.4.1634036519679;
 Tue, 12 Oct 2021 04:01:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f6sm2065697wmj.28.2021.10.12.04.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:01:59 -0700 (PDT)
Message-ID: <d27b62fe-1660-0d1f-4263-88e181d811bb@redhat.com>
Date: Tue, 12 Oct 2021 13:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
To: Eric Blake <eblake@redhat.com>, Yang Zhong <yang.zhong@intel.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-4-yang.zhong@intel.com>
 <20211011170324.2f5oacnghualbu45@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211011170324.2f5oacnghualbu45@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 19:03, Eric Blake wrote:
>> +# @sections: The EPC sections info for guest
>>   #
>>   # Since: 6.2
> Given this has not yet been in a stable release, we can make this change...
> 
>>   ##
>> @@ -356,7 +371,7 @@
>>               'sgx1': 'bool',
>>               'sgx2': 'bool',
>>               'flc': 'bool',
>> -            'section-size': 'uint64'},
>> +            'sections': ['SGXEPCSection']},
>>      'if': 'TARGET_I386' }
> ...but are we sure we have the best interface possible if we are still
> expressing uncertainty about the QAPI used to represent it?

Yes, I think it's better to have a more flexible representation.

Paolo


