Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94B56A3F7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:43:35 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Rn4-0003Xs-0A
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9Rm8-0002ZB-VW
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:42:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9Rm7-0001ka-3k
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:42:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk26so11313032wrb.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gQO5CZv/s8I4DGhu8BU0GVqfe26X4h0gK1nBS+CS6YM=;
 b=tA32EDRRkya4k+DL6Oalff8xmP7OYom+NpOZF+YiYXixmBmwFssWjzRmzumOhFH9EQ
 a67mpD0puG/+MnCjNG/9dWXICjdLLQgpQlQxwBLgpIHpCkV/6ZTD3ehyHt+SZ5i+LlXe
 BARq7b1pLjv1lV+whxlgyejVF5CGp1rCOUuF/PE1OoQIG0aHzI6+7INLnu0FtuUkOTe9
 MD8hyAN/VW4QHyh+UpXG/WMjohMpo6+KoCiiI3moj6AMHfranSFuLQTc/XJDIFIcZF0s
 XbzHckA+s0X76mwjTtxc6n3npXToVERvkzkgSh1TGbfbZC6zHualDqaYUV7mCeXF5Mad
 PVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gQO5CZv/s8I4DGhu8BU0GVqfe26X4h0gK1nBS+CS6YM=;
 b=Y2NNbTz5iibSW4N3k0NtKM3OiS4FIUWGUxSN97yJy/dlD/XYfbZ62VfhyCuUnSctan
 MQIYDUIHJQ0q2wrvNZxl4UDVvd9ClUpb0k3O6FEjm0b+diazz6TCodL4gV44sLxFNAPE
 7doUvwzeJ6+1ADfKFv0S77Sw72+ckW5VhtAjyQxjVjT2x71VotudrB39BYHxv0o2UZgP
 WOiX2+aqvsoMxtUmoOVtpaHDCEpBhYvVHvON21OzgY/8zj2qnnbVZGXv+h3wp0gln/xc
 bFkowBBIwbZov9/qdPIpKmGdRXNOfczDe65pIZaRoaL7zsIdTbwIlmD3irFDV7F2qp3/
 KhYQ==
X-Gm-Message-State: AJIora/raFQRyMWSxEDBzU2ILG44rz0o5T3cNQpZWRRvpG6CzVzT9Sz4
 CtCXprCWiIKsPPbRvhc3eCUfPw==
X-Google-Smtp-Source: AGRyM1tgfLrTdPlK7j96YY43jditG5y6XfP/kB1LOGEj3gxJyWOaBiT8TdW1R58kMUYCduP7cCGAyA==
X-Received: by 2002:a05:6000:1861:b0:21b:b56f:3fb5 with SMTP id
 d1-20020a056000186100b0021bb56f3fb5mr43795647wri.698.1657201352947; 
 Thu, 07 Jul 2022 06:42:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003942a244f40sm26946062wmq.25.2022.07.07.06.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 06:42:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E54301FFB7;
 Thu,  7 Jul 2022 14:42:30 +0100 (BST)
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH  v2 00/15] virtio-gpio and various virtio cleanups
Date: Thu, 07 Jul 2022 14:38:13 +0100
In-reply-to: <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain>
Message-ID: <87fsjdjayh.fsf@linaro.org>
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


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=C3=A9e wrote:
>> Hi,
>>=20
>> This series ostensibly adds virtio-user-gpio stubs to the build for
>> use with an external vhost-user daemon. We've been testing it with our
>> rust daemons from:
>>=20
>>   https://github.com/rust-vmm/vhost-device
>>=20
>> Getting the test enabled took some doing most likely because the need
>> for CONFIG support exercised additional paths in the code that were
>> not used for the simpler virtio-net tests. As a result the series has
>> a number of cleanup and documentation patches.
>>=20
>> The final thing that needed fixing was the ensuring that
>> VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiation
>> process. This was the hardest thing to track down as we store the
>> feature bits in several places variously as:
>>=20
>>   in VirtIODevice as:
>>     uint64_t guest_features;
>>     uint64_t host_features;
>>     uint64_t backend_features;
>
> None of these know about VHOST_USER_F_PROTOCOL_FEATURES and vhost-user's
> unfiltered feature bits should never be passed to VirtIODevice.
>
>>=20
>>  in vhost_dev as:
>>     uint64_t features;
>>     uint64_t acked_features;
>>     uint64_t backend_features;
>
> I don't think these should know about VHOST_USER_F_PROTOCOL_FEATURES
> either. AFAIK vhost_dev deals with VIRTIO feature bits, not raw
> vhost-user GET_FEATURES.

So where does VHOST_USER_F_PROTOCOL_FEATURES get set before it's set
with the VHOST_USER_SET_FEATURES message? Currently it's fed via:

    uint64_t features =3D vhost_dev->acked_features;

in vhost_dev_set_features() which does apply a few extra bits
(VHOST_F_LOG_ALL/VIRTIO_F_IOMMU_PLATFORM). Maybe it should be adding
VHOST_USER_F_PROTOCOL_FEATURES here? How should it be signalled by the
vhost-user backend that this should be done? Overload the function?

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

