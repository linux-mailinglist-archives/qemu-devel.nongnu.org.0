Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C491628DD4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijM-0003J9-5k; Mon, 14 Nov 2022 18:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1ouif2-0004Q9-93
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1oubt6-0003SR-50
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668441641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLouI4uTxxj4oU9eIP5c4NJ9ADGeoXRTvDj7XyKI83g=;
 b=U0IqXAQ9s+CB58lf8i2Ux6fn92CiX7f+FgWfYzW6qss0zOTHpwmKzi2uo+Pyj2ur4hDAog
 74k7ZksjlY2VLO1/iscAMPNzJPOyN9HkOisr+y3QGlkPD/2eX/117W/RK9IU8wKEFfG55Y
 BARwkoJh28Wj9iRo1EKkTQEfWXXU63E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-DG1KDDSHMBeaMlHnx52fMw-1; Mon, 14 Nov 2022 11:00:39 -0500
X-MC-Unique: DG1KDDSHMBeaMlHnx52fMw-1
Received: by mail-qv1-f70.google.com with SMTP id
 e13-20020ad450cd000000b004bb49d98da4so8619763qvq.9
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLouI4uTxxj4oU9eIP5c4NJ9ADGeoXRTvDj7XyKI83g=;
 b=iGCdInWQRM81ml7Vbblp/pOIydXlJtVsvSOElTKScFUVakEFCiLd6qV51d2HGxRSHI
 N1W61p6Q3cscGhkSTN4dGm7Qy4v2/Dp1VlXb99OnB7Bci+VQDHAUT+5+GjGYpFT9lYhD
 CXr0QU9Cr68Ksx4naDN8tjRe3Shx3FLx1KW6OotgmnPTEAkPPa22DaCWJULw2dycCyBq
 h9H5N38usiOYl8/x3oa7N+hIeOHGGuUmmg8eDi4UY1Wj2/zWfuY8TlED/IU4tGpd50M6
 DmTzGpo0+7bbgEmu/I2LTSnomKqh6RIO1D9pKorH7U7gWzG2csW/B4lCqgAytN901x72
 lT9A==
X-Gm-Message-State: ANoB5pk3kKCOaT5IYkxbs2uk+hLS94Oi6a828twf9ZTnrvDBRWxY5Kjk
 lUo+xZLi8Lnjvl5WGLfxW5pBXHpXu0xdHYiGgeTudFS/yqoJcZOqGUBjRY/seupTnFbp1ZmfTuD
 BXPfMGHwm7sPKmCc=
X-Received: by 2002:a05:6214:598d:b0:4b1:97a2:405b with SMTP id
 ll13-20020a056214598d00b004b197a2405bmr13212258qvb.27.1668441638373; 
 Mon, 14 Nov 2022 08:00:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HqTNNJzopx5d3c9k49wZwHEEi39hfUhY3vaLz3ReYRFMy+O5ogk1QeuNMmmcGOgWAN68nOw==
X-Received: by 2002:a05:6214:598d:b0:4b1:97a2:405b with SMTP id
 ll13-20020a056214598d00b004b197a2405bmr13212208qvb.27.1668441638002; 
 Mon, 14 Nov 2022 08:00:38 -0800 (PST)
Received: from [192.168.13.102] ([212.24.158.62])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a37b103000000b006fb9bbb071fsm20051qkf.29.2022.11.14.08.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 08:00:37 -0800 (PST)
Message-ID: <57d53545-f4d0-87f8-4e31-d44760b34583@redhat.com>
Date: Mon, 14 Nov 2022 17:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
 <Y1pI2Tg9VTNwrrEE@redhat.com>
 <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
 <2964d2a7-7fa4-3d2a-e101-28cd788c14dd@linaro.org>
 <f80d495b-43bf-af54-8fc0-2e6d11ec4330@redhat.com>
 <d3cb269a-183c-4e74-587f-93ad9ee41f44@gmail.com>
From: Jan Richter <jarichte@redhat.com>
In-Reply-To: <d3cb269a-183c-4e74-587f-93ad9ee41f44@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jarichte@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



