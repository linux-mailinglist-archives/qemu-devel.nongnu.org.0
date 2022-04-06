Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAD84F6705
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:36:31 +0200 (CEST)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9a3-000550-1W
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nc9YZ-0003Px-Pt
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:35:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nc9YY-0002Ue-8k
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:34:59 -0400
Received: by mail-ej1-x632.google.com with SMTP id a6so5876297ejk.0
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AmpfOyQxyvWEbMML3ftIoVfE4fF10HXog3DDf8BBwf8=;
 b=a8fRcwcgax4Sw52pFyYyv9sjPw73rrtFp81KZ6mGFb+yAkj8YXI8rBLGkPbdLHvrhr
 dF1D+5UQPq/3x3SIQbgyUFinrKtQT2pRKNopH6r+6X0Fl2d78g/WIN0IPpsF05LQYjx5
 QQHfU3Hm3wR6JiyTajTEn8mJNMpMMlIKWYWag2pNRHkTbo39f/C/G9bXIrzo445z32iM
 UpA4ry35D0x4RVEh+6AM0lk+yaMK9Uy2WNAvkFgCD1rz8CkB6Or9cqLVgUjMy1kPLQoE
 eN8SHd2s0N0IZTld8DZ36AdrqHhlnT91PHLBDDi1IkSPZ8HmiMT6ZaoaySn/KotpzejS
 zuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AmpfOyQxyvWEbMML3ftIoVfE4fF10HXog3DDf8BBwf8=;
 b=wv6cvHl0xCL8q9DYgK9W8jeXbh7xVhLdz8/dkpeGs7T73am+75p3FUEPAlE7wouhCR
 I60TnPR1EOWbZSGEk588c4W+LxKwzWxSbRKTJ4V7Y9Z8kpwXyWvBYyYpeBN/5eiJHnbx
 A+LmbQG6Ehn/ek1AbaCoH8uAsFz2uuFuETX0lp2xMQmYomIySHB66MGGoL2Utrlj8sJ8
 R2pkmA+blOqXymckUnZusGKMT6eGPXEXNd99naARUMly3eo+RydjsPk4Lmz8JOPQomhj
 lVGusYxy07d3Xu8Vt0ft5csbpnu/dDjy7wbT7HTT0t9z/MYZsDdOS51purqenVIUgygW
 kdAw==
X-Gm-Message-State: AOAM530F+I4NIGWjlfgKe3zGUrk3B86p4xnL6x+Jdcpe+QsdLpG1rvzs
 pbkMI30yglQ+W1LbMSc66sRh2Q==
X-Google-Smtp-Source: ABdhPJxURaFcT41hDkcIzP5Cp5QlP43ACyb7jRx9pNGSND8YNpCTv3xXiISfalViOxFOCGfYoRgEXg==
X-Received: by 2002:a17:907:c018:b0:6df:e7d8:3397 with SMTP id
 ss24-20020a170907c01800b006dfe7d83397mr9290232ejc.143.1649266496826; 
 Wed, 06 Apr 2022 10:34:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b006a767d52373sm6688323ejb.182.2022.04.06.10.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 10:34:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01E081FFB7;
 Wed,  6 Apr 2022 18:34:55 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-5-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 4/5] tests/qtest/vhost-user-blk-test: Temporary hack
 to get tests passing on aarch64
Date: Wed, 06 Apr 2022 18:34:15 +0100
In-reply-to: <20220210145254.157790-5-eric.auger@redhat.com>
Message-ID: <871qyajetd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, pbonzini@redhat.com, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> When run on ARM, basic and indirect tests currently fail with the
> following error:
>
> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_ele=
m:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>
> I noticed it worked when I set up MSI and I further reduced the
> code to a simple guest_alloc() that removes the error. At the moment
> I am not able to identify where ths issue is and this blocks the
> whole pci/aarch64 enablement.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Hi Eric,

I sent a RFC patch which I think avoids the need for this hack:

  Subject: [RFC PATCH] tests/qtest: properly initialise the vring used idx
  Date: Wed,  6 Apr 2022 18:33:56 +0100
  Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

