Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43858ED4B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:31:27 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlny-0000cm-Iq
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlOR-0001Ib-MS
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:07 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlOP-0001tO-Uu
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id m4so27613296ejr.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=MyxqOz8UZWrxcEhwr6HgpasQV8vJbsHy8n93BFZbSUnwougm/anhpPVtl0NLYZ7aqZ
 DHt3CUPCIXu0CtAyzqe2PDxS36KB/nowa3w2vDhD6AxbgXBkDYfKLk0FkXIOnxBXTdj4
 NZPXK984Q8BpUZEGHPFsEPPyiKLuLNIbMlUWo5BH0p1dv6MRnlAzUHJKT5w2Hm8UCTDJ
 419ROSZ3L4JL7vQyZEVBfZs+Lf+sDDsHogIn2h+it3zKSArXteJ0Pqey7xORFq+g5/fM
 Y0sDs+aQINiOpDUAkVXy6aInQT3Z6kR6GK34pv/KLxZg+As8hEcqyqVj5EYwl6sIc6Kq
 tp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=LN/Q59oigfOVLj8H0SQXL3p53XeLLVn6qXieKwNBGvzBZLr4Pc+HaSvaYhq8mx0mbU
 0VcnJXc8b7BGHEa0PWvS/6Bdcpr5kZl01QAEsk5FXHByzZa4zBm6MYGIR6OGiMwxGhch
 JdyBY87v28NKA+elVDFRkT4NKBx6IbN5qJ//RxFT5qbfPEhjOL5W0njcBoDigv1UjWm1
 PLwKf9PYTb1iFCd/ErpKn8RPxlgsTT7qNBkusEGovV3ASoL3uLsCYZbos08CTGXpaScu
 cCYXqBUn4k4aDQL9yLMe2bFPUXuBHT2ITPItBflr501PDGVytfCq5vJXYd7Rka/936SR
 jG+w==
X-Gm-Message-State: ACgBeo0Mi2Qqjhc/CiULet19Gtyk0h4SLjEs2IdDHJ4+7alrBoPnZfrt
 d5/wSy5kyd3OsGxLUWkBDqyzCQ==
X-Google-Smtp-Source: AA6agR4LBGhmt04Xzi3KgAS2SbvBlIn6L9O59Qgvd2N7jRX8Wtll/xySMXb3kvv1faY5UakM1SefqQ==
X-Received: by 2002:a17:907:3f95:b0:733:1e1f:d75c with SMTP id
 hr21-20020a1709073f9500b007331e1fd75cmr276955ejc.727.1660136701245; 
 Wed, 10 Aug 2022 06:05:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bf17-20020a0564021a5100b0043df042bfc6sm7657668edb.47.2022.08.10.06.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:05:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 641141FFB7;
 Wed, 10 Aug 2022 14:05:00 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-12-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 11/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_v6
Date: Wed, 10 Aug 2022 14:04:56 +0100
In-reply-to: <20220703082419.770989-12-richard.henderson@linaro.org>
Message-ID: <87r11omepv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

