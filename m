Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BD472BA3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:39:20 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjfr-0002j0-V2
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:39:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjeX-0001pI-9l
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:37:59 -0500
Received: from [2a00:1450:4864:20::432] (port=42767
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjeU-0001lN-Tt
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:37:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so26471604wrd.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kYPlsICG/XFOEQa3rbjDxd7e69asP/0P5b4muSQyS4s=;
 b=JwVPyUxrKdAbomzZGcOv54iqOGyPajym+otYJcQDu/zpnvjLHkCtsWAQM4tIHkh6bf
 DhPrtxEMoh0uyBlbE3qSkTmmnBCW2LAm3cE5JHY/xtqDBbSQQFeRUeluywLg2AWA/Ert
 q7tEyvwpIG47ezhL3VcRXyNPXZ/EyvB/2rMbQUrqvIPi9cjE7RpKefYL67BOgSwdSXlV
 xtljxKFmEYuDqnO8aXJbf6k5vU4vtbLjVdb24TzQENOLAKvFJzd3KlDwgABhuhjpEciH
 E0K/XNSOF7EuYkdBZYEE56S+UnCKCKvAQHVJ2tx/wUG1osK4t3a1Crx2p0eFl4tv/dQc
 JsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kYPlsICG/XFOEQa3rbjDxd7e69asP/0P5b4muSQyS4s=;
 b=hFRZV79vygP5GWkW3TEMnwmOUmFrmA0tfgFvIKsuQZu9ApNZ94UqVMvqHs3ozd1q9Z
 2rbJD7ml/X06qRfdF5cvfARwi0vFBq7uKMQ/rjyQwJTMtzq6l96olP2RK+HFbMU/rL2U
 MgQc/nCGzBTeiJRlytcr21eWHFguQ2GAcHBJq0oc1O+aFHfT6iDmV6aEZYKn0yTAZIT0
 WABLumltNPsSIEB3WLKE+BAadkVcZXOYuiK20kNIFJp/LHFRp18n2b0fjoxG36Y+lHOY
 o5ctNPbXg+oDlwf3F4SvmTli347wZ5BDCTl9B8X77BpfOe7Wk09aprvd4z2aVFNNP9eQ
 oUTw==
X-Gm-Message-State: AOAM530ph+ee9SRdEdgvlfTCTD1MqmGywCO9lj4e9rpZdTjsm/it14rB
 x/AosK6fT/8mp9/TEIGIjhVZAg==
X-Google-Smtp-Source: ABdhPJxdpBNMdu2F+w7MkhL3PnGctocLMLTaOqoezFN2W4tvhMXZ06rqRG728bzz+uLNi/CFBYO4zQ==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr30936812wrd.33.1639395469950; 
 Mon, 13 Dec 2021 03:37:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm7488751wmq.34.2021.12.13.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:37:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A4651FF96;
 Mon, 13 Dec 2021 11:37:48 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-8-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of
 TableDesc entry_sz
Date: Mon, 13 Dec 2021 11:37:42 +0000
In-reply-to: <20211211191135.1764649-8-peter.maydell@linaro.org>
Message-ID: <87k0g8n3ar.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> We set the TableDesc entry_sz field from the appropriate
> GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
> number of bytes per table entry minus one.  However when we use
> td->entry_sz we assume it to be the number of bytes per table entry
> (for instance we calculate the number of entries in a page by
> dividing the page size by the entry size).
>
> The effects of this bug are:
>  * we miscalculate the maximum number of entries in the table,
>    so our checks on guest index values are wrong (too lax)
>  * when looking up an entry in the second level of an indirect
>    table, we calculate an incorrect index into the L2 table.
>    Because we make the same incorrect calculation on both
>    reads and writes of the L2 table, the guest won't notice
>    unless it's unlucky enough to use an index value that
>    causes us to index off the end of the L2 table page and
>    cause guest memory corruption in whatever follows
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

