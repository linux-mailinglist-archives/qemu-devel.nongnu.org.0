Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0715508668
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:53:37 +0200 (CEST)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7xo-0005d8-Qw
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7iq-00052W-EQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7in-0007bi-7t
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dbHto5qvr6tHGa8Lh0ZHYsOuknnSoAlltg2V8GWKrc=;
 b=JuqI6UaFofTOL+C0jskX5SxZjTO88ouUIkQciS5a4BDnb4BYBO6jCV65DvryuitMso+cgN
 Qle4BDpWQ4Wu3dZOeB1qikVsg7CFxnBHRUz46DmeVdBn1PQS5r1kfUwAcAGtwbo1jF0ZwS
 IH0AwyLodT4Ez44qtLrCwOmKTpKKlWs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-iSzvEp-pMpmEtzZCKG5sjQ-1; Wed, 20 Apr 2022 06:38:03 -0400
X-MC-Unique: iSzvEp-pMpmEtzZCKG5sjQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso271734wrp.21
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 03:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4dbHto5qvr6tHGa8Lh0ZHYsOuknnSoAlltg2V8GWKrc=;
 b=nO80QvBhHMgexPpJhOLY76gYNyRD77XjxiLFXvZKGkCOxesym2zl0q3uLcQY0jAAQz
 1k8JYzoXmLQG22zn/SxRQNBvJwO1hr6yuWwmB3l/q1isHoPfp9bRKPv6Fmy3ZnKmt7Xg
 PzRjeXaHI7/6vavIhrUgzNK1OzGh1ct2aHBdHJu++jJnnLa0RVrR4GncUeiy190PCKNx
 buk9/bFLKHSyB/UpXXAuSR5DUfMbCAPPIwg3HVNV5/nPM7PnBP/glT2Zgs+deuexod8w
 q2Z6/+jf7ahJ1lgQkTL+1BaWEkOkZFUy4UcKRUir+6mFo2jicXoTITCcHUx48b+wjDI/
 AQPQ==
X-Gm-Message-State: AOAM531r9t/VUX92MiRqoWcpda4oGnjIa7Wh5G9Qa2rvAkR/fkDAPi+5
 Oat8Xc4RSXDx8r2nu47htzTjOIYFjAB9kWPeDHgLjmwBI6ENF9Ho5b9WB9m4sxwSgWI0XStZizp
 kSHB8NcPa88GC/CM=
X-Received: by 2002:adf:e5d2:0:b0:207:9be3:c080 with SMTP id
 a18-20020adfe5d2000000b002079be3c080mr14881645wrn.519.1650451082327; 
 Wed, 20 Apr 2022 03:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSx623XTaA1kDein9C9vbWpAq/9P3kADcE92AhLV/ZtFAusfC+QigeOH1PWS4wCR8U59sQGg==
X-Received: by 2002:adf:e5d2:0:b0:207:9be3:c080 with SMTP id
 a18-20020adfe5d2000000b002079be3c080mr14881631wrn.519.1650451082111; 
 Wed, 20 Apr 2022 03:38:02 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm17630755wri.0.2022.04.20.03.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 03:38:01 -0700 (PDT)
Message-ID: <dc6b5d50-13f9-2b93-ccef-e7d10573e156@redhat.com>
Date: Wed, 20 Apr 2022 12:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tests/acceptance: Allow overwrite smp and memory
Content-Language: en-US
To: Ahmed Abouzied <admin@aabouzied.com>, qemu-devel@nongnu.org
References: <20210802222257.50946-1-email@aabouzied.com>
 <CAPm-u-to0fD_wZaScQQUencDqMYQZ0Ys5FtjJJ30b50vCtYSmw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAPm-u-to0fD_wZaScQQUencDqMYQZ0Ys5FtjJJ30b50vCtYSmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 19.30, Ahmed Abouzied wrote:
> ping
> 
> Just pinging about this little patch. Patchew link here: 
> https://patchew.org/QEMU/20210802222257.50946-1-email@aabouzied.com/ 

Sorry, seems like this completely fell through the cracks ... since nobody 
else picked this up yet, I've now put it into my current pull request, so 
that the issue should finally get resolved now.

  Thomas

> On Tue, Aug 3, 2021 at 12:24 AM Ahmed Abouzied <email@aabouzied.com 
> <mailto:email@aabouzied.com>> wrote:
> 
>     Removes the hard-coded values in setUp(). Class inheriting from
>     avocado_qemu.LinuxTest can overwrite the default smp and memory instead.
> 
>     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
>     <https://gitlab.com/qemu-project/qemu/-/issues/453>
>     Signed-off-by: Ahmed Abouzied <email@aabouzied.com
>     <mailto:email@aabouzied.com>>
>     ---
>       tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>       1 file changed, 4 insertions(+), 2 deletions(-)
> 
>     diff --git a/tests/acceptance/avocado_qemu/__init__.py
>     b/tests/acceptance/avocado_qemu/__init__.py
>     index 2c4fef3e14..2639b89c84 100644
>     --- a/tests/acceptance/avocado_qemu/__init__.py
>     +++ b/tests/acceptance/avocado_qemu/__init__.py
>     @@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>           distro = None
>           username = 'root'
>           password = 'password'
>     +    smp = '2'
>     +    memory = '1024'
> 
>           def _set_distro(self):
>               distro_name = self.params.get(
>     @@ -471,8 +473,8 @@ def _set_distro(self):
>           def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>               super(LinuxTest, self).setUp()
>               self._set_distro()
>     -        self.vm.add_args('-smp', '2')
>     -        self.vm.add_args('-m', '1024')
>     +        self.vm.add_args('-smp', self.smp)
>     +        self.vm.add_args('-m', self.memory)
>               # The following network device allows for SSH connections
>               self.vm.add_args('-netdev',
>     'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
>                                '-device', '%s,netdev=vnet' %
>     network_device_type)
>     -- 
>     2.25.1
> 


