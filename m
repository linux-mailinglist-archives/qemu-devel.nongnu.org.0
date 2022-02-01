Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B44A6801
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:29:45 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1eh-0006IA-Vz
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExud-00032L-Bw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:55 -0500
Received: from [2a00:1450:4864:20::429] (port=33314
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExua-0001kt-SB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:53 -0500
Received: by mail-wr1-x429.google.com with SMTP id e8so33785379wrc.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=yJBMm+aOLVfHJKdoanxgR+LVpK5h8ynM2gzEnK/J1uo07AYrN3GhZ75OP8xpj3zOFL
 +XOL/jQ9L4IA/MvZphxBmyXqM5E7pQ6J/JW24BjLbjXgnFIvwIAT4XJ1eO/i5xsXWL3P
 QKpsTMApfAZ7vTPWHK5z31O6ejKtNGlQH8tPb3aqvEZv8wadmVPD/RD4spDpRc9BwLSR
 /ro6mUpQF0nyWyd2emhmMHlsaNhJ1nZGnG4I8cpighwVD+qQChY6qqb9IZlXW2JcpzGf
 vW3zzoPJe3DWYl9AHhA2f/yTgyPbsWWOQAjOcqGyMuNhm7s2jtlshDQ64t+NJ48g5ajt
 zZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=vkEtjQNYLqyusWfcFb0H5e2t3mFb9WEaXKNlXpt/sc4Wah9PHTeBdyfTHwPI5Oq+6n
 WH/mJ0BZUsLF0gpdWcbfhUKGu/w21L68gEX0NKdjVgzRIu1L3dDa4NvQZYgWgzb7qYD5
 SUZK6EDJDzW7VTxItGuHOMzOzfkdoXZBA9W/H+n0QowA97yCnE0NFeMFUaZimYz09qU7
 IMijtAO5+4h9PGAig9PpnfyjeMpenjLzLMRYffyjAsyTa3V9IAyG6DQK9H3S88M4UbS8
 avaotcGmN90YxxodWVWgONe+oN4TcFFPfeyDSfjy/UbfM/+gmjV2ctrN8EqlO3C4rFgU
 d05A==
X-Gm-Message-State: AOAM533csPsIpsq6iz1FdteELJBelb9F48HNLrisFoqzVVhsC4T8w4Ig
 7FS2otm3ZeC6zUo5aHLylu/OvMPB7D359g==
X-Google-Smtp-Source: ABdhPJzEyBBtbe0JUC3j294RGG1LQqSzuKImQEW3IyzIvM2UDIgpPJH/fU6kqFrMM4oNdrjtYCt8MA==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr22400571wrq.65.1643740191528; 
 Tue, 01 Feb 2022 10:29:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm3362608wmp.10.2022.02.01.10.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:29:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BAE71FFB7;
 Tue,  1 Feb 2022 18:29:50 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/20] tcg/s390x: Implement vector NAND, NOR, EQV
Date: Tue, 01 Feb 2022 18:29:46 +0000
In-reply-to: <20211218194250.247633-5-richard.henderson@linaro.org>
Message-ID: <8735l2xwwx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

