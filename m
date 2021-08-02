Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A738B3DD2A0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:08:24 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATvr-0003kL-Or
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mATun-00027w-2R
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:07:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mATul-00056B-BQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:07:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so7839453wms.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9/8+Wvq44hX2gNggCNp/1M6G1d8xJ5cTFIjDSijrzBc=;
 b=Jt/iNfS6i6S7se38rGHAtAjdncEiWYfktfOL76+lAueumgtlSyPn1E8Q0W6QfBl7m3
 Axy0MuXHJqRK0W0Y5qfh0XhVCc8OwJacGjQERHB3uAUFg4BoehvLE+kUOh+OAv4gNhwt
 KaKt7gzdgDVwT9r6/+bLI5IFGQocDBNyEo+uZR3wNrhgjKmaoR5TGwiQkTZeqh2wOJoK
 qa1gyf2AvO4g5waSYkQrwkPhdU+VmcRKVyV/f72bhSeEassIBMg8lhxT9oQL4KDSdzGy
 FhRz2esB7WN+FwODCmJHnRT2DIxlyA+/sILu5mKicJ6/XRNJlORz2vixi0AcN9PtadxE
 bJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9/8+Wvq44hX2gNggCNp/1M6G1d8xJ5cTFIjDSijrzBc=;
 b=fTzUMZ3Aa9gJsH2SrUoSIEmJcZ7t28h4NhjpWIe4IKGJQQ/W/foneDC5z2CIGAoy9o
 luOmsqYOiPR7HN614jqcLRd6FIq7VPG62I/Zdiyql3S5JvrUdIFZ1FtaSXD5Kfg1e8Xo
 er0IRHeXxci5v4vDPYJKQWM/F7ZEbkIaiD2RhDiGfWbulmSd9uVd8wnGyMqnSt3et+ba
 U+BrDKFaURwQc+RLGepRBDNGs7y/mwM2TFLgwvGEYAzHXgamQKJSpwPj1qLea+9GdsvH
 VG6QMf1wwdisfkBBES7bsbesMieELlGtpBdZ6YQghY8RhnnKrmpsfdmO4usQ/auO0T5i
 8uBw==
X-Gm-Message-State: AOAM530Y+wGg57mLXxTCnvD31hPgPHrKrBSIaeiwu/IjesbGJmihWGIR
 Tlj1awZn3B21RKVG4GP70nXQ/g==
X-Google-Smtp-Source: ABdhPJyEaK2MQm3rBW28EayZ4IsVYcGq4aBHymv9H/ZDRcpUxLqOImSOfE0pqPzIIXWxW1MbDoxjDw==
X-Received: by 2002:a05:600c:4f05:: with SMTP id
 l5mr15898001wmq.96.1627895233212; 
 Mon, 02 Aug 2021 02:07:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm9534434wml.24.2021.08.02.02.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 02:07:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D618F1FF96;
 Mon,  2 Aug 2021 10:07:11 +0100 (BST)
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
 <20210730135817.17816-3-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 02/13] plugins/api: added a boolean parsing plugin api
Date: Mon, 02 Aug 2021 10:07:07 +0100
In-reply-to: <20210730135817.17816-3-ma.mandourr@gmail.com>
Message-ID: <87mtq0gqps.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This call will help boolean argument parsing since arguments are now
> passed to plugins as a name and value.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

