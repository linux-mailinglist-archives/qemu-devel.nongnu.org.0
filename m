Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2FC1F57B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 15:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQtps-0002LK-0W
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 09:20:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQtoZ-0001qf-Rv
	for qemu-devel@nongnu.org; Wed, 15 May 2019 09:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQtoY-0000MJ-Lj
	for qemu-devel@nongnu.org; Wed, 15 May 2019 09:19:23 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hQtoY-0000Kx-F8
	for qemu-devel@nongnu.org; Wed, 15 May 2019 09:19:22 -0400
Received: by mail-wr1-x443.google.com with SMTP id f8so2682801wrt.1
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=lGeg13vIu9QamGoiU3kRLkgpMfysxq9BkUT6xkAnII8=;
	b=Icsq+wPgmODDNVArE9pPlttWupRUQoW53eZuOuqhMwSnZdGbWluOEHeUwDlwlL7RwS
	ZRdPMsv4dkdyR+AibT5PYkCrQwEPVnYKaKljbqmWUvVv7BffHXNImE2dY2yHpWhBn1a0
	Ay52p/uYzcaFYI7y4KgIPdv0ms66GfkC5n6qpLY1+h6foOu0c4IIcZca3z14NCVr+lGL
	vFQMDzH40E8/qkQjecg4vxCYPqdDoyfV4NTS1LU3Zay/+9xg4n507aDJUMGyh8kd85Kw
	W8aSMwSp8lgFAX86clUnUPH4CSOFkBZxN7HcGLx9clqwtBCwtNX+whCRhI6oLjqHQ86s
	ETQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=lGeg13vIu9QamGoiU3kRLkgpMfysxq9BkUT6xkAnII8=;
	b=o52zQSZSTyz86yP8dWY4dRx3jnL5Y/lVNx5M5IaPyxDXjJYESfvIKbz3skd/5DjKGV
	oaRgCu6astcgQn1MwBx2BZAanNjYVP1ytnoHUYaJD2ln0El70/IWePrRCPlWmtXd6fMM
	0m27Yqb+zpC62nhjGCiEewnt/6BO1NrXxT/1BpAjiHIQQk7TDZMJAZOO8dT8zjTvo5oQ
	8a/vhixZ/7Dfa203njHbCbG6nWalMipWGrqq5R07MFvgj9SW6Qw4mx1LHaleTBgBJMSi
	6Mx54nIqyFinUyXLkb5h6igBrRwhD7KV/kcTeq0yzalytCftFhYkd9zxVml/9iWN+xFK
	6wRA==
X-Gm-Message-State: APjAAAVVqt0980+Avf7bGoceUFsaMnVVlJmbfGdfT3VAIyry9+lUOAlf
	JIHrQmAIaiJg1NJ5ILuQBf2w1A==
X-Google-Smtp-Source: APXvYqzMUw4VG+RdKgLXkEsOfouzqAEvhgxf2ulyC/oGfSHjw5avz3Q8XOFlNZ1vC4ULZsdleJQQBw==
X-Received: by 2002:adf:b641:: with SMTP id i1mr25793751wre.288.1557926360997; 
	Wed, 15 May 2019 06:19:20 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id b8sm1775157wrr.64.2019.05.15.06.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 06:19:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DE4681FF87;
	Wed, 15 May 2019 14:19:19 +0100 (BST)
References: <20190502081554.5521-1-arilou@gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <20190502081554.5521-1-arilou@gmail.com>
Date: Wed, 15 May 2019 14:19:19 +0100
Message-ID: <87sgtfn9d4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v9 00/27] gdbstub: Refactor command packets
 handler
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jon Doron <arilou@gmail.com> writes:

> This patch series refactors the old gdbstub command packets handler
> with a new infrastructure which should ease extending and adding new
> and missing gdb command packets.

There seems to be some compiler errors and variants that this breaks the
CI on:

  https://travis-ci.org/stsquad/qemu/builds/532410263
  https://app.shippable.com/github/stsquad/qemu/runs/822/summary/console
  https://gitlab.com/stsquad/qemu/pipelines/61291132

You might want to consider setting up CI checks on your system and
running your next series through them before posting:

  https://wiki.qemu.org/Testing/CI

--
Alex Benn=C3=A9e

