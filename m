Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409731E816
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:46:19 +0100 (CET)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCft3-0005Uj-VE
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCfqu-0004jp-FI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCfqs-0005ox-8r
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613641440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/oUH83yvgTbTgpGRwfa+lYGHr4STadHNFna7DZctk8=;
 b=goMNbWdtQ3pZfXjfXSgHbQr6VWF/IJ6VYPac+8C9PdZO/ozewiE/DmDfccsyjwVHnxQy/E
 mxGVJOOcCBfX2SRsj6v5vKWKNYdAjifcCFTlGISA53OFGSgB4VoePMQffDKulrr3IO41pR
 xZEE6Xz9tkG4bilyOZO0pHHkzI1xoUg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-CfLaTwRdN260VV2z07WcQw-1; Thu, 18 Feb 2021 04:43:57 -0500
X-MC-Unique: CfLaTwRdN260VV2z07WcQw-1
Received: by mail-wr1-f69.google.com with SMTP id e11so732993wro.19
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:43:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/oUH83yvgTbTgpGRwfa+lYGHr4STadHNFna7DZctk8=;
 b=s2ob/Zwu8z8wpyu+rdX6tZ2emdQ3fYBvPF+daTWnDZ71vC7mSBeb5SsDAu4Xa+VsCQ
 xL046Euhw7G9Y9+/vSIWjA1Y7MBOdl4yx9vuMc/XFkrZxjgQ6oo+ndFmBZxA5COvq6FT
 tQnDNs4RlI68JBxcJDKA6SBVVDP0mFNo4NKwTCukXG4AwsLUPLogX8qmzrHjNnqKBlqv
 yN9xF5ZKdMC9JG4voVg3RjpdHmSFLKxZa6ufFkACe/i0GYIFn48mR7A15XFfYMQ9ujan
 C27VBrlPB59bXHYnoEZzkDfVNxjnaMOJMbXdwQzLpCA97LM/SpBL6bUKAHqI5uq7Bxug
 LXvA==
X-Gm-Message-State: AOAM531noWbr0kzUCdI5nxyfLExLiXZW97xvpaVcm0/fEAbyZSKZ/Cwn
 xr4eRvY8yGm0iNsVKmptIxdJt3cgakXea50yfGhltVHjrdxIEw1vWVCxOH7AFfTdOjK5A07vnNH
 uN4q96BxTme9OJA0=
X-Received: by 2002:adf:ce91:: with SMTP id r17mr3344105wrn.219.1613641436401; 
 Thu, 18 Feb 2021 01:43:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMOb3IDgaYqdEW2tkZ33eFn3YO+zdFXyxi+LRDW60vFVymK1fuZ5dq/fUeAHNxFm21ZFgR7Q==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr3344076wrn.219.1613641436195; 
 Thu, 18 Feb 2021 01:43:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e12sm7570704wrv.59.2021.02.18.01.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 01:43:55 -0800 (PST)
Subject: Re: [PATCH v2 7/7] tests/avocado: add boot_xen tests
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2948d7db-2168-7c5e-a73e-969a67496daa@redhat.com>
Date: Thu, 18 Feb 2021 10:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217204654.GA353754@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:46 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Bennée wrote:
>> These tests make sure we can boot the Xen hypervisor with a Dom0
>> kernel using the guest-loader. We currently have to use a kernel I
>> built myself because there are issues using the Debian kernel images.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  MAINTAINERS                  |   1 +
>>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 118 insertions(+)
>>  create mode 100644 tests/acceptance/boot_xen.py

>> +class BootXen(BootXenBase):
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_411_and_dom0(self):
>> +        """
>> +        :avocado: tags=arch:aarch64
>> +        :avocado: tags=accel:tcg
>> +        :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=machine:virt
>> +        """
>> +        xen_url = ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_arm64.deb')
>> +        xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
> 
> This URL is already giving 404s because of a new pacakge.  I found
> this to work (but yeah, won't probably last long):
> 
>         xen_url = ('http://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_arm64.deb')
>         xen_sha1 = 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'

This is not the same package version... Please understand the developer
has to download the Debian package sources, check again the set of
downstream changes between 37 and 57. Each distrib number might contain
multiple downstream patches. Then the testing has to be done again,
often enabling tracing or doing single-stepping in gdb. This has a
cost in productivity. This is why I insist I prefer to use archived
well tested artifacts, rather than changing package URL randomly.

>> +        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
>> +        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_414_and_dom0(self):
>> +        """
>> +        :avocado: tags=arch:aarch64
>> +        :avocado: tags=accel:tcg
>> +        :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=machine:virt
>> +        """
>> +        xen_url = ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_arm64.deb')
>> +        xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
> 
> Likewise here:
> 
>         xen_url = ('https://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.14-arm64_4.14.0+88-g1d1d1f5391-2_arm64.deb')
>         xen_sha1 = 'f316049beaadd50482644e4955c4cdd63e3a07d5'

Likewise not the same package version.

Regards,

Phil.


