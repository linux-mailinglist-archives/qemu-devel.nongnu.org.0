Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F822B0C62
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:12:58 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH5d-00085N-8A
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdH39-0005bP-LU
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:10:23 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdH34-0004LP-Gb
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:10:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j7so7016903wrp.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=zi7SWgoFtvCTX3u+uqgcDehQe9UT47yzYsHYst2noaE=;
 b=Qq030q3RM1rjeBiV/w1/YcZJWC+lbCAAKsjAAC3RQEqDdOcwec2+9a3SuhLFZZZXg7
 fg16y083Z+6BgZ9iN1v51fbIVzSNpOKne4VDoRbB6euMLRrAUUjbUdAJ++dNcJETmVf4
 S6jSxm1lFgBq9yPHc/JFnNW8cdxndquLBn4j6ekBlWr4/aB/OIu09ZkyNhK21OvNdvYC
 HFcNtIWpMYJLfDGMT2l2MYcJpILn7RcxtrGzGEk8GeDGWuwMt8zdtTwcbXEh94N1Rltd
 7QzAF4ddhV8YYQD0MZBebKKM3ie7LqGvsCkZniFmU/hbKZbbO24tu/tuJ1j0Xn8ybqqL
 sFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=zi7SWgoFtvCTX3u+uqgcDehQe9UT47yzYsHYst2noaE=;
 b=Do8c/h5P5bSfUOo6fDNl59gOkzyu/EjUX3xb5T8xst/Kr3zcXuIgq6XoqZ1iGdaym8
 pGS+Echbg/WKUnpVe/BT6lIq0MiPuGYM1e7Wcuv2bNqpWUWBP4h0bVqmjpicgxmQf0Ux
 HVfDicG7hyJCBU7DNiLps22cksYfEju0BmM7UQMGMd0XYcfwhnp5/Q5WsoKhOBnDx5ov
 rtTv3RJaBsSz7FxB1Sw+KOR0hQ2BboA0LZBT/FWCGe8rV+PxHN4Nxx5/0hoYlB1a2HMJ
 HkIW6qIX4zTfuhJ/yQFSRLWtO6XrISW7OL8GUCNSM66nP1sazfZRDIR91CLLcb50fDlx
 +cyQ==
X-Gm-Message-State: AOAM532KFv3SOC3A03UfcG0/SX/YQO28Uyv9/LzxXySN9B67FYShta9p
 b8MRYe1up96tQ0C8zD8/w2A/jA==
X-Google-Smtp-Source: ABdhPJwduXH7hqZt+0R6M00EVC0i7QXxCdAsYoqdhokKYgq4NaLXN68XFISE2XyNtqT9r9pdpauxlg==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr813195wrn.231.1605204615662; 
 Thu, 12 Nov 2020 10:10:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c62sm7177374wme.22.2020.11.12.10.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:10:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E272E1FF7E;
 Thu, 12 Nov 2020 18:10:13 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 2/9] docs: Move cpu-hotplug.rst into the system manual
In-reply-to: <20201112144041.32278-3-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:10:13 +0000
Message-ID: <874klu78fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The cpu-hotplug.rst documentation is currently orphan and not
> included in any manual; move it into the system manual.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

