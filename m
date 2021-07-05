Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2B3BBD8C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:36:20 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Oln-0000jp-Em
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OjG-0006Qb-GQ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:33:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OjC-0005Md-Oc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:33:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so3479059wmq.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s3GGNerN3BQLFmI/JEAfTO9BH/N1N7gjtV8b/R1WstI=;
 b=O4wQy7p20WK+Vw/ymnSRR3+z/PNr0W0bsrbiTvefscSD/VKznhBFUswpcID5cZSwM0
 ATNvmHGaFB5Nh5VkcRc+UawLabZbtgfS2zmOS0gvOvs31Ana5ygnmbg7sEYq5mTI4hRu
 dlB1NNGhQiRAPpU0KbXNJN0d0LKv7Xu2WGFytA4J338M0xyMVxD1cBeUEl72A3fIZXpA
 s4OCm7a/Jw83z3t8Im/CmLb7h07ooDjHyh4cgVbNpa/utQAro7vjawawUexGX0SVhHIG
 Y1fJy7YdfTJtOS/Iajw071dvAxaOQBf4by14RRNwnpPe3ipDu46s9VCtD9/yD6XxsdE4
 bF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s3GGNerN3BQLFmI/JEAfTO9BH/N1N7gjtV8b/R1WstI=;
 b=TsJWn5DNXHUkI9axZ/v94UhnKn9tZlnE2XFGjM+VEjGMGlt47527BQWQEdewCdHlVh
 W/ks/YL1YU5qZ6bW5xhLwv8yL70SaQpBdiMNMyPbBOf8oL0D1LUpwoTTH7RQ+ZDtVsCC
 J/BgX8S4+4UkJY5eWuzJSjIa6EeUAvKrYNtoSOzgc4WZ51ht4P2wRXYHBOXvrDZie1XJ
 NMHwGKlrYhSdUIhzmijf2ZOaZ3euRvn8ehEjPInRmVTSkWM+Isphe8pRsUhd1Bf8I7z+
 y/PLMCqxUkwEfM9IJmRaasQa/C3q6tn9mTDwbeemm22oEF6M5t9/4965PE7VCqCRLUuP
 Igqg==
X-Gm-Message-State: AOAM532diEbkhYSrRYH27jJOUtYlb/hQ8h8To8u8tsqxFtms5LxUlM+s
 VkTbquaiJVHu4yQmcvf1xnpNRA==
X-Google-Smtp-Source: ABdhPJywf4jQjrSgnP9lE2P9tZbdkwRCTTWlOER0qWyEYt+290Pu5pOM9ndzkImpzc+jnKY/GXcLSg==
X-Received: by 2002:a05:600c:214b:: with SMTP id
 v11mr15405171wml.95.1625492017454; 
 Mon, 05 Jul 2021 06:33:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g125sm15448888wmg.27.2021.07.05.06.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:33:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 156581FF7E;
 Mon,  5 Jul 2021 14:33:36 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-7-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 06/22] tests/docker: fix sorting in package lists
Date: Mon, 05 Jul 2021 14:33:31 +0100
In-reply-to: <20210623142245.307776-7-berrange@redhat.com>
Message-ID: <87pmvw51hr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This will make diffs in later patches clearer.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

