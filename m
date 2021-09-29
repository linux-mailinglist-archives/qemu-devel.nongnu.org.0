Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72541C79B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:58:58 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVb2v-00063b-29
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb1r-00056K-MJ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb1o-0002Pt-Io
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632927466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClkLC89eOjyRm24cWRofxm3lI/IZtLH8xob3cAVr6tY=;
 b=Q5oJtUjOcZG8BLbJ/bqCuni5yaLUT2FLReyRPI2bl9Hu/4/+bynWCJJ8VpTpwZsBpHSZic
 1OQcVR1HiVFsnDaBK37tBkkXNFxJJZQKpScViKyQPmJ5wKv3+jxSckv3AXdAq5Arc9XQTH
 vzUJwXmY3QO0ob0WufdEtiVOxSR0/q0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-mMmfad2uMeCY6wL-K_V7hQ-1; Wed, 29 Sep 2021 10:57:44 -0400
X-MC-Unique: mMmfad2uMeCY6wL-K_V7hQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso2647288edj.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ClkLC89eOjyRm24cWRofxm3lI/IZtLH8xob3cAVr6tY=;
 b=BGzZZZzEXLSnIxeht/eRzBg9lMMOWsCFNSoBCuVSRPp5bBlBGtWfy/kUvOdKLtMhaP
 5XIfWGnILpMBNbEQyxeTx1O9O2ycAYHVBc2dI25DEi47zXWVVN+DU1/FthqP8D3FpuDG
 Y+YvOfeifbaq5pnV/eCahFi7MF+qejKp+JiiffHOXb6qbUtoaaQ9HpdqfuBuzPiSvzrE
 RBxaoBuYlIpryYHCiq1umCodJkNxl14saDFKL3j+t+QfRgbOeP2nZwF61Pkkv416fJHA
 EfntvNGPXdibQKAcx7FoOw/Xtqpc0HIDCJ2jzPiLLdqOE4U//0sELNwtb/Fm5WuGxqta
 OFFA==
X-Gm-Message-State: AOAM530iibkfydW9iqQBHCIvxLWJ8ZHOd2QA2aEBJeWpGTewhGt5Q3tp
 8OALx/xLvClSg3j0PBGJBXp5EipIO0QJp4avJTW7Q4KtO9PA8cMU33mGQ66CbiR3iH78cgU9e5i
 bryXmsX4mlTXtG5o=
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr356060edk.251.1632927463732;
 Wed, 29 Sep 2021 07:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHL99CLGoKbC1E13uz+mlyDprUqJ07/VXeRy2S7O+flM2VBjhz5NkEip+ZA9oLnpXDjTc26g==
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr356026edk.251.1632927463479;
 Wed, 29 Sep 2021 07:57:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a22sm18731eds.62.2021.09.29.07.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
Message-ID: <f0df8f93-0214-58cd-4304-20afd2e150ec@redhat.com>
Date: Wed, 29 Sep 2021 16:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
To: Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
 <87sfxntp5x.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87sfxntp5x.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/21 16:46, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 29/09/21 04:58, Yanan Wang wrote:
>>> Hi,
>>> This is a new version (v12) with minor update suggested by Daniel
>>> and Philippe. Two new commits (#1 and #16) are added. Thanks!
>>
>> Queued, thanks!
> 
> Could you amend PATCH 16 to drop ERRP_GUARD() in machine_set_smp()?
> 
> 

Sure.

Paolo


