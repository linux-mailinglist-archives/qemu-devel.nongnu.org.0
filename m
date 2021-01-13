Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0202F4C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:51:22 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgYU-0005Tj-0F
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgU4-0003TE-UF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgU2-0003SD-EI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545605;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4xSfq28ilhdS/dEKCCRIC+4nFcHCGo8hIdFUOMrRzE=;
 b=Ga0PEYAIZ+pDt3dfDeE7Z4XNPs2+c+HUrrd+qGNp6xMFg7t7XpignXpq8hlXt524RbumCT
 WzOhAiF4tmaf3MmY+wG6U/E7S7vpUiqfwMKXCks0eP2g1fIP21XelLo4bAI4O2X5n+lp0N
 IAbVYkf9d/HSAGKNI2RmGxB+1ICYQbY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-KhrZjXGOMyiRGR1oLthkWg-1; Wed, 13 Jan 2021 08:46:43 -0500
X-MC-Unique: KhrZjXGOMyiRGR1oLthkWg-1
Received: by mail-wm1-f70.google.com with SMTP id u18so832859wmu.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4xSfq28ilhdS/dEKCCRIC+4nFcHCGo8hIdFUOMrRzE=;
 b=YwNeFNwp/fRK65Se5F3SomEpKVJX4Qey39AgoFCot+ySHcU0aEzJ9F9yWp8wTYWEem
 zl4rFLkSJh1gUxCDADsiKMMOcol9JlMKGswniRFiK3Scu7gf+Q/Rjbtpirp3sOaGwHHb
 EIgvsWxbVY5Gui3mkquf/PqzxjRyeJaIxLMa+bwNtANBNhyC7PEsMBvW/IeEeg/82g9y
 eg/DZd1MD3wY9AMyYI3J/cbGYYV8oDuc2boXXl+391fqzmndRwzfbVOjfkczA/k7uFX6
 dWD8KkjsQ28x0B6EvgD44uvUUMlTKDkLZ5qzGR5WgsSCFdm15Prme4ANnmNGxja9Jv8j
 AAyw==
X-Gm-Message-State: AOAM533ljYEWWno2UB95MxcHbyTAfp5Ne55TJZTWZ8vZKQNSTgT8GdTi
 JTuLi/CQ1H/Iw24sQyAJoCSNJWbk3BPy1yRN2/XuNsLClAFpRmdKoiNbiSXOvbU1P8H3PgXiOGu
 dSzR2HOQhaLHGWvs=
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr2359708wmc.36.1610545602483;
 Wed, 13 Jan 2021 05:46:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzggH2McgS1Zryfa8X7Np46Hy6v7YGcf7DGqBT8x7BT3CMWOdML2UPq2lZh7Vicp0A6xsfnTQ==
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr2359688wmc.36.1610545602321;
 Wed, 13 Jan 2021 05:46:42 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id c11sm2620625wmd.36.2021.01.13.05.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:46:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 06/11] hw/ssi: imx_spi: Rework imx_spi_read() to
 handle block disabled
In-Reply-To: <20210112183529.2011863-7-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:24
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-7-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:46:40 +0100
Message-ID: <87a6tdgda7.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> When the block is disabled, it stay it is 'internal reset logic'
> (internal clocks are gated off). Reading any register returns
> its reset value. Only update this value if the device is enabled.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


