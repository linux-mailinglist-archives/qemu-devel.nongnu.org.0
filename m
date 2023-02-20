Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB969CE48
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6eo-0005If-Cw; Mon, 20 Feb 2023 08:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU6ei-0005Hs-Ds
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU6ea-000751-NT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676901373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaIsq9lFMUNYDFCEARra74wH8d/GPMtEu6DIRRxkmug=;
 b=cDyMyjDzA7jE3ehHoiZe6qoXHgLsMRTcsQde6KmtEiy/aBa8ZiU3HrO1SwDYi4VpSqvqrh
 SRus//8TNvqaQwxTOLQGXYa4Ka5Wge88odsVi4vqkiU8PcSR0se5CuVknYizQf604pkgwx
 qfCLrkFv2igLkcCfDxZ2VlR9rKOX6D8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-vnbNbOXPNlWA_I9CJR6XUg-1; Mon, 20 Feb 2023 08:56:12 -0500
X-MC-Unique: vnbNbOXPNlWA_I9CJR6XUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 c30-20020adfa31e000000b002c59b266371so105796wrb.6
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BaIsq9lFMUNYDFCEARra74wH8d/GPMtEu6DIRRxkmug=;
 b=CWrxfcgewltGjlL5l2Qu5RTaczGibeUy2URb+j8u26XFLhd3h7ej3yuqJFMLWgEahD
 HIK0XTqcNdbqc6zRQwgJyWPvTgc+SFcXwcn0fSFSipnGVGdlBeDsf3LoUf+JY0oSore3
 Hs0n3A2btQDY/Q21Yj74Ktr+xcSS721SC1st8zo3l049Kv6dblUczbq/WfU+mOwQjXHO
 l7tjwKnyOD+Gls8F6RNUui6H1k5W5WuGItZ2mzkdVTyaHQvg/qlcSsnGwNE6/X+6UMn+
 DUjkz+xMl7kjvT538oSwioqdKEl5dT6f8NGM2qMq0EsWP/DGow3NgapzG4hNpFN+tOmN
 A6GA==
X-Gm-Message-State: AO0yUKWAAEavkI0N/Z0xd1sz699GI1ftL+lWWByXNelQ+v9FOQLE9qQk
 XpYIOQ79g6Vu24Np5iBoIK1GNHlVWu2CnyIZD3n00y8DXY5Z1PSqL0uQIcEwmjrD+nz8NKHm9ns
 IG9uim7MQM88LoF0=
X-Received: by 2002:a05:600c:4d89:b0:3e2:1cfe:6e1 with SMTP id
 v9-20020a05600c4d8900b003e21cfe06e1mr416618wmp.9.1676901371104; 
 Mon, 20 Feb 2023 05:56:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/YGxLoaggS/SAWTkmiPSBOjGh06vKRmXiwJ/Q+CWywXn0cJMDNUUHCzFR+KE4kNZWE0wTGpA==
X-Received: by 2002:a05:600c:4d89:b0:3e2:1cfe:6e1 with SMTP id
 v9-20020a05600c4d8900b003e21cfe06e1mr416606wmp.9.1676901370772; 
 Mon, 20 Feb 2023 05:56:10 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b003dffe312925sm11208747wms.15.2023.02.20.05.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 05:56:10 -0800 (PST)
Message-ID: <c6a1897f-80e0-3a0f-eeca-5becaedf6c21@redhat.com>
Date: Mon, 20 Feb 2023 14:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Brad Smith <brad@comstyle.com>
References: <20230209093514.177999-1-pbonzini@redhat.com>
 <CAFEAcA8YhD2j316m47VC8pcx9Wi94p+71iCgKRjgj_9yrvOFLw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL v2 00/11] Misc patches for 2023-02-08
In-Reply-To: <CAFEAcA8YhD2j316m47VC8pcx9Wi94p+71iCgKRjgj_9yrvOFLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09/02/2023 16.17, Peter Maydell wrote:
> On Thu, 9 Feb 2023 at 09:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit ae2b5d8381a73b27f35f19c988d45c78bb4d5768:
>>
>>    Merge tag 'pull-include-2023-02-06-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 92f5d4606bedf0e2af0169a32aff9443084c5d0a:
>>
>>    target/i386: fix ADOX followed by ADCX (2023-02-09 10:17:34 +0100)
>>
>> ----------------------------------------------------------------
>> * block/iscsi: fix double-free on BUSY or similar statuses
>> * catch [accel] entry without accelerator
>> * target/i386: various fixes for BMI and ADX instructions
>> * make the contents of meson-buildoptions.sh stable
>>
>> ----------------------------------------------------------------
> 
> This seems to consistently fail on the BSD jobs:
> https://gitlab.com/qemu-project/qemu/-/jobs/3742560167
> https://gitlab.com/qemu-project/qemu/-/jobs/3742560168
> https://gitlab.com/qemu-project/qemu/-/jobs/3743330014
> https://gitlab.com/qemu-project/qemu/-/jobs/3743330018
> https://gitlab.com/qemu-project/qemu/-/jobs/3743909430
> 
> Unfortunately the logs don't seem very informative :-(

Out of curiosity, I added some debug printfs and ran the test a couple of 
more times in the CI. It's pretty weird... There are two problems in 
qtest_wait_qemu() :

1) In these FreeBSD runners, that "do { waitpid(..., WNOHANG) } while" loop 
does not finish in time, so the code sends a SIGKILL signal to the QEMU 
process. This then causes qtest_check_status() to abort() later since QEMU 
finished with a bad status. Should we handle this more gracefully so that 
the code does not abort() after the SIGKILL?

2) By increasing WAITPID_TIMEOUT to more than 75 seconds, I can make the 
test succeed. It's really weird, but it seems like the do-while loop always 
takes 75 seconds to succeed in case of the "invalid-accel" test - but I've 
got no clue where that delay could come from... Any ideas?

  Thomas


