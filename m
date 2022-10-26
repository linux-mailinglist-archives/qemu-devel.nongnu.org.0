Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B200C60DE63
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:47:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onczF-0001yI-8e; Wed, 26 Oct 2022 05:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oncz5-0001WY-U5
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:46:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oncz2-0000eG-Lt
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:46:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so25364406wrb.13
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0UgyfzlT/a0gWe9TnMunp4QM08vfgN2VW6aHHLTXxw=;
 b=zCtBRj1u6Dt87DepoXI6GqJDPggtCDxOMNzycQdlqxD+Y/6DbXN/g3dIeKAPhq2VWZ
 eSHJFSXeaYylxTVUw7xFiGlpAzQbPUIboqEJpsNCar/GzvH9DPIuHFWPIgYqBb8bCkiB
 aCdXhyqIOD5nlDa7f0BSNq5Ra6FeRCDel4ionQAL8kTynFK3Gnmr2HzwReTPDb/3DBmp
 Pt/xv/1axjo3q1Lz6+FXqe9rZatpNElBaw5JoOTFJTMVGSUZjci4Ii/9STnZOxa10oIG
 jbqAO/zx77Gg3CgN/WqHPBO8Bue1N14VMqM/Dsd9BhKinlK8aGaAYK57ue49G9qC9beT
 R28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H0UgyfzlT/a0gWe9TnMunp4QM08vfgN2VW6aHHLTXxw=;
 b=N4688OxiAp/0E4+wzi6US+EZ6yajIAzn2dG5ykfgBOomlIjR6SivD6+sl0gdG6s/4C
 gA45BR7oqTk67WjiCgkfb44KHIrAmWSvv7v7qPVwzozV3iyVaFzVUhsw+lF7zWkYEqOf
 oZnDezlQTsY7AUEMT6uoXUmaMc5VXbzi0sDUEP9VzYwrwJ8oUTh3bvVw+6DIRPddlNbM
 EW+zAouW5SpO2y0qc1bIkgrhbQfCuhELrkiHPSXerfICcLtWCCMiMcYQvawZqEJKuhwE
 8eHcoMj7Snm/T6aJz7AK2vIRHOS5hXJhd3YNcsJMmmodRL5bfr7YzQM6tN6sxvMFdaIw
 qHFw==
X-Gm-Message-State: ACrzQf2tPuRwW0Lrz9xT+b9Om8GDbEfPmzoq7eKQ3mGoRT0sr/ZSZWXG
 7ajUMT1/I6H6rvqHDVYNAx+cGQ==
X-Google-Smtp-Source: AMsMyM6aSHfWqUYwWRuAiQHTZDBTVPt0M2c4YHMWYzvZecS6apvWcunX4LwLP6zRUQyoK4dm0Bc1fQ==
X-Received: by 2002:a5d:66ca:0:b0:236:6d69:e1a0 with SMTP id
 k10-20020a5d66ca000000b002366d69e1a0mr11661421wrw.558.1666777558413; 
 Wed, 26 Oct 2022 02:45:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 co30-20020a0560000a1e00b0022cce7689d3sm6084656wrb.36.2022.10.26.02.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 02:45:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76AB81FFB7;
 Wed, 26 Oct 2022 10:45:57 +0100 (BST)
References: <20221025235006.7215-1-philmd@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
Date: Wed, 26 Oct 2022 10:45:52 +0100
In-reply-to: <20221025235006.7215-1-philmd@linaro.org>
Message-ID: <87y1t25356.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
>
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

