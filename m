Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E82B7C37
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:18:41 +0100 (CET)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLTz-0008Cm-Un
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfLSP-0007la-2w
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfLSM-0002qF-Mh
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605698217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8aIfdAZHwJ88oAcjbIcvjiGHb9fshmeoF6gREOIijE=;
 b=Aoy6C5QlXD8zKVYul/1qRcOUbgHyDYl6s0f2tDSnW0MQA8tVa2unSqXE3Ix9sUUjz/iEMm
 IQjwB1lZPJ0P5Iq0Fy9ylrVfVUHZtZUIn3vXU/4bKCrBPlcr4hPOyeRJ8Bya6WpX5tH1Ba
 AzDuDZufbiUGgOuysbcOdJHWvEoKu9Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ezcH4S9GPGespIH2ZDllMQ-1; Wed, 18 Nov 2020 06:16:56 -0500
X-MC-Unique: ezcH4S9GPGespIH2ZDllMQ-1
Received: by mail-wm1-f69.google.com with SMTP id a134so715653wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 03:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s8aIfdAZHwJ88oAcjbIcvjiGHb9fshmeoF6gREOIijE=;
 b=MPB/XGZXJEdNo9F4JW8LcWR+d0sTZIPdK4T8pn4iWktfFoBvLpQpm+x/Einzwu/1LE
 NlPAGu5eG+KXq+AvfvznCXVzUkT68d29okVOz71v9XITy80w/+OKqi8qB4kkPUaooG05
 UwlE2uKssI/f31zeIAyl73+M+zf9A+p7SYyUAamalXrFxiz58egWlPyweYSFku2S/oyO
 3iA8sq9dmjHlbzLukiVCxK2wJuyGOTFKXBcnNBlo/WDpUHj75omFYPOf94SgDbk5j2d2
 yRGetYgCBlw/IkSGcON3UYc94xmxNLxXpiACqyYyleYoiHzVEsxwVDSKGraPjLnHZQWH
 LkUA==
X-Gm-Message-State: AOAM532c10Pa7nHFTwRNmc2CYodkalL4myjEcmXdto2o7NkEDXLPGqG9
 abzt053PL6/XKY/C6psDnzf2JvFvwd9PBOXsntj7/tbRyCdqsgCA0GqC1nmdzKRq91gmBBMZAga
 jgqPK940LbWMB14w=
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr4447786wrp.203.1605698214883; 
 Wed, 18 Nov 2020 03:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUH0p92Vf6I/nNQVqDVCpH5fME34cYCNY2S8SiQXMrjfujAlop0M9GkxuDEsdMrEeoYpNmug==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr4447764wrp.203.1605698214664; 
 Wed, 18 Nov 2020 03:16:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 60sm29838405wrs.69.2020.11.18.03.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 03:16:53 -0800 (PST)
Subject: Re: [PATCH for-5.2] meson: Fix build with --disable-guest-agent-msi
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20201117201834.408892-1-sw@weilnetz.de>
 <f631a213-1e8c-3ca7-5adc-5590b5897bbc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <025997f1-ac8c-d1fe-7e7b-ae7668ddc59e@redhat.com>
Date: Wed, 18 Nov 2020 12:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f631a213-1e8c-3ca7-5adc-5590b5897bbc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:30 AM, Paolo Bonzini wrote:
> On 17/11/20 21:18, Stefan Weil wrote:
>> The QGA MSI target requires several macros which are only available
>> without --disable-guest-agent-msi.
>>
>> Don't define that target if configure was called with
>> --disable-guest-agent-msi.

Can we have a CI job to avoid further regressions?

>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   qga/meson.build | 36 +++++++++++++++++++-----------------
>>   1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/qga/meson.build b/qga/meson.build
>> index 53ba6de5f8..520af6ce9b 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -61,23 +61,25 @@ if targetos == 'windows'
>>       if 'CONFIG_QGA_VSS' in config_host and 'QEMU_GA_MSI_WITH_VSS' in
>> config_host
>>         deps += qga_vss
>>       endif
>> -    qga_msi = custom_target('QGA MSI',
>> -                            input: files('installer/qemu-ga.wxs'),
>> -                            output:
>> 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
>> -                            depends: deps,
>> -                            command: [
>> -                              find_program('env'),
>> -                              'QEMU_GA_VERSION=' +
>> config_host['QEMU_GA_VERSION'],
>> -                              'QEMU_GA_MANUFACTURER=' +
>> config_host['QEMU_GA_MANUFACTURER'],
>> -                              'QEMU_GA_DISTRO=' +
>> config_host['QEMU_GA_DISTRO'],
>> -                              'BUILD_DIR=' + meson.build_root(),
>> -                              wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>> -                              config_host['QEMU_GA_MSI_ARCH'].split(),
>> -                             
>> config_host['QEMU_GA_MSI_WITH_VSS'].split(),
>> -                             
>> config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
>> -                            ])
>> -    all_qga += [qga_msi]
>> -    alias_target('msi', qga_msi)
>> +    if 'CONFIG_QGA_MSI' in config_host
>> +      qga_msi = custom_target('QGA MSI',
>> +                              input: files('installer/qemu-ga.wxs'),
>> +                              output:
>> 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
>> +                              depends: deps,
>> +                              command: [
>> +                                find_program('env'),
>> +                                'QEMU_GA_VERSION=' +
>> config_host['QEMU_GA_VERSION'],
>> +                                'QEMU_GA_MANUFACTURER=' +
>> config_host['QEMU_GA_MANUFACTURER'],
>> +                                'QEMU_GA_DISTRO=' +
>> config_host['QEMU_GA_DISTRO'],
>> +                                'BUILD_DIR=' + meson.build_root(),
>> +                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>> +                                config_host['QEMU_GA_MSI_ARCH'].split(),
>> +                               
>> config_host['QEMU_GA_MSI_WITH_VSS'].split(),
>> +                               
>> config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
>> +                              ])
>> +      all_qga += [qga_msi]
>> +      alias_target('msi', qga_msi)
>> +    endif
>>     endif
>>   else
>>     install_subdir('run', install_dir: get_option('localstatedir'))
>>
> 
> Queued, thanks.
> 
> Paolo
> 
> 


