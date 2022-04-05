Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D648B4F2B97
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:11:42 +0200 (CEST)
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbh63-0003Jw-Nx
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbgqH-000212-Qe
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:21 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbgqF-00019Z-Va
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:21 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f18so9361350edc.5
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GWvpdYKYj+9lJ02PPqE2W2WtDWNrcbd4BI7dPC501Yo=;
 b=y1hZe9V/x/TEZ4H9OpgiJNw+FISw5ye835o5YoDtkimu48pOWAMRJH4sxp00EqZxpV
 S70ZOI3zrKxuzcaTpRjEbVvrqQSPcToE63v8HrqhRcwoaLix0pfan2LtX506+uwgWpzJ
 slaQnFrfjD9Jo4LBa4mILON+zT+rvV6PfTdi5n4+8UXaOmdvamkfrQZma2n/rqkwOItF
 4GwJZqktXd1JZCbI5ehQFtiH2oO9ze5J9p5ibgzfqL+zQzrGsfCIHnq4xa9e+Gt22IZ/
 kNCRjRA+5eQLxZEikA7ES4Wb9YqVSOruJcDYLS54p4bCNjafuIhDGYL6tTjUt+Hg5W+j
 irAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GWvpdYKYj+9lJ02PPqE2W2WtDWNrcbd4BI7dPC501Yo=;
 b=26GqU2Z7uV4YMwRRVtshG4WkTLt7XZPILH4D7YLydH+XrK9rnwmaOxkYo+uHzlgMiu
 uFDGh3vuDqbAbLnO4aP7V/7X4DiXO0dT8ZxN5WIWvtERjYvoXnWupOV4PDE0ZVs4Nc+i
 XaOKwnQpWg/LLDytYM2QPTGRZ+yS6wGMijtt/vF7NFWWi4WaUMdwzQMcKGfHWfLe51F3
 ElV0n9HauTsawl4U+7Tq4EDHW1HTls4yhOhB1VW9f+rYMJ3VCg9aZPsNuMGTn90j+gMh
 0TzHJH+X/sAcncg1pFz2PJOWHewCxfNa003zZs45wAmlCXHQQi2E7IzUe7RneU0IkTxb
 pQuQ==
X-Gm-Message-State: AOAM530cQx8f0u1XwygGvNCYuTjwIhAkwJavI02WYbcFd7vSYwjzNlM7
 bQBSwqqVwe8wE61on4uekd85xg==
X-Google-Smtp-Source: ABdhPJwkvpQTV9PX/OGYFKv8WyAalTGyGVdl6ujyn2J0KpTuqyGv5bqn8FY+22fewh2mZTGt0QbqyQ==
X-Received: by 2002:aa7:d78f:0:b0:418:efc6:bf0e with SMTP id
 s15-20020aa7d78f000000b00418efc6bf0emr2863873edq.330.1649156118102; 
 Tue, 05 Apr 2022 03:55:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 fd8-20020a1709072a0800b006e7b63f8ae6sm3035150ejc.4.2022.04.05.03.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 03:55:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57CA41FFB7;
 Tue,  5 Apr 2022 11:55:16 +0100 (BST)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Tue, 05 Apr 2022 11:55:09 +0100
In-reply-to: <cover.1641987128.git.viresh.kumar@linaro.org>
Message-ID: <87czhvlrzf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> Hello,
>
> This patchset adds vhost-user-gpio device's support in Qemu. The support =
for the
> same has already been added to virtio specification and Linux Kernel.
>
> A Rust based backend is also in progress and is tested against this patch=
set:
>
> https://github.com/rust-vmm/vhost-device/pull/76

Queued to virtio/virtio-cleanups-and-gpio-v2, thanks.

--=20
Alex Benn=C3=A9e

