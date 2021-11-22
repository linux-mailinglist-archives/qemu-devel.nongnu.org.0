Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68B458F5F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:28:12 +0100 (CET)
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9Mf-00011y-VW
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9KH-00089W-72
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:25:41 -0500
Received: from [2a00:1450:4864:20::429] (port=42824
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9KF-0007n1-LI
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:25:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id c4so32661242wrd.9
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VciI4mD+64AnqqnlGndErcV/UESzz+hkZ7747+TM4ks=;
 b=Phbg0QoVlQPlY86Xgvlcdw4R3QzcO9uhIhjhprdQzt4fTFtBHiTepgW7cLk7ka2ACH
 giQABigsfJQAyH4OmRbhnabVNbjyrSyDnmxh+owXLn9YHc/d5SpHoq+q81ugjoZJfLES
 9i6C9TGC32PGVusf4KpCskDMby1k4zzb3Q5CifMolt3ew1Q/V1H2U+liD/W2Da31WWGR
 /Zg0bZ4CnIgpR9LgJXkvXsTHkki2VzzGT2gMgPO1bWTCrbRwhYK7lCcsiuePmlfP/jNy
 RGWjdlyaPcYMZbzzB4XoSsQ3qOqkvAlT4FGws22YK1xlH4WPRTMPBmSEWGk7eYXnn0lw
 s9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VciI4mD+64AnqqnlGndErcV/UESzz+hkZ7747+TM4ks=;
 b=6/OauBobYtQGOoI/0GBcKIcNjPdqtHYarxti+75d+5ICe579Fi8u9KpaYYdTBYIQD9
 pFoI9DbplUASLR5f8iUzftYeOVG+z+9RHOMLMTPi7entRa30BxcWSU32VnWJkOVQG7IH
 2RWkKW7H4UH9XZXtTsy7pM3K9Mdo6zwXRAU9E6oeBdg7TtX24mpwuMA9Gf+TKSuKODXS
 gBRzdXwTD2Z0QvTOBoxCzekQHDlNclsD5v5e8JEHzSAxAijWH+p0oe840pIaWO4lZDDf
 KUsryZC5+mePZrcZwyawAtq85oTZarhpGlODokspFY9TgZlnK0JTD8bDCUNMhEgsdWwH
 Yy0g==
X-Gm-Message-State: AOAM530F9pDXQI1IfqvsEV0QhAxW5WZV985eASb5eXe9paqq3eOfRX+H
 XE/ZR6lk9V+3P1rT7x6TQY83UkgTJO6JJXo4tFKCtg==
X-Google-Smtp-Source: ABdhPJzv87blkIC4n0JRn1A8tF7TWsRUbLmAU4vYgC2boqHHfkNiHSDt4hX5sVfPFLwORaRrybUsKCkhjep555b7kwI=
X-Received: by 2002:adf:e984:: with SMTP id h4mr38390899wrm.149.1637587537571; 
 Mon, 22 Nov 2021 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
In-Reply-To: <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 13:25:26 +0000
Message-ID: <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
> What about simply replacing it with a new sentence below the bullet list,
> saying:
>
> "Please also use a spell checker like `codespell
> https://github.com/codespell-project/codespell` with your patches"

How many regular contributors actually do that?

-- PMM

