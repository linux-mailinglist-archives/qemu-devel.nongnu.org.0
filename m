Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6B2B915C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:46:56 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiOt-0002sM-HX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiNL-0001jS-CB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:45:19 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiNI-0007Le-4t
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:45:19 -0500
Received: by mail-wr1-x443.google.com with SMTP id b6so6130622wrt.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=fGdwe4aHrmcnC+qX1yNpZSMyzTcxnrCON/cxG8GtBeQ=;
 b=MjD5NQJ0GxfPIp1WGaOD5GGAt9jqsUS2c7ydaZkvTfpLGcb281B1VrfKUvn5+1y6mZ
 Yo9Cvu6/1rDnXPZL1pzB42CSgkNAwTtcFUv1WN33+QpE34jSjJTTYmBETQXKVfcDmxXm
 2N/0+nsPRo9KehzTLGEAM6G/22vJUhniLfyAYreHQfcM/2T9U8I1O0LUhum6H/8AcS8S
 cyBY4pw4hIH2IseY+YMnik9o5KL8QG3YNcsSSH89gyoPG7ehNEpLSD+RA4S+QZlXNOHz
 VsjS7+jSOPh4kSBqsGOyWnVqYMjgdmSP6JvfvjUhrgPybqh0cTDBAV+iOe5tM9yAFVd2
 VTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=fGdwe4aHrmcnC+qX1yNpZSMyzTcxnrCON/cxG8GtBeQ=;
 b=n4M8KGLg+jsAUV8p1kzKlbPq1SEvY5042g+6zc1SDkPkpyZBtMip8eECxqgy83latF
 TukzFzpl905J+lnJu8aRb4LhyslwN/dk61muNxK8ETJzl+wWeJoZidscXHjcymduLU5N
 ZBNDIwEgFhow3JdV3VC3MUxVTlpnAyuc97XghiKMI38tE3/XhZcssXKa+QvxE15EdI9z
 xy3e6/GvFV0o/iZ93IUW+DwRTJdB6LTulYePX2CK44AaMMwlzpMe/Yfgpp+Cr1iRe9Q8
 XIjQVHAW+GqAeNK7FkM1iie1/hVi5GLFbDVpcE/6y0HNfT0NGlAGSLTQomCfwEduXo37
 NcrA==
X-Gm-Message-State: AOAM532fRH6x/dbaIPndSXXGJPqEPMoWRIbvpfiixs5lic3PjRbeOUXC
 ++tAuaIFH2/rI7gdD9cxfk26UQ==
X-Google-Smtp-Source: ABdhPJycSCJvI6DqOPa5Jh8El9TFGruAO3ByVvk1v8XapbyY2Vu4m5WY9zOX+itR0TljWRXrV8s00g==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr9642530wrh.230.1605786314278; 
 Thu, 19 Nov 2020 03:45:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a128sm9668372wmf.5.2020.11.19.03.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 03:45:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 874C01FF7E;
 Thu, 19 Nov 2020 11:45:11 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
In-reply-to: <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
Date: Thu, 19 Nov 2020 11:45:11 +0000
Message-ID: <87ft55vad4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?utf-8?B?aGFpYmluemhhbmco?= =?utf-8?B?5byg5rW35paMKQ==?=
 <haibinzhang@tencent.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Hi David,
>>>
>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>> images for code and variables respectively. These images are both then
>>>> padded out to 64MB before being loaded by QEMU.
>>>>
>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>> padding.
>>>
>>> 2 years ago I commented the same problem, and suggested to access the
>>> underlying storage by "block", as this is a "block storage".
>>>
>>> Back then the response was "do not try to fix something that works".
>>> This is why we choose the big hammer "do not accept image size not
>>> matching device size" way.
>>>
>>> While your series seems to help, it only postpone the same
>>> implementation problem. If what you want is use the least memory
>>> required, I still believe accessing the device by block is the
>>> best approach.
>>=20
>> "Do not try to fix something that works" is hard to disagree with.
>> However, at least some users seem to disagree with "this works".  Enough
>> to overcome the resistance to change?
>
> Yeah, at least 3 big users so far:
>
> - Huawei
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
> - Tencent
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
> - Oracle
> (this series).
>
> Then Huawei tried the MicroVM approach:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>
> I simply wanted to save David time by remembering this other approach,
> since Peter already commented on David's one (see Huawei link).

IIRC the two questions that came up were:

  - what would reading memory not covered by a file look like (0's or
    something more like real HW, 7f?).

  - what happens when the guest writes beyond the bounds of a backing
    file?

I'm guessing for these cloudy type applications no one cares about
persistence of EFI variables? Maybe we just need a formulation for the
second pflash which is explicit about writes being ephemeral while also
being accepted?

>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