On 11/10/22 20:29, Daniel Henrique Barboza wrote:
> 
> 
> On 11/10/22 11:57, Jan Richter wrote:
>>
>>
>> On 11/10/22 00:26, Philippe Mathieu-Daudé wrote:
>>> On 9/11/22 16:39, Daniel Henrique Barboza wrote:
>>>> On 10/27/22 06:01, Daniel P. Berrangé wrote:
>>>>> On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
>>>>>> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
>>>>>>> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza 
>>>>>>> wrote:
>>>>>>>> 'make check-avocado' will download any images that aren't 
>>>>>>>> present in the
>>>>>>>> cache via 'get-vm-images' in tests/Makefile.include. The target 
>>>>>>>> that
>>>>>>>> downloads fedora 31 images, get-vm-image-fedora-31, will use 
>>>>>>>> 'avocado
>>>>>>>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>>>>>>>> download the image for each arch. Note that this command does not
>>>>>>>> support any argument to set the hash algorithm used and, based 
>>>>>>>> on the
>>>>>>>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to 
>>>>>>>> "sha1". The
>>>>>>>> sha1 hash is stored in a 
>>>>>>>> Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>>>>>>>> in the cache.
>>>>>>>
>>>>>>>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This 
>>>>>>>> will
>>>>>>>> immediately spares us at least one extra download for each 
>>>>>>>> Fedora 31
>>>>>>>> image that we're doing in all our CI runs.
>>>>>>>>
>>>>>>>> [1] https://github.com/avocado-framework/avocado.git @ 
>>>>>>>> 942a5d6972906
>>>>>>>> [2] https://github.com/avocado-framework/avocado/issues/5496
>>>>>>>
>>>>>>> Can we just ask Avocado maintainers to fix this problem on their
>>>>>>> side to allow use of a modern hash alg as a priority item. We've
>>>>>>> already had this problem in QEMU for over a year AFAICT, so doesn't
>>>>>>> seem like we need to urgently do a workaround on QEMU side, so we
>>>>>>> can get Avocado devs to commit to fixing it in the next month.
>>>>>>
>>>>>> Do we have such a commitment? ... The avocado version in QEMU is 
>>>>>> completely
>>>>>> backlevel these days, it's still using version 88.1 from May 2021, 
>>>>>> i.e.
>>>>>> there hasn't been any update since more than a year. I recently 
>>>>>> tried to
>>>>>> bump it to a newer version on my own (since I'm still suffering 
>>>>>> from the
>>>>>> problem that find_free_port() does not work if you don't have a 
>>>>>> local IPv6
>>>>>> address), but it's not that straight forward since the recent 
>>>>>> versions of
>>>>>> avocado changed a lot of things (e.g. the new nrunner - do we want 
>>>>>> to run
>>>>>> tests in parallel? If so it breaks a lot of the timeout settings, 
>>>>>> I think),
>>>>>> so an update needs a lot of careful testing...
>>
>> Hi Daniel,
>>
>> if the problem of migrating avocado to latest version on qemu is only 
>> in parallel run, I would suggest to disable it with 
>> `nrunner.max_parallel_tasks` [1]. Even that the differences between 
>> avocado legacy runner and nrunner is huge, the migration should be 
>> straight forward. So if you have more issues with migration to the 
>> nrunner, I would be happy to help you with that.
>>
>> [1] 
>> https://avocado-framework.readthedocs.io/en/latest/config/index.html#nrunner-max-parallel-tasks
> 
> 
> Thanks Jan and Phil for the infos. I didn't manage to do a successful
> Avocado run with the QEMU test though.
> 
> What I did, aside from the changes that Phil mentioned in
> tests/requirements.txt:
> 
> - created a /etc/avocado/avocado.conf to store the settings
> - copied python/avocado.cfg from QEMU to avocado.conf
> - added the following in avocado.conf:
> 
> [nrunner]
> max_parallel_tasks  = 1
> 
> 
> This allowed me to set Avocado as it would be if running with QEMU
> avocado, but even then I had no success. The test get stuck indefinitely
> at this point:
> 
> (...)
> 2022-11-10 16:00:20,758 avocado.test INFO | Temporary dir: 
> /var/tmp/avocado_tmp_znhvpbh0/avocado_job_ywyf7v30
> 2022-11-10 16:00:20,758 avocado.test INFO |
> 2022-11-10 16:00:20,758 avocado.test INFO | Job ID: 
> 4bb3e2a12c05d84a0a06849ecef435d547a198a0
> 2022-11-10 16:00:20,758 avocado.test INFO |
> 2022-11-10 16:00:21,041 avocado.core.task.statemachine DEBUG| <Worker 
> spawner="<avocado.plugins.spawners.process.ProcessSpawner object at 
> 0x7fdad5da5840>" max_triaging=12 max_running=1 task_timeout=None> has 
> been initialized
> 2022-11-10 16:00:21,041 avocado.core.task.statemachine DEBUG| Task 
> "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": 
> requested -> triaging
> 2022-11-10 16:00:21,042 avocado.core.task.statemachine DEBUG| Task 
> "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": 
> requirements OK (will proceed to check dependencies)
> 2022-11-10 16:00:21,042 avocado.core.task.statemachine DEBUG| Task 
> "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": about 
> to be spawned with "<avocado.plugins.spawners.process.ProcessSpawner 
> object at 0x7fdad5da5840>"
> 2022-11-10 16:00:21,043 avocado.core.task.statemachine DEBUG| Task 
> "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": spawned 
> successfully
> 
> No error is provided. Tried to run the test for 10+ minutes and nothing
> happens. Hitting CTRL+C aborts the test:
> 
> $ make check-avocado 
> AVOCADO_TESTS='tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg'
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
> tests/fp/berkeley-softfloat-3 dtc
>    AVOCADO Downloading avocado tests VM image for ppc64le
> The image was downloaded:
> Provider Version Architecture File
> fedora   31      ppc64le      
> /home/danielhb/avocado/data/cache/by_location/d73d707673a941f5892e4bb0fa7fabaf0d41fd58/Fedora-Cloud-Base-31-1.9.ppc64le.qcow2
>    AVOCADO tests/avocado
> JOB ID     : 4bb3e2a12c05d84a0a06849ecef435d547a198a0
> JOB LOG    : 
> /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a/job.log
> ^C
> RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | 
> CANCEL 0
> JOB HTML   : 
> /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a/results.html
> JOB TIME   : 396.78 s
> make: *** [/home/danielhb/kvm-project/qemu/tests/Makefile.include:142: 
> check-avocado] Error 8
> 
> And the log registers the following:
> 
> 2022-11-10 16:00:21,043 avocado.core.task.statemachine DEBUG| Task 
> "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": spawned 
> successfully
> 2022-11-10 16:06:54,071 avocado.test INFO |
> 2022-11-10 16:06:54,123 avocado.test INFO | Test results available in 
> /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a
> 2022-11-10 16:06:55,694 avocado.sysinfo DEBUG| Not logging 
> /proc/slabinfo (lack of permissions)
> 2022-11-10 16:06:55,696 avocado.sysinfo DEBUG| Not logging /proc/pci 
> (file not found)
> 2022-11-10 16:06:55,712 avocado.sysinfo DEBUG| Not logging 
> /sys/kernel/debug/sched_features (file not found)
> [---end of log---]
> 
> 
> I'm probably missing more settings.

