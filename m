Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE372F4C4E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:39:44 +0100 (CET)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgND-0007UR-DV
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKl-0005ul-8q
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKg-0007w3-HW
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8XwYsiGGHOPSJH7Yz5Tw5P2tfkHFb/+AReSQR2pzIQ=;
 b=UTW6EzCX3XwjovdzDIIzfmokDhOnOT+xXGV6dOKrwBupBPR2bGC0WO58hMsaRIcVEraRac
 YvRKjkDD/CSpC8+ivwUEbXNvxzywNj5N2fl3ePVPlXy4dAK4FXx1ZE7kZRxJiCG8pjJ7cR
 TloX4bopRILlK573NHjBmKcLR0P6iQw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-UNltZV9RNJ6Ls3Xg0_w1zg-1; Wed, 13 Jan 2021 08:35:32 -0500
X-MC-Unique: UNltZV9RNJ6Ls3Xg0_w1zg-1
Received: by mail-wr1-f72.google.com with SMTP id w8so967664wrv.18
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8XwYsiGGHOPSJH7Yz5Tw5P2tfkHFb/+AReSQR2pzIQ=;
 b=OnJCOkuzM5F+C48y+aPimkIK+Xc3HmLC/0f/F08GyxEHDZ1+8qQY+lCFnbc9qTyBHj
 kOLdHw0a5Q2h/MRT6c1cAaQhcJXLKTGmbtKxB9k22KmufNwB9DvuKXsZPl0OQJGNvlWs
 A6zA2znW/cmexUujhYAB+H21aG6z6/M3OoousANa0VKkiR0dj7Me4qnKVTWEkHU1kkLM
 jLp3DD5UxHPbuhMCJ0/kfdapt6DoHZrCX4bletWWeOpm2EBUuPIlyqwHXORlq1a0FINe
 xXT378vMVXCQgeHz/iYmgRxZrfiQ/GvNFlaXNIRBdDvHiPUK/MjFIQecGC12d068pImP
 EZJg==
X-Gm-Message-State: AOAM531hK9yGRj4YvU+oGHsR1lIctHFujrZPcDNXagtz0FeXg9YJYT/N
 BX5ixvMOAW/eUR1vNixRZGQiInJNsJDPHnBu6CooU0MP0W94Oi3Z+K7ahql59i5twZpO1Z5cGlK
 +5iskSI474du/H8A=
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr2646575wrx.34.1610544931705; 
 Wed, 13 Jan 2021 05:35:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh09qX4HbYzYkFCUUIBYoh8QENkdc7M9A1J63YDMCVGSXOuLE+IW5iJAM+97X84lUll8OfXg==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr2646554wrx.34.1610544931506; 
 Wed, 13 Jan 2021 05:35:31 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id b14sm3242414wrx.77.2021.01.13.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:35:30 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 01/11] hw/ssi: imx_spi: Use a macro for number of
 chip selects supported
In-Reply-To: <20210112183529.2011863-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:19
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-2-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:35:29 +0100
Message-ID: <87v9c1gdsu.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210112145526.31095-2-bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

A fast search don't show what resets cs_lines, but that is independent
of this patch.


