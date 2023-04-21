Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451656EA29E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:10:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppi5k-0002Zi-En; Fri, 21 Apr 2023 00:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ppi5b-0002ZZ-Dy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ppi5Z-00051K-1x
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682050175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLbGYm0H2CK1LiFwWsNMUKtM8FNsuL53Mqy2W+BD9Rc=;
 b=Bm+7zGLeRj92AtFKDrEBq8rgcKk/C9pH6ueBqgDnhF8GTyuCOKiym5+YbjqxBEDI+qY/Rk
 orM0pD5+CYgqYPbrDSTDwjlnupAIqZECzNzHcx3nSLPm0bHABkZU7S1bkVMz8zl9AJWDOd
 rmTxoSONo5LtNm0fBIzRN4Ms7RwFnjY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-6X4qcnjvNSSh7HnVwScfuw-1; Fri, 21 Apr 2023 00:09:34 -0400
X-MC-Unique: 6X4qcnjvNSSh7HnVwScfuw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef8c84cae4so21096106d6.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 21:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682050174; x=1684642174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLbGYm0H2CK1LiFwWsNMUKtM8FNsuL53Mqy2W+BD9Rc=;
 b=YRp3zo+4FhMbLenMyNVLhlTaE4pyg60z2KVJwmGjxK4MloWQqacNYir2JoJxNioJh7
 sKkWsDd478FXOLDnAf8Xi+NeYYlJE3XpU3Iu50ZuMkk2NKH00jdu7se2XBpZ967k86D6
 z9a2cq/Ke6ca3rVfgcJ9X7Pa1g69qNyMRgmyG+Y9bLHk4dIbDXGgkQmhk2+/yJZrQb0v
 AhRmxVN8CGHLEU+a3qSA3GZHaML11VkHFpaq+8clLzVq+EgGWIHC5twFdNV3z7uaq5Q3
 2MpuLE8lwuP2eoUNEvCKKD5eiLKHcr2vXcm53FBjQnAhwjdDmJOSJsSnBSX7eBbHfCGa
 czBg==
X-Gm-Message-State: AAQBX9cVI2h4gg0l4zSXtOqOxhF0FYn4wRtFSPMhUomZ5HsKpysMFfPY
 GTf2NESppjjaNtagxi2VKWfEQUIsCD+53M8go84efrRwfKDuSS3SRufyCwYQjtON+Ha8xaxn1n5
 BsfkELPVyTtn3l9M=
X-Received: by 2002:a05:6214:cae:b0:5a2:abf1:7d33 with SMTP id
 s14-20020a0562140cae00b005a2abf17d33mr5883705qvs.50.1682050173745; 
 Thu, 20 Apr 2023 21:09:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350b31w/k+eay+N8x2G451kAEOTWO2FAhzDoYCQV4QH4kMH4P/r2DohXqnQAYZrKCRjNocQowhg==
X-Received: by 2002:a05:6214:cae:b0:5a2:abf1:7d33 with SMTP id
 s14-20020a0562140cae00b005a2abf17d33mr5883672qvs.50.1682050173427; 
 Thu, 20 Apr 2023 21:09:33 -0700 (PDT)
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5?
 ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
 by smtp.gmail.com with ESMTPSA id
 dz16-20020a05620a2b9000b0074df16f36f1sm983103qkb.108.2023.04.20.21.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 21:09:32 -0700 (PDT)
