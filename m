Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9201F508DF6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:06:09 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDmK-0003Cw-EF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhDJf-0001qe-Q5
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:36:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhDJd-0002QI-PK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:36:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id x18so3073128wrc.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eUMeammwPdTl5dAUABUwUN3NNnIe0wOvp1tqtqN68OA=;
 b=WS1mNSXEDqZi2GysAqjEJAKYWKF89vwmJknReaMQy5oAfBpHyl4WeTu1+EqdXKSsZF
 YKU0+5ZhKx7XskuiZ0hvNeXy/s7eOIoBugwATLOGeqwR3XPikBpqAty4TeQxHzC3O6Zd
 hJcwZCCdTpG5IB1vNAGZ+874k+fNDQeXO6WU4ryBWPg4EzzX4kY97lUmr9iXl9GeyPk9
 NO1DlWbzlSkK7gb9E+WScE5GOcCsTg7/9zJ2Fks7GvTNgLVkeUNJF+rQm3WZaR2AzJd7
 vGO9dymBq4uq+G8FQb2z4JwoSa4jALA7E9oZJKAYFzxqRHyf2u3Win9sQN7Y50JwJIp+
 2Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eUMeammwPdTl5dAUABUwUN3NNnIe0wOvp1tqtqN68OA=;
 b=Oi92TrZ8ecdpGHnbJs4qZcruhZLaIjek0Aw54hdPNxjbfWAnA5NSFiFpY3pzIgK19i
 FZTJauIkY2L8C/jteuGJAogr7DjynxNDSwn+GQIfavcHbfNmJWK+QydOSo4sscJqn9Qd
 lZ4CyRzS78qAX1nIM+d/BmWyGk0L5A1U/wLkBkDC63DV2AptbDO2Zh7nBW239hjSYjeb
 kPB0EkFp8FMl47idECOmmk2bizqBgTxYH1wGlv6sskVX1x66/aZGH42xW5ClFDcPu/Rk
 WpHTyIAHmr/WJTeoYe3Npxql7N0mvUEPI2BNT52fyQo+1owApV/F0zd9FhK1SQZN0hsx
 sOSA==
X-Gm-Message-State: AOAM533tRh+yAY3IYkfPvSJCro7rqNYpeyFie5ZOwkLaV2fnZcLlpUVS
 SO7SewtRfmdrwc+6GsfjUOo=
X-Google-Smtp-Source: ABdhPJy7wUGx3IUkKwrA8Vd3Tc032p+p8tW12pmTS1+d4HnZ+98rOlZMqcH/SQyeApvipO/t7jHJhw==
X-Received: by 2002:adf:dc41:0:b0:205:8df5:464c with SMTP id
 m1-20020adfdc41000000b002058df5464cmr15631087wrj.445.1650472587843; 
 Wed, 20 Apr 2022 09:36:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm305482wmn.2.2022.04.20.09.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 09:36:27 -0700 (PDT)
Message-ID: <a6bf4a6b-9e48-78e0-7bb4-8d9e7d317519@redhat.com>
Date: Wed, 20 Apr 2022 18:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 08/41] build-sys: simplify MSI's QEMU_GA_MANUFACTURER
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-9-marcandre.lureau@redhat.com>
 <CAPMcbCrg9fqKcCPPCdWQc+oSgUKbZP2mZGqnefaY4RoGDFj3rw@mail.gmail.com>
 <YmAjUU9iGryBp90p@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmAjUU9iGryBp90p@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 17:14, Daniel P. Berrangé wrote:
> On Wed, Apr 20, 2022 at 04:48:54PM +0300, Konstantin Kostiuk wrote:
>> Hi Marc-André and Yan,
>>
>> Currently, we use this for the mingw-qemu-ga-win package in CentOS Stream 9
>> and RHEL.
>> https://gitlab.com/redhat/centos-stream/rpms/mingw-qemu-ga-win/-/blob/c9s/build_configure.sh
>>
>> Yan, do we need this feature or not?
> 
> IMHO the downstream customization makes sense, similar to how
> with RPMs we set Red Hat as the vendor.
> 
> We neeed  proper meson_options.txt entries and configure --with-qga-...=....
> options

