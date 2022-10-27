Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99060FC63
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:52:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo57L-00065l-7n; Thu, 27 Oct 2022 11:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo57J-00064f-C2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:48:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo57G-0001YU-Bz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:48:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id z14so2964259wrn.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kS2/zX/tI+DJfIwcgpktm8ra82H+ZLEfhpkdYQgz2w=;
 b=BBHJKK/Zem51R90c4Oyl6IlHxnlvmF+ZAHniXYIcCjAXV9DHA3vcbMXj5hCkox4OAL
 tFzcd39FBw5Ar274+IXGpcV60RYY5dGBzSTJtovw06jFZBbSphTQlj5PT4ycGTBTUX1h
 vcAg0xFtcWXqWJ7jN8Jn7YqIMAUQ/Rvw+NRUn49uL8W9ua6pd7ocgQ//Lyxi3T+5y4ob
 EPiITrE6CI5S/M4SO71PKnPx8so+oIIE3I2x1i3hZbgSA1iiy6MV9TxkKhwh1Kt9/7Jz
 kwluQQRa2Mkg3X89aCylJGGRM8S3VU4oaQNeeBaggEmyitjxTHoF80b/nET4zKgR6/5e
 Jnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5kS2/zX/tI+DJfIwcgpktm8ra82H+ZLEfhpkdYQgz2w=;
 b=aOvROfHHoppJQBFbRWNfT/WhqTTmenrTVzMWWGl9Zhj/5fP0ToKLp6jIMks5FMf/kX
 APdsRjJiYHJv9SxRgQ2q8pKFkIuW3jFuMM+Oa2FXbeHHbvvINz1GQ2WXStq6ukubfF2Z
 4/SEqTAG0aA05tIVyuEuKjHMYh//je6oAuDt2A0D/jOfEsJVyTfV5G1fG/EDFYUgRtXk
 6z2xWCz7qCozdOvFVOmBlDKbP+ii8vn2pT6ifpnjboVv9Ud0jMcrshPLGBgYAH8Rix4T
 TFtAJ10Yta9IluxnbjhKsLyR7h8jte8Yp/LIREfpOx+jKkjV7Oyl8Uwa4EcXkc5q1tRd
 mElQ==
X-Gm-Message-State: ACrzQf2CuKqUtd5VrRstsh4M6dy2vSq1tCSl0m6Wfdu/dPa9CxvPVvgZ
 lqZ9cjjFedOLZ9hE8sYMWXgCcY8C4BGryg==
X-Google-Smtp-Source: AMsMyM6Ohsq8f6TpU7b8tGdpdr9ELdPTH/EY3WPJwNUcNSbZM91Vf2mf1gni04p4SZKBa+E/4LpohQ==
X-Received: by 2002:a05:6000:1548:b0:22e:3469:b726 with SMTP id
 8-20020a056000154800b0022e3469b726mr32150658wry.10.1666885688817; 
 Thu, 27 Oct 2022 08:48:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm5286716wmb.47.2022.10.27.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:48:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E695D1FFB7;
 Thu, 27 Oct 2022 16:48:07 +0100 (BST)
References: <20221027113026.2280863-1-iii@linux.ibm.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/vm: use -o IdentitiesOnly=yes for ssh
Date: Thu, 27 Oct 2022 16:48:01 +0100
In-reply-to: <20221027113026.2280863-1-iii@linux.ibm.com>
Message-ID: <87czad1d54.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> When one has a lot of keys in ~/.ssh directory, the ssh command will
> try all of them before the one specified on the command line, and this
> may cause the remote ssh server to reject the connection due to too
> many failed authentication attempts.
>
> Fix by adding -o IdentitiesOnly=3Dyes, which makes the ssh client
> consider only the keys specified on the command line.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