Message-ID: <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
Date: Fri, 21 Apr 2023 00:09:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/20/23 12:54, John Snow wrote:
>
>
> On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daudé 
> <philmd@linaro.org> wrote:
>
>     On 17/4/23 19:44, Alex Bennée wrote:
>     >
>     > John Snow <jsnow@redhat.com> writes:
>     >
>     >> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée
>     <alex.bennee@linaro.org> wrote:
>     >>>
>     >>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>     >>>
>     >>> Avocado version 101.0 has a fix to re-compute the checksum
>     >>> of an asset file if the algorithm used in the *-CHECKSUM
>     >>> file isn't the same as the one being passed to it by the
>     >>> avocado user (i.e. the avocado_qemu python module).
>     >>> In the earlier avocado versions this fix wasn't there due
>     >>> to which if the checksum wouldn't match the earlier
>     >>> checksum (calculated by a different algorithm), the avocado
>     >>> code would start downloading a fresh image from the internet
>     >>> URL thus making the test-cases take longer to execute.
>     >>>
>     >>> Bump up the avocado-framework version to 101.0.
>     >>>
>     >>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>     >>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>     >>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>     >>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>     >>>
>     >>> ---
>     >>> v2
>     >>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>     >>> ---
>     >>>   tests/Makefile.include | 18 +++++++++++-------
>     >>>   tests/requirements.txt |  2 +-
>     >>>   2 files changed, 12 insertions(+), 8 deletions(-)
>     >>>
>     >>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>     >>> index 9422ddaece..a4de0ad5a2 100644
>     >>> --- a/tests/Makefile.include
>     >>> +++ b/tests/Makefile.include
>     >>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>     >>>   # download all vm images, according to defined targets
>     >>>   get-vm-images: check-venv $(patsubst
>     %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>     >>>
>     >>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter
>     -j%,$(MAKEFLAGS))))
>     >>> +
>     >>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>     >>> -       $(call quiet-command, \
>     >>> -            $(TESTS_PYTHON) -m avocado \
>     >>> -            --show=$(AVOCADO_SHOW) run
>     --job-results-dir=$(TESTS_RESULTS_DIR) \
>     >>> -            $(if $(AVOCADO_TAGS),,
>     --filter-by-tags-include-empty \
>     >>> -  --filter-by-tags-include-empty-key) \
>     >>> -            $(AVOCADO_CMDLINE_TAGS) \
>     >>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>     >>> +       $(call quiet-command,                                    \
>     >>> +            $(TESTS_PYTHON) -m avocado                      
>                          \
>     >>> +            --show=$(AVOCADO_SHOW) run
>     --job-results-dir=$(TESTS_RESULTS_DIR)  \
>     >>> +            $(if $(AVOCADO_TAGS),,                          
>              \
>     >>> +  --filter-by-tags-include-empty                          \
>     >>> +  --filter-by-tags-include-empty-key)                     \
>     >>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=%)     
>                      \
>     >>> +            $(AVOCADO_CMDLINE_TAGS)                          
>             \
>     >>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 
>                      \
>     >>>               "AVOCADO", "tests/avocado")
>     >>>
>     >>>   check-acceptance-deprecated-warning:
>     >>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>     >>> index 0ba561b6bd..a6f73da681 100644
>     >>> --- a/tests/requirements.txt
>     >>> +++ b/tests/requirements.txt
>     >>> @@ -2,5 +2,5 @@
>     >>>   # in the tests/venv Python virtual environment. For more info,
>     >>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>     >>>   # Note that qemu.git/python/ is always implicitly installed.
>     >>> -avocado-framework==88.1
>     >>> +avocado-framework==101.0
>     >>>   pycdlib==1.11.0
>     >>> --
>     >>> 2.39.2
>     >>>
>     >>
>     >> I thought there were test failures that prohibited us from
>     bumping the
>     >> Avocado-Framework version. Did those get rectified recently?
>
>     No, still not working on Darwin. At this point I'm thinking at sending
>     a patch clarifying testing QEMU with Avocado is not supported on
>     Darwin.
>
>
> What's broken on Darwin?
>
Hi John,

IIRC, the main issue is that the legacy runner (the one active in 88.1) 
pickles some stuff that do not play nice under Darwin.  It has never (to 
the best of my knowledge) worked under Darwin.

> Is it broken with avocado-framework==88.1 too? (Is this a regression?)
>
It was already broken with avocado-framework==88.1, but it should mostly 
work with 101.0 (see previous reply).

> We might need to consider entirely separate issues:
>
> (1) We need to upgrade avocado-framework to a supported LTS version >= 
> v90 for dependency harmony with qemu.git/python testing
>
> (2) We need to upgrade avocado-framework to >= v101.0 to fix the 
> stated checksum issue in this patch
>
> (3) We would like avocado tests to work on Darwin. (Have they ever 
> worked? When did they break? etc.)
>
> My understanding is that this patch helps with 1 and 2 but not 3, but 
> if Darwin support isn't a regression, this is still a step forward.
>
To the best of my knowledge, this patch would help with 1, 2 and even 3.

Cheers,

- Cleber.

>
>     > I'm not seeing any with your patch applied.
>
>     Are you using running the Cirrus-CI jobs?
>


