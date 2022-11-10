Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D26245D9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 16:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot9Sl-000862-B5; Thu, 10 Nov 2022 10:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1ot91G-0001dK-1K
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:59:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1ot91D-0007QO-ER
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668092341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj+Vp3DXDI2NTv/8AOgOi0B4q+8k3mvgj2SZh2wllJw=;
 b=i9Guqgbz0okheNuqt/8QPFKeJ1TWzRjDdHtotXxsc7M1ozzEwcEDFTOsCIqc2Ckg9C1IAH
 rFNPDV+krXWZsW2PUZAWbcKox49N08mjHouwauBLGSDkyMeqXBIGq3XJD1RO8QbKaeOJBV
 oP4uOVC3vPsC1KJ8WlOk2iFMxj8GZEg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-Cen-aZKzNz2fD_DwJ3dGXQ-1; Thu, 10 Nov 2022 09:57:15 -0500
X-MC-Unique: Cen-aZKzNz2fD_DwJ3dGXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 e15-20020a056402190f00b00461b0576620so1693839edz.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hj+Vp3DXDI2NTv/8AOgOi0B4q+8k3mvgj2SZh2wllJw=;
 b=b63IHMuC67P9etU73bWD+ybh8etNREXKRpnu55pl40WvG/qO49cDN0GwKvY+rPDxT8
 8MdkD9yYDV3th/tXwVZKd0VOmpqka6vQJz2OUZl496q/JxToLBKMRUjpSpKjoVkdrT1b
 gOOrKzjkGtdK7+DxSgbKeL2Vc02ykrvMbD1yADcORviSc5GUEocrQNfQiBAAXbPXUFbD
 V8D9bPuw7V4J9x6KqtOY1VRn7dhftw2sxb/PYiOmEvZKKgXpOlKnFNahwsRP2SbZXZof
 agAZKIXqQl/Rv4POQTleVXKs/+AT/qIyypQ/pRyPuuh1PBWuHNJpQnrVha51wFxEt40j
 fkuA==
X-Gm-Message-State: ACrzQf3SWAfa06ZeLAzn2sY7hDFynESCR/t7Dh6ZX0Z/0pwKc2mrFM49
 bXNs/pZEFs47Mr1bC4KrxlF3DJa7VstU1scbgCsqmrqIJYUSGe6lhqLCAtqrcKqkyKw2DfRywZb
 pc8iCpGoGEbdoLZ4=
X-Received: by 2002:a17:906:2289:b0:7a0:3125:f1e5 with SMTP id
 p9-20020a170906228900b007a03125f1e5mr2827572eja.314.1668092233760; 
 Thu, 10 Nov 2022 06:57:13 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6/vmX97ZUf3iQwCgKXLeg+3Lnw9QiEakCmeGV32CiNFLWO+gNMBgQhrA1vqtiIn4LvY+eE5Q==
X-Received: by 2002:a17:906:2289:b0:7a0:3125:f1e5 with SMTP id
 p9-20020a170906228900b007a03125f1e5mr2827563eja.314.1668092233541; 
 Thu, 10 Nov 2022 06:57:13 -0800 (PST)
Received: from [192.168.13.102] ([212.24.158.62])
 by smtp.gmail.com with ESMTPSA id
 et10-20020a056402378a00b0045c47b2a800sm8463073edb.67.2022.11.10.06.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 06:57:13 -0800 (PST)
Message-ID: <f80d495b-43bf-af54-8fc0-2e6d11ec4330@redhat.com>
Date: Thu, 10 Nov 2022 15:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
 <Y1pI2Tg9VTNwrrEE@redhat.com>
 <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
 <2964d2a7-7fa4-3d2a-e101-28cd788c14dd@linaro.org>
From: Jan Richter <jarichte@redhat.com>
In-Reply-To: <2964d2a7-7fa4-3d2a-e101-28cd788c14dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jarichte@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Nov 2022 10:27:29 -0500
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



On 11/10/22 00:26, Philippe Mathieu-Daudé wrote:
> On 9/11/22 16:39, Daniel Henrique Barboza wrote:
>> On 10/27/22 06:01, Daniel P. Berrangé wrote:
>>> On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
>>>> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
>>>>> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza 
>>>>> wrote:
>>>>>> 'make check-avocado' will download any images that aren't present 
>>>>>> in the
>>>>>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>>>>>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>>>>>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>>>>>> download the image for each arch. Note that this command does not
>>>>>> support any argument to set the hash algorithm used and, based on the
>>>>>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>>>>>> sha1 hash is stored in a 
>>>>>> Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>>>>>> in the cache.
>>>>>
>>>>>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>>>>>> immediately spares us at least one extra download for each Fedora 31
>>>>>> image that we're doing in all our CI runs.
>>>>>>
>>>>>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>>>>>> [2] https://github.com/avocado-framework/avocado/issues/5496
>>>>>
>>>>> Can we just ask Avocado maintainers to fix this problem on their
>>>>> side to allow use of a modern hash alg as a priority item. We've
>>>>> already had this problem in QEMU for over a year AFAICT, so doesn't
>>>>> seem like we need to urgently do a workaround on QEMU side, so we
>>>>> can get Avocado devs to commit to fixing it in the next month.
>>>>
>>>> Do we have such a commitment? ... The avocado version in QEMU is 
>>>> completely
>>>> backlevel these days, it's still using version 88.1 from May 2021, i.e.
>>>> there hasn't been any update since more than a year. I recently 
>>>> tried to
>>>> bump it to a newer version on my own (since I'm still suffering from 
>>>> the
>>>> problem that find_free_port() does not work if you don't have a 
>>>> local IPv6
>>>> address), but it's not that straight forward since the recent 
>>>> versions of
>>>> avocado changed a lot of things (e.g. the new nrunner - do we want 
>>>> to run
>>>> tests in parallel? If so it breaks a lot of the timeout settings, I 
>>>> think),
>>>> so an update needs a lot of careful testing...

Hi Daniel,

if the problem of migrating avocado to latest version on qemu is only in 
parallel run, I would suggest to disable it with 
`nrunner.max_parallel_tasks` [1]. Even that the differences between 
avocado legacy runner and nrunner is huge, the migration should be 
straight forward. So if you have more issues with migration to the 
nrunner, I would be happy to help you with that.

[1] 
https://avocado-framework.readthedocs.io/en/latest/config/index.html#nrunner-max-parallel-tasks

- Jan

>>>
>>> That it is so difficult to update Avocado after barely more than
>>> 1 year is not exactly a strong vote of confidence in our continued
>>> use of Avocado long term :-(
>>
>>
>> By the way, Avocado just provided a fix for the problem this patch is 
>> trying
>> to amend:
>>
>> https://github.com/avocado-framework/avocado/pull/5515#issuecomment-1308872846
> 
> Thanks Jan!
> 
>> Is there an easy way to plug upstream Avocado into QEMU? I would like 
>> to test
>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg to see if 
>> the problem
>> is fixed by Avocado upstream.
> 
> See 
> https://lore.kernel.org/qemu-devel/20200403172919.24621-9-philmd@redhat.com/
> 
> For your case:
> 
> -- >8 --
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..e17bc3972c 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -4,3 +4,3 @@
>   # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework==88.1
> +-e 
> git+https://github.com/avocado-framework/avocado.git@b31b868c882d4650d3b7d2fbfc9b8ac0f2c3672b#egg=avocado-framework
>   pycdlib==1.11.0
> ---
> 
> Regards,
> 
> Phil.
> 


