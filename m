Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10F695982
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpEm-0000xs-Fk; Tue, 14 Feb 2023 01:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pRpEh-0000v2-1h
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:56:19 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pRpEf-0000JR-1w
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:56:18 -0500
Received: by mail-ej1-x62d.google.com with SMTP id lf10so5833988ejc.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 22:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m46y6athCHx8Qm/4ueMq0G4R/wGjNzLAm9EuzU4Kp24=;
 b=covBJt7zqcrOOWsifT/KfHdyo739+oKnGQOPsgowaN/4e6zIYjBF2sFNw5aGubuOZQ
 jCW7r7e4KQVhoz7mwmvwtop0slZ0seaMi/UKQfnM/zkMRiu3bP+/E1JHQoaM35hZ/XJs
 pK6fq70WT8VwZoORGOokQ4VY2tjZyQePD6VfwmA18Jp/y+c6gQrDz+FPdLeb6J+FVFaz
 MU8mH6oGyNQuriDvExaynSbItfD410eAqoi1Ny+0i0gDXo5z0I3jR13ZAWyWiFWt9xor
 GsiY9Az1+Fmq3jVguVy1UMugPsDuxtTMu5q9cIx5kx+TO2HLBxWQW8zW6Rhc8jR+ARSn
 4i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m46y6athCHx8Qm/4ueMq0G4R/wGjNzLAm9EuzU4Kp24=;
 b=sm+4KewXLoCTqUjt7tGnpLiYycfzRY9PpyINZYqO9fiCifkalHGWLrIMBJ7OYNs8wV
 1hN2sUAp+umRolglQ2puw88GJz5Pi3qgM/D7U+K96dvX8qRwPd6qT+fE6DZU/sqJENXS
 r9XFZpBUNla0itirqqWbB8WiG/pAxAOp7LbVLmNvF18tG6zcX9CzDhzOWsR0FqbX0yha
 jy2eW7O1CNp+6z2N0rLdv8YPlWv+3ZqncTgpOzuVutoNk9RsFz3nVZOiAvubjsuYTUVV
 /2fnz7GZNFowIliR44UKzJFRaOVx2nBjEESj6YKk4YrTanAwzsrNSVVXlEfXDlJE886S
 NFJw==
X-Gm-Message-State: AO0yUKW1FV+tm8hHE94wgSD01EnG7Q8gu3XBLmz9VUn8mAUbY1OQy6Kh
 urvWNKQUq54PHayk6tWjLVqnjw==
X-Google-Smtp-Source: AK7set/7Jmgkd3p88JSU3JTEccO37Y0ib3KBRNUACJGLgExHtiqUff5bSb39DzyK3/TSZDVYPN3Zjw==
X-Received: by 2002:a17:906:a846:b0:882:82b3:58bc with SMTP id
 dx6-20020a170906a84600b0088282b358bcmr1785672ejb.65.1676357774643; 
 Mon, 13 Feb 2023 22:56:14 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b0087bd4e34eb8sm7776042ejj.203.2023.02.13.22.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 22:56:14 -0800 (PST)
Date: Tue, 14 Feb 2023 07:56:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <20230214065612.4yown5cacay5txhp@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
 <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
 <Y+sDYFI+ku5/S1+J@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+sDYFI+ku5/S1+J@sunil-laptop>
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62d.google.com
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

On Tue, Feb 14, 2023 at 09:13:28AM +0530, Sunil V L wrote:
> On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> > Sunil,
> > 
> > This patch is a bit confusing to me. You're using functions that doesn't exist
> > in the code base yet (build_madt and build_rhct) because they are introduced
> > in later patches. This also means that this patch is not being compiled tested,
> > because otherwise it would throw a compile error. And the build of the file only
> > happens after patch 8.
> > 
> My intention was to add the caller also in the same patch where the
> function is added. I think I missed it when I split. Thanks!
>

Before posting a series I try to remember to do the following check

$ ./configure ...
$ git rebase -i -x 'make -j' $BASE_COMMIT_FOR_SERIES

Thanks,
drew

