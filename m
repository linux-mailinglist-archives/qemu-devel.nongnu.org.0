Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE23157CF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:41:18 +0100 (CET)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Zov-0001y9-1D
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9ZlR-0000PU-N2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:37:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9ZlP-0004c1-Ve
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:37:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so23719040wri.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sCoHBmtgWJaq+hfW0pH8Y2LCInIKenhZfFrnLzfoxX8=;
 b=I6TPrUohPYSFpPi1djVinxrW/AFqgx0Cgi/sHbwhCUcydJrckHulm1BeWOZs+tfCOG
 Rw0GhmPZ+aPFwvJ4AKgFElKErhv1KK9NcOhDnlwItMh9gFlZBh/7mKh2rhhTJvhTxxUO
 YKWtQer2mjYs3ztTOrjY1gItwiRG1uo55qDyJaz/0PuO9egqrdYFKkDDQR9StCnrJizD
 WKp/truq1CNmTpVNh1l7Z8ShxAA4XJ6zePkPzjW7VOQ4IcLO5pshHbEDdaAvEerTk4Wj
 WM840h+J/k3LkBdfT4azYFxpT/gx2yZhxe8gulLEdONQ+KPn7tuEkwMJHICEn2CtDtvC
 Vfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sCoHBmtgWJaq+hfW0pH8Y2LCInIKenhZfFrnLzfoxX8=;
 b=V7XrDU8pKvCJ7Hs6SrXmXDaIWHtWm9ER0t8AFvXFNq9oGoSiRgAjVGJZzAalGiUFuc
 sWZBOUkO/mmiIOzz+PIDp3RXf/jx3c8+F87C5KhDAtNCdXdD4KhH7++mpBQEYD3VEJuO
 lyP/oEbdX7OFmJq2cLDM+0sP0BJXvhPlu7S1bGD9x1oc80W9SsZheLEJeNUFbOf2Jnvv
 Tn0XpCHzcDoCs7srV6sOlQqAVG7Zb5V7t5AZJ75QM7eWB8DQL7aVzF7pziBJmYT/BPTZ
 cx2An/e2nbohQIC9u2Aqb2p+I2NCPtlhGDHsDpt6o+6hbGV3rL8lBgtbN3B8LG8/Kj7n
 ZveA==
X-Gm-Message-State: AOAM530jd9RBFQ22V1tPKmFDXddQpTMUOqURBSV4W46uYqCHWNc0ZkMb
 QjQ6h1LYnz9Rd3R3jGNAWYX4w1qbPfjK42Np
X-Google-Smtp-Source: ABdhPJyN72liu+WF4n4SIs2gcJbLxp7nHRNItvTKUxHrxZ+O5xLk/dIXyhWxa7qkR761EnTZUqoGIQ==
X-Received: by 2002:adf:c187:: with SMTP id x7mr7164473wre.293.1612903053545; 
 Tue, 09 Feb 2021 12:37:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm10778738wrl.84.2021.02.09.12.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:37:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0CCD1FF7E;
 Tue,  9 Feb 2021 20:37:31 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/5] Move remaining x86 Travis jobs to the gitlab-CI
Date: Tue, 09 Feb 2021 20:37:26 +0000
In-reply-to: <20210205091857.845389-1-thuth@redhat.com>
Message-ID: <875z319dv8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Since Travis changed their policies, travis-ci.org will soon become
> completely useless for the QEMU project. We should now really make sure
> that we move the remaining tests as good as possible to the gitlab-CI
> instead.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

