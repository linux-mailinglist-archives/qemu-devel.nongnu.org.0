Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2536DD17
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:33:50 +0200 (CEST)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbn8G-0000pQ-V3
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbn5O-0007rF-MF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:30:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbn5M-0006si-86
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:30:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 a22-20020a05600c2256b0290142870824e9so2895875wmm.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Tl/1T7NIaqL4l1+3Mwst7zbtCSxIlw7ws13tPycf0es=;
 b=F25RPGrktKCAoY+ur/WpvLMciK7vddrpMvldO+nHt5ylFsy9F9aogG3tvPbjCRZLjr
 cHX7x6FQVMWaa1omNS7/ukdpApmmN8YzHBd0VdKUp+yeip2svhn5CvQev6rB4mGR9RXd
 xvfddE6p/q3xC8922Cb1PbpTPFWoe9V9BJUcfA6pmy22fUWegvU0Hb213MzFDpP4vfI5
 biIsJmkUWrpB8CenLk3kOCY7utbYyFUjzepRtlAkn10v9ktoS6SBSk8UXtufxucpV79n
 7lNLVr0efV8SJ+tHPk0g0Qr+mxtLNC1nmxsY3ZVHkcIE2y5hO2XEd4Itm1JviDCSe7B2
 3cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Tl/1T7NIaqL4l1+3Mwst7zbtCSxIlw7ws13tPycf0es=;
 b=arXuiUh2VNSBVE7VIgCGvVUwQc8+9rLX4A+svazYxV2ne+VZAIkShbMt7WqHXx0aB7
 ObOkZQz85XI1MeZEubJhKdK8jzkI5391aN96x8Km2GFgxBEPaj9g9pcQUDFLaf0aSARM
 aimGNHb1aJAg2yWMmxI4a1ENoYFI06wOLu3VSfK6uurtbdmAbLiuchssFGi/qceQ7MAN
 VOsnJ3mXzgEzmxmdDFNY0lB9HHMonuZJ2T7iEefPRbP7ip75KAIoIiRr6OfLDMYU9c+7
 Z8amHiInzTqT8WaEPH/gyUp7paRP7D7SMpABp+317hXg85xOW3AB3TtW2Bec3okWr3JC
 ydBA==
X-Gm-Message-State: AOAM533E76tEO3lFhrdINJ1xACuZpgx+iMGyUYpHBYz7REsMUtZgQ1KT
 rWZ47aGbJxgPmT51Ltfy+Wh+cQ==
X-Google-Smtp-Source: ABdhPJzk4A92gCystc5JXkTrcAbyQD6cFbseszX9UrzJxwbDzAnpq06dI5zrIS7mDT+49C7Jnz1psQ==
X-Received: by 2002:a1c:2:: with SMTP id 2mr32474546wma.113.1619627446326;
 Wed, 28 Apr 2021 09:30:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y8sm381625wru.27.2021.04.28.09.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:30:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7C3E1FF7E;
 Wed, 28 Apr 2021 17:30:44 +0100 (BST)
References: <20210427185524.281883-1-thuth@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] cirrus.yml: Fix the MSYS2 task
Date: Wed, 28 Apr 2021 17:30:26 +0100
In-reply-to: <20210427185524.281883-1-thuth@redhat.com>
Message-ID: <87a6pis763.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The MSYS2 task in the Cirrus-CI is currently failing with error messages
> like this:
>
>  warning: database file for 'ucrt64' does not exist (use '-Sy' to downloa=
d)
>  :: Starting core system upgrade...
>   there is nothing to do
>  :: Starting full system upgrade...
>  error: failed to prepare transaction (could not find database)

Ahh I missed the earlier error. Queued to testing/next, thanks.
<snip>

--=20
Alex Benn=C3=A9e

