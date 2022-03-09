Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025A4D2ED1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:13:54 +0100 (CET)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvCS-0002Vr-Kc
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRv9Y-0001CR-MI
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:10:52 -0500
Received: from [2a00:1450:4864:20::634] (port=39720
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRv9X-0007zB-2q
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:10:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id dr20so4488169ejc.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 04:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KiK+pXRjvT99pa3j2wZGfRqB404LEiiIXMdE4FysbUs=;
 b=twlFQBobnLi/26NkwpGY0lHqvQze88PY/lCrH59xY0fH59RGeF7e+sOg6zMRmDcV63
 xzB9e9NhZSREiAd/4CMHGRb38KagxPaWWb+hmoieTHHYHfX44kX0ChApuw1j4+KZjEoF
 V8F2ULZRQyWZBpYnaXExvJy32o68xcU9m8Oau5B9a77qWWM5oTEgXrmNsznuPCzGV4MF
 e2E6Ort/HRMCZzKXf0acm7XpRRKfvRYLxLec6U8gEmmQNyXSEoHP16e6f72n1iRVr49y
 a1PTdMIYDkC6ylAAZY0bEIodNyWogzzqoajNxgG9Q5bAR9xHpHMW90wyM5osHjV/D0cS
 OZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KiK+pXRjvT99pa3j2wZGfRqB404LEiiIXMdE4FysbUs=;
 b=hhyh0mT2fVQKXuvD7CSQfCp0mk89SGhPc3JvA1iZwmOUlBt/Oy9bshNCW8mYOxAWvu
 NnaOG4NtMjUPGKVqPusz64PHEBFMcqYvg+zp73q3liscSkyVmFjEPlaA5dEdexD/C7wb
 AwatUD00mr9mTJgNEFSHvTeM27h8QNFY7etyJnrGVBu1mt3nADRr0lbT4Am0tWTMsjbc
 9lfF4Ko238HLb7oAT70xHVbNlcaqn3fVSdGIjNOgtOQo4iZ1StG1Bsqj94Ry/gYC03tC
 lhkwh4ycwRcmHsGGtZRnNALFMieU7V8qya0XoapHZU2tNHOG0CEfCmNKmSpghOOl898l
 Ye+g==
X-Gm-Message-State: AOAM531zF9fGq3lraL8+h2RLtCL/nvdBaiFEsd720BVjIgp8dZWMeeem
 9rqLsKlSmPNcJmAQVA9c5f6VCA==
X-Google-Smtp-Source: ABdhPJyPxyrtUFs+/HYUjjpjUjESbpE1HdFKGFOG7lcvr+8DZs/1BvS8rOKFiEC+sZZViyH9/C3j8w==
X-Received: by 2002:a17:907:7e8f:b0:6da:6352:a7be with SMTP id
 qb15-20020a1709077e8f00b006da6352a7bemr16942745ejc.612.1646827849546; 
 Wed, 09 Mar 2022 04:10:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm660074ejm.188.2022.03.09.04.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 04:10:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2E1A1FFB7;
 Wed,  9 Mar 2022 12:10:47 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-10-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 09/11] edk2/docker: install python3
Date: Wed, 09 Mar 2022 12:10:43 +0000
In-reply-to: <20220308145521.3106395-10-kraxel@redhat.com>
Message-ID: <87ilsn5nso.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gerd Hoffmann <kraxel@redhat.com> writes:

> python2 is not supported any more,
> so go install python3 instead.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

