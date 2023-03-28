Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB26CBD9B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7U0-0001qh-9K; Tue, 28 Mar 2023 07:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7Ty-0001qU-Co
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:27:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7Tw-0001aK-LC
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:27:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso768872wmo.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 04:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680002835;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmLVWRHv9Mce/1Gxtf/hiKt4uOFJk025+sXNL5BqVhI=;
 b=YbTyLOPmPySapMP2QBhlVXPUCcCkd6KpTjdJOInijHZXQvUz9MLJDoti6nyk+3EuYF
 iMAaopafZHrwY7fXxRGIjeIOXQUJEfuLOjdioqxSS07SI/yzrlw8OPLON59sdXBlAl24
 VJeDRAxmEfB4fgWLOqI+ct4Cu2eQ9d08cB3Yvdc9bNrhy/pBly83H6Gtj8bCUmdfU7LR
 pvuFwYCiBc2dJpeAXZwdoowyWSJsmZ6Fir9a6c7JOTQuEl0NcXUKo1Ch0ieJGcK++fu+
 jpflbace6M0fFT8n+Rs1pd3CIMF+chP0c0Cy9rXxbHFTy1j9QDUghSZOZmw8APT9Y/SO
 FKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680002835;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mmLVWRHv9Mce/1Gxtf/hiKt4uOFJk025+sXNL5BqVhI=;
 b=MLgRWwP1CYeZbN+VWlYTwSvONvY7XSb3w/19umYPtzC9GcH2SH5Ml+B3b9sod8n5g2
 ZLlYx7/vA2iKocEuj8l75t9mP0OTOFhwXejUUMNc3EgYO0XKuMlW1Z1CHcbqL1jZQPtX
 99Ln+fgzfv7sAmFQ3nhKwCcnaBijJoNlfOuqWDQHeqIJldwUcym5Wx/HdeN4NdvBm5Eb
 bmFH6xxK39BK2S++6PTB9QgV0ngYPmuk8DtWoHD3P9qOOoysGp2gzRnDMjL2uzjYbIWG
 KK5355jZYb/a7bde8X/VY5mwARO0OFxRxh1ZIhoqDptkONuk26LlgAYfhNhnShWuvHEZ
 cFuA==
X-Gm-Message-State: AO0yUKXZKIGLK+XS5v4+Fgec+dquNWCLKiNLECf8BCNH0HH9d9iBe+gy
 0aFvLKmD4SHe8ER2Tcdk7W+FVg==
X-Google-Smtp-Source: AK7set/rKuJeCLEfn8iMwesAs+RUH7DbxCveNvjd+59wlqYXnKCIHEaAUVqNtzWdJIjs2hdckl2YNw==
X-Received: by 2002:a7b:cd88:0:b0:3ee:7061:1bdd with SMTP id
 y8-20020a7bcd88000000b003ee70611bddmr11925479wmj.4.1680002834958; 
 Tue, 28 Mar 2023 04:27:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b002dfca33ba36sm5932061wru.8.2023.03.28.04.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:27:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4841F1FFB7;
 Tue, 28 Mar 2023 12:27:14 +0100 (BST)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Liu Jiang
 <gerry@linux.alibaba.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Date: Tue, 28 Mar 2023 12:27:09 +0100
In-reply-to: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
Message-ID: <871ql9ru99.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Viresh Kumar <viresh.kumar@linaro.org> writes:

> The same layout is defined twice, once in "single memory region
> description" and then in "memory regions description".
>
> Separate out details of memory region from these two and reuse the same
> definition later on.
>
> While at it, also rename "memory regions description" to "multiple
> memory regions description", to avoid potential confusion around similar
> names. And define single region before multiple ones.
>
> This is just a documentation optimization, the protocol remains the same.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

