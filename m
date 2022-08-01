Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67A586694
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:50:50 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIR8T-0003iL-BX
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIR4z-0002Gr-19
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:47:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIR4x-0004DQ-33
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:47:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id q30so8799516wra.11
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=N0iz0nciGJX3anEhvSJdhN/SgpaU1OOdRZlVErf1NFk=;
 b=ERdCEE7FuXMgbtqp9YjD1XYk/cOak/SzBBC6Iih7f9FpZSX/TahJOnsRVWm4wyuwdn
 clzuSFf7UTGHmIyPThDPNhoAvHecXSHYHrGQ5ZCNQYKog4VaD25GFv0JLxiQcAeFf6Yi
 qTA84RPswJVFQ9NgGE4dwBHLjJvOfufNF1i36pySAkrDpE0bFz3ohhnixxGEntQIVH9f
 Vd+lX2z2NrYmZfnoy2PkRo1uizv7TuNVCk9w/r+PY7DRJn2Z/c9vAgGVlGsPoz1W1bmC
 jwBQYWwiIb9Xc8vVtYZfHOLMMEbPmq3j75hC4wQDAT/0uuxsTwsoHmEY24ev97Gspvrn
 K5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=N0iz0nciGJX3anEhvSJdhN/SgpaU1OOdRZlVErf1NFk=;
 b=wSF6L5hr9yPpViHGXQt+8Gnm+BbiRfMuz3WQeya/kpgMGptvzMuvNE+0fxTi0lk+NC
 MHw1VdQ9AZHzIkfOI5K7wJEdji+tcJCvLn69X3LTZl34/3Co+femliriaeOdJQc8nsKf
 heWhbk046AvuaeU6T65pXZDklJGT52DVvJIwSsWD6gXRpya+E0D28m00A4/zDEQmjYDc
 3OteQ8i2reN2taIY3ZP3cqvIn9J9FpNiCpO9sbugX/ajtak6eEwZRqFsn/BRvSnCHDTK
 mgFNzypCK///elYWl5CS9JAGqMJRID+2mJINgSYb80569+E1Ow8mBuZXNJIQv53H1Rgx
 a2cw==
X-Gm-Message-State: ACgBeo3pdN+5uuqfsfy5tfJp0cfMlOJxNv1tyqHmGvmpgfu798HT1gZT
 9pVtO8gtZRNx72DdD1AbC6dH2tC3hmqbzg==
X-Google-Smtp-Source: AA6agR4Gq1yZi3tpW3WkruIcVW2VIBckBded6jjhz/GiNlexsb55GOEfUnM5OGxndoNOdVZ4wk846Q==
X-Received: by 2002:a5d:6501:0:b0:21e:cc1c:ae5b with SMTP id
 x1-20020a5d6501000000b0021ecc1cae5bmr9515635wru.341.1659343628229; 
 Mon, 01 Aug 2022 01:47:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d51c2000000b0021badf3cb26sm13181712wrv.63.2022.08.01.01.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 01:47:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27DEF1FFB7;
 Mon,  1 Aug 2022 09:47:06 +0100 (BST)
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
 <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
 <20220728093501-mutt-send-email-mst@kernel.org>
 <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
 <20220729061221-mutt-send-email-mst@kernel.org>
 <20edd357-716f-c84c-9714-607f7f64db5c@suse.de> <87sfmkf3yc.fsf@linaro.org>
 <a8b045fe-958c-ee88-28ff-b73aab1664b9@suse.de>
 <8b008e30-15df-91cd-c891-b7707324abe1@suse.de>
User-agent: mu4e 1.7.27; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Date: Mon, 01 Aug 2022 09:44:55 +0100
In-reply-to: <8b008e30-15df-91cd-c891-b7707324abe1@suse.de>
Message-ID: <87fsigpcza.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 7/29/22 16:00, Claudio Fontana wrote:
>> On 7/29/22 15:21, Alex Benn=C3=A9e wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 7/29/22 12:13, Michael S. Tsirkin wrote:
>>>>> On Fri, Jul 29, 2022 at 11:46:05AM +0200, Claudio Fontana wrote:
>>>>>>>> @@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
>>>>>>>>      VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
>>>>>>>>      int i;
>>>>>>>>=20=20
>>>>>>>> -    virtio_set_status(vdev, 0);
>>>>>>>>      if (current_cpu) {
>>>>>>>>          /* Guest initiated reset */
>>>>>>>>          vdev->device_endian =3D virtio_current_cpu_endian();
>>>>>>>> --=20
>>>>>>>> 2.26.2
>>>>>>>
>>>>>>> As you say this is incomplete ... bout could you share a bit more
>>>>>>> of what issue does this address?
>>>>>>>
>>>>>>
>>>>>> Hi, the problem I am trying to address is a segfault in OVS/dpdk tha=
t looks like this:
>>>>>
>>>>> Sorry I was not clear. What I mean is, you don't yet know why does re=
moving
>>>>> virtio_set_status call here prevent the crash in ovs, do you?
>>>>>
>>>>
>>>> I have no idea. Trying to collect logs to figure things out, but as
>>>> mentioned the logs easily hide the issue.
>>>> Likely there is just more to study here.
>>>
>>> Given the OVS is going off on a NULL ptr deref could it just be it's not
>>> handling the disabling/reenabling of the virtqueues as you pause and
>>> restart properly? I could certainly imagine a backend jumping the gun to
>>> read a queue going very wrong if the current queue state is disabled.
>>>
>>=20
>> In this case both the ovs buf_addr and buf_iova are NULL, which is a
>> nice case as they are more detectable,
>> however I also have segfaults where the addresses are just garbage.
>>=20
>> I wonder whether it's possible that given the fact that the guest is
>> going away without notification (SIGKILL),
>> as the guest driver resets the device and communicates with QEMU,
>> QEMU adapts the state without notifying ovs,
>> so ovs happily tries to dequeue data from memory that isn't there. But I=
 am just guessing.
>>=20
>> I am still studying the qemu vhost user side and ovs/dpdk side to
>> try to understand how this whole thing works.
>>=20
>> Thanks,
>>=20
>> CLaudio
>>=20
>
> I am pursuing this as a DPDK library issue.
>
> It would be cool to have ovs, dpdk and vhost-user with the default
> test-pmd application somehow hooked up in a basic test
> in one of these projects..

I agree although it's hard to marshal multiple projects into a known
working state that isn't too brittle for CI purposes. The existing
qos-test testing doesn't really exercise any more than the initial setup
and register reading of the VirtIO device.

For example we have a number of non network standalone vhost-user
backends in rust-vmm which would be nice to plumb in somehow.

>
> Thanks,
>
> Claudio


--=20
Alex Benn=C3=A9e

