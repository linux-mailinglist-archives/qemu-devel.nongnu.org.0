Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FEB623770
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 00:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osuTI-0003ug-Gy; Wed, 09 Nov 2022 18:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osuTG-0003uW-Se
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:27:02 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osuTE-0006mJ-QF
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:27:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so2290013wmb.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 15:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KBCJrIVNe0zrXCJU5HeQVKKOM1/hllZzpvia9aCOSa8=;
 b=JhcLK/D3GiJjtLUyiOLKCsWIPXkq5VUgw0ew9AMD+GMHxhkijjPCD21CY/LrMcEuWL
 Pf29Y1AI5pOyAEu8Td2e7SCbBWOcaM/Cl0KTO06mZMmT3W8e79q7GuFkh0RcI/z5kO/r
 nBDdtNqt4VFh5LdxdYOzOdELq9j+kiZfNJ+uM3tAZ+Hcul/EMw3vcSV7m855zNDgsDBm
 /2xfGXp96SxaGXEMuZ2VORBrOxaPfQtsxq9tm/g/fow5S6rgQ1Zun+POMWs9+XbWg2fl
 WLC2ukX00YXfKqgfKiRgvUBQlJYOdrugjHT8a9Wkk5eWcIuPQnpz6X9CDE0PsVc97Ssf
 o3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KBCJrIVNe0zrXCJU5HeQVKKOM1/hllZzpvia9aCOSa8=;
 b=0sub5KzK2i+cxf3Rd2Hb9JAA2V4ZMivhftzNav6sj/qWVY0FMf4BBYJqsZCCsf+8q3
 osZKesuHYG/uo//KdvX9y8MRf3tvyp4W1PrtF5eDZCaaIm30xfCRbh6dWkEHKTAfjW65
 c18EE4MYKZnbEXAmeKbQUn3N1JxCsTYg310xOHcnuBmfFVaUHNVTvhvRGPVZ8GwncT44
 CTwsI5FqPEXORZfgRW1Uls79CP4xeekhVtffIFrJTHiGcEC8QtSIZQ2kMsfpFOeCefrG
 4eaZHPWb/sIw2NDEhxVdvQFBNrAP4LPv/GBAMncxefKge39gcgoYRjIU3VC6w0pMq/0L
 nJxw==
X-Gm-Message-State: ACrzQf1QKttKaRxNJt+dsV3+lVWAorZVWcP3ucWin6y/30fBTIDcLyk/
 AL/UPnVJojIFd8ZkXsOyUkXYHg==
X-Google-Smtp-Source: AMsMyM4F7fp+9Kp1gX/tcDK6Kv/WULDtdxp9W92q6cye9JDcUEj55N4tSmsvUKfat9ljxLWpRjTvdw==
X-Received: by 2002:a7b:cd91:0:b0:3cf:47e7:c8bd with SMTP id
 y17-20020a7bcd91000000b003cf47e7c8bdmr52880191wmj.139.1668036418542; 
 Wed, 09 Nov 2022 15:26:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adff191000000b00236488f62d6sm14047359wro.79.2022.11.09.15.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 15:26:58 -0800 (PST)
Message-ID: <2964d2a7-7fa4-3d2a-e101-28cd788c14dd@linaro.org>
Date: Thu, 10 Nov 2022 00:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jan Richter <jarichte@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
 <Y1pI2Tg9VTNwrrEE@redhat.com>
 <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/11/22 16:39, Daniel Henrique Barboza wrote:
> On 10/27/22 06:01, Daniel P. Berrangé wrote:
>> On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
>>> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
>>>> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza 
>>>> wrote:
>>>>> 'make check-avocado' will download any images that aren't present 
>>>>> in the
>>>>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>>>>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>>>>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>>>>> download the image for each arch. Note that this command does not
>>>>> support any argument to set the hash algorithm used and, based on the
>>>>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>>>>> sha1 hash is stored in a 
>>>>> Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>>>>> in the cache.
>>>>
>>>>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>>>>> immediately spares us at least one extra download for each Fedora 31
>>>>> image that we're doing in all our CI runs.
>>>>>
>>>>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>>>>> [2] https://github.com/avocado-framework/avocado/issues/5496
>>>>
>>>> Can we just ask Avocado maintainers to fix this problem on their
>>>> side to allow use of a modern hash alg as a priority item. We've
>>>> already had this problem in QEMU for over a year AFAICT, so doesn't
>>>> seem like we need to urgently do a workaround on QEMU side, so we
>>>> can get Avocado devs to commit to fixing it in the next month.
>>>
>>> Do we have such a commitment? ... The avocado version in QEMU is 
>>> completely
>>> backlevel these days, it's still using version 88.1 from May 2021, i.e.
>>> there hasn't been any update since more than a year. I recently tried to
>>> bump it to a newer version on my own (since I'm still suffering from the
>>> problem that find_free_port() does not work if you don't have a local 
>>> IPv6
>>> address), but it's not that straight forward since the recent 
>>> versions of
>>> avocado changed a lot of things (e.g. the new nrunner - do we want to 
>>> run
>>> tests in parallel? If so it breaks a lot of the timeout settings, I 
>>> think),
>>> so an update needs a lot of careful testing...
>>
>> That it is so difficult to update Avocado after barely more than
>> 1 year is not exactly a strong vote of confidence in our continued
>> use of Avocado long term :-(
> 
> 
> By the way, Avocado just provided a fix for the problem this patch is 
> trying
> to amend:
> 
> https://github.com/avocado-framework/avocado/pull/5515#issuecomment-1308872846

Thanks Jan!

> Is there an easy way to plug upstream Avocado into QEMU? I would like to 
> test
> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg to see if 
> the problem
> is fixed by Avocado upstream.

See 
https://lore.kernel.org/qemu-devel/20200403172919.24621-9-philmd@redhat.com/

For your case:

-- >8 --
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..e17bc3972c 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -4,3 +4,3 @@
  # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+-e 
git+https://github.com/avocado-framework/avocado.git@b31b868c882d4650d3b7d2fbfc9b8ac0f2c3672b#egg=avocado-framework
  pycdlib==1.11.0
---

Regards,

Phil.

