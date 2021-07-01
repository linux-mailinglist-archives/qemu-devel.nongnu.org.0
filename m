Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188E3B91DC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:56:45 +0200 (CEST)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lywFI-0003NQ-CP
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lywDl-0002EZ-KM
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:55:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lywDj-00045K-Ss
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:55:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso3995238wmj.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XfNf+UwiIVrW9M8sDwRsYz8Nx0S24NaGav+5KpAqhpk=;
 b=aFceSPvny3sJwOZLKHf++D0AYzFuDHYzfO7m67o5tnLubpidW9w4tL+pGuk90zZMdB
 c62ySk7lX6slFGI+e44pH2ArfCylcpMOn4RlyQdnG7HCy8U1ynF20yHFe6Q7pxVx4eoZ
 zmR3qbdIjw0a7CB2Fvg83ZqAkdiB5Uq5A7zd+e9DZIUxo8TZ5OD84xJvnaa0QlZwU4Tr
 Bj3fUKl1mLakq06lT1B97h3uojoUx7gnDb3TpzwZPGgvt7WXq5JBrMmwMmTdZKLU14Uf
 xY8LOG52ofs5pcKxSeNULUJm0CBPZ5nIb1ZjAtCaL3bqH+Rh/QnlnJ4N5BNMcFr7/JRY
 3lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XfNf+UwiIVrW9M8sDwRsYz8Nx0S24NaGav+5KpAqhpk=;
 b=lANcSdwmsqME2e622i+vtaj7Erak3/QM226ddm70TKZuU+Urpk38AlApfsY0J2zbaO
 J6vF//i46q1JFc2iKC03ue0Kjwhgk/oOE+nehx2i8PXQYUIyyqo7xaxYgdVCaSf2wt63
 ryEJn3NCtSA+N3DX+COy6eIH4HHgid5ov4BtwSLyKZNsGmR9RElY7XB29GEHgmEoMnxQ
 oU1Hpn6Nf/K7cLjU5457DozZGfEsnKOguQzpA0kDPIkVHOFOmOQXX2W0tzv7ADWo2U1E
 ghIhfrpcKvS1SOCz9K7MTZ/5QIApy3f9XpbPXls8Q+n1TUpZlQHHDBp1C6nkh4QIsabI
 OMyw==
X-Gm-Message-State: AOAM533M/KCpP96m9/Aw+9/7jbb2uqEul93kwpgeVN1r3Q/km/cFmqKA
 i41bnSI1UAj5+wxrbkfXRrDLag==
X-Google-Smtp-Source: ABdhPJy1wqc3izFYz/+v6dPuQKeC2VEvNUG1pG6UWrlX6WmfUQmka3fK0Z93dBy58SRl/FZK5VJOAw==
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr10543260wms.25.1625144106221; 
 Thu, 01 Jul 2021 05:55:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm25643771wrz.7.2021.07.01.05.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 05:55:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B4DA1FF7E;
 Thu,  1 Jul 2021 13:55:04 +0100 (BST)
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-4-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v7 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
Date: Thu, 01 Jul 2021 13:54:56 +0100
In-reply-to: <20210630012619.115262-4-crosa@redhat.com>
Message-ID: <87eecip51z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
>
> The playbook introduced here covers the Linux distributions and
> has been primarily tested on OS/machines that the QEMU project
> has available to act as runners, namely:
>
>  * Ubuntu 20.04 on aarch64
>  * Ubuntu 18.04 on s390x
>
> But, it should work on all other Linux distributions.  Earlier
> versions were tested on FreeBSD too, so chances of success are
> high.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

