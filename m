Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AA48EBF4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:46:45 +0100 (CET)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Nqm-0002J8-H9
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NIS-00037q-Mf
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:11:16 -0500
Received: from [2a00:1450:4864:20::42a] (port=35365
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NIH-0003PA-Bu
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:11:15 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e9so15868866wra.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2P+LJW1WfqK58GE0Vr6u0mvTNRbavpbAc50I9s73N2Y=;
 b=AsOtYnSFaq6lSZeO8t1z6/JxKYMF8/hYH0hneh7LQWlg3WEMgwJnvD+aSaJjvdjjmK
 WPIxhVqg7snbjyLayd0UKl6H2bGnD5xmtOE5l7gHnSLxkD7YKWyvpmGy5X4MTyahETDl
 jQU2Grc8r6vEbx/woU8EvJI/wLNHCjVlRptbY0lb2+R2LXbz6mKMLoWaWkGeyP1uqxfS
 IWjeFNSCPzKksqwuh8VKh5VNnq48gmFKlE2v9linflhBf1WSbX6ZCpDZ05DSlQqsXoKR
 8k4V05aQSevYqRGLMHz4dKhWiMEYvpprXrIfQGaF/49ZAIYSvIS5UmMNI/eluWHXa2o1
 jyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2P+LJW1WfqK58GE0Vr6u0mvTNRbavpbAc50I9s73N2Y=;
 b=VDq8NO4nXFjrHhmlI7sAZGkiFyxZmsS0V9mROqdNTK3N78dyzglFZohZo1mcp25DVK
 cHht/msd5n4P3/jDs4GYqDqwtcWg9QL4RdQXqnzZgnWqXyYz5g3A8IqpfZ9ZUEtnK1WB
 FT7Hs87VDWvkDBZQS/vO2G+NRyWwT0v3Gn0MTwQREoSp5Ntjfx+nuhP5fTOAT0M0sfPF
 rW4Hlz+1GJaTQ54I4VUcylNSMD6vz/QctIsZX7ASo/Si8UkOIuzD7PMaCGwrnZQ3pTRy
 +Hi8YX22GuIS8/3LD0I5ucwnTDHTbAFQf8fzp9MwKjeK7/173kDiekR52iBikqRlc/jz
 f8Vw==
X-Gm-Message-State: AOAM531OYELyVh3ey+2lwbjrjPYhzMb5+8/lx/ymHpLq1Raeve/iYYXi
 XH0jY0pPY5zsD5tPKf2+FZHPmnmz7mik+Q==
X-Google-Smtp-Source: ABdhPJxjWvnJ1H+Bx3ZqpWgg81Els9bAnFfIKmeKAlij76QBVVOFd4KqGbxfjcvFUlLcUPV9KE0Vng==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr8724978wrr.179.1642169435607; 
 Fri, 14 Jan 2022 06:10:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm5056538wmb.12.2022.01.14.06.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 06:10:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F00F1FFB7;
 Fri, 14 Jan 2022 14:10:34 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <5f560cab92d0d789b1c94295ec74b9952907d69d.1641987128.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] hw/virtio: add vhost-user-gpio-pci boilerplate
Date: Fri, 14 Jan 2022 14:10:29 +0000
In-reply-to: <5f560cab92d0d789b1c94295ec74b9952907d69d.1641987128.git.viresh.kumar@linaro.org>
Message-ID: <87v8ym8l2d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

> This allows is to instantiate a vhost-user-gpio device as part of a PCI
> bus. It is mostly boilerplate which looks pretty similar to the
> vhost-user-fs-pci device.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

