Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12451334308
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:29:16 +0100 (CET)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1hz-00071U-1S
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK1KB-00072f-Kc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:04:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK1K6-0004SW-Tu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSVnxMAAjKSdtyaArk7QoRn+s5vms/zOhUmikvWvD0E=;
 b=RVeWLcGR/zgjlI58UGMocKWejEmLCYoU6rzNoydDg1mcOzId1z7eKHTXYfl+6aW+zPF4+U
 mJwO6cfdJHss8tEVk5KJfT+e1Vf65vNr71Pf1g5MDSBEX3qrEaSk+swgcH+6ro9n67Abvv
 6ZWFS+/SDDF8v8kuntjp1zjpGS2j9YY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-7v_fPecnPeOGI9MgXb1aDg-1; Wed, 10 Mar 2021 11:04:24 -0500
X-MC-Unique: 7v_fPecnPeOGI9MgXb1aDg-1
Received: by mail-ej1-f70.google.com with SMTP id 3so7444076ejx.17
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oSVnxMAAjKSdtyaArk7QoRn+s5vms/zOhUmikvWvD0E=;
 b=deTeDRPI2TfgniW97LPOV2qvpoxvwKAomYIcdO0q6bpUlCgf6pBrLdI3f2rDuUdRaY
 sxNta8BGvYn4b/SrSU/A8x+5S0MmglS22//BhHNDs2R1w0aC70Y95HQVkyik7W5gPqBX
 wFjTNiInGMT4ykL5Tp/doOHR6qO3ndsTBaE7E9lFJslHfAgXM/JZ2mGqiiaH9aQh/M/c
 QUHCkyTd0ddlazlw69cHZ3j39lV59WrgnNDrXmP+Wa022Jor8Q9p6pkZRGaj10rX3sXY
 kYkjaTLAaqxYa182BTc6pmGU5cScTgfXj+jprfFySeOMVYhN4qJ6KB7HzcMkT5fXaeZR
 dMxQ==
X-Gm-Message-State: AOAM531jdcQH/MahP6PV/c1zJPmOwNNqQ1OW8Di0iX9phMI412b3HgM0
 I7xUlpfL6xAkAJ6svcO+gjrmpupqIxaYnsj3Kumek4iAxnUQTpiWCoUR1fXqK5I5zyTNCqbIjvh
 oSKbgJMR3NomASTc=
X-Received: by 2002:aa7:d484:: with SMTP id b4mr4144003edr.63.1615392263103;
 Wed, 10 Mar 2021 08:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsXy5h9Wy6g+BaqjDHhNLFwhRZ3g2ODckG+nyFHvEk5rPmFTINzdKo54UiBTunyOrK96YZOw==
X-Received: by 2002:aa7:d484:: with SMTP id b4mr4143994edr.63.1615392262991;
 Wed, 10 Mar 2021 08:04:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q11sm9964973ejr.36.2021.03.10.08.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:04:22 -0800 (PST)
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210310094936.1318317-1-thuth@redhat.com>
 <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
Date: Wed, 10 Mar 2021 17:04:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 16:49, Willian Rampazzo wrote:
> On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> When running "make check-speed", currently nothing happens. This is
>> because the redirection to "bench-speed" is not working as expected
>> (since the bench-speed rule in the generated Makefile.mtest filters
>> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
>> Fix it by calling "make bench-speed" instead of using a dependency.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/Makefile.include | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>
> 

I don't object to the patch, but if no one has noticed in 6 months 
perhaps the target can go (replaced by "make bench"/"make bench-speed").

Paolo


