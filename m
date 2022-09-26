Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66D5EAC18
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:11:14 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqhM-0003sP-VZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpzn-0007zh-7D
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:26:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpze-00051r-8n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:26:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id t4so4763442wmj.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=CYplaB+rw01Xxte4Fbgb6VvUNHtO3jaeY7GnZiX0s1g=;
 b=hTSNkp1X7bLCZBRZ3PPra2z8zyLjrb6x1LTRsj4M2Nx6Jo6lyan93EHCyTwUQDtn83
 EzJ/OkXv5M3p83+Tph8cKeB5FBZLFHj+++DIxMrUIGIi/eoNaBzjuAw3sYyEHA26Iy6M
 SEl3DXVW79aiHnj6ZtWq78w+rhrhXx/oRFItomqknSgHJO7V4b3iwSlN3cG/OuzgGspR
 lMxNTLBsk00bUwOlcMfKR3QTLKKSglUqpUfh26dJAx/4/upj69AXhtG9bvxnGHkCGYBv
 B8n52gDLYzrsS3rtGGz8EXaZXy59jwqnKLK/CoqvX6QmJmyBKNMgRC8kvMxRe6i1iD5T
 cFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=CYplaB+rw01Xxte4Fbgb6VvUNHtO3jaeY7GnZiX0s1g=;
 b=VxBBH4B7xNZcHMKVPJkv8wkGej+1NWB4YqKY1D9zOlH1iXZQ5UBW8nE5uUOM5Np5sG
 w9szw3EwJw73/Zz1jOp6Ag6i/sYoRRvb+uwBsNam31f5KlXHAzCw8qEz8GhiRVui+Fle
 e4v+/DfvMtxOE67jIxKXSypRAU4FWwhnVUNQUFr5+7lbb6PGHs7dlmDRWF3dSzCoB9fn
 U9YOSfoPNaD5gIolDD4D4t+okOJAvDzk6SpapeTDWJS8Gl6se3R8EV4REFQWhlY7v0sL
 OnP6pMIe0/PFDqTaO9L+B0Gatb5zLauERvJgV1MNvh9NzYxzHWR6nAHIFNQikwLL5WJ6
 ibyA==
X-Gm-Message-State: ACrzQf3FAhOsQXWWvFFi9Nksqp1CCp5x9dCnmkTjifzF1C1UgjVm4oy3
 QZr8smO7KKm1dAX8mT5Ty6xkTMGa3ZwFPw==
X-Google-Smtp-Source: AMsMyM6VVcgcvIVfxX5lOXYXDIR16mlmS4cSdFXK4Jlan5W5JrFPbTvT0A9P4zkwACHxHOBVpare0A==
X-Received: by 2002:a05:600c:3b94:b0:3b4:9cdc:dbd4 with SMTP id
 n20-20020a05600c3b9400b003b49cdcdbd4mr22853531wms.159.1664205960333; 
 Mon, 26 Sep 2022 08:26:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c9-20020adffb09000000b0022a3517d3besm14972452wrr.5.2022.09.26.08.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:25:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 064EA1FFB7;
 Mon, 26 Sep 2022 16:25:59 +0100 (BST)
References: <20220825222745.38779-1-pbonzini@redhat.com>
 <20220825222745.38779-2-pbonzini@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 01/20] configure: do not invoke as/ld directly for
 pc-bios/optionrom
Date: Mon, 26 Sep 2022 16:25:55 +0100
In-reply-to: <20220825222745.38779-2-pbonzini@redhat.com>
Message-ID: <87czbi40oo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Just use using the compiler binary, with -nostdlib in the case of the
> linker; the compiler driver (whether i686-*-gcc, or x86_64-*-gcc with
> the -m32 option) will then pick the right magic option to as and ld.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

