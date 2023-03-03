Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77B6A91C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzy7-0002Za-Ac; Fri, 03 Mar 2023 02:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXzxv-0002Qi-Hw
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXzxt-0002Od-U9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677828989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
 b=JlRrEyGOxM/Izre423M12K9vlQnPZe8nBer0DSbB6xED62x4og0DdeU/SP2rPATG1L3ELA
 J3BC8AAAJEgEUVfbZBTp1vUE3kG7ad2bDzz7YRl854bGvuABRfndplZVjwEerYaAhX0QAJ
 91mFhx1nxJxuqxLPftQh2vCb1rk1x7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-SCrCgPAJPIy8h1iI9-QklA-1; Fri, 03 Mar 2023 02:36:26 -0500
X-MC-Unique: SCrCgPAJPIy8h1iI9-QklA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso218310wru.15
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 23:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
 b=SYOMnX8JSXLlAxaIndRsTcZl/xC8ZK7OK+43EDfFZHzKXE9qSzKL6cbAg+R84bgCNm
 Fdg43s0RskjYcNzcvyRnaLTxHsvMPZWLRn4gqi/hnMW9C1QZpRcPPq/0l3rMvORG97s5
 qL8teZ9gjdRzDk46autVe7GoRPOqbIX/sEhJrAggRHnrr1DfX4ftYlO5ASy3eCCEhrZy
 xFrDUI71NrQJ0Mft3SCjkxZRF74VJl0neOLQQZ3QpvYVtu6DURk90nQG6nsAHHZlsBjX
 /KXg/B0eOKfWfZjXUe32uBRteT0np3L8L/5pqiLyV+xpWkm3JrpI/xjOR44RngrRAd0p
 5JHg==
X-Gm-Message-State: AO0yUKUFO6BmK1MWjYaz4DSUkY9AJNQ86cGkgAKc7ST8Edf2plHP6E1n
 QkLRGGx7kG059Q19/XqWf5XD0Z756GewCh00IJPSDGer3MpxWyXOW+iPnO/PrPPC4lht6K5ap79
 B8GL8Yn9jKfuZA78=
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id
 g4-20020a5d5544000000b0024218097e17mr786036wrw.6.1677828985660; 
 Thu, 02 Mar 2023 23:36:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9cVmsT0uaOjLpyfGRqzmsceoSUEMI//iNaoUptBCRvsgzqA+n1h2dF2/JHs3Sf1sqcgq/pNg==
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id
 g4-20020a5d5544000000b0024218097e17mr786014wrw.6.1677828985284; 
 Thu, 02 Mar 2023 23:36:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm1378189wrx.12.2023.03.02.23.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:36:24 -0800 (PST)
Message-ID: <29a8a698-b056-714a-3a94-c591e5b55c44@redhat.com>
Date: Fri, 3 Mar 2023 08:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 02/03/2023 23.16, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, 
>> including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
>> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
>> +this 32-bit KVM support has been removed some years ago already (see:
> 
> s/some/few/?

I can also use "three years ago" since the patch had been merged in March 2020.

>> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4 
>>
>> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
>> +future release. Use ``qemu-system-aarch64`` instead.
> 
> If we unify, wouldn't it be simpler to name the single qemu-system
> binary emulating various ARM architectures as 'qemu-system-arm'?

That would be more intuitive for people who are completely new to QEMU, but 
I guess it will cause a lot of "you broke my script that uses the -aarch64 
binary" troubles again. So I think it's likely better to not go down that road.

  Thomas


