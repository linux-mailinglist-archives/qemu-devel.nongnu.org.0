Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC16FDF1B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkBD-0002YQ-Ky; Wed, 10 May 2023 09:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkBA-0002Xr-W6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkB8-0001s9-RF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683726505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BG8IsS3x/UzMgAeZT6Z02HMkRmZWLvViNb3bUMxj4o=;
 b=AUUyL9VDnpY3TPukPkFum/r0+k9Z6ZrQbleYdBj4KA98etdq1nfY8cWlqDoiuUV9Pb8gts
 wo/PIS5OCm3E9hZ5e/HJOqXA3rAwCuDwQvAAro+mJ6XSAPcLNs0T/nGL1GfNsfMe7iGRGb
 TDsVbksix5MSXvzon4ZH5yaNM1Ogq9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-zwc4_GgpNfSwhCWPaCMcnQ-1; Wed, 10 May 2023 09:48:24 -0400
X-MC-Unique: zwc4_GgpNfSwhCWPaCMcnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so26151445e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726503; x=1686318503;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BG8IsS3x/UzMgAeZT6Z02HMkRmZWLvViNb3bUMxj4o=;
 b=jZvzsvsU5CpywFK6Yvw2AbdRhaEx/KLAPhx5ckY70rS4LwoNUzBXqJg1vfrTkTbGF2
 Ok5MJYpu13e/bWHTrR6DUPEWDe9/Vvp8aNdWxGIXZdrX75HNNkwbU8JooQEUq4e7S1sc
 KMadxM9IUhWJtDmGPyqPb++Ig3HR+d3XoVjrk68VMZpO6k17eJVUdoW5/JfqG/QlAdKo
 +vHF4RDQd+S1E7c/AxnAtzZpjiPLMYGaHJOeBDvA53KUbZiYmADUSiiXE8x6K/dfrM1S
 pfRCvca92BjQgPGw5UN/uETLwSm5xZ2tfNR/jwMINsauou943e21cvR6AyDnoEtoD5yF
 fp5A==
X-Gm-Message-State: AC+VfDzMri2vaP+7+U7K4AvUVlePoG6fLHZ/5JFQCf957TWDvQZrLLjv
 YBwKpe1WSqVL8SyG3ehjF67oPf7AA37LGXaV9idlVvzzccQy1Ks31QnPM6VakYv73PSqr7HPq8N
 yxRGm9Rf8eifINMw=
X-Received: by 2002:a5d:6341:0:b0:2f9:61d4:1183 with SMTP id
 b1-20020a5d6341000000b002f961d41183mr11809699wrw.45.1683726503315; 
 Wed, 10 May 2023 06:48:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mgUObxg4I0JvBnd9Oce42UYiHdZpwVEEinbcwt2SmxS9/seYJdnDEu4r/XR8W+kuuHrh3iQ==
X-Received: by 2002:a5d:6341:0:b0:2f9:61d4:1183 with SMTP id
 b1-20020a5d6341000000b002f961d41183mr11809680wrw.45.1683726503009; 
 Wed, 10 May 2023 06:48:23 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003e91b9a92c9sm22828289wmc.24.2023.05.10.06.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:48:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  "lukasstraub2@web.de" <lukasstraub2@web.de>,
 Paolo Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 04/10] configure: add --disable-colo-proxy option
In-Reply-To: <2c554e38-cf95-ee51-d362-5b80dcf596c6@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 10 May 2023 15:48:57 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87mt2dbb3k.fsf@secure.mitica>
 <20efd1c7-5f63-73db-6564-5e6f1adf99ae@yandex-team.ru>
 <87r0ro8jno.fsf@secure.mitica>
 <2c554e38-cf95-ee51-d362-5b80dcf596c6@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 15:48:21 +0200
Message-ID: <87bkis8fh6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 10.05.23 15:18, Juan Quintela wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>>> On 09.05.23 21:42, Juan Quintela wrote:
>>>> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>>>>>> -----Original Message-----
>>>>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>>>> Sent: Saturday, April 29, 2023 3:49 AM
>>>>>> To: qemu-devel@nongnu.org
>>>>>> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>>>>>> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Paolo Bonzini
>>>>>> <pbonzini@redhat.com>; Marc-Andr=C3=A9 Lureau
>>>>>> <marcandre.lureau@redhat.com>; Daniel P. Berrang=C3=A9
>>>>>> <berrange@redhat.com>; Thomas Huth <thuth@redhat.com>; Philippe
>>>>>> Mathieu-Daud=C3=A9 <philmd@linaro.org>; Jason Wang <jasowang@redhat.=
com>
>>>>>> Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
>>>>>>
>>>>>> Add option to not build filter-mirror, filter-rewriter and colo-comp=
are when
>>>>>> they are not needed.
>>>>>
>>>>> Typo: This patch still build the filter-mirror/filter-redirector in f=
ilter-mirror.c.
>>>>> Please remove the "filter-mirror" here.
>>>>> Other code look good to me.
>>>> Vladimir, I was doing this myself, with the bit attached.
>>>> But then I noticed that one needs to also disable
>>>> tests/qtest/test-filter-mirror and test-filter-rewriter.
>>>
>>> Hmm, but we decided not touch filter-mirror in this patch, only filter-=
rewriter.
>>>
>>> And there is no tests/qtest/test-filter-rewriter test.
>>>
>>>> Can you resend with that fixed?  Or I am missing something more
>>>> fundamental.
>>>> Thanks, Juan.
>>>>
>>>>>> --- a/net/meson.build
>>>>>> +++ b/net/meson.build
>>>>>> @@ -1,13 +1,10 @@
>>>>>>    softmmu_ss.add(files(
>>>>>>      'announce.c',
>>>>>>      'checksum.c',
>>>>>> -  'colo-compare.c',
>>>>>> -  'colo.c',
>>>>>>      'dump.c',
>>>>>>      'eth.c',
>>>>>>      'filter-buffer.c',
>>>>>>      'filter-mirror.c',
>>>>>> -  'filter-rewriter.c',
>>>>>>      'filter.c',
>>>>>>      'hub.c',
>>>>>>      'net-hmp-cmds.c',
>>>>>> @@ -19,6 +16,16 @@ softmmu_ss.add(files(
>>>>>>      'util.c',
>>>>>>    ))
>>>>>>
>>>>>> +if get_option('replication').allowed() or \
>>>>>> +    get_option('colo_proxy').allowed()
>>>>>> +  softmmu_ss.add(files('colo-compare.c'))
>>>>>> +  softmmu_ss.add(files('colo.c'))
>>>>>> +endif
>>>>>> +
>>>>>> +if get_option('colo_proxy').allowed()
>>>>>> +  softmmu_ss.add(files('filter-rewriter.c'))
>>>>>> +endif
>>>>>> +
>>>>>>    softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.=
c'))
>>>> This is the change needed, right?
>>>
>>> No, we decided to keep filter-mirror as is.
>> Ok.  Anyways, this bit needs an ACK from Network Maintainer or go
>> through their tree.
>>=20
>
> I think r-b from Zhang is enough, he is maintainer of COLO Proxy, which i=
ncludes filter-rewriter.
>
> (anyway, I'll resend the rest of the series when you PULL request merged)

Thanks.


