Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE583B73F6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:10:36 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyERe-00008q-Kx
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEQ6-0007CZ-IR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEQ2-00051h-3z
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624975732;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyH1IAhyBMUJtdC+SieMX3R61t/3icqEuZFe69axFe4=;
 b=RPYnhUYpopXFAh43DBTtGUytD8cqQ1z/8uqg2wss3sl99efZj6ez5LhBkaLcyGD1cMLYUv
 fcwj15jIvtqKKSSClZo7gZObwBdAl5hU9+YtIdbss7KRSRddROOCDoXlez6NzTZQuKsmds
 strY8UObRBLXl9vOmHWVNXb2z5irvPw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-upIH8VyxMOuFtg6g52gtMw-1; Tue, 29 Jun 2021 10:08:47 -0400
X-MC-Unique: upIH8VyxMOuFtg6g52gtMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l9-20020a05600c1d09b02901dc060832e2so1659734wms.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kyH1IAhyBMUJtdC+SieMX3R61t/3icqEuZFe69axFe4=;
 b=m+OpjnTx3vGXQeASd/QKrI9TrGCBq4NntY2NLwvBdibb5RuU99HVOdFjL9ddoHGArf
 jw60AtyJEoO/+00beEX8Lu4qAGhFTjoz2WuvJK1iW13rFkC21ju2wVz7iKTegWwNd8K/
 elJ5u6qBmcj/vpcVTtfLXSPgkxzH7tim0MsI/T5QlL5QWpIzpAlEgqOP+6Z5R/Hunzeb
 iRX4h4rcDowQQCOZa9cA1AMNWZvNASbOoz6CUGjUQmWUehGqzr+2qqe6oW9i78Vl36QB
 ODr+sA6hhlsXZpso1XDpzxP3k6IxBz3IB0Cv96ipikGENYPzOcMvKV0r/GjNSttng4ix
 zAng==
X-Gm-Message-State: AOAM533F/n7s1zwZcv+IiRm1eSNbr00pBlTwHK2Mmi2PGBwiiSYBHt0k
 V4u4CJXyWhylxKbQG4A2GFzUhSPPL7vLYCWsZpfzTYO2YXIEQf2zRObiC/jvwIjGCtY4KRqhMBn
 pRZ7niReabx48WJM=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr33765331wmj.119.1624975725020; 
 Tue, 29 Jun 2021 07:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBl9fOB46mPeV3huP1zD3PzN+sGjWfQXW5dWiVV7pQcZB88D2ctGg4KJ9wtjestgbsaNwyQg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr33765303wmj.119.1624975724816; 
 Tue, 29 Jun 2021 07:08:44 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e15sm19447796wrm.60.2021.06.29.07.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 07:08:44 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
To: wainersm@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, peterx@redhat.com
References: <20210621080824.789274-1-eric.auger@redhat.com>
 <20210621080824.789274-2-eric.auger@redhat.com>
 <95e946f0-856b-33fe-f2b9-6aec91132893@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1bfd5883-fddb-391b-f23c-c89a71056209@redhat.com>
Date: Tue, 29 Jun 2021 16:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <95e946f0-856b-33fe-f2b9-6aec91132893@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wainer,

