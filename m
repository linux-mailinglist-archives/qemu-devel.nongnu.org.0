Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C242D583C8E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:54:39 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH1A6-0000pZ-O4
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH10D-0000yn-N2
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:44:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH10B-0007Ur-Nk
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:44:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id q18so1649134wrx.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4FjniqKGgt6S8g5HMHRQOGBXUuh6rJm5WeXmsFop9iQ=;
 b=pkZ8l2ztEMZ/Rqaee6lhIFf5jMI0oAB3d+9CTM80aHndYA7SroJ3BsaG1R52wJ/FCO
 a+kcqf0OwuIu6W1oXDc1yF4T9ysmRYrYx+9ZxQrPKOETLo0dCxMr3tIXzpBHFDxSp7ZU
 XqQnFsbuLrx26miF+sa9U7xk+NMDO37z+F99Ud/14gzdB9DAeDUcKn0qUSUl4JmbtU5P
 qI771Whou1bu5FNR1zZzJN7cgisXc9ssz2/HbptvQhAG/EWoMkXbWVsTA2EyIoz+PEwj
 Ion7t5jx+ErdtHnLRN1qDDd5jnbYUW4v1GpbXcFPFYfdU/ub9288jQ2hNq43/T8LALM7
 7Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4FjniqKGgt6S8g5HMHRQOGBXUuh6rJm5WeXmsFop9iQ=;
 b=J81S/W0Vb7sp16aWFAQvcmt7raGxThd55X+EPPWpvy5Hxptrl4klJid+cjhrHMheDJ
 ql4mFIGI0mZswA9DlYCwn+4e3vKKrmxtXCiE1GYClhEchePJx10rZEGjuynoRvUkpyDb
 4Ikx8KjIRfi43YGe4gWL/noOW0SOmrlSd8LS7sBlkO1klTSwFC9CV4EuVEpnYnvi+gpu
 ERxCyyX1k/GKAnI1tylZtDvasEiyJD5KRAXAGBDV24ciM3pYnLMa/vSGnSDcipot0mjy
 xXr9orV1IIYk+oTKMkPKLn7MxB0/vUqwT/vw1e2iHqvJrz1CSEQjp+M8+LWui1V91Cmg
 454g==
X-Gm-Message-State: AJIora917oEPJVGnyBFtVCJnZWnoDXlEVrjHTQVjG9Bco1LVJs7IZMLQ
 rBPeVVfqHXGXI8W0R6FCeVNxZA==
X-Google-Smtp-Source: AGRyM1seQnAPkx8OS7Df2vuzZ5zCOiWhTVSFQmmhg7Uk/126hu7ssPeWoFpnVeZAi2L27jjwgjwYVQ==
X-Received: by 2002:a05:6000:70d:b0:21e:6113:d6d1 with SMTP id
 bs13-20020a056000070d00b0021e6113d6d1mr16204692wrb.709.1659005061210; 
 Thu, 28 Jul 2022 03:44:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a3278d5cafsm5638097wmq.28.2022.07.28.03.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 03:44:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 245231FFB7;
 Thu, 28 Jul 2022 11:44:18 +0100 (BST)
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-6-alex.bennee@linaro.org>
 <9a3214bc-7d18-94a6-aa46-756ac7ad48d2@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, Coiby Xu <Coiby.Xu@gmail.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "open list:Block
 layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 05/21] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Thu, 28 Jul 2022 11:41:35 +0100
In-reply-to: <9a3214bc-7d18-94a6-aa46-756ac7ad48d2@redhat.com>
Message-ID: <875yjhh5z1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Jason Wang <jasowang@redhat.com> writes:

> =E5=9C=A8 2022/7/27 03:21, Alex Benn=C3=A9e =E5=86=99=E9=81=93:
>> This bit is unused in actual VirtIO feature negotiation and should
>> only appear in the vhost-user messages between master and slave.
>
>
> I might be wrong, but this is actually used between master and slave
> not the device and driver?

Argh you may be right. However got confused with grepping:

  static const VuDevIface vu_blk_iface =3D {
      .get_features          =3D vu_blk_get_features,
      .queue_set_started     =3D vu_blk_queue_set_started,
      .get_protocol_features =3D vu_blk_get_protocol_features,
      .get_config            =3D vu_blk_get_config,
      .set_config            =3D vu_blk_set_config,
      .process_msg           =3D vu_blk_process_msg,
  };

and this is all part of libvhostuser but vhost-user-blk-server is in the
main tree. I guess it isn't moved into tools/ because it also re-uses
bits of the block layer?

Anyway I shall drop this patch.

>
> Thanks
>
>
>>
>> [AJB: experiment, this doesn't break the tests but I'm not super
>> confident of the range of tests]
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   block/export/vhost-user-blk-server.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-u=
ser-blk-server.c
>> index 3409d9e02e..d31436006d 100644
>> --- a/block/export/vhost-user-blk-server.c
>> +++ b/block/export/vhost-user-blk-server.c
>> @@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
>>                  1ull << VIRTIO_BLK_F_MQ |
>>                  1ull << VIRTIO_F_VERSION_1 |
>>                  1ull << VIRTIO_RING_F_INDIRECT_DESC |
>> -               1ull << VIRTIO_RING_F_EVENT_IDX |
>> -               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
>> +               1ull << VIRTIO_RING_F_EVENT_IDX ;
>>         if (!vexp->handler.writable) {
>>           features |=3D 1ull << VIRTIO_BLK_F_RO;


--=20
Alex Benn=C3=A9e

