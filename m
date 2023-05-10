Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F16FDD95
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:19:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwilu-0007bA-OE; Wed, 10 May 2023 08:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwilq-0007ao-FA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwilo-0006sn-A9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721088;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOVWo80HQnHu6uIFdugAgc6iaBTOymP8BKNKY4/yOgc=;
 b=V8cCE51eT7V+zwyDid/BhEEHZ4Z4lLKYfoF35KLNxHAPHwFsYr2PpIY6DA1jkzcJG+yFUK
 ocAKDOxDBizt90vZ6PhPdBH4hjyp6kCBrY3qVXb+aw30WenQG8/9So7WWj8nOfdUsYdizW
 l5i6hjVJRTvW5QvrRYP76vggssmnVXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-03CMaG8-M6qvAv-ZCXIAWg-1; Wed, 10 May 2023 08:18:07 -0400
X-MC-Unique: 03CMaG8-M6qvAv-ZCXIAWg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f433a2308bso22665315e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721086; x=1686313086;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOVWo80HQnHu6uIFdugAgc6iaBTOymP8BKNKY4/yOgc=;
 b=bxcJpSm8y7AgrkxuKRdRIfWEu8cZw6t3hAUXlHUhBkqB1rnSPZa36K/wapFGB7cfC/
 uUhJDBrCRVzJZzoIvAbi0Nl0BCaBC4QS8yD2W+rgK9VRy7/UP7p3dr6npzBU3+rI7fH7
 gdyOU4n/gqil9AHvUkx8D3qDshqxY5g0F6Ka8bAxjfZPjcmGFPev0VVw25IpR+XawLyo
 g1ce6fgSlR/tC7echMhmhxYL1uweiIN76Caw/+OgL7mRrEEwkxkTQR6Zm8GJjV1TsHld
 bWwl7coPOO8WDGRnwhZhB4ovCWEEDpp3GYovImRrh7LdnZC71n1wv49woITGgXHESHDY
 3Deg==
X-Gm-Message-State: AC+VfDzY4zJoiVIXZW9OPqhoYyddF8uLPmadq2EKAIBza/i98hXSGfVL
 3CA66vyp6cqDZlQxGCYOq46vSTwO/UqNM3XNOnTVaClSJ70u2L0W0jvgE7R5hNh2MJd4H7ieFMT
 sQWwxnE8afe18rAs=
X-Received: by 2002:a05:6000:c7:b0:307:9081:d355 with SMTP id
 q7-20020a05600000c700b003079081d355mr7255289wrx.26.1683721086109; 
 Wed, 10 May 2023 05:18:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xCLJEAqCbmYUKA1xkU0c47OfgrRtuV5dSydfcrn9cRqc5NzaL3PFQ89U3/ZC7rfLCOC7TRw==
X-Received: by 2002:a05:6000:c7:b0:307:9081:d355 with SMTP id
 q7-20020a05600000c700b003079081d355mr7255277wrx.26.1683721085825; 
 Wed, 10 May 2023 05:18:05 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d4a84000000b003062b6a522bsm17362228wrq.96.2023.05.10.05.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 05:18:04 -0700 (PDT)
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
In-Reply-To: <20efd1c7-5f63-73db-6564-5e6f1adf99ae@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 10 May 2023 14:36:03 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87mt2dbb3k.fsf@secure.mitica>
 <20efd1c7-5f63-73db-6564-5e6f1adf99ae@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 14:18:03 +0200
Message-ID: <87r0ro8jno.fsf@secure.mitica>
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
> On 09.05.23 21:42, Juan Quintela wrote:
>> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>>>> -----Original Message-----
>>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>> Sent: Saturday, April 29, 2023 3:49 AM
>>>> To: qemu-devel@nongnu.org
>>>> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>>>> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Paolo Bonzini
>>>> <pbonzini@redhat.com>; Marc-Andr=C3=A9 Lureau
>>>> <marcandre.lureau@redhat.com>; Daniel P. Berrang=C3=A9
>>>> <berrange@redhat.com>; Thomas Huth <thuth@redhat.com>; Philippe
>>>> Mathieu-Daud=C3=A9 <philmd@linaro.org>; Jason Wang <jasowang@redhat.co=
m>
>>>> Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
>>>>
>>>> Add option to not build filter-mirror, filter-rewriter and colo-compar=
e when
>>>> they are not needed.
>>>
>>> Typo: This patch still build the filter-mirror/filter-redirector in fil=
ter-mirror.c.
>>> Please remove the "filter-mirror" here.
>>> Other code look good to me.
>> Vladimir, I was doing this myself, with the bit attached.
>> But then I noticed that one needs to also disable
>> tests/qtest/test-filter-mirror and test-filter-rewriter.
>
> Hmm, but we decided not touch filter-mirror in this patch, only filter-re=
writer.
>
> And there is no tests/qtest/test-filter-rewriter test.
>
>> Can you resend with that fixed?  Or I am missing something more
>> fundamental.
>> Thanks, Juan.
>>=20
>>>> --- a/net/meson.build
>>>> +++ b/net/meson.build
>>>> @@ -1,13 +1,10 @@
>>>>   softmmu_ss.add(files(
>>>>     'announce.c',
>>>>     'checksum.c',
>>>> -  'colo-compare.c',
>>>> -  'colo.c',
>>>>     'dump.c',
>>>>     'eth.c',
>>>>     'filter-buffer.c',
>>>>     'filter-mirror.c',
>>>> -  'filter-rewriter.c',
>>>>     'filter.c',
>>>>     'hub.c',
>>>>     'net-hmp-cmds.c',
>>>> @@ -19,6 +16,16 @@ softmmu_ss.add(files(
>>>>     'util.c',
>>>>   ))
>>>>
>>>> +if get_option('replication').allowed() or \
>>>> +    get_option('colo_proxy').allowed()
>>>> +  softmmu_ss.add(files('colo-compare.c'))
>>>> +  softmmu_ss.add(files('colo.c'))
>>>> +endif
>>>> +
>>>> +if get_option('colo_proxy').allowed()
>>>> +  softmmu_ss.add(files('filter-rewriter.c'))
>>>> +endif
>>>> +
>>>>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>> This is the change needed, right?
>
> No, we decided to keep filter-mirror as is.

Ok.  Anyways, this bit needs an ACK from Network Maintainer or go
through their tree.

Later, Juan.


