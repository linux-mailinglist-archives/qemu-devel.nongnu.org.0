Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82E4F3602
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:56:24 +0200 (CEST)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjfT-0002ez-84
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbjde-0001HJ-5E
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:54:30 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbjdc-0007LD-Ih
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:54:29 -0400
Received: by mail-ej1-x62d.google.com with SMTP id p15so26850153ejc.7
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mRD2pj5OzgauYVwhz3f4/rloNXXqRLicIwcFRO3vn7M=;
 b=YIEWYkbxawGfeXsQcfvTe1cv7yxkqsn4z569MvysYGT5BIZcXXOS/EALFNVxYIIXR4
 bdbID2WUGhdrtAXNbji9X8LxLdVTTFLVM71DDJdE83+Wud85f5H0BAjqLFoYidZDO2RZ
 11q93ZRR5cNte60doOgeAmAwcIhAhX4vF5U3G57h9Q02n/1RPlQ1m19lw5bh50gYrf+K
 Uiy253eoenObt2Gmcn3CgwpUdMk9OJCHFnb2cL0Rkq9U20GGv+rhD2Gf7ozaONIRIv3t
 WlcEqWWpuvZ6kDc1iYMxo5VhKYDYwirm6u+UIaprAD4x3jayDyqufXC550tbY6622q0t
 z3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mRD2pj5OzgauYVwhz3f4/rloNXXqRLicIwcFRO3vn7M=;
 b=TFSN+X5dDocefhMZue0wGkW+2tw6I3VEtBTTrdrs5Js9+y4u0dFq2EtM8l5blk8sRt
 wXVqqEPf5jZXXjcVX/jcJKAyupK4hx1JSU2I5emsjuiewbkEUR4rjvQ1ZlTDuorQuvxM
 MR3bNupF9RhLuTtZGyJ5x20TyVslKDdUogsykCCTdYLIPQuw3VtjIwrPVN6JTU4mAv7S
 f7ukAyY0w/qdOGG0viticY9Sbg4kaDcHXqFDHfhvSj6JuBnV2jMgn/VkdXGXkhdA4sAb
 EaeJ+XdQQCVyTI9E7gmKXdStO/8woPKpLOEWpysSVJM2JJtwpMEiqzbGaLs2ehM+PCZt
 7OxA==
X-Gm-Message-State: AOAM530Ooih5+MvnZ070sspFrYrnLCmGF5hDkHHFw7TOr08ltrnTUHlv
 hn4351I1VStHFK+ahpl3aTZPAQ==
X-Google-Smtp-Source: ABdhPJwFONTCRxXwDwLq28XnPmR1dxfx09kqVN6gBEiiNqC1WAkUuK4eE7gI4fsNXNXHJEUX3Grvug==
X-Received: by 2002:a17:907:6d0a:b0:6db:f0f8:6528 with SMTP id
 sa10-20020a1709076d0a00b006dbf0f86528mr3638692ejc.466.1649166867024; 
 Tue, 05 Apr 2022 06:54:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170906174700b006e80a7e3111sm849189eje.17.2022.04.05.06.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:54:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 661CD1FFB7;
 Tue,  5 Apr 2022 14:54:25 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-3-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/5] tests/qtest/libqos/pci: Introduce pio_limit
Date: Tue, 05 Apr 2022 14:54:20 +0100
In-reply-to: <20220210145254.157790-3-eric.auger@redhat.com>
Message-ID: <874k37ljou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, pbonzini@redhat.com, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> At the moment the IO space limit is hardcoded to
> QPCI_PIO_LIMIT =3D 0x10000. When accesses are performed to a bar,
> the base address of this latter is compared against the limit
> to decide whether we perform an IO or a memory access.
>
> On ARM, we cannot keep this PIO limit as the arm-virt machine
> uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
> are mandated to allocate at 0x0.
>
> Add a new flag in QPCIBar indicating whether it is an IO bar
> or a memory bar. This flag is set on QPCIBar allocation and
> provisionned based on the BAR configuration. Then the new flag
> is used in access functions and in iomap() function.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

