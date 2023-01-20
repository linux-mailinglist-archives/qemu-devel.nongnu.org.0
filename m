Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BF6753F4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:57:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIq0L-0005uW-8X; Fri, 20 Jan 2023 06:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIq0J-0005ts-5K
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIq0G-0001st-8B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674215775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vg6mJzvu0y8vgifCIBh6KKubBetRO7GYEyZ6/+9wrew=;
 b=CGXn+FIabaRSe4sbmTF3WKw4CwjkMfTDJ/lzn8ingq/03QdycFnDx4PDc+j7xo33M6r14b
 LKyc5aUQGVO83wxLarGsMMLsQZro+cNvEvozMHJtjTF8Oyd3JwGWnef/N4KeYGjT8IQVGH
 TWmXytCEJWxe7On7aMspSUc5blRVa7s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-6aTjH474PeeUOhjvo2EMNg-1; Fri, 20 Jan 2023 06:56:14 -0500
X-MC-Unique: 6aTjH474PeeUOhjvo2EMNg-1
Received: by mail-qk1-f197.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so3349055qkn.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vg6mJzvu0y8vgifCIBh6KKubBetRO7GYEyZ6/+9wrew=;
 b=Ze6hpr8QArvp2Ws5Gqe68liOYQwXc3JE9NcCXtS34InauCCbUhuI0GNOQv83tsqORU
 I0biQ/MvMdIXGCG+APs2JxETJdIdE7aubkzeI2OtDyVjk7HyiJA3xUsMmNAv6LanE9RU
 WKUR66BZHjb1WB65qMn/aN71sVQEnD70Gj0+NUB4v7qS/bd/uug/lzlBpnS2qREicgjz
 JTFLdkCH4+f1YldCra8uzW66RN80xGfwT4aVeBo4nsiAEWpah6e3zAj/KdTEhb8XyDLo
 2HXWDHhvjjMj/lJ8kXyoTlSb1q+U52QA8Wdm6JxeWdjIKG1LVnLdAF9Y3kIiyfidMQgM
 mHHA==
X-Gm-Message-State: AFqh2krdqITtTcgiznOviXpqCzJ/GCZ5zrCgeWa1oEyj2G+rvV+SYsl0
 F4lA2dGsMt79bIUFSNvBHJaMLkGEH2vTVSB3ms5Jiv2oPLDj0pXrgyBI3CiwHzAKujFd9FQGjAk
 eAg8q14SvmQ197/8=
X-Received: by 2002:ac8:71c1:0:b0:3b6:3abd:fcc2 with SMTP id
 i1-20020ac871c1000000b003b63abdfcc2mr20104428qtp.46.1674215773701; 
 Fri, 20 Jan 2023 03:56:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXslsqQwJqVGYKeuWvFHUQT4LIkpVZ6nAQtm3xvcGPgl1xP0C5pJn+pZBnsYQhs7SE+EMQ844w==
X-Received: by 2002:ac8:71c1:0:b0:3b6:3abd:fcc2 with SMTP id
 i1-20020ac871c1000000b003b63abdfcc2mr20104391qtp.46.1674215773482; 
 Fri, 20 Jan 2023 03:56:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05620a414200b006faaf6dc55asm26231527qko.22.2023.01.20.03.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:56:12 -0800 (PST)
Message-ID: <648e62ab-9d66-9a5a-0a03-124c16b85805@redhat.com>
Date: Fri, 20 Jan 2023 12:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 10/11] qapi/s390/cpu topology: POLARITY_CHANGE qapi
 event
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-11-pmorel@linux.ibm.com>
 <c338245c-82c3-ed57-9c98-f4d630fa1759@redhat.com>
 <5f177a1b-90d6-7e30-5b58-cdcae7919363@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5f177a1b-90d6-7e30-5b58-cdcae7919363@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/01/2023 18.09, Pierre Morel wrote:
> 
> On 1/12/23 12:52, Thomas Huth wrote:
>> On 05/01/2023 15.53, Pierre Morel wrote:
...>>> +#
>>> +# Emitted when the guest asks to change the polarity.
>>> +#
>>> +# @polarity: polarity specified by the guest
>>
>> Please elaborate: Where does the value come from (the PTF instruction)? 
>> Which values are possible?
> 
> Yes what about:
> 
> # @polarity: the guest can specify with the PTF instruction a horizontal
> #            or a vertical polarity.

Maybe something like: "The guest can tell the host (via the PTF instruction) 
whether a CPU should have horizontal or vertical polarity." ?

> #         On horizontal polarity the host is expected to provision
> #            the vCPU equally.

Maybe: "all vCPUs equally" ?
Or: "each vCPU equally" ?

> #            On vertical polarity the host can provision each vCPU
> #            differently
> #            The guest can get information on the provisioning with
> #            the STSI(15) instruction.

  Thomas


