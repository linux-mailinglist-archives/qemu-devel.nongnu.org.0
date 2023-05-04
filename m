Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C76F6A08
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXCp-0003Gg-Fu; Thu, 04 May 2023 07:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puXCm-0003GQ-Kp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puXCj-0001O2-IS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683199976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/F3xIkumEtWHapIyEddyjtLBZuYIDSzJZ3fNfb7IcRk=;
 b=jVqFozwT0YNHDMIfzUHqcIFi1J2hCFWPzJI0EZCDt3NdQuMWziiMsLupOijElaa3UqvU3y
 7mpwTCpZKj2lhIXZPbLRbnzezA+kmPD7zWS/7VMnYpmW/DT1bnnV3AzpY2ry6I0Mp3iS/r
 dHJ05bJgbYqf8Bni6DCry508zA4kBf4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-q12dSviKOxeEnRxJnjuWVg-1; Thu, 04 May 2023 07:32:55 -0400
X-MC-Unique: q12dSviKOxeEnRxJnjuWVg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6438bffbe3dso195877b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683199974; x=1685791974;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/F3xIkumEtWHapIyEddyjtLBZuYIDSzJZ3fNfb7IcRk=;
 b=P3PbkA4KxNdnRorwn1opoJpkqKpfHw4llaRBkGBpFyjlKUM92nwcXaoG/9ylQWtj98
 o89QjaFbgddY+DNSiFHsgKVWy2csnpY64bu7BUSoV6I5bgrLzMGG+ofRazOzSKSHjgeP
 IqNKbN122G5pFZT81R/A1xwKVHvLgnM85NxJAFxkYLDvvmFAa6rLKI19r2hhbjLZ7UPo
 HUPU/skkYT2OKZ0wNIDu8xa9HX9ajN0w2STeVVRcbEvjQhz5Oh42O4xXJe2VSdN4jx/a
 +7o9/2lPCOr4yci1pPdxOPshU1q4Vh3l1u1VsEtiORQLRK6aMdfAGHFw/nSfgGmdvHzl
 vyZw==
X-Gm-Message-State: AC+VfDxjXUvMstClqNwjCVjPwGX46CSqL+FjHhfNW1jGSgsO4y09aT5Z
 /vVbGwyxtUcqu3zTEVL9EpOE3CWYuhvDTGcMf4ZvivMZHuI2pvCa3rqQ2+SbLDYQ8SrUrcjrrmo
 Zd5Htr8LUKZ/JySY=
X-Received: by 2002:a05:6a00:b83:b0:63b:57cb:145f with SMTP id
 g3-20020a056a000b8300b0063b57cb145fmr2233618pfj.20.1683199974448; 
 Thu, 04 May 2023 04:32:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KfSfAVAJvOAsCvI0QxqqVO3G+PfbQWR9nTC7Y2WYT47GeJa83q+KxLRrJjbs1E8NyfIbZWg==
X-Received: by 2002:a05:6a00:b83:b0:63b:57cb:145f with SMTP id
 g3-20020a056a000b8300b0063b57cb145fmr2233597pfj.20.1683199974163; 
 Thu, 04 May 2023 04:32:54 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a056a001c8100b005a8173829d5sm24911755pfw.66.2023.05.04.04.32.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 04:32:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <ZFNr/YMWTicdsVHt@redhat.com>
Date: Thu, 4 May 2023 17:02:48 +0530
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <16CB2748-DC38-4FBC-97A7-CEB95560B01A@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
 <82B950B9-1C97-483F-A5A5-C755BEA1B727@redhat.com>
 <ZFNr/YMWTicdsVHt@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 04-May-2023, at 1:55 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, May 04, 2023 at 01:52:36PM +0530, Ani Sinha wrote:
>>=20
>>=20
>>> On 04-May-2023, at 1:32 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>=20
>>> On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
>>>> On 03/05/2023 16.55, Ani Sinha wrote:
>>>>> mformat and xorriso tools are needed by biosbits avocado tests. =
This patchset
>>>>> adds those two tools in the docker container images.
>>>>=20
>>>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and
>>>> the containers already have that tool installed. Could you maybe =
switch the
>>>> biosbits test to use that tool? Or the other way round? ... at =
least having
>>>> two tools to create ISO images in our containers sounds IMHO =
excessive.
>>>=20
>>> It looks like this series wasn't tested,
>>=20
>> Oh I wasn=E2=80=99t sure which tests I were to run to verify this =
because https://www.qemu.org/docs/master/devel/testing.html does not =
mention any specific tests to run after:
>>=20
>> 	=E2=80=A2 Once the merge request is accepted, go back to QEMU =
and update the tests/lcitool/libvirt-ci submodule to point to a commit =
that contains the mappings.yml update. Then add the prerequisite and run =
make lcitool-refresh.
>>=20
>> Is it =E2=80=9Cmake docker-all-tests=E2=80=9D ? Maybe we can update =
the doc. This is the first time me updating the docker images with new =
packages and I doing not touch this infrastructure part at all.
>=20
> By testing, I mean run the CI pipeline in GitLab to see if everything
> still passes. I expect the alpine job will fail the container build.

Ah that makes sense. As I told you offline, I regenerated the centos8 =
container image in my fork with those two packages and made sure =
avocado-system-centos job passed. I did not run all the pipelines.=


