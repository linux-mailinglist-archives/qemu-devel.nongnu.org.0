Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F533F309E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:01:49 +0200 (CEST)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6xn-0005j4-4O
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6vV-00052b-7b
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6vT-0004r0-4Q
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DlLMuHBoXIa/I0o3FiEShe+SRf934Lj7pJeJZvCWvs=;
 b=TQrvPubjVTnSAA04PzU3ULzwqgT1xAqkLLNTKRELNXdXxHCa0E1xo2SkqyMmOYn7D+VpoW
 rUxvjjNXpTbxQODo16k7ekjWad4VSbb50oANjC8r35+earsUYgQAEJkYLUzDi6AHMiuAWK
 0Y2hVdMX5BkIb0MLFRSQ3HU/t5geNOE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-Au0CvmkNOcCzAOClsd4_wg-1; Fri, 20 Aug 2021 11:59:19 -0400
X-MC-Unique: Au0CvmkNOcCzAOClsd4_wg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so2993023wrr.2
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7DlLMuHBoXIa/I0o3FiEShe+SRf934Lj7pJeJZvCWvs=;
 b=K5CUFX8H7A95PTAd83+KfUTpoM01Xmwq+W5YTFA5so1sgAym3Af9qQ/Pwx4NPxvsx7
 1BIyw3mH+0JwC9oprLYsdAWp7wbyOls9lAaWGSzdCydrFOKk7TGquWiYQraXPpAhR1y2
 6EhSyHuAavHTlaFL1ohs8Rl7A8CvzRyq99n4GiiQA8T7LcJ7x4qVP5OTUoeJBeQBJ6BT
 L79dQhSqy0sQYJRAvv1De2SEh0MZ4CnljEcRpWFVX8lbEAWKwtIr3sv/ANb0aCy5jnMr
 RYXjp2i8yitHc6gjQ1JIcwstUfBqDAbZ/IxwbkHAsJmE8P9pkTQVCpTzwB8klhV6sUmi
 3u2Q==
X-Gm-Message-State: AOAM530UdOPvkZqnJTIt01+tENBCuV+q6mRRKgnPOunvBxEU8DR77TBA
 vMR/CnVpwppUTixb0vVaGBnEMn3nkH98aUfAuViBX16XPTnz4Cqi7UqgM1GI1n33GPwNfGYk6xe
 XHtKW2gmGjf132xU=
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr4848638wrm.392.1629475157969; 
 Fri, 20 Aug 2021 08:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ0ljOLJiLHlLuBpBhD9PPViCR+2bCZvLbLLHi9k9mRIJNy5GRvfWuTeF60NL1yUz4iDhZTQ==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr4848616wrm.392.1629475157743; 
 Fri, 20 Aug 2021 08:59:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h8sm10490568wmb.35.2021.08.20.08.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:59:17 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
To: Ani Sinha <ani@anisinha.ca>
References: <20210812071409.492299-1-ani@anisinha.ca>
 <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
 <alpine.DEB.2.22.394.2108202110430.624345@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15eb786a-31a3-67e8-cc4e-4db8dd949144@redhat.com>
Date: Fri, 20 Aug 2021 17:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108202110430.624345@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 5:43 PM, Ani Sinha wrote:
> On Thu, 19 Aug 2021, Philippe Mathieu-Daudé wrote:
>> On 8/12/21 9:14 AM, Ani Sinha wrote:
> 
>>> +    return;
>>
>> I suppose if you replace all 'return' by 'g_assert_not_reached()'
>> both issues reproducers crash?
>>
>> Your patch is not incorrect, and indeed fixes the issues, but
>> I feel we are going backward now allowing call which should
>> never be there in the first place.
>>
> 
> Linux kernel does something like this all over the place. They simply
> replace functions with NOOPS when they are not allowed for a
> configuration. They do this relying on preprocessor macros ofcourse!
> 
> It will be hard to do anythiung better without rearchitecting the modules.

Which is why this situation is unsolved since various years <:)

> That would have significant impact particularly on x86.

I don't believe so, the rework has to be done at the machine creation,
no change during runtime.


