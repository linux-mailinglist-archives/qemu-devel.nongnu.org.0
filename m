Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B681C375357
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 13:57:26 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lecdB-0001gj-PU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 07:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lecXE-0004H2-Ko
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:51:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lecX6-0003Bk-3G
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:51:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so5153759wmy.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=C/jSEqQamCJjQBHae23LV9PWnfqampAK0mzh8deoeIduYWB2P7tZZjoestFN1jimhw
 4401l4y+K2jEp+jPjOqNWj49w7M1yzdIh0d2GH4jxq1RwcIgMLqi1a6DbAiskcYYtjvF
 52hkOhvNxUsZDbv9GXxVTsSgwSBS8Ph+rUSqDN51KIPfK4PYCA61IdcP/DuK3sAHYnDO
 dhN68kZJW4TiAXQF1U25zvhOloxRIzNSQ32yKZOE+po3GZ0CA8F9vyRaUcPtKbe+FD5O
 GVGhdlPHJUr5eNGvzFC4hXNpl/THI/ntsHfV3mJIZyEZ2CnZxgdx44VaDqWnqGdCHXXu
 dpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=l/vaFtkwslxCeYG1C4hm3c5btoDFspxva5jpDcpgkBnWl0P3jXGvzfoBVjy90iM6Li
 D6RgbR3Aq2LdTQgRcZU3SK7zoCTP7dXcYcD9BV8DFMpd78kYlDrInf+fOTQ2FLktIbjj
 TNwxnexGb6bk3i1Yhsf8R7uD0pVWMmrEA8Hq3SbA9+4/GqNiB2CB4OoLNDjiy9tZu+V8
 +H2I3s/f+1mecWchQZTTAwEqdXv54vs+lZsYT7aaPBwnYQSmlP4xWy4h7FVquAjn64Bu
 fmodPKe1+Lv8rtz/OyA0bDorPSdWpBlldMJsk0y71czjxwPGanKTPhBQ8vKV5j8PV9xL
 Lefw==
X-Gm-Message-State: AOAM530t4W6JBJ7DstSrfdtcLJVNs6+cLITx6tBAcPCJZ6EMTF3n0xpe
 fQBjSwJGm6ZQSmMzrF2Rmd7k0g==
X-Google-Smtp-Source: ABdhPJwX/X1TXaz3u0X0QLafPrhGPkttJMYdqw4F+07MEttGcimYOo70pZbNTfQ0iEjYLN/73LByVw==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr14580621wmq.57.1620301865114; 
 Thu, 06 May 2021 04:51:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm4072044wro.87.2021.05.06.04.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 04:51:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D43C1FF7E;
 Thu,  6 May 2021 12:51:03 +0100 (BST)
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-3-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/5] gdbstub: Constify GdbCmdParseEntry
Date: Thu, 06 May 2021 12:50:57 +0100
In-reply-to: <20210505170055.1415360-3-philmd@redhat.com>
Message-ID: <87a6p8nkrc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

