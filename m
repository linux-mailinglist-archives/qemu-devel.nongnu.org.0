Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A568649D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAIO-00069L-1Z; Wed, 01 Feb 2023 05:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIL-00067a-L4
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:49 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIK-0001t3-7Q
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so981882wmb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKelXlTvg7PFnZiFd/GH2jZXxuq2ysuy7rbTT3HjiAs=;
 b=S2xfjbVNcsCSbFOJPdRokoT1uN6FhUWKI8G3TokaPP7hMLhRW67jg3uqvjljxE9/gr
 awkeaNfdOfn/wRfC1ATHK3PIva0KD6qFNPc5SVvJblt9APVgQwysf/I4mT08hdL6m9dZ
 iYrtZdQtsFw+ytD+c8RlE9uhAuvn3ruafu3wrITZePzi9rhNxmWYPGZsInfIy5gi/9vA
 B5TBSgiTrG3tLIFXYvPY/JBSjR5t/FrOXocKho4okZC0N/7cADsPNemGjVNw/PifemIU
 hkrXHaLUlvwY9OY8RvBf2Sb80uISAzlxS7Sf3vxnWhyFCdzeAKIf+77h2d4jPfTvu8ct
 cp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sKelXlTvg7PFnZiFd/GH2jZXxuq2ysuy7rbTT3HjiAs=;
 b=F9hNFoyWVq10Z5pmMyZ47J5ZzEkbZV3ubMgbN4k05K/SZzSHzDUCjyIVp/UG8AhPwP
 YmHPs8zMbUKfvJ8BuAGDib3j0ccOj9wjRulDEh0UY0G1/dJ4Of2ZAVs6GxI56wLopPly
 o0hRBK6mx1Puyz/+GHdSJogNua4dNt0pq658hpTnCwOdO+Sbl0dqubeH2XbuHYDZ1KbJ
 SUa8j1BzLK01CVPhoQGWaDR1qzLozs9C0s3yYV+3bo7qeMQaLuEyrVdTVv6aMh0i28tw
 weMmDI3Uzzrp1uZlyqykoxfuVZedXHQRGRzLBIJq2+ARrlM/hfFmCw1gAV+b/20hfrPr
 k3rQ==
X-Gm-Message-State: AO0yUKU0C72yQR26+cXvg2KzS1sITqENMAEGSgrReByl8WqEQ4zA+xOU
 QRmERYoseM9NelcTftQ/iyR2Hg==
X-Google-Smtp-Source: AK7set/Gg6KhDsn1ZuvCI/s7znAPh8rfmRfPkIE4D2z/OM+la60lisU2193wisx/TLa8zcB0JE5Jhg==
X-Received: by 2002:a05:600c:1d21:b0:3dc:5ad0:e583 with SMTP id
 l33-20020a05600c1d2100b003dc5ad0e583mr1439172wms.22.1675247086916; 
 Wed, 01 Feb 2023 02:24:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c071500b003da28dfdedcsm1318915wmn.5.2023.02.01.02.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:24:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28EB51FFB7;
 Wed,  1 Feb 2023 10:24:46 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <2027b734e65a94bbe59be038e580d55064edca54.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 5/9] Updated the FSF address in file
 include/hw/arm/raspi_platform.h
Date: Wed, 01 Feb 2023 10:24:37 +0000
In-reply-to: <2027b734e65a94bbe59be038e580d55064edca54.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87a61xsmxe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