Let's keep this one for a while more, I am going to add string option 
parsing to parse-buildoptions.py which simplifies things a bit.

Paolo

>> On Wed, Apr 20, 2022 at 4:27 PM <marcandre.lureau@redhat.com> wrote:
>>
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> If there is any reason to allow customization of this variable, we
>>> should provide a proper configure option.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>   configure                 |  4 ----
>>>   qga/installer/qemu-ga.wxs | 10 ++++------
>>>   qga/meson.build           |  1 -
>>>   3 files changed, 4 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/configure b/configure
>>> index 8cbe55ac82e8..5ac653b21351 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -2694,9 +2694,6 @@ fi
>>>
>>>   # Guest agent Windows MSI package
>>>
>>> -if test "$QEMU_GA_MANUFACTURER" = ""; then
>>> -  QEMU_GA_MANUFACTURER=QEMU
>>> -fi
>>>   if test "$QEMU_GA_DISTRO" = ""; then
>>>     QEMU_GA_DISTRO=Linux
>>>   fi
>>> @@ -2790,7 +2787,6 @@ if test "$debug_tcg" = "yes" ; then
>>>   fi
>>>   if test "$mingw32" = "yes" ; then
>>>     echo "CONFIG_WIN32=y" >> $config_host_mak
>>> -  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
>>>     echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
>>>     echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
>>>   else
>>> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
>>> index 0950e8c6becc..53d836c06a96 100644
>>> --- a/qga/installer/qemu-ga.wxs
>>> +++ b/qga/installer/qemu-ga.wxs
>>> @@ -8,9 +8,7 @@
>>>       <?error Environment variable QEMU_GA_DISTRO undefined?>
>>>     <?endif?>
>>>
>>> -  <?ifndef env.QEMU_GA_MANUFACTURER ?>
>>> -    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
>>> -  <?endif?>
>>> +  <?define QEMU_GA_MANUFACTURER = "QEMU" ?>
>>>
>>>     <?ifndef var.Arch?>
>>>       <?error Define Arch to 32 or 64?>
>>> @@ -43,14 +41,14 @@
>>>       Name="QEMU guest agent"
>>>       Id="*"
>>>       UpgradeCode="{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
>>> -    Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
>>> +    Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
>>>       Version="$(env.QEMU_GA_VERSION)"
>>>       Language="1033">
>>>       <?if $(var.Arch) = 32 ?>
>>>       <Condition Message="Error: 32-bit version of Qemu GA can not be
>>> installed on 64-bit Windows.">NOT VersionNT64</Condition>
>>>       <?endif?>
>>>       <Package
>>> -      Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
>>> +      Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
>>>         InstallerVersion="200"
>>>         Languages="1033"
>>>         Compressed="yes"
>>> @@ -133,7 +131,7 @@
>>>             </Component>
>>>             <Component Id="registry_entries"
>>> Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
>>>               <RegistryKey Root="HKLM"
>>> -
>>>   Key="Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
>>> +
>>>   Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
>>>                 <RegistryValue Type="string" Name="ProductID"
>>> Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>>>                 <RegistryValue Type="string" Name="Version"
>>> Value="$(env.QEMU_GA_VERSION)" />
>>>               </RegistryKey>
>>> diff --git a/qga/meson.build b/qga/meson.build
>>> index da5e5efb19e8..6e57de430d29 100644
>>> --- a/qga/meson.build
>>> +++ b/qga/meson.build
>>> @@ -123,7 +123,6 @@ if targetos == 'windows'
>>>                               command: [
>>>                                 find_program('env'),
>>>                                 'QEMU_GA_VERSION=' +
>>> config_host['QEMU_GA_VERSION'],
>>> -                              'QEMU_GA_MANUFACTURER=' +
>>> config_host['QEMU_GA_MANUFACTURER'],
>>>                                 'QEMU_GA_DISTRO=' +
>>> config_host['QEMU_GA_DISTRO'],
>>>                                 'BUILD_DIR=' + meson.build_root(),
>>>                                 wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>>> --
>>> 2.35.1.693.g805e0a68082a
>>>
>>>
> 
> With regards,
> Daniel


