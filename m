Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074C204C45
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:25:26 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jneFB-0007zV-9k
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jneDG-0005i4-A3
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:23:26 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jneDE-0002jm-FQ
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:23:26 -0400
Received: by mail-wm1-x341.google.com with SMTP id g21so2255684wmg.0
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7Z2KQ4t7cTwpAK4RxV1DEyefiMNrJO/YLDYw8QtSCGU=;
 b=NncY7aewQ8ceYx04YLZzqnyhxSxlyjzeU9te5CAwbhE7A7yyvpPrBLRJeDdNektHCN
 LYL9bguPCrQVb2gKIdeJYZb9ESNByrxWqA5jGzGSFGY7WP0FojR34b9w64sRa+fCJ9Ah
 830hZiwzkzkNUwbvg105rNYrKbQ7T+WMHxtbpIUVPPsBVEnS4UI6PD4nO9YEkDErn/PG
 ZYeBXgqBZeRsBjdJiTVk8DB1z8PZxnCN9CEQB1m6Te24DCK6+baxI2SuaGv+/OxmnYjq
 3th5SB1UXr+Kcq/QnMcik7kfNvfokoPs5zetVDaXk+YsRxrgTwAO3XsuuiMevItUEdeo
 pUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=7Z2KQ4t7cTwpAK4RxV1DEyefiMNrJO/YLDYw8QtSCGU=;
 b=CvPynoiM3iaEfcpLQMN6IJ9/d0HJ0RcvhSfGSfS1IV8V7YadHN5QAYmf1zYcXmFBpn
 pwjGRIxfZWtx3RgFukvSfrdz1oKBf9jlcIY+pgRPR1TTncYmCVRkLAChToHt7kxzBZpT
 sjVNOjeQuNpgAG+/KsRR0ufnkvPM33ktUfzdPHkPg1oebcBL0Gt8cJDH5V5WEyWMEAN5
 7rEJDcpInsO9asPui+sqKnGXDU5opCR11ocwV6P7T1lqfV640y3YxAsuCn2+9zxEe2n9
 zrZH8Up7W8GZQj64ehZUgELVKMxJLq7h7VEvjhJDbFH8xyvJnlC/Yttv+JefJ3buqLvG
 +1mA==
X-Gm-Message-State: AOAM5334OynOKL9oDjsELhkTVYmMbpGA3xtZEzGzrgCrawBgE7pdtXlT
 r1eOqWt4jpoklC1aocQmvZOCQQ==
X-Google-Smtp-Source: ABdhPJxoKUucRckYnS+ALyTr4kwCQAoZXQJJTpcGbdsvNBfsGcr9qzaVveH+AMno+Frzl5MmBMahZg==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr23791012wmb.144.1592900602987; 
 Tue, 23 Jun 2020 01:23:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q4sm2665661wmc.1.2020.06.23.01.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 01:23:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE8271FF7E;
 Tue, 23 Jun 2020 09:23:20 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <CAFEAcA_rnDDCTBQDEfbx5qzFFmkyeo9D_NdEC-v52i3wgKjApw@mail.gmail.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 00/25] risu cleanups and improvements
In-reply-to: <CAFEAcA_rnDDCTBQDEfbx5qzFFmkyeo9D_NdEC-v52i3wgKjApw@mail.gmail.com>
Date: Tue, 23 Jun 2020 09:23:20 +0100
Message-ID: <874kr29onb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Just a note that I'm assuming this is still on Alex's plate to review.
> Ping me if it gets reviews and is ready to apply.

Thanks for the reminder - it had dropped off my radar. I'll have a quick
scan through now.

--=20
Alex Benn=C3=A9e

