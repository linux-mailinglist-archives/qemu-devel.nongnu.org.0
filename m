Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919874A82AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:48:41 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZfM-0006nA-L4
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZbO-0004zg-To
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:44:35 -0500
Received: from [2a00:1450:4864:20::62d] (port=44569
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZbM-0002Ny-MK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:44:34 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ka4so7297320ejc.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=S3IyqGfPRAYr5m0NYXMk9jqKaLejDcoam6qhfjL2dodUzXI9ahHc14IzxafLX6saam
 QXNVJf2Udb0JXjt2AuQxb52Efsqr2ido/Z5rhfki+9CoS93S8Fj3shunMZcETSXvwY16
 4ERYs/8gMVHLSxciOVOAfZ8vbbctPYdE6hN4aqz0z/6qVaqcl8vZQiqc8EyURy/jEm1Y
 5piIIl80yECh88kL5+lx52bhhIZzqdjY4MdWh1P6XND4m+5cukeck1zfPYPrKE1wJc1p
 VHCBAmiu8LJ6DY24uC365z9IolK5GsQs28j9zum1G7kVuFr66n2s+Y0wdjvmvUXK21WS
 FkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=vklZZA4iAxO0/aoZQec3jeYJz6oT0r56CauffuOIGajN/aJBD5eE2LSd56YKvOWlIU
 yAB9A6mtDIqO3ckNju5NxzyjVgs8X4NKmGn5DeKnqx4YhMzbKT1H+r8q1IWjFJsyj6wT
 wnO8KlZjDIjDm0zNu77QOqFmSuOiUUgpYE+sqobKo5uUIwGpkKuYgldu+ozlH9UG6xbD
 Dio5goRpv2mjB39hFy/d2wHgL1Zb4RuMMQG+cktVqgMtu/9D5Gm3NzmvJ5Het8Cwo1Uz
 XAyp2nGl1kK6zd3VhT5VDzXQbJcAT1HOOztfokR0lIi6vAhyWLxbKrpf6UyX2Oa+z0jS
 Admg==
X-Gm-Message-State: AOAM5321tnEXqeadXDCBUAK1LsuYY2vkYfWY9Hai0KW2aXNI3J4wxi3I
 svfMoit0PKWoDtmI+xZDkzZgEQ==
X-Google-Smtp-Source: ABdhPJywMgkmvAmSp6ddlTHvfrreajnmHakdaBrgvkSyjoUvKuMmVa+1bDGrIBsSlwU175yaOBQSiw==
X-Received: by 2002:a17:907:7e82:: with SMTP id
 qb2mr28590199ejc.496.1643885071206; 
 Thu, 03 Feb 2022 02:44:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm438816edw.102.2022.02.03.02.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:44:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A09621FFB7;
 Thu,  3 Feb 2022 10:44:29 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-18-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 17/20] tcg/i386: Implement avx512 min/max/abs
Date: Thu, 03 Feb 2022 10:44:24 +0000
In-reply-to: <20211218194250.247633-18-richard.henderson@linaro.org>
Message-ID: <87tudgtek2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

