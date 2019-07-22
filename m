Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1670894
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 20:29:36 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpd43-0004To-DX
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 14:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hpd3s-00045S-CE
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 14:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hpd3f-00045Y-8h
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 14:29:13 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hpd3f-000446-0e
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 14:29:11 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so40399715wrt.6
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=VOk8330Yr7xHInb63RLoT14O7DD76ScChxM+wEjcarM=;
 b=idqWg7QNn4Yq14367gajaH171lMQTB18QKqoUifPqMACxVy4aSzno2Bmp+11CuNE5J
 8dqHHEbRTlBy0+K9+VknwqNFuddD8zqIZW6Wn7HrJUErmttowqYuai6px9cHTcwVyjOA
 oQMvFN9TmsNKdkCAkTQiEcxlhgTvvtwF9abA5ryWikXwNOsu4WLN7MQa2yvE8dLZ9OtW
 0r7KHhvVWJpbOYDy38xX8JWlowPdkm59Ubj6gIbWjS31zmG1yK54NRbEpKQDgA+paR/2
 ZQzU5cO8UP2mM8d0BotlCRs/Pt44/bFcvP6JRlOXH7cmQFq7pJooRrunRbLeGH1aVM8o
 04NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=VOk8330Yr7xHInb63RLoT14O7DD76ScChxM+wEjcarM=;
 b=NnVF/sxt8wJSgLf4t6tdY/UXXBHC3J92xlLzMUt3XH2H+LvryJTuNmx1dwt2fwZUWQ
 PQfa2B7X1bs5XX89ul17V2hwqNSKB3o/wjfj4gZvMALcOi9ghB2t8BGo0Q+Dh6Ul3QK+
 BkjpZDvb6CnLoeiHJJUZgktnoo2uFnHGjR01kgeDHt4HUi5XPlOKYEqVfB3JSeDmB++U
 lRFB4tMvJ1xstbLJfO/VWY/2IfqQufdfkMKkV5wVrBnZ53kyhfs7KNXXrT9tLDMW7jD2
 MntihLyf8UChHvye0qYk9i62uPFPztylEuGSzWhDqty2Hi6eIyw4aXqxJakCZuXUPOrG
 ClcQ==
X-Gm-Message-State: APjAAAXV16uts6SpO+z6TE792gAxTM3gheay8U4MA/WU1qCXLr7IKE2j
 Zyhm06D/yMvki+babSdabf3arw==
X-Google-Smtp-Source: APXvYqwO8qBY1GNGVDEgXwMmzzVbDqp1Vr0vutZ+7RH2qVCLomMFN+vwyrNxbpZW2qsw+xB4WlxPFA==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr25930439wrx.90.1563820149321; 
 Mon, 22 Jul 2019 11:29:09 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id f17sm35635488wmf.27.2019.07.22.11.29.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:29:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 527A01FF87;
 Mon, 22 Jul 2019 19:29:08 +0100 (BST)
References: <20190717134335.15351-1-alex.bennee@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190717134335.15351-1-alex.bennee@linaro.org>
Date: Mon, 22 Jul 2019 19:29:08 +0100
Message-ID: <87muh52aa3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH  v2 00/23] testing/next for 4.1-rc2 (win,
 travis, iotests)
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> This is my current queue for testing/next which I shall submit a PR
> for on Tuesday in time for rc2. This update adds:

Ping, any more comments or reviews before I tag up a PR?

--
Alex Benn=C3=A9e

