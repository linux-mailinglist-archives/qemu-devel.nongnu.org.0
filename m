Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140063F068
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ibs-0005yK-Tw; Thu, 01 Dec 2022 07:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0iam-0005tb-JO
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:23:16 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0iaU-0006kW-Th
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:23:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m19so1036489wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAyBhoz/alhq0qQkmUSt4I0if7PHnFXtkOIWbSuwCyw=;
 b=Z0FmOhqcxd0Hm8WExU0jhq0c8pewLk+lG6OaTUFMm//j0vXWTJypXqxHTZGLolp5mk
 2P8qtMcKqO0V3pfr1L3ERyC/QDXAeuxnqD0ngQiQfgo1HAjmJd40TtPW3FvanEfnkl1v
 yDc5juxnPJjtn/AEYUvzmctW3fgru1SV2JSQLl0tvyd40RdPTxZeoqi4+t7k8JFas6cS
 OyN3hErefcSqYsl0OltwUZvH+Y9+gLs2NMMYwhWyDuMBi1Hu6x2q6npH1pp2nqoZ7HI8
 3oKOUiM1YQMGLkxOe3/86jqZR5JRx4cDtelfY5Litt0ymz2p4banwkGfohalXJurRjPT
 G5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XAyBhoz/alhq0qQkmUSt4I0if7PHnFXtkOIWbSuwCyw=;
 b=ENuvz+CY6jvhwEuq4SZNaa91jBw6bVKqZi6eo+YvnkD3tO38QvW6X4F5+Gn0Wk5GW7
 B131mDXhFIwAir90NAwmE25LJE44rQVJZmnviVR6RGSyq2YfWztYphxFZrkYKpApBF8h
 KCZJdwMUGCs3ODAc6pUZqdpGUbYFb0RHSXQFUoy+zVDf9neE66i8Wldp0NOLNq+MmbvS
 tA35KqER3kcPbm0VU0Nj4BWAV8l5z19O2a4TXsBkhdCe2KAoeUCN1wv04S7SjHtyGDN+
 FcAsQg+LMbBL5+W3PFetRkzfQZSKpHPsAaKdmjYfQNB+0bFEbzaM3l8A/BT1luQb7LwC
 Mssg==
X-Gm-Message-State: ANoB5pn3GpZqr4+uh8cv9llU7VD0rvZ9M2Cw7iQdSPFXuo6vsOrJmnwT
 dDqApZbdiZCWRGHFNcc+iHWzjg==
X-Google-Smtp-Source: AA0mqf7Jlgobyv/BhAPq6vvfH31aOzHx14lYX2OF7mILUTLCkR1c1/1Qgwq5nlLE28w/+CtkuJsPJQ==
X-Received: by 2002:a05:600c:2296:b0:3cf:baa6:8ca5 with SMTP id
 22-20020a05600c229600b003cfbaa68ca5mr33936230wmf.178.1669897362354; 
 Thu, 01 Dec 2022 04:22:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a13-20020adfed0d000000b0024219b1cb1bsm4311920wro.60.2022.12.01.04.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 04:22:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E7921FFB7;
 Thu,  1 Dec 2022 12:22:41 +0000 (GMT)
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <Y3+5rfnNmR7R/h6/@fedora>
 <20221125081243.a3q7ep32o6g4r2vd@sgarzare-redhat>
 <Y4fFICp5tBrEPud1@fedora>
 <20221201080250.s3cugnnkf5f4kqvo@sgarzare-redhat>
 <87k03bctrj.fsf@linaro.org>
 <20221201052647-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 virtio-fs@redhat.com, Mathieu Poirier <mathieu.poirier@linaro.org>, Fam
 Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>, German
 Maglione <gmaglione@redhat.com>, Jason Wang <jasowang@redhat.com>, Raphael
 Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Date: Thu, 01 Dec 2022 12:21:21 +0000
In-reply-to: <20221201052647-mutt-send-email-mst@kernel.org>
Message-ID: <874jufcnzi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Dec 01, 2022 at 10:14:39AM +0000, Alex Benn=C3=A9e wrote:
>> Do you think rust-vmm's vhost crates have enough of the state
>> management to manage vhost and vhost-user backends? Maybe it would be a
>> good experiment in replacing a (small well defined) piece of
>> functionality with rust?
>>=20
>> That said there is a lot of deep magic in the vhost-net stuff which I
>> think is down to the interaction with things like vdpk and other network
>> optimisations that might be missing. For the rest of the devices most of
>> the code is basically boiler plate which has grown variations due to
>> code motion and change. This is the sort of thing that generics solves
>> well.
>
> Not sure what you want to replace with what though, libvhost-user or
> vhost-user bits in qemu?

The vhost-user bits in the main QEMU binary. We already don't use
libvhost-user for most of our backends anyway ;-)

--=20
Alex Benn=C3=A9e

