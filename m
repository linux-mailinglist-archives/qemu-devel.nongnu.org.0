Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5948B233
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:30:00 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7K22-0000TO-PX
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7JyS-0005yV-84
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:26:16 -0500
Received: from [2607:f8b0:4864:20::933] (port=43735
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7JyQ-0000Hf-QO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:26:15 -0500
Received: by mail-ua1-x933.google.com with SMTP id i5so30717170uaq.10
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5whdWrzlfYUfk6Ua7wZnlNThQc4jegq4szu3Ndq9bLM=;
 b=ozpt1m2QNQfJWmTts8oaSEZqEvpvbnmRbmfViFBoiCWycUKwgdNAt/xBM1XmFn/fDv
 XWpKtbV0PRu8csMjnn8bdd0qyhL8HNwuU1JMHoANNMQRu0eI5j+AiHuaB184nHvedXeo
 cd0vhG3o3eYHR11IPcM/YWvUEw9uYVi4ZPhSFpkO3LGYredY6KPzmn+P2qhSiqIUvkNi
 TX+bBP77PPqLBfyHUGXJoN1WvzvwvuMTUxYNKHRjIyIiEI3S/9vPyEE+yEequxSK9NhQ
 mROKa0XePiW2rlQ6tLBl6uWofrui192ROB+sGUNlUVQYhMnlgNv3IbwoAfFXUJ4g9GQu
 FNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5whdWrzlfYUfk6Ua7wZnlNThQc4jegq4szu3Ndq9bLM=;
 b=bOGnPA8Xg4/TJr/fjNi7tZXAe+Q9G2LV+b2jcBhovQiJy9wxtZSP4IUQ7nS8dk+l5k
 IwALlRbgFXMgzA5YBg4R+XCYlFNUaKEEFsRJRyimQdsV8J7jy6f8ieTiUpajvt344XVZ
 Zrbrurj5OC1iPXPIm6hSxFKAdG/KL8s5NyBBGlJ3YTXP2Hm5C4bPwmpakte4uphAkuUO
 yfIb1UXBu++G2STtD3qEIjb6qdyDtwFoJNoK6ogT5IGWioMtE8WcRK1YEcnUsnE0hUxL
 sUInQWyT+WN1B/1d3aEHwTmoLRP3EI4bWKoTjyFB2sweO5CqUbyR/omrGflxXB9a2Ga7
 gm4A==
X-Gm-Message-State: AOAM530UD9je9r1lBnLC4WTFPryX4INMzX3o9gbbPX16UTRun/rGmOpT
 93A/sqQ8OevwQighCgCFUKBzRQ==
X-Google-Smtp-Source: ABdhPJyMZ8ElKFxYima5ehaVJbuLxnwBiqLTcFYaj9s0lkBuXpJLmltVTL/FNMBnjS1vBAuhx+60TA==
X-Received: by 2002:a05:6102:7a3:: with SMTP id
 x3mr2647490vsg.36.1641918373833; 
 Tue, 11 Jan 2022 08:26:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h25sm376694vsl.30.2022.01.11.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:26:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2E1C1FFB7;
 Tue, 11 Jan 2022 16:26:10 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 0/8] virtio: Add vhost-user based Video decode
Date: Tue, 11 Jan 2022 16:24:21 +0000
In-reply-to: <20211209145601.331477-1-peter.griffin@linaro.org>
Message-ID: <87k0f6b5nh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x933.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Griffin <peter.griffin@linaro.org> writes:

> This series adds support for virtio-video decoder devices in Qemu
> and also provides a vhost-user-video vmm implementation.

This brings up a bunch of failures in CI:

  https://gitlab.com/stsquad/qemu/-/pipelines/445691849/failures

A bunch are probably solved with masking the build when VHOST_USER is
not available but there seem to be some compiler warnings as well which
are probably worth looking into.

Sorry I took so long to get to the review!

--=20
Alex Benn=C3=A9e

