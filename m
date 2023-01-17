Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340666E05C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmqP-0005i8-Eu; Tue, 17 Jan 2023 09:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pHmqN-0005hc-GM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:21:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pHmqL-00029u-JC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:21:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4667997wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zun9R1HnhsYpIBEgRGSUZTaf8sxjD8dhuMNZisat7OE=;
 b=izHMtbuWbUucEUuHTTlFDItCol7+bADhZ8vPpw+vOs3DapJ8eG6INbA16ISgsOKgCW
 8lWRjrp6+IBf8DkSUuB1kgMqGvdwadXzGHzFaAOgrVNBqdJwgh3+wEZWKI7u2lyAKJb0
 fEJ4fY2sRWLw6X/wH9epcCUqZneGbDCGWsOdUU6ZPoxANZvCBwiMRBdbMptPZTERBs3J
 swOeLd0sOBdDSCDqn8sYCFfqia665gypxQL9CpBnf0dDvm/+bbYzW3Fqz5iQjtizT7g2
 DuNhgS53jotsEq3e1cog8/JUA152Ve1jCyBGQucQ3diz9h4d6Ixe7P7SOW4lk6KrI45l
 JLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zun9R1HnhsYpIBEgRGSUZTaf8sxjD8dhuMNZisat7OE=;
 b=0bciwLCSm8zBcgJLLj2G9OLLbMu5SuaS1TeBmwYeWMfKI1UamIAXRpEWA52UyD46hC
 oVRK2Ezyh+G++bADbPUH9J5fBcv1UQDZrGEms5GGqLZd7AIZiY/3cLnqUiL0K7Qj10gX
 yJIJaJke0KPcAnl8FP2TNYpdUMFSW7nkLYf9/pfEpgJg4NtZRPWDF+MWYPSXLDEvmxrP
 d8mDkUfP5TIV8MYpw5i2pRb6/r6yBUc/DHluDUhEgHEIKceUdljBzTwGiFCjmTKJJ6W5
 X8W52+9yAMyheK3FipV5QiYsCtN3Z1sDC+SAP+0ViDypfkQw8w5oVg/xSVBYuTdNN4L4
 eXJQ==
X-Gm-Message-State: AFqh2kqbzvynP/Jmxl4l+rdmCrYwicvtQnKmnEjKws7sgmUmV1eXawxN
 thSeZ/df18UD3CXW/EHlDJlBFw==
X-Google-Smtp-Source: AMrXdXuqMMdgEqpTq0Kqpst9s4vegKgZPQtwgIb+WdRlWyAn+Bj0fQOyi4fE5wuBq+qS/Lx0mHC7zw==
X-Received: by 2002:a05:600c:4a27:b0:3db:3ef:2369 with SMTP id
 c39-20020a05600c4a2700b003db03ef2369mr3755143wmp.40.1673965299712; 
 Tue, 17 Jan 2023 06:21:39 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b003daf89e01d3sm8505849wms.11.2023.01.17.06.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 06:21:39 -0800 (PST)
Date: Tue, 17 Jan 2023 15:21:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 1/2] riscv: Pass Object to register_cpu_props instead
 of DeviceState
Message-ID: <20230117142138.j2cv2lzvppiuzpne@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113103453.42776-2-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 13, 2023 at 11:34:52AM +0100, Alexandre Ghiti wrote:
> One can extract the DeviceState pointer from the Object pointer, so pass
> the Object for future commits to access other fields of Object.
> 
> No functional changes intended.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