On 6/28/21 5:06 PM, Wainer dos Santos Moschetta wrote:
> Hi Eric,
>
> On 6/21/21 5:08 AM, Eric Auger wrote:
>> When running LinuxTests we may need to run the guest with
>> custom params. It is practical to store the pxeboot URL
>> and the default kernel params so that the
>> tests just need to fetch those and augment the kernel params.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - add fed32 and fed33 checksums
>> ---
>>   tests/acceptance/avocado_qemu/__init__.py | 52 ++++++++++++++++++++++-
>>   1 file changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>> b/tests/acceptance/avocado_qemu/__init__.py
>> index 81ac90bebb..8152420fa5 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -305,17 +305,59 @@ def ssh_command(self, command):
>>       'fedora': {
>>           '31': {
>>               'x86_64':
>> -            {'checksum':
>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
>> +            {'checksum':
>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
>> +             'pxeboot_url':
>> "https://archives.fedoraproject.org/pub/archive/fedora/"
>> +                           
>> "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
>> +             'kernel_params':
>> "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
>> +                              "no_timer_check net.ifnames=0 "
>> +                              "console=tty1 console=ttyS0,115200n8"},
>>               'aarch64':
>> -            {'checksum':
>> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>> +            {'checksum':
>> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
>> +             'pxeboot_url':
>> "https://archives.fedoraproject.org/pub/archive/fedora/"
>> +                           
>> "linux/releases/31/Everything/aarch64/os/images/pxeboot/",
>> +             'kernel_params':
>> "root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
>> +                              "earlyprintk=pl011,0x9000000
>> ignore_loglevel "
>> +                              "no_timer_check printk.time=1
>> rd_NO_PLYMOUTH "
>> +                              "console=ttyAMA0 "},
>>               'ppc64':
>>               {'checksum':
>> '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>>               's390x':
>>               {'checksum':
>> '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>>               }
>> +        ,
>> +        '32': {
>> +            'aarch64':
>> +            { 'kernel_params':
>> "root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5 ro "
>> +                              "no_timer_check net.ifnames=0
>> console=tty1 "
>> +                              "console=ttyS0,115200n8 ",
> Nit: indentation ^
sure
>> +              'checksum':
>> 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
>> +              'pxeboot_url': 
>> "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
> Maybe use dl.fedoraproject.org instead of a mirror server?
yep
>> +                              "32/Server/aarch64/os/images/pxeboot/"},
>> +            }
>> +        ,
>> +        '33': {
>> +            'aarch64':
>> +            { 'kernel_params':
>> "root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a ro "
>> +                              "no_timer_check net.ifnames=0
>> console=tty1 "
>> +                              "console=ttyS0,115200n8 console=tty0 ",
>> +              'checksum':
>> 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
>> +              'pxeboot_url': 
>> "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
> Likewise.
ok
>> +                              "33/Server/aarch64/os/images/pxeboot/"},
>> +            }
>>           }
>>       }
>>   +def get_known_distro_kernel_params(distro, distro_version, arch):
>> +    try:
>> +        return
>> KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('kernel_params')
>> +    except AttributeError:
>> +        return None
>> +
>> +def get_known_distro_pxeboot_url(distro, distro_version, arch):
>> +    try:
>> +        return
>> KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('pxeboot_url')
>> +    except AttributeError:
>> +        return None
>>     def get_known_distro_checksum(distro, distro_version, arch):
>>       try:
>> @@ -449,6 +491,12 @@ def set_up_cloudinit(self, ssh_pubkey=None):
>>           cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>>           self.vm.add_args('-drive', 'file=%s,format=raw' %
>> cloudinit_iso)
>>   +    def get_default_kernel_params(self):
>> +        return get_known_distro_kernel_params(self.distro,
>> self.distro_version, self.arch)
>> +
>> +    def get_pxeboot_url(self):
>> +        return get_known_distro_pxeboot_url(self.distro,
>> self.distro_version, self.arch)
>> +
>
> As the KNOWN_DISTROS grows, more loosely methods will be created in
> the avocado_qemu/__init__.py file.
>
> I refactored the code so that KNOWN_DISTROS and related methods are
> packaged in a class. See in:
>
> https://github.com/wainersm/qemu/tree/eauger_avocado-qemu-v3-refactor
>
> Maybe you could incorporate that in your series? Otherwise I can send
> as a follow up series. Whatever you prefer.
OK I take your patch on top of my series then.
>
> Thanks!
>
> - Wainer
>
>>       def launch_and_wait(self, set_up_ssh_connection=True):
>>           self.vm.set_console()
>>           self.vm.launch()
>