Hi Daniel,

I discussed this problem on Avocado meeting today and I got information 
that Cleber Rosa is working on a patch for qemu to update scripts to 
Avocado 99.0 where he will fix those things, and he will publish it soon.

- Jan

> 
> 
> Daniel
> 
> 
>>
>> - Jan
>>
>>>>>
>>>>> That it is so difficult to update Avocado after barely more than
>>>>> 1 year is not exactly a strong vote of confidence in our continued
>>>>> use of Avocado long term :-(
>>>>
>>>>
>>>> By the way, Avocado just provided a fix for the problem this patch 
>>>> is trying
>>>> to amend:
>>>>
>>>> https://github.com/avocado-framework/avocado/pull/5515#issuecomment-1308872846
>>>
>>> Thanks Jan!
>>>
>>>> Is there an easy way to plug upstream Avocado into QEMU? I would 
>>>> like to test
>>>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg to see 
>>>> if the problem
>>>> is fixed by Avocado upstream.
>>>
>>> See 
>>> https://lore.kernel.org/qemu-devel/20200403172919.24621-9-philmd@redhat.com/
>>>
>>> For your case:
>>>
>>> -- >8 --
>>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>> index 0ba561b6bd..e17bc3972c 100644
>>> --- a/tests/requirements.txt
>>> +++ b/tests/requirements.txt
>>> @@ -4,3 +4,3 @@
>>>   # Note that qemu.git/python/ is always implicitly installed.
>>> -avocado-framework==88.1
>>> +-e 
>>> git+https://github.com/avocado-framework/avocado.git@b31b868c882d4650d3b7d2fbfc9b8ac0f2c3672b#egg=avocado-framework
>>>   pycdlib==1.11.0
>>> ---
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>
> 


