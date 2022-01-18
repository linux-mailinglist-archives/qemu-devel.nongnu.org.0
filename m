Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF2492C83
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:36:11 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sOw-0007wy-LN
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sKi-0004Sa-9J
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:31:48 -0500
Received: from [2a00:1450:4864:20::32c] (port=55240
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sKf-0006lI-Jg
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:31:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p18so29333719wmg.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CsXrGHYOV28f1EmSGitQt8xbKYy5teeqvo+LrFuNNs0=;
 b=FXrRCHKZpiraQ4v0SHx3/GHWMZu36/KjbpHhJde9sRXN4eJmgN7I6XbTm9Q3lkBRhp
 ugVZHkVaRsr5TjFzOXK5Ik6xdGU79Ilet5L/vdtr4GIdeHFtKHkLWCzzOHhNeTVQHW8D
 wAOePpogDRwFAk7qPbusg06zhCwgSlaFYV6zTs+JVN7PVmzEKIQSQzsZtlb5m9S6PSL6
 rEe/P/8ypdwE/aYiLT8PVketjiBgeXFXxLSAugTb8dql1er3lv5EHeR2n3MNGMAM3RH8
 4D+j3YNHG24JUiicMf0p4xjmu2wJkghwxJYJgg2GWqzCCHhQQr46sd5V4GkSgU9YC4jn
 fwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CsXrGHYOV28f1EmSGitQt8xbKYy5teeqvo+LrFuNNs0=;
 b=nLNrADCUS7ycfhASG9f56zoPCU+gq7jPn3S3vGTJcB3xbwUWwsPNEkS9BOuVrMLFc5
 /ytTf0My9rHUrn+p8CvNf8861FT2NqmaKeZXGNBLH4P0qWH0N3TxGdZppnELCtPg4CDR
 UOX9dk9QhHbGCbCIYZVXzm9buIbaN0YiaVhea4crjvOQM/g9llSjgNq5BzfF0jM2C4rt
 1vM/YIwyERI54mRw1H28dvQcQ7OUIE7E1OCdVVZxhvLL6JNXW7NCorhW0FweN4hCRFxi
 EuBk2krJkKzfup+VIoT5AOzAkNVv9wn7jMANgieUBpeC6Tl1Cuz1pPt3gobiTYi2YqSc
 fGVw==
X-Gm-Message-State: AOAM531tW2xv/Thla4eKs0oQl0bi92hBSuUDDwc60KR0seJ/PJzieoBg
 YsULV13on878VVdDlg51gbFzEA==
X-Google-Smtp-Source: ABdhPJyEimVMYk4xfYjD+st+4Udo5nSbzQ4mdVRLln4a9e8YQ5pRVMxghtk7nQv9kDBIL1gobYyHHA==
X-Received: by 2002:a1c:a90c:: with SMTP id s12mr21621180wme.27.1642527088409; 
 Tue, 18 Jan 2022 09:31:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l15sm2786391wmh.6.2022.01.18.09.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:31:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6C0A1FFB7;
 Tue, 18 Jan 2022 17:31:26 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-12-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 11/13] hw/intc/arm_gicv3_its: Factor out "find
 address of table entry" code
Date: Tue, 18 Jan 2022 17:31:20 +0000
In-reply-to: <20220111171048.3545974-12-peter.maydell@linaro.org>
Message-ID: <8735ll9ci9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
>
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>  * failure to read the L1 table entry should end up causing
>    a command stall, like other kinds of DMA error
>  * an L1 table entry that says there is no L2 table for this
>    index (ie whose valid bit is 0) must result in us treating
>    the table entry as not-valid on read, and discarding
>    writes (this is mandated by the spec)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

