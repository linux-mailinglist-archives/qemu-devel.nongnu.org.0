Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17C3E8C4D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:45:45 +0200 (CEST)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjrs-0005pN-Rp
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDjq3-0003f4-QW
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDjq0-00016K-8B
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ousx7AlwAojW1Tcg2xmbWctrPKR67NvJho8cNVErw0E=;
 b=dc+cRVdTGhRkJjWmLj1guVf8rZ73lfcSc8BU+rOpnTeHDnZABGeZQcQH7ooWBx5i49FXSC
 OUPkc/kLKCADB0wDhKk/ymRf/NdD1WEeAJ6Ov9lNfdtaya2qY0PLTNU3RrdLaicAqLQlOq
 W36eflQE1FNVlHffFjzbOl58jl49+Og=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564--VgQHNghNT-tZnx5kx8U7w-1; Wed, 11 Aug 2021 04:43:46 -0400
X-MC-Unique: -VgQHNghNT-tZnx5kx8U7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 d10-20020a056000114ab02901537f048363so475964wrx.8
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 01:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ousx7AlwAojW1Tcg2xmbWctrPKR67NvJho8cNVErw0E=;
 b=RFwSLkmF0xfiOFkX/wkD0jaYtPj+t9/d14b4wcNOIoTrsfhserqkC8RaJ+Z5rNog//
 z4JZe6xXJGP9PIq4RVPODtCsIkimdY9hsuTjgBi/oydEtc92GE8br6fx1Kotfog50R1U
 wY/5k8eYiboS9WPjql9OEfZM8grpSkda2HnItzCATYVyfOELwFsItmRFMRjKdNEAomfN
 o8ZNRykqta18op0umKoBoLphHD3N91cBlqtrWpb1U03/FXrS3kU6rOqciVHoJot9IhSA
 Egb+oGsfzJ95JVjlqsuCaBYDy4SSXGHdD9YhD/l4NXgOPS+WmRMJMnBXm18cze3LiHf5
 3GGw==
X-Gm-Message-State: AOAM533yQV6ZriUbXi/s6dxZ9MxPvZQM/ob6UFaCSKNmrvmAckLyCkCi
 BkT5GGh3w/KuYy5/E/mzf/6sIUdZq/gcrtAhm9cGKzKAHNPC6FPQ5tCe9zdkD0qteGJj8m2Bzff
 LIovjxoddFiFZGyc=
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr8506980wmj.71.1628671425139; 
 Wed, 11 Aug 2021 01:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh0PHzW1tkIhf2rB6VNFwGItG0s5ejnnsDRpaRL0JFMsXG9xKN86cOo1zWmSoSJo8v7JrxAg==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr8506945wmj.71.1628671424817; 
 Wed, 11 Aug 2021 01:43:44 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64a0.dip0.t-ipconnect.de. [91.12.100.160])
 by smtp.gmail.com with ESMTPSA id b20sm5657179wmj.20.2021.08.11.01.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 01:43:44 -0700 (PDT)
Subject: Re: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-13-david@redhat.com>
 <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
 <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
 <0acca1d9-b340-e280-44ad-bc10fc2d4bf3@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <584bf667-5465-850f-2228-5030d5e67e90@redhat.com>
Date: Wed, 11 Aug 2021 10:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0acca1d9-b340-e280-44ad-bc10fc2d4bf3@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>> Shouldn't there be some modifications to qemu_s390_skeys_get() in that case?
>>> Or does "fail" mean that it crashes?
>>
>> qemu_s390_skeys_get() should simply return -EINVAL because
>> skeydev->key_count == 0. So don't think we need any modifications.
>>
>> Makes sense?
> 
> Ah, right, make sense, indeed.
> 

But I'll still make the clearer and also fixup the error messages that 
are getting printed. Thanks!

>    Thomas
> 


-- 
Thanks,

David / dhildenb


