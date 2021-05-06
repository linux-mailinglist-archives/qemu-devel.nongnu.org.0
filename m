Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956337517F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:28:45 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaJI-0004cs-JE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leaG0-0002nv-S1
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leaFt-00047k-Qp
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620293109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQiuki7NfIyclGBm/fDfPtve2NNMTbqLWkGZU/IuMLY=;
 b=GoUKgIIHx09C9Xafx+deuEVp0w7pcLnmKthdvqL6VqimkQDPcbmRTPT1JZdj5eCWOkz6JG
 51447vB4kLkk8jDo7ZBsgsGRJN42BESWjwIBSEVMxK6qik7B/57jyACBpUi/u9Ylma1KQW
 IkhGDnmTbh7WpqVTHFPFcpug3AIdeMM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-twAeXGVEMLqSog0zPLntpw-1; Thu, 06 May 2021 05:25:07 -0400
X-MC-Unique: twAeXGVEMLqSog0zPLntpw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g19-20020a0564021813b029038811907178so2306676edy.14
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 02:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KQiuki7NfIyclGBm/fDfPtve2NNMTbqLWkGZU/IuMLY=;
 b=KEzXc8UkRmUzLBphWNzGbpduAA49Ag5wMJ5mGRYGBSqFa5Gu7Jr0l9uJ/D17JAImsN
 WQ+8lwdlAO2ZBJzToffxOy7LERiYo+tDg7xfdj2+VhvKAZJVOpB3NCUYjlTx9XdSor5v
 qO++9CnFpXwNMvII9i2IbdEx7rxrqxkupHBanReEkeWHkH7C7sMkkahJTTWJ2Xnp+kFu
 OjWFbR0x1SpiIdStq+CoAMd8YaN+pn685i2majJWaMPYBTGhgdcFaC9WTH3chwc1HNO2
 GjG4Wz6h7/11UF9YB/lr3zRM68mH5U/1EbaQHeJRY6AzVoH7dNV0lj8OllEhLJTLMeu/
 SHHQ==
X-Gm-Message-State: AOAM532+ZrzD+1eSBxDpuui2EIiqP+uFCYueh+yRiNhtV/XoE+GYaZwZ
 330w/FfQC0Q6MXRED6JtCmJAXDzgITRQgIpa77m8R0AytQ93VgcspN7KizAFbXudjJT7w5Eud8n
 MX1VGjOw2Oa2Uu1c=
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr3360833ejb.498.1620293106818; 
 Thu, 06 May 2021 02:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV5Vq+yPRueLLRVVXajqBTHBwQ4HrDYRxlKLDAcHVjATPkbGBDpcu1LHgZacCD7AcRQe3dOw==
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr3360800ejb.498.1620293106543; 
 Thu, 06 May 2021 02:25:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id a24sm1165003edr.74.2021.05.06.02.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 02:25:06 -0700 (PDT)
Subject: Re: [PATCH v7 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-11-david@redhat.com>
 <039b34c2-07e1-49da-d325-ae1b67636374@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <74f91b11-4858-e350-d145-73fd45652f27@redhat.com>
Date: Thu, 6 May 2021 11:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <039b34c2-07e1-49da-d325-ae1b67636374@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 11:58, Paolo Bonzini wrote:
> On 28/04/21 15:37, David Hildenbrand wrote:
>> @@ -545,6 +545,9 @@
>>    # @share: if false, the memory is private to QEMU; if true, it is shared
>>    #         (default: false)
>>    #
>> +# @reserve: if true, reserve swap space (or huge pages) if applicable
>> +#           default: true)
> 
> Missing open parenthesis and "since 6.1", otherwise the whole series
> looks good, thanks!

I could have sworn I had the "since 6.1" in before :)

Thanks!


-- 
Thanks,

David / dhildenb


