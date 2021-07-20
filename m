Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84D3CF9DF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:48:34 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pAn-0005pT-Nk
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5p9H-0004hB-Md
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:46:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5p9G-00074m-7E
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:46:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id u1so25921326wrs.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=76I/MMOUd+CQjYigA3oHmDSeeOR61hScsWLRx5qaxoE=;
 b=hoOEyDXaWE1gqf5eAazKHfPYUJwft7RxWYMCHCNEwT2TZ888GgE22KgLKG723fpc37
 vPg4f99kvpulUQlf9JnArO0FOizaV+ydFximNtZbCa4TyJ4prr7LEz/M2xdTdAiYduyV
 gyseqDf2pIiRs5Kjn9iCFyRyxr95XM2bRnYdLfb4PogR8uXY2naTkF/2RxWPIjRXHm9v
 MCRv1BIBC5bS15bhXrKFYw6E53x8VsobIDYd8MunO927IzMFsNTQZKEgR+YZ09+QN9Qz
 ZF2wFuaeHoz8jSiqqoudUPOxQW3T7IfDYm5Ivm4y0lMCq7b+tnot5rA7DlSckjAMcSRj
 Nq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=76I/MMOUd+CQjYigA3oHmDSeeOR61hScsWLRx5qaxoE=;
 b=GRmqIAVKusDovhEr8o9A4Yhr7SSt9dTrupb7zkCWeVEeJteVn+YmmjnzDeHbTwXm7O
 Db7aJ1cUem5mxIiIQ62szMPdBfoTfsjrN8j2DQoQRNzhMB5T5KulKfubsePeNVeoWtns
 +CzD6PCRAhRb2TJHTqYnPuLzgNrMJsPaDitVs6BuXcuX5ag601qloc4FCA33i+86MXy2
 pSfaAe8kTH5rKEruK3yyLSC92w/UoYBBauwMhBA9lfRjB6zXrxbuMVixVv60jPP1gXjy
 3AS3Ht5ZsWdU3BqV0DR/ipf7Lbv7KPRsCE3MmFa7tXKmax17F7pkPpoF0M7drtTX4VBk
 qBtA==
X-Gm-Message-State: AOAM531EOTva/+bg6O2eESxO8NozwYKcYzwCDNG+OIdDVr9DVnP4N0ia
 O/zl+deiFVmhqnAwkrPrehV4Xw==
X-Google-Smtp-Source: ABdhPJwyEdooyais4nZpCZRIp7CorJfK3G4nglxoIjlVzoz1wMGwPTeOmkdZgGMlz11UXoZ7p+Hh2A==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr34923483wrv.273.1626785216205; 
 Tue, 20 Jul 2021 05:46:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm2268369wmc.44.2021.07.20.05.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 05:46:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AA611FF7E;
 Tue, 20 Jul 2021 13:46:54 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 0/6] plugins/cache: multicore cache emulation and minor
Date: Tue, 20 Jul 2021 13:46:26 +0100
In-reply-to: <20210714172151.8494-1-ma.mandourr@gmail.com>
Message-ID: <87lf61m9tt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> Hello,
>
> This series introduce some minor improvements/bug fixes in the cache
> plugins and multicore cache modelling.

Queued patches 1,2 and 6 for-6.1/fixes-for-rc1 as they are bug fixes, thank=
s.

--=20
Alex Benn=C3=A9e

