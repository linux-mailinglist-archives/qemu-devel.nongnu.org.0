Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23549FFC2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:48:07 +0100 (CET)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVLy-00012X-H8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:48:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDUPn-0006nF-RK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:48:00 -0500
Received: from [2a00:1450:4864:20::631] (port=44926
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDUPk-0000uV-Oz
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:47:59 -0500
Received: by mail-ej1-x631.google.com with SMTP id ka4so17812888ejc.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kAFFJosOjJdkfmqR/6JhNlav2hmRd7Kgv5XzXrPDRG4=;
 b=DtkAc+btpQPRZF4sQe2YPvRpLYxvoF/X6BvlmAET20QIFnQpANA239qZ4gAVIbmXu+
 Doji32pP68KAJGy7UQaamz1sHLMj8UOowEQ+jFs/3VQaxJfJ2xZQDsqFHAjSk6AJ/I5I
 mfJBy7Ds30YGlleiX8ynbpCBc7OYB/hkWCzpcg+nytQZH2Y8FzlFwMMp5V6hQIJ+N4qS
 0KMiRMXuPwrcOn3SJV5/q6UZjaug8uVGXPlJRBAQXdQHePKhWJ2Igq1FaSexlTMoppyO
 3J34H+qsSGEC9q1b2QRwr6M2/CW4gjhlUb/6g4sTM0ZZ5crVayp8DJeklZ+bYb+yHc4Q
 Zz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kAFFJosOjJdkfmqR/6JhNlav2hmRd7Kgv5XzXrPDRG4=;
 b=g6Ut9otTvB6bDF/Bvd2AzZxSsSvYH/ysGbJbA2UNTKYXSM6wflYbZTTKhwxRFOYRKW
 T7MTx6doh1NRf93A0+dLxWSzd7MDWRiPwuVMuNjRb26ToSQVyrBhT+jM1Jpd7zg89n6t
 9nXU7jWiWdnOaZuEvcxBNFVqwtwHB8b5csMv3aO74xwFRuB9pb311UUn8zuBjfDhXmdM
 Todfs5ML/KmN1Va8OXrJgiF3OUYkNA9I6g/re2Z8l0YtAzhbt4yKhTpXavX2pV3h/Kch
 zjXcgEVNWjwxaHPTYgJtIhNhC4FVG+uyYA/m8B/DTlNQ4JW0XTL7eHYv9y/AqVrgeHe/
 xZpA==
X-Gm-Message-State: AOAM532sZOTr/M61dbSwV0F0bpr+5KJ9VVWdTdlj4eCQJ+0xpdobOBcv
 kMY3NJ20te2S8ePNUXnC3x9VyA==
X-Google-Smtp-Source: ABdhPJypws6sMRVbaKb0okhkvPykrrYpN0OrPDmw6dUwtOGxTlg92DJFtXQbGmcHZDhjdEk/2g1njQ==
X-Received: by 2002:a17:906:31cc:: with SMTP id
 f12mr7406870ejf.115.1643388463521; 
 Fri, 28 Jan 2022 08:47:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p29sm13317781edi.11.2022.01.28.08.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 08:47:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B29231FFB7;
 Fri, 28 Jan 2022 16:47:41 +0000 (GMT)
References: <20220125173454.10381-1-stefanha@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] gitlab: fall back to commit hash in qemu-setup filename
Date: Fri, 28 Jan 2022 16:47:32 +0000
In-reply-to: <20220125173454.10381-1-stefanha@redhat.com>
Message-ID: <878ruz958y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
> causes cross_system_build_job to fail when pretty-printing a unique
> qemu-setup-*.exe name:
>
>   version=3D"$(git describe --match v[0-9]*)";
>              ^^^^^^^^^^ fails ^^^^^^^^^^^
>   mv -v qemu-setup*.exe qemu-setup-${version}.exe;
>
> Fall back to the short commit hash if necessary. This fixes CI failures
> that Greg Kurz and I experienced in our personal repos.
>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Queued to update-plugins-next-280122, thanks.

--=20
Alex Benn=C3=A9e

