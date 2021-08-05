Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7CA3E1476
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:09:51 +0200 (CEST)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcC6-00060e-Ca
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcBJ-0005MJ-9a
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:09:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcBH-0001p4-OV
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:09:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso6115587wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=v+8fluF3NvCz8tD7D0XJ06j+C8BmukQGqcsaSgYKo1cN18fKW+SqJSLA4Nrh1R3Pm9
 CKdbAnduaX2O3gMwe4ah7S5FcqObYC/S0eu3rg9yCa1VvAq6I2528Tv94Ol2cbHuOKSL
 iSXKn4VCnktbQ//zFo3CNHPMraTgl1QcMtnJjKViKwO3C/YVAOZQB+MSO68s/eUMS3Pa
 FnodffQwne2YSWzgdnv6lFScsP6jFlIXI3f5YNJSNuHoI1jtUIx5wuREvg7iT/QY+SlQ
 gO7FIAsTnvYZcY6wtKolBNhecFhZDUk7jcWI2GkuZ34EUTt0+7Nh3HeeEhYmC0NYWqfY
 1V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=b7k0cgATgv8Dx2Uo6pKi8hIqz2J0J8WKGOElCxTARW6V1yZ+o/SZWMVMvAa+ZVeM3q
 wnKoKTRwwGNczKt/DW9C5zai8us7ag0s5iOQXNqrh4dn0X5Ef69zFXJgVnFFyS9ePm/y
 tyMZlhWnM8UtIo5XEvCcaGtjpYEHUQbl4eDqDEnXUhnHTnR75+RThZJkoxTONiNadDCe
 zUO9qVI7CgM6yVYYmsr/3NEz8BNwgE/MbKimLhpp0saTnIObSHuC8C7mYb5ycqLsX+Ug
 lDZQeuqm7ia03Z59cb+GJR/iwHxgzc4sYQHsqLpFUvkEnwNmfrRob1MbGfHbqYUJsJvi
 ojwg==
X-Gm-Message-State: AOAM531csp9II7q4PskIfSZAWN7zK0mwNOVoExfYgCljTBtzVSpvcgVa
 YF6Kzny+AmZm2uD5MDbw7eckpA==
X-Google-Smtp-Source: ABdhPJxkpXju6i9mxjxy+Q3yRh5TRe/K+JjOptblu3dWcl/d6xx4uL2PZevhTf7No/KSVDwtJ3bEnw==
X-Received: by 2002:a7b:ca4a:: with SMTP id m10mr4744630wml.174.1628165337627; 
 Thu, 05 Aug 2021 05:08:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e6sm5347148wme.6.2021.08.05.05.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:08:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 621061FF96;
 Thu,  5 Aug 2021 13:08:55 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-4-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/6] docs/devel: create "Testing & Debugging" subsection
Date: Thu, 05 Aug 2021 13:08:51 +0100
In-reply-to: <20210804005621.1577302-4-jsnow@redhat.com>
Message-ID: <87fsvoksa0.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

