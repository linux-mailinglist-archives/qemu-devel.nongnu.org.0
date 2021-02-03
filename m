Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E732330E20B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:10:41 +0100 (CET)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Mbw-0006hE-Vw
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MJk-0003xs-Fg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MJi-0000Eh-N6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMBF1hLs70iUL2gd7WBzO9t/dhs+KV55I0fekI8WbdE=;
 b=BnmmYvwFUM80hj4Vt2isSNW5fTlIeFacoBoiREB33MsyeUpt5sKm3MVcE5GXMxALpnEO94
 yMr4iEDtAnpx/OgvGpbpY11gZRNb9NiSbG6D+q/FVCHhhH+jvKaWspcuN6FMA7+ZjYBrdP
 K+TbQmIwddEUmdoEq1TcUXDxDGF9y7c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-IqljWbjwMwWkaz_fZ24o8Q-1; Wed, 03 Feb 2021 12:51:46 -0500
X-MC-Unique: IqljWbjwMwWkaz_fZ24o8Q-1
Received: by mail-ej1-f71.google.com with SMTP id d15so158372ejc.21
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PMBF1hLs70iUL2gd7WBzO9t/dhs+KV55I0fekI8WbdE=;
 b=M1EkmdVmsBy75YP2V7BfzeB93YlxzzSbtSD9PEvzXXTLBifzWANXFD8JJzEN8bFAWp
 HKjKYmI9foey+rxYCp0onyfH+0ltraowHhekm0uSATDCSyYqfpPcTl50krU6hHIUKOw5
 pG7W4X9jc3u6R1V+JwJS7zq6St43XqJPj7Q327HEYclUwq/gaQvLO+W6ESIoqst2P74d
 9SUYyW7xF0oHKjYZF18o4jTveB1fdRu0x4yjLDtUsoR78TJm1coqRpIRxyLeHeD4MkDx
 1pYy4EcAmKu9i/nYZ1TrodO6FJM3PUDBafGmJ0u4rp/tlwvfvA6G34hiTD+96WzO7pI6
 6Eow==
X-Gm-Message-State: AOAM531DwssGHG0VoRIcbiI4v7K+OoypZ1lixcZKDFEOnmbavLXNnIzQ
 FEcVIHnAJSCQ6FOQrqMl/Cd0and8TwWcnTjuhkf0mOsaUr4VwyVzLxBR0ZBWcCpyT4xGmptVqdL
 P0bjDRjyP9WIua2g=
X-Received: by 2002:a05:6402:19bd:: with SMTP id
 o29mr2689388edz.161.1612374705333; 
 Wed, 03 Feb 2021 09:51:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEfboC2TfJTeEPhc32avkmGVjn51KPuhpP8A27tRIA1rLkc7fZSy75SmqBkCNof5b8lfn86w==
X-Received: by 2002:a05:6402:19bd:: with SMTP id
 o29mr2689366edz.161.1612374705157; 
 Wed, 03 Feb 2021 09:51:45 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id i6sm1256555ejd.110.2021.02.03.09.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:51:44 -0800 (PST)
Subject: Re: [PATCH 19/22] Acceptance Tests: add port redirection for ssh by
 default
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-20-crosa@redhat.com>
 <e0f187b2-8cc2-f187-a44c-e9448cbe5fc2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2acf7e3a-0fc3-fe63-5af2-c49e5053fbe5@redhat.com>
Date: Wed, 3 Feb 2021 18:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e0f187b2-8cc2-f187-a44c-e9448cbe5fc2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:46 PM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 6:23 PM, Cleber Rosa wrote:
>> For users of the LinuxTest class, let's set up the VM with the port
>> redirection for SSH, instead of requiring each test to set the same
>> arguments.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  tests/acceptance/avocado_qemu/__init__.py | 2 ++
>>  tests/acceptance/virtiofs_submounts.py    | 4 ----
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>> index 5f4dd6b9ec..89669cc604 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -301,6 +301,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>>          super(LinuxTest, self).setUp()
>>          self.vm.add_args('-smp', '2')
>>          self.vm.add_args('-m', '1024')
>> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
>> +                         '-device', 'virtio-net,netdev=vnet')
> 
> You need a machine with a virtio-bus to be able to plug a virtio device,
> not all provide one.

Alternatively you could provide a network_device_type argument to
setUp() which has to be explicitly set (since the tests would be
pointless without network access).


