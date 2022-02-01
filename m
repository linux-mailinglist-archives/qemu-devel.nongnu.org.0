Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530974A684B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:59:30 +0100 (CET)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF27V-0007Vy-ER
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExwc-0004Hy-Nh
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:31:58 -0500
Received: from [2a00:1450:4864:20::32d] (port=35790
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExwa-0002FS-VN
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:31:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f80-20020a1c1f53000000b0035399b8bedcso2393025wmf.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=k8A1cdLrBLmljn9DMF1rwPLWrLPeKKTdMm7zOpeqzSV+Y2WVn1Ns0WCEvb5XPM+/1y
 6hds8tIYFLTI2RMhnSZxMzqkm8zUfYTan0iTeeyfC1+UklIch+Qz8IRdGPGs+k131a2p
 7uVRCC093ZaKkji+qd/V93JJkCvC7ZvFQd6wyWp6xfHU7iDkvSoe223L7vROoNrEXnGN
 WNklMLpF6Esulnvwt/wf4n8MwySbt40TTqh/Mxb3AZROtqaO+/GGPfeX/XNu1uTuaQ0E
 I3dsatEZDvHzTrrwjdj6Zu+R4D1t7bF+NFQYfz/9Nq/+LeKjVPEWKwiwTw+8Bo+6gnSy
 U9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=L2/TOA04OCuquOHYXNE+tqEBAfEboZqSLuq3UDOAP4w00LEw+cwJhpkNv2i8rEM7n8
 D6Hty6M1yIS1Z3vpGZNtXkKNih7/nhn47MhBUHJ/jj7/snj4zvdDPqMEzagkwF7QhTuS
 pMQ5qHeJ6SmbMxIZMshjvGYyS5qXmoUooG0632eLLTt2gv0dOfGb1aW8+QIjIbNUGCia
 hu4+Mqs+Hxzi/Kxkgjc/6D6OWJ95+D+SxpU30JJDiXENA/TDPW9CutcnWd65Us8sGobu
 nvqqKMJKdZ48hd1hKFq3G9CRcGVVvK/3txK0tcJa3nwQrcDEX4yeLdn78UojYLEsQNkt
 Opcg==
X-Gm-Message-State: AOAM530H1jYsW/xUp3qAHkenCva0drRYFS5El/GEA30w6n+ZjZz6hN5G
 wzdjcSmyvMxgN2qY9pe0iQ0UnItBpxveNQ==
X-Google-Smtp-Source: ABdhPJz2Dx7SvfvDOHWSv59+Z5isVKC2KKN8dFWGYVv++nW4FgWCn0S4hzFCOg2lgSBD8qCtX8WEtA==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr3007485wmi.18.1643740315406; 
 Tue, 01 Feb 2022 10:31:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t4sm2671241wmj.10.2022.02.01.10.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:31:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC5E51FFB7;
 Tue,  1 Feb 2022 18:31:53 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/20] tcg/s390x: Implement vector NAND, NOR, EQV
Date: Tue, 01 Feb 2022 18:31:49 +0000
In-reply-to: <20211218194250.247633-5-richard.henderson@linaro.org>
Message-ID: <87y22uwi92.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

