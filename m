Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F5348ED98
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:00:40 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8P0J-0001o7-9d
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:00:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8Oqd-0005tk-7e
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:50:39 -0500
Received: from [2a00:1450:4864:20::42a] (port=44794
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8Oqb-0002WU-Qx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:50:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k18so16272734wrg.11
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jjL3nGg/OQddVTNJaFFjACgxMoHd15okBdRJg7qQzVM=;
 b=nrG6oOw9QfFEtjAQaqoAD+iQa3EEAd+XtHtx7+VtNw09eTw2ejMewY/IlkVMovYKNh
 HvSK7vRu8PhhTkuMSxTc6VPDNKk7MEicx+U3wmnWzLrwxl/YUet05FRC6n6PIVzkocPW
 B0Uzk/WC+yj6PuRS+WdhvQW7YvH/VFck8iza0Vr/rWIgib/jw+Jcezm69eyTHvtqo2W2
 AauKB9b1IoXQNZX7HP1j6Lv7QebLClpJA8dtvRe7HC6wT5z1asm1OsZ2jn6TiswMiV8u
 p1cmxidnXjo/PkuAJCElHTSNMrOUnQjHYzWDeDkTpzXzeQPs6NWDDb8KiJ3MxmCUhy/9
 1ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jjL3nGg/OQddVTNJaFFjACgxMoHd15okBdRJg7qQzVM=;
 b=LqykFgXlNrCfG2P6GgODgyUAGpDCD3JB01w0lE2eUse1AeZzAo+FVPO3ZY4ptUtQP/
 G+zgLcfn1lFevqkoKcRmyxDKUe5t4TFi49RBud4PyfOqNze2Qd/zG2kUdXkJONZYgF4s
 KN5M9/M5LpdDVpBCZ+jjaa2a1NrGhkVYoiR5hA9jN32giSbmpEvsTNNABwLtCgpurPx1
 NEE5CoLZKfXRmuf/iV0tJBJlc2MVAN+fZTROE5PulvvpNxHJoEJ6iKRest00LElx5+Nz
 llHfLBv/tbU1vgUO56qYu3MyZi2TQ1JXeW86ZVpe3dOAHYYGkcYZc8nUDG9oXgx03T5H
 iskA==
X-Gm-Message-State: AOAM5331Ni5H2GGyL31oamlyPrzHkv+iZJAfj0eEXrlUw5uPfzVgN0KM
 5NCS7F+lE2WwmVz+x3T/gjX1cw==
X-Google-Smtp-Source: ABdhPJztFMhJB4jfqly+1X/yjSstyCt0D2/Ld8M5R80lze/YDj8f7kNerB1MioF9FTq/eAdKXM3Jtg==
X-Received: by 2002:a05:6000:15c2:: with SMTP id
 y2mr9177973wry.202.1642175436364; 
 Fri, 14 Jan 2022 07:50:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm4360101wmq.41.2022.01.14.07.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:50:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA3041FFB7;
 Fri, 14 Jan 2022 15:50:34 +0000 (GMT)
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Idan Horowitz <idan.horowitz@gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb
 range flush
Date: Fri, 14 Jan 2022 15:48:54 +0000
In-reply-to: <20220110164754.1066025-1-idan.horowitz@gmail.com>
Message-ID: <87ilum8gfp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Idan Horowitz <idan.horowitz@gmail.com> writes:

> When the length of the range is large enough, clearing the whole cache is
> faster than iterating over the (possibly extremely large) set of pages
> contained in the range.
>
> This mimics the pre-existing similar optimization done on the flush of the
> tlb itself.
>
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

For multi-patch series please include a cover letter which is the parent
of all the patches. This is the default for git-send-email.

The code itself looks fine but what sort of improvements are we talking
about here? What measurements have you taken and under what conditions?

--=20
Alex Benn=C3=A9e

