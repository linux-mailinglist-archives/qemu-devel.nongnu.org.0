Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522760E84E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onles-0002SC-Nz; Wed, 26 Oct 2022 15:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onleq-0002R4-JZ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:01:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onleo-0007XP-Ve
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:01:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso2376677wmq.1
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zpzp4aOdkkISx5ILcz2RiZRzgoDoLjsOb8Q83qDZTuo=;
 b=g43jYRFfdAkmpnCeBkFk26McMgzkKS7nAuOKg/fO6paxLU22nK0yZx/x6sIsTKP2QG
 ceZMcomWlZ4Qqdr9tiRbWw08c6rxc3Uh23la9I7wr2Cn4es2aNmVO+nSZfimEGiHMSQ1
 nPgRblPQSj3/6Z3O5RuGEa+vbjbKHu1Kd4W00n9dX9NZ4V+lehuF+YhnPI9xJ7F0iF+L
 ayRMtgchppJNjvmi537QMxKjBNlzUdpvWU+NpY9hqVIG6lQyjJLtw3I7aUhTpux+3ywF
 6pNDyWCE8JgsFfOOVA2x6R6TRIqT+Pnb4ovKdxAN9TAaI8XyINmrWtrAx4VU9jWcKhf6
 trXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Zpzp4aOdkkISx5ILcz2RiZRzgoDoLjsOb8Q83qDZTuo=;
 b=fwFK9faMLctIULhqGDFPfiPoLbzCuVDpCpUctmoO28Q9MFvm5/+s3bdKA9CBh4Dmg1
 Qj1yXjVn5WPA7etzqqhfP9xPjeEiNaz6mPS5L09zXNOzwRBIvx258UsFz/QGqQqtDce8
 JOZLKEU1wUxol+5X6+1sUWGNbFAiFszlsn+QR8YoKzlrE14siFMw7hoNz8FwaKe9eOnq
 v1+e+wzG+D/ouBluWoCbAPuiq+HH7W9lmutso+JmqvPqMpZMwFAQQNy0rqM5GrvQVUZX
 JzjatOi8EUgB2UX0KqYcJDPjSx6gZeQDjCD4pAjcKPAq5HOCsOB6Usw1C2Z4kT2AAg0P
 hUpg==
X-Gm-Message-State: ACrzQf3yhZGCChiw6Aa1+NwArJgiH3+P47cMFmz5v4eFV3XgXooIpgjr
 f9INw7dA5GZ4kP5jz3lDazI/8Q==
X-Google-Smtp-Source: AMsMyM6aXssRV9cCopFQKhvSSRLqDTri2SN4+sODUiVIOnw54XkFIoRxASG0kxB53TgxohdplKz2Bw==
X-Received: by 2002:a05:600c:4ec6:b0:3c6:c469:d295 with SMTP id
 g6-20020a05600c4ec600b003c6c469d295mr3555807wmq.117.1666810900982; 
 Wed, 26 Oct 2022 12:01:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfaa05000000b002366f9bd717sm7165399wrd.45.2022.10.26.12.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:01:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B0631FFB7;
 Wed, 26 Oct 2022 20:01:40 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-2-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/12] hw/xen: Correct build config for xen_pt_stub
Date: Wed, 26 Oct 2022 20:01:35 +0100
In-reply-to: <20221015050750.4185-2-vikram.garhwal@amd.com>
Message-ID: <871qqu4dez.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Build fails when have_xen_pci_passthrough is disabled. This is because of
> incorrect build configuration for xen_pt_stub.c.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

