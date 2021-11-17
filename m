Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F84547E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:55:40 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLPX-0003kq-IX
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnLNp-00035r-BW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:53:53 -0500
Received: from [2a00:1450:4864:20::32d] (port=39643
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnLNn-0008Sp-TP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:53:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4862912wmr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pxYhrcQ/bUCFEe7Ofh6ChYVKvBlp26lsf9JXNKydumY=;
 b=gIqNt4c+9NUYtHp3sQE0e7RI3V9MPRwT/6Dx4uOJyvwL4orqd0KlGAIPchtMZgIrSd
 6Xu9WFAESXMjbK39FeWL3daivsWtbgWaQFiZZ0KzoSBDfguJ8gSlgpZD0yueiR9WaLbS
 4IJhlHZrBdyIMKd2c+WYztOmcRnyxEcMI/ocRPnHs0a5BALkxYlEFcWR0Tlekslreef5
 aWwEHV0udnRKsUSguOoCwKLcr8OmBiNqan2FqBBNlVVdGS/0x1OZFrlwGQlMfbEYjJva
 E+s9WBJsWMEn5STsfbMzjB8rTaij47K+IBN8SLN/KG/YMraoDtZJWa5Y6S2BsytWS3Yi
 ByNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pxYhrcQ/bUCFEe7Ofh6ChYVKvBlp26lsf9JXNKydumY=;
 b=u83tMXwPeIaDZLlgpP+yGkaSpjEwXyx7iiVHa7F+cNb4MqZw4aQiRn3QVTVRgRot13
 CE1Awb/L5I+pmj7DOpnfxViVEpPTD5M5Q1/HbVeLLsZs0xZwhBY/MTklrvbylguXkFIM
 1Hg4c81ZHFlNOVWBIM1w8TOMcQ2B/djbBexZsM/ADsJJugpTxwB6o6+MYmqsVNsofIEI
 aG3fPQwPm2G1I+nT84yfXIV+MTEWflWJJIfJEByI51mn1M7Lvo6k+nN4Y2WGT80qBcIl
 s0u8kDHW6Jztlu/9RwXPLmnz0WKmdWzg6GFHTNWk5Amr3vlNmSiEJTXromSSvLz03589
 iOIg==
X-Gm-Message-State: AOAM531If4FilhNPkaRmS4LMGSxsRCusmLYXa7aObIA1vBsXeeE6oECX
 VxtlajPK//Bc3ogk547/4imdTQ==
X-Google-Smtp-Source: ABdhPJzJha1q/gGVRXjYDgJgPE8ak7Y7+wnTet2sh0Y3N9bpnvySmCVIJZgWTIQyznWQfd5r2py/2w==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr29181850wmg.71.1637157229818; 
 Wed, 17 Nov 2021 05:53:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j19sm20614531wra.5.2021.11.17.05.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 05:53:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFB531FF96;
 Wed, 17 Nov 2021 13:53:47 +0000 (GMT)
References: <20211115140623.104116-1-thuth@redhat.com>
 <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
 <CAJ+F1C+kTL_thUHtaQ1pxPN360E39aYA81m=8efaYrKhzXyaFw@mail.gmail.com>
 <623c1883-4ac9-e615-7a58-b0d781e19aeb@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Date: Wed, 17 Nov 2021 13:52:57 +0000
In-reply-to: <623c1883-4ac9-e615-7a58-b0d781e19aeb@amsat.org>
Message-ID: <874k8ax504.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/16/21 08:05, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>=20
>> On Mon, Nov 15, 2021 at 6:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org
>> <mailto:f4bug@amsat.org>> wrote:
>>=20
>>     On 11/15/21 15:06, Thomas Huth wrote:
>>     > Gitlab also provides runners with Windows, we can use them to
>>     > test compilation with MSYS2, in both, 64-bit and 32-bit.
>>     >
>>     > However, it takes quite a long time to set up the VM, so to
>>     > stay in the 1h time frame, we can only compile and check one
>>     > target here.
>>=20
>>=20
>> I wonder why gitlab does not offer the docker executor. On the
>> freedesktop gitlab instance, they have windows docker executor, which
>> speeds up the build time. Maybe we could also have our own Windows
>> runner for qemu?
>
> We could, foss.org provides the QEMU project with x86 VMs resources
> we are not using. What we miss is a sysadmin willing to setup &
> maintain a such runner.

I think we might also have Azure credits from MS, but the same issues
about admin and setup probably exist.

--=20
Alex Benn=C3=A9e

