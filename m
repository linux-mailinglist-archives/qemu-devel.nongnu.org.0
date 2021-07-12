Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB03C5D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:29:55 +0200 (CEST)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w0Q-0003ZR-Dw
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vTu-0007kd-Qb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:56:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vTt-0002W3-DZ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:56:18 -0400
Received: by mail-wr1-x431.google.com with SMTP id i94so25461130wri.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YoeRfEVEPXrZsmToRyV7Ftq2RYYTAmyUvlHu1mW4Nsw=;
 b=UuzsJ/k7Ofe0CJ3Rdlnu38rEhebZyShTPU2qfgoy3YiZ07CKKBbaBgjC4qlKXpiii/
 gBbCfRGiycEQ9DBeTnq1bFM2QmMovJ7UG2OAEna/vhlskGqMU30DMLOcytBsOBo6K2gX
 QRNGrlYih5cJI4DkJRujS0TJiJzxsu4ssEGTswb0qoPULyJU69oIZ8ImRwHaQuu+OzgX
 /8DrfOE1GcfD2y7Nx7YqAHawzxvFTdlQoeNcfIhmsKbms2zhAY7vFHw6/fBaJWzuLh0+
 JOD/57Tac/5xzSJ86H7hV12HAR0jDlYKuA4pOUw+EFqwgaMH1LeHJhvHGdJgEl6kVNp9
 /+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YoeRfEVEPXrZsmToRyV7Ftq2RYYTAmyUvlHu1mW4Nsw=;
 b=Wtr+u13gUd8AHTtxGFnyv3CH2JgLDp4yHofLPUEX3NGtJ+loJrwfYZi7wuGUhLgSwC
 2Dqe/5WvHdHok40u38hcMlgn8oHzranapPlmzKBQlkyRt7t+fuqGkvtpxZ2oyTSbga0f
 UUseug0N87x5Nwv1QWD5DDp5QJOynDI02f+8oukJTqMIb1GZIS6WYlbnMw5AgbX8jGHa
 /ARoG1YMH6VIlvPflYrqptca2wps4r5uFAUc98Eu0uOvINWFN6iUWDtl+kb/yjg1bLEQ
 +zImWq77qsYP+nS2+7/Mh8qHit4cOyihKHXr/nQDKrOzVxO5n86djM54mDvhoJHNPmWR
 xxxA==
X-Gm-Message-State: AOAM531W+phluruXZVX4EIg0vY5PT6VYLAlHJosM0g+1QYi86niIhqwW
 Y5s8ucYCkmmno9eOGF2ZUBd0D8fMYZ+Xpg==
X-Google-Smtp-Source: ABdhPJwYpF/SZa38huVGZE7hkXFa4mKFg3qlEfNc6ubExfez8pMokdCTT++a7kODXxv5B0X8VkJRpg==
X-Received: by 2002:adf:de92:: with SMTP id w18mr48362862wrl.42.1626094575425; 
 Mon, 12 Jul 2021 05:56:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s17sm14425985wrv.2.2021.07.12.05.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:56:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBA8E1FF7E;
 Mon, 12 Jul 2021 13:56:13 +0100 (BST)
References: <20210712123917.463123-1-pbonzini@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: fix condition for io_uring stubs
Date: Mon, 12 Jul 2021 13:56:08 +0100
In-reply-to: <20210712123917.463123-1-pbonzini@redhat.com>
Message-ID: <87lf6bvggi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
> not usable in "when" clauses.  Just include it unconditionally, it will
> be quietly elided by the linker if liburing is not available (including
> on non-Linux).
>
> At this point, the difference between libraries that have config-host.mak
> entries and those that do not is quite confusing.  The remaining ~dozen
> should be converted in 6.2.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to pr/120721-testing-and-plugins-1, thanks.

--=20
Alex Benn=C3=A9e

