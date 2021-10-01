Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5041E84E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:26:26 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCw5-0004GK-Ip
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWCtw-0001VF-Ti
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWCtt-0006Ha-9E
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633073047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vk6dmvOf2cFqjX+SRGSeidqhuZpSWnf9HXyi3guosrM=;
 b=ANBTbFxPlB4j4Dam8tjtJrdDzIjzffTQIL0OuYtjPLc4b+EM5/T2HkydyE80pSuO2iO9XV
 jwzGiUw9cJnV+BGeooc8+z9VamEJIlgUMruUW9mmWTTBPc3MuRTx5QI1qXdOCqyG3XqIgy
 TZtC79FMS68YfQYr4h89jf8b0bHqnnw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-rG_xNQnYMcuHp_raPZ6F0Q-1; Fri, 01 Oct 2021 03:24:06 -0400
X-MC-Unique: rG_xNQnYMcuHp_raPZ6F0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso1945835wrr.15
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 00:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vk6dmvOf2cFqjX+SRGSeidqhuZpSWnf9HXyi3guosrM=;
 b=18bEGZbSFPkYcFVxMmPa5yI+tPM/mglnPKoe6l35VSUXx2LwN+RlnJCOPri0yF4ZKl
 AEgBEfmizUAyKZFH/CvlfWheKjmwuSAeOwp/dTdWAxABMkv3RJ6snmpSP2wn40iSAnCc
 wq71gzx5S0tShatp51P0hXuR8Mr81oAOxtW3qOn9vpNHxkjVXuTVYNeDWL6gKjd7ZDcE
 aRYA7d8v8lAPmenSXdZkkuEezSgH/1zW/cBOGpYv7DhCczckcqqqJUQ8ouns233ICecj
 HJ57x+9o4XUJiqAuwj6ESPNRoj6wqklTP47uJrLGxbd6X+kqsS4PaNH2cvbpMzLj1EFj
 KK1g==
X-Gm-Message-State: AOAM5325CwsRDVolFSv0p5qh3b76nYsPM4RD1AEN+EHZHAxJWEY7MSes
 9Qyq3biU6nttKyLvrUEFE35FweIO7a6suU0/iV6VRV+mT4ySwQHHM433PRA+SPK//loqziVvqez
 zGkXsl2JxlQb6ACkulTX3h56qjImjfjVYmhldvgre1daaxXEvCYsYDNqJdRHn9xQ=
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr10474274wrq.378.1633073045546; 
 Fri, 01 Oct 2021 00:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc1oJB756wAWPB46DviqNVKCZAFTqxH48kavB4+TIYeLUimg9CD4aPGbkbQYI6hNf+Waz/MQ==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr10474241wrq.378.1633073045298; 
 Fri, 01 Oct 2021 00:24:05 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c9sm7199497wmb.41.2021.10.01.00.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 00:24:04 -0700 (PDT)
Subject: Re: Moving QEMU downloads to GitLab Releases?
To: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <26661c01-e7ae-e225-7ec4-2e915b7a6ac5@redhat.com>
Date: Fri, 1 Oct 2021 09:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, michael.roth@amd.com,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2021 16.28, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 3:08 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> Hi Mike,
>> QEMU downloads are currently hosted on qemu.org's Apache web server.
>> Paolo and I were discussing ways to reduce qemu.org network traffic to
>> save money and eventually turn off the qemu.org server since there is no
>> full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
>> GitLab Releases.
> 
> Daniel Berrange posted this in another discussion:
> 
> "gitlab releases have a per-file size limit that is somewhere on the
> order of 10 MB IIRC. Our release tarballs are 100+ MB, so I don't
> believe that's going to be viable.
> 
> The gitlab package registry doesn't directly support plain file
> downloads afaik, and is also size limited to 50 MB per package

Maybe we should also discuss again whether we could decrease the size of the 
release tarballs. Someone recently mentioned that we could e.g. remove the 
edk2 sources from the tarballs - edk2 is licensed under a BSD-style license, 
so we are not forced to ship its sources in our tarballs (unlike the other 
firmwares which are licensed under GPL).

Or maybe we could also finally move the firmware images completely into a 
separate tarball instead?

  Thomas


