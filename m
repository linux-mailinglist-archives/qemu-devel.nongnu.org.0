Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9F39F4A6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:09:50 +0200 (CEST)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZcD-0003GJ-FV
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqZbK-0002bt-Pn
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:08:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqZbJ-0007ef-45
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:08:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id a20so21173762wrc.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4w9qT2s05NUwpAGZ0vfExG/hlx55ZRY+ADV1j6HD8As=;
 b=Ig5Bkparr3u9uVRzl2sKZheaeJ6E+4u8V1QrioDm/8pDjgkKE4q/JjsuY6vMk3jgKk
 jzkBDxQgLtd5bs7CybVEkvuJ35va7TumIPf/Fl5CSrxrNor7/GhgUke7ip6Hlp0JREoT
 bV48Cffyz8jqzwKyAXiLoUluL35IN5B1eHsNIuph1q1Dpad4LYi8qqvkne5XlMr+4Edw
 zE8X2pEQky5yVG2Jl60LXRnUx5yx9CPyHT4rZOTpZ8wjgjhOEUtTvVnCqTwOPmGeGOb9
 VulAcq3pSdKHtghZsscq3oUCtPstNMDk9IELA7VCflV/7QC/3MZCdCbqT+CSCiE3Eoan
 VA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4w9qT2s05NUwpAGZ0vfExG/hlx55ZRY+ADV1j6HD8As=;
 b=BHfTV94wLDai+zG3JaloIcElXXT7aZenRVzxWp73RxFmWGs2jRXCV+93OWBKlIg7NH
 Rhv0UjzRWMarw4CklU+pmsAhE8cY2G6h+TJivZkuN3iG7zq2qdABq6oUws2pkiwNDZbP
 S/WbwYaPAjQKJYbUKWjs8lo/eIR2RiB09J4eRTtBXGv2bMnytHHmOb/rTUA19NKxvbPI
 a629YoEOROLFzkmFYh1hQRjr5G6IV0q5Fn8fjn+6Uw8GBqxud2DLdqT8RrjvsCmCfdKM
 lvZ8zN8cHUXkp01OrsuX4xh57KNfwG7rt+yKvmLYXoTUcfmNmpqLNa7iou3vpo5P98ab
 b9kQ==
X-Gm-Message-State: AOAM532ziCsXInzfcvKk/6YvF6fHROoJFoI39hHK/srQJBp0CCIin4PB
 yaz5dEfKnkHhbfI5RcW5unOPl8wgp3W4xQ==
X-Google-Smtp-Source: ABdhPJzzhYsTxEaRbUaEnG7FS3VNKmVTEYQeuCYdxEeX5EKSlxiUMxPlPwzdgEiJv+d7OTo62fm5lg==
X-Received: by 2002:adf:f711:: with SMTP id r17mr21747095wrp.69.1623150530564; 
 Tue, 08 Jun 2021 04:08:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm11272065wrv.67.2021.06.08.04.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:08:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC9161FF7E;
 Tue,  8 Jun 2021 12:08:48 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 04/28] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Date: Tue, 08 Jun 2021 12:04:35 +0100
In-reply-to: <20210502231844.1977630-5-richard.henderson@linaro.org>
Message-ID: <87eedcmx4v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> All callers immediately assert on error, so move the assert
> into the function itself.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The change itself seems reasonable although I do find the return values
of the underlying tcg_region_alloc__locked a little confusing. What we
are saying is the initial allocation should never fail but subsequent
allocations aren't actually fails but creation of new regions?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

