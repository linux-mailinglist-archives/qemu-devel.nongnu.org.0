Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDDC472B7F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:34:24 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjb5-00059L-KJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjZL-0004Bw-6m
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:32:36 -0500
Received: from [2a00:1450:4864:20::42d] (port=36819
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjZI-00013M-1T
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:32:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u17so26500735wrt.3
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U+QXe/GFv9IjthoBHMaFdMtB+ZK7MRsXQrSQUifs+eE=;
 b=mj9GPFZIndZRlMvAO1uN9ai6T5KFCg9sVdoiaUM5ebIFjAEy7frAXZjABAvGpwNXuV
 Bk1FMxQ1hcnpMSVbX9f7zIiDe56HRp7m9XQ16QEUrzg6sC+Njz6T0jr7qrLWifUuKwGo
 KYKDHVu8bmM12EMP0NbFPfW7CauQppN+07bdr+T2PixyQ4qkC9/cCrfv0Jis3Po45ewK
 1tbDlEGTDVtSXAjJgO4pYtIpwIYft87QIdjSWrrMde+rS0FZti6kOjZwb9XKppVV+ACI
 ZAnbfzgXhNN08dBgzdStzaZrp0bQ4cT4Oac1H2Ioc22vc1v06Dp0WVUwB2rgwrKpgOsx
 n6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U+QXe/GFv9IjthoBHMaFdMtB+ZK7MRsXQrSQUifs+eE=;
 b=BywiqI0aRZ2g2wq31vEYpeHGaynJGtUgIzlHqq+sLuEpZ+1NQS7yguctHYHVAQMvYl
 sAHyWKPh/U/BuQLT/W4n+hQKk8dfPHSoPPjDwRVLCvu05f9l2Hb73LENeI6KbfgmWvwr
 T6DgjPZBsy82T8R/24LXDC2oLyxXBsAxCR7IAlGIdxVKmiyTkgDDdE6jb2coHLjglU0Y
 dV8HK4ZMuM8DMILpyia58uJORbvXdHGSbb3bbZhXbkCYPLZ/yOt6u2PXAUsg2Q+m/D8Z
 mE9qFMgsTjjUrgMJAJMbE7NSg6JgX0wUjV6oDNFMz9dqLFd6Aek9NSJAMGL7lehjnngb
 BPWg==
X-Gm-Message-State: AOAM531foqQr7NzC2fmDI/VufaktTq6KBS+QeHlqYIYMsMTqWGaw6dBd
 /xiZeDvy6qS92hdT9RZeR7LskA==
X-Google-Smtp-Source: ABdhPJz9c44Pl5rUcD9uGCLn+G0mhOeLW1//6JK08sZ1rHgGKHR0YKm3vx1UhBPwT2M4IPW1XHtJDQ==
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr31871954wrd.61.1639395150597; 
 Mon, 13 Dec 2021 03:32:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t17sm7309459wmq.15.2021.12.13.03.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:32:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E085C1FF96;
 Mon, 13 Dec 2021 11:32:28 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-5-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from
 TableDesc
Date: Mon, 13 Dec 2021 11:32:15 +0000
In-reply-to: <20211211191135.1764649-5-peter.maydell@linaro.org>
Message-ID: <87wnk8n3jn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> The TableDesc struct defines properties of the in-guest-memory tables
> which the guest tells us about by writing to the GITS_BASER<n>
> registers.  This struct currently has a union 'maxids', but all the
> fields of the union have the same type (uint32_t) and do the same
> thing (record one-greater-than the maximum ID value that can be used
> as an index into the table).
>
> We're about to add another table type (the GICv4 vPE table); rather
> than adding another specifically-named union field for that table
> type with the same type as the other union fields, remove the union
> entirely and just have a 'uint32_t max_ids' struct field.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

