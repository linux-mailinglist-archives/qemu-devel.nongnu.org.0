Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E27597F0D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:13:05 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZiC-0001n0-8e
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOZdv-0007aQ-MU
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:08:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOZdu-0004fY-5L
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:08:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id bu15so651958wrb.7
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 00:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=EG8W5q/0/6oum9EXZnLBDDDrNZ3eLv8wT2jAXNj8oVk=;
 b=IEr9SGVves10rBVRra1m8jU0DesFNu6Sw5V9khBy+MuIdVsrBvlXTeOAt6Brr495QS
 8WZmZMAPiPmbHPITBUYepyctHRhsubOuRkGwoR6ROQEwF7MrGJbQ/Px8Tegja6Yk8/vt
 uN77/rTh0BX0JxpX1botkrz8hHwf8wVt0XbYe7nPg0wpYI62C546GDPdyH31MgSQz/hZ
 I/KwVMg9ve91LF1RTsYqsSPoXQLPi2J8kDlG1ZyuGUmzWr95NmcRWQkeaBdPdohN7ML1
 PGzKCPj/D2VC75jIlRVnqI2TcgUBKYf+uXjUuddFwxoDgfGfsoc3BZDrUqlOzaiKb36P
 lZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=EG8W5q/0/6oum9EXZnLBDDDrNZ3eLv8wT2jAXNj8oVk=;
 b=3qQ3jOXdZYW9gPAr/FChRqPqjKT8se5daOc80W7PRQBpxqLTKxZl2GbWRGQ76eO+1Y
 XIhVZgATKWh6QgdjbIdE1z7pYlExKcIDcKLV6AeNYQsehVHn+/YU7+y6mTSrih8TTU8/
 wp5PQeIgOszn5rNBwkjMdrqlEBVLiPrTxcB1XsozwfsyMMLz69i/WoHCGMRP7guqXC+5
 OmkovDiCBdP0EqlN3+e/Z8+emV4b9e1Z9X92KZ6iDQQJbd3QirooLWLyijA7Md1HNgm6
 y+sgh7t+E77IOqlL6QzKfOAKZJLG0Pyt6xHXlPtaHO0H2nlLqgN/Yr56J4KTnlSosm3t
 GbfQ==
X-Gm-Message-State: ACgBeo00u3LK+UW9qtNNMQLJKoAfbnPSMa8CxpR2cxDoVypOLLEH2Lha
 mhsEL3BbsnMzvj4tn1Q9subJXA==
X-Google-Smtp-Source: AA6agR7Y3LZaRkVAGQYD4/rSlF8drcovAhLW5lo4WwEELzg1JgTO9/PVxPIbzbXSZQANttF7t6bfLg==
X-Received: by 2002:adf:e193:0:b0:224:f578:ced with SMTP id
 az19-20020adfe193000000b00224f5780cedmr754211wrb.218.1660806516364; 
 Thu, 18 Aug 2022 00:08:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b0021e4bc9edbfsm536117wrm.112.2022.08.18.00.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 00:08:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C8B51FFB7;
 Thu, 18 Aug 2022 08:08:35 +0100 (BST)
References: <20220817034630.1600434-1-bmeng.cn@gmail.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Beraldo Leal <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] .gitlab-ci.d/buildtest.yml: Increase the
 check-gprof-gcov job timeout
Date: Thu, 18 Aug 2022 08:07:00 +0100
In-reply-to: <20220817034630.1600434-1-bmeng.cn@gmail.com>
Message-ID: <87zgg2rpu5.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> Current project timeout is 1 hour, but the check-gprof-gcov job never
> completes within 1 hour. Increase the job timeout to 90 minutes.

I've tried to do some data mining on this test which seems to indicate
that the average successful completion time for gprof-gcov is 27 mins.
So it seems the sometimes *something* causes it to run a lot more
slowly. I wonder if increasing the timeout just masks the problem?

>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  .gitlab-ci.d/buildtest.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 1931b77b49..52d45508fb 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -495,6 +495,7 @@ check-gprof-gcov:
>    variables:
>      IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check
> +  timeout: 90m
>    after_script:
>      - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh


--=20
Alex Benn=C3=A9e

