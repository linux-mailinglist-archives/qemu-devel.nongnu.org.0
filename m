Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9906E4393
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 11:22:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poL3g-0001YR-5Z; Mon, 17 Apr 2023 05:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poL3e-0001YD-LY
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:21:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poL3c-0002jY-Vk
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:21:58 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so825373f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681723315; x=1684315315;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohN/cJgp3EHy2B3u1hvfz20suus1SJ5QEpghl1bT9Dc=;
 b=Q8hZqrSZSxp048/2vEwUxP4pxQzJRNNKw/d+ZUdFtOKFyJpn9zS18ErPsOCPl+DUF+
 Sgvqqqrz7Rh+b/t5N1CLDWoVRuZy5wc2t29Fd7UPE9XU+URGFiLmk/Pl8Vo+Lp32MSdy
 tuht4QW57DgeH7kIQzpSHEi76/D3LkL8XshBO6FuY+7H3pdGya9V/Q4IC4O+JHo98nwj
 Hqj2HLQyg1QpOz6zXz+ZMjKnEE6sIfm2GXVYgQ8mx1XuLXRyh1FFvNA7wJTXxq9Hk6rr
 P6WlpGyDgl+jkmEHEwaOHbeEswPb6gHAGjiGquuPe24GpB7hQtX2by2Y/HOLJeFjaQPk
 vvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681723315; x=1684315315;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ohN/cJgp3EHy2B3u1hvfz20suus1SJ5QEpghl1bT9Dc=;
 b=DiG9EBuSWL9dmQlyqpQaJf2/hywhJt/K7hNPzld29R50UpuMFck224srMt5Lmwii+1
 XkdFmzmAOFw71kGFFItqupFX9tKtApks9HhYLUK2FrZLTaf2Z2cXHmquGFEtGX/5T6Jl
 byTZ6U7P/N08qb8pQjFQKMi+1gRlH37ISK/y30EdJis4IiHyPRCocrPp18zaXjX9BPL7
 sDgXxgKeY+TaG5wjrvptXjbT7S1JWXCgRqOcOMP4GSfYSS123sv6LT9PpzjHFtcX6SHZ
 +7HxYcWT7eDNTxrfRclBDs2XzUhHQ+YGpD80WW3TsPZR9eizPcIMYIqI0wUyfcRxwNHl
 /9hg==
X-Gm-Message-State: AAQBX9esYAdTi+jsB+QCDu95GO4QH/J2woJ9NRDkhXu0Akx9vtaD735g
 J235MFnTYt+2xb3iwiBUkJx2XQ==
X-Google-Smtp-Source: AKy350ZEV9n9kF1oenDMa2H8SBotCul7CAJJnkOOgDhyYioVfPkuxvuTeItb7hUODi6DWxWCS6IxYg==
X-Received: by 2002:a5d:4d90:0:b0:2f5:4345:2e41 with SMTP id
 b16-20020a5d4d90000000b002f543452e41mr4942881wru.63.1681723315243; 
 Mon, 17 Apr 2023 02:21:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b002f9bfac5baesm3418262wrx.47.2023.04.17.02.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 02:21:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C78F1FFB7;
 Mon, 17 Apr 2023 10:21:54 +0100 (BST)
References: <89d47285e882a99a0513411edcc96aa575512f13.1681710993.git.viresh.kumar@linaro.org>
 <cd1e974b-2bbf-4b9a-c538-95268de9f449@linaro.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org, "Michael
 S. Tsirkin" <mst@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org, Cindy Lu
 <lulu@redhat.com>
Subject: Re: [PATCH] virtio: i2c: Check notifier helpers for
 VIRTIO_CONFIG_IRQ_IDX
Date: Mon, 17 Apr 2023 10:21:26 +0100
In-reply-to: <cd1e974b-2bbf-4b9a-c538-95268de9f449@linaro.org>
Message-ID: <87h6te983x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 17/4/23 08:02, Viresh Kumar wrote:
>> Since the driver doesn't support interrupts, we must return early when
>> index is set to VIRTIO_CONFIG_IRQ_IDX.
>> Fixes: 544f0278afca ("virtio: introduce macro
>> VIRTIO_CONFIG_IRQ_IDX")
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>   hw/virtio/vhost-user-i2c.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
>> index 60eaf0d95be0..45100a24953c 100644
>> --- a/hw/virtio/vhost-user-i2c.c
>> +++ b/hw/virtio/vhost-user-i2c.c
>> @@ -128,6 +128,16 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice=
 *vdev, int idx, bool mask)
>>   {
>>       VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
>>   +    /*
>> +     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX=
 -1
>> +     * as the Marco of configure interrupt's IDX, If this driver does n=
ot
>
> Copy/paste of pre-existing comment, still I wonder who is "the Marco
> of configure" :P
>
>> +     * support, the function will return
>> +     */

First patch of my last VirtIO series fixes these all up.=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

