Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBE583C1A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:34:54 +0200 (CEST)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0qx-0000qV-Vu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH0k9-0004hw-CR
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:27:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH0k6-0004ec-8X
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:27:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d8so1611062wrp.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q6rAoJhPdDbe1rEJJWfUBURlnEplku8fpl/PFpgB1NQ=;
 b=ExqL6Fbkd23MbRCEeMsFbPbKXKpMrxp6lsJ1IbPDgGyD3yeas384l1ojlN/w4+Cn4x
 kEwMozu5tqEcgHPXnpb0qbTgzULfTwk1IxHB6/4UViUFm1dCymmcWqt/mY1ZLQ0UMlDm
 5Qs+f8ByS8GR4uQuwdnIk/4lAbS6d4LifwUd4X2q2ZkXNL1bsq+zcfrhpivCgBs7vPS9
 fDbxZTsN9YURcSID/9FwKgMah0ADrtowHglFVTu5Gg/T/To2RRGjxWeLHO9yvNVzVnAI
 6If+ubKZucDh3O/qyQau8gbCOcguWgZkaH8GOydvuN3po+cRnm4sVrNQ0AE0fAf/KAMo
 w/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q6rAoJhPdDbe1rEJJWfUBURlnEplku8fpl/PFpgB1NQ=;
 b=F3Khon8B3iqrWpnxeGB0O6V5kcgh9i4DFqQZBYKGUpyv4NTSoe2CMmKZnkzbsmbE91
 M5WzCKhKMZn7ogdk4riQcUmtq0lUlzjO7TkrObM4UM7diJHT0WvMNyOU8aai0A6vU7St
 Wz88mKWlqHPQSwRtL/Cu2wpWoJdU33yoKfE5G5Et8qTPqG+XkD2fHQv7gSabD2OU9fUc
 VgZdhapnLEx2kEFE/DrcpkCdSMAICBPsK32ovfSIOFrmaAGPI+A9wlmaxXqApQORl6Bx
 MDUXdBxsYn0HWt0jDtB7vpUVNOa2JAGZDVT4d272ygJNZ5lJdlme3Pa4F+uc6GN0VsjF
 mAyA==
X-Gm-Message-State: AJIora8JwlAJ7ouikLP4wI+z6BlYIIqS7O4w9CQ09VZ1TL9W3uF72od2
 3qmDoLojTdGaYj+xpdEAbwFlrw==
X-Google-Smtp-Source: AGRyM1tSSp+ktdvvqrS8HdtjDGqeWhSedRl32DxWPtnk4eQVA57ZMdpOcPQ6xOjTuAMbgX/jRZlSlA==
X-Received: by 2002:a5d:64ec:0:b0:21e:9396:b0ff with SMTP id
 g12-20020a5d64ec000000b0021e9396b0ffmr10725600wri.411.1659004064405; 
 Thu, 28 Jul 2022 03:27:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d48cd000000b0021e91d5bb1esm619025wrs.8.2022.07.28.03.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 03:27:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62E061FFB7;
 Thu, 28 Jul 2022 11:27:36 +0100 (BST)
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
 <20220727155653.3974426-2-alex.bennee@linaro.org>
 <YuJM5XY9u8lV3pA6@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:Block layer core"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH  v1 1/5] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Thu, 28 Jul 2022 11:27:09 +0100
In-reply-to: <YuJM5XY9u8lV3pA6@redhat.com>
Message-ID: <87edy5h6qv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Kevin Wolf <kwolf@redhat.com> writes:

> Am 27.07.2022 um 17:56 hat Alex Benn=C3=A9e geschrieben:
>> This bit is unused in actual VirtIO feature negotiation and should
>> only appear in the vhost-user messages between master and slave.
>>=20
>> [AJB: experiment, this doesn't break the tests but I'm not super
>> confident of the range of tests]
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220726192150.2435175-6-alex.bennee@linaro.org>
>> ---
>>  block/export/vhost-user-blk-server.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-u=
ser-blk-server.c
>> index 3409d9e02e..d31436006d 100644
>> --- a/block/export/vhost-user-blk-server.c
>> +++ b/block/export/vhost-user-blk-server.c
>> @@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
>>                 1ull << VIRTIO_BLK_F_MQ |
>>                 1ull << VIRTIO_F_VERSION_1 |
>>                 1ull << VIRTIO_RING_F_INDIRECT_DESC |
>> -               1ull << VIRTIO_RING_F_EVENT_IDX |
>> -               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
>> +               1ull << VIRTIO_RING_F_EVENT_IDX ;
>
> I didn't see this series yet when I replied to the other series this is
> split off from, but of course, my comments are still relevant for this
> one.
>
> I asked for a changed commit message (the "experiment" part should
> probably go away if we're merging it; instead, it should explain that
> in vu_get_features_exec(), libvhost-user adds the vhost-user protocol
> level VHOST_USER_F_PROTOCOL_FEATURES flag anyway and the device is the
> wrong layer to add it, but the behaviour doesn't change with this patch)
> and noted the extra space before the semicolon.

OK - mst do you want me to respin or can you tweak the commit?

>
> Kevin


--=20
Alex Benn=C3=A9e

