Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09032D6DE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:42:22 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHq7I-0004Sn-Ky
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHq5u-0003cw-Uy
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHq5s-0006I8-JQ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614872450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEsOz/8T8z2ylZ4ja7cwKljdny+N8pW5D/wcdQijxOA=;
 b=c3vh7NvzRuUejUKVeCaLZje7XxQfsXGO9N8xgWfA2/Xj6lxGRDM9hgOwV6WSAZL74NBs8w
 6zlDW3TCP26VCcx8bh6H2Cj2dvKn9eb8vyIgYSkuVjECqb3dWBH2z0+nXoqGgKQGrnd/99
 WUT2bq6uZZ1uLslApsqNjJQw0kQ4bRA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-PSd7ii3DOROpMb9Elh8Gvw-1; Thu, 04 Mar 2021 10:40:48 -0500
X-MC-Unique: PSd7ii3DOROpMb9Elh8Gvw-1
Received: by mail-wr1-f72.google.com with SMTP id i5so12969068wrp.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oEsOz/8T8z2ylZ4ja7cwKljdny+N8pW5D/wcdQijxOA=;
 b=DDa0YQNUGtRGeEWRmc26eB8Y2OckEnBdLHs5kBhrGptiQaki4nxfAaWtZkviW6yPAx
 cRY+9MPI1/SMVupSkXoCpSJOuH6HFE3J/9SToqoLHNk82EiO3YV3CvmKr44r+pJUJonm
 flJa8Tmh3SytQwymwEkf3ltjUY9KQ687PvVYJxSFTt1HYCg2YuyKq+c+rhD356enZuCr
 iuQEkSv2L5b85IfRX0mLlI/xCimM0ZQNGFBa4o3y5BMKrp/rAm3h8zvwxxadtrnYlVWR
 i3mOYCLwOHoG6oCDgX8AXpdy/0WQfeCBK8DcOEhRuTlaOxY6qLqEcBSoGXnMUrGjeNLN
 dmxA==
X-Gm-Message-State: AOAM532z04k0E8n3uNHNyDNvmkaywQJZZxKlP4xoT9//2wHOrc20VjlU
 yS19QA+7nx0USGBY5iG/4CBNBI67CBD7LvA6V9JVB2MeTQxX8rhzP73OPzPdrrMdq00sirzuciB
 Be3taQ5jg7rgqDZw=
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4475379wmh.11.1614872447605;
 Thu, 04 Mar 2021 07:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP0EpyGjhDBDf+Mc0MzjfE82cjiMYcXu9FVzWL7+roDia1wTJrSkAJZpvXM7B/U1zggnOmBg==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4475350wmh.11.1614872447432;
 Thu, 04 Mar 2021 07:40:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 4sm11076508wma.0.2021.03.04.07.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 07:40:46 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
 <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
Message-ID: <438743f3-6e97-1735-6c11-26d261fa91b4@redhat.com>
Date: Thu, 4 Mar 2021 16:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/21 15:54, Philippe Mathieu-Daudé wrote:
> On 3/4/21 2:56 PM, Paolo Bonzini wrote:
>> On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
>>> Series is organized as:
>>> - preliminary trivial cleanups
>>> - introduce AccelvCPUState
>>> - move WHPX fields (build-tested)
>>> - move HAX fields (not tested)
>>> - move KVM fields (build-tested)
>>> - move HVF fields (not tested)
>>
>> This approach prevents adding a TCG state.  Have you thought of using a
>> union instead, or even a void pointer?
> 
> Why does it prevent it? We can only have one accelerator per vCPU.

You're right, my misguided assumption was that there can only be one of 
WHPX/HAX/KVM/HVF.  This is true for WHPX/KVM/HVF but HAX can live with 
any of the others.

However this means that AccelvCPUState would have multiple definitions. 
  Did you check that gdb copes well with it?  It's also forbidden by 
C++[1], so another thing to check would be LTO when using the C++ 
compiler for linking.

Paolo

[1] https://en.wikipedia.org/wiki/One_Definition_Rule

> TCG state has to be declared as another AccelvCPUState implementation.
> 
> Am I missing something?
> 
> Preventing building different accelerator-specific code in the same
> unit file is on purpose.
> 
> Regards,
> 
> Phil.
> 


