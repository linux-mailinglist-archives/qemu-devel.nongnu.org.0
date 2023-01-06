Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7BE65FD30
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiTu-0003o1-NZ; Fri, 06 Jan 2023 03:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pDiTs-0003lr-30
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:53:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pDiTq-0001ZD-Bx
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:53:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so3080418wma.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fjQkgCfYf8Avj91ydvqeMjuATnulbyvxKIKR08AULZ8=;
 b=oJ+uPFEhGOLl2mjobD4ml9Uzx6TD7TugnWwp41+dhEX2rsrvdAlZmXA2eLikq7bw6J
 4pQLOnFYOEyg3wXQhKYJ1RhFsWoU08orimf57cEYn0O9hVDlLZALLeHVga+VC+Ou/K2K
 NLphq1m+WWQ0wrLEJ8JTLFmNrcIOEQoMwQLtATuU1WjnDwz7AyALWSQFJQwSMEKDfD5A
 mrD9QOBpao/djV691CZd8+oadaUXsG4QvqdkT7PmwzD+YDSE2v/zQBs48lhvOLxP4dbt
 5B1g71j1UNVemPSESJTtgz64SSWYuh53JqtIJ/sEoexD3ba/L005jokA+D0B4mdeZgBS
 XTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjQkgCfYf8Avj91ydvqeMjuATnulbyvxKIKR08AULZ8=;
 b=TJXHO+2323TTEJm8OiliJdnXzKshOhwgopBLha9ivptDFev3c7CECw72KHtpX0z026
 O0GyT0dF3KIn7X4oc/liUA9jOFRtFy03xjzemPpJg/3pXH9ddY+1sgamYx+MRpBDerOX
 VD0BF7wbxZIXd8FHWjarAQAQwc2TiOhChIg9R61GVinFxxSPiCtWvjsNWcOV5NPJs7hz
 qXs+9wGJvxJ4y113h/qbDTRV5NNflR4nFtDUcsOD52d7DNKJycEuGYgIZJ3zKxIuhTsG
 CGfcodMIHmPhgF1aSi/aPiY90HdCkXz281AC3R6TP+DzKElO+bkFq0pxoMqvcJYNovWX
 Volw==
X-Gm-Message-State: AFqh2kpqAVvOiCizake81zBSpGoHlH5EgvF4LCQmgDOjOLakBhjQvrL5
 EJ9iy/kog2jZMMvCRG3yG3pZfQ==
X-Google-Smtp-Source: AMrXdXvhrik5JIBo/s+0gU4wB5HqCIQAZiERqGdalUfW8JQj/bACfXFo+xTdlYZ6WPbblNbWfNUWrg==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr41785956wmp.21.1672995215870; 
 Fri, 06 Jan 2023 00:53:35 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm6031470wms.17.2023.01.06.00.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 00:53:35 -0800 (PST)
Date: Fri, 6 Jan 2023 09:53:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v4] riscv: Allow user to set the satp mode
Message-ID: <20230106085334.vz4kbm3lleut7c6m@orel>
References: <20221212102250.3365948-1-alexghiti@rivosinc.com>
 <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
 <CAHVXubiuupjz2zymHHi-3pM=m3v=V287P7_-o1-AjXxZhMYW5w@mail.gmail.com>
 <CAHVXubj5pZEiAGCEk8qxmAyP5mHnCS6oN7fp0a3FNA+RKPK7jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubj5pZEiAGCEk8qxmAyP5mHnCS6oN7fp0a3FNA+RKPK7jQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
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

On Fri, Jan 06, 2023 at 08:56:33AM +0100, Alexandre Ghiti wrote:
> On Fri, Dec 16, 2022 at 2:03 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
...
> @Andrew: Please let me know when you have some cycles to review this,

I'll try to get to this yet today. Thanks for the ping.

drew

