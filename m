Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F757089D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 18:59:03 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAwkQ-0001Ap-1D
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 12:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oAwfg-0006Dh-5Q
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:54:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oAwfe-00080k-Na
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:54:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id bu1so6622973wrb.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s/nxFiMIGUifB6edkOzkgR1RpSiKhhGsoOmgEzZ+sh4=;
 b=QhwXURIgm24rKXQEE+gQH/SNoL11kxY9g8xYEl5X/ouYRnLFuGqGJVLAXgtRwisCUz
 AF8NNBp/vMQfWk7TRl92haZY3Dl5T/tPXZmZlVZV6SQ52/um3UhlAQwHjLHL0fYraKOR
 ZKaSTliq88kh6SJAlHsBhUZKJW20MvDs5Uqve9OV3iyutbAULs9JuCj8QrK7LYfLpSLj
 f6+OjB9w6zXnUVFDVrbezxKyqK0YXUuOvWTYErvL8bT3npgzof/n+UVNFJUSWQHS+OKc
 3AXQTaAlGxkMP601sa6Q9U0d2MQD4L0lQm19HFC+LWOrst2wLmpaZa2yCp5Xc/vpZNgc
 ZCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s/nxFiMIGUifB6edkOzkgR1RpSiKhhGsoOmgEzZ+sh4=;
 b=7bBrq1nfLi1kNYWcE225MgO82L+co/ru+CNG96FteJ/sSzlTCE+yleJZNtaxvyaLzN
 e2uPFxZwKpDi283K0fjx0aE7x08ll99DkDOHD4/Ac6vfxvd98V1vu0zXowxd08kEgLfC
 X3NEP7TGhmCj+/k+uIvu8q9aaZxH0cO+OjzpV9lJ/b93J3t2xlO1ygTgk38Fx8uXDqIy
 CVDVA5tgm6ZANZsgHoNrlhObIdV8xlBQaoNrazFldBFlxpKBSAY91H3Fy1ucghRA/Ihs
 xbRpFbXesib5QDhUtWHyZxePMGXob3bZ+ClTk0FOGVmMuVjJiOhBZLYueD22462u7L47
 Ke5g==
X-Gm-Message-State: AJIora8V+RDR3btXLPhSHxhGL2yv9SvJxCdXQ1pPCsLQkqUEhHgUb2ai
 /W0wyLFVDjftR1V9FHSeWx+J4sUlugbNNg==
X-Google-Smtp-Source: AGRyM1ugkLUdd3QpTR5imcj8D2uiW6pWuciX/kGebGIMtjvEA6JDkBGt40yAhzD/v6rIh/eHank/9A==
X-Received: by 2002:a05:6000:2a7:b0:21b:af5a:323a with SMTP id
 l7-20020a05600002a700b0021baf5a323amr17790113wry.88.1657558443330; 
 Mon, 11 Jul 2022 09:54:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a1c7506000000b003a1a02c6d7bsm10446848wmc.35.2022.07.11.09.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 09:54:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A24751FFB7;
 Mon, 11 Jul 2022 17:54:01 +0100 (BST)
References: <20220711095300.60462-1-thuth@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, qemu-devel@nongnu.org
Subject: Re: [PATCH] Replace 'whitelist' with 'allow'
Date: Mon, 11 Jul 2022 17:53:57 +0100
In-reply-to: <20220711095300.60462-1-thuth@redhat.com>
Message-ID: <87fsj7si8m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> Let's use more inclusive language here and avoid terms
> that are frowned upon nowadays.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

