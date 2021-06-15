Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90293A7BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:31:47 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6ME-0003rV-Dv
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6KL-0002WP-FU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:29:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6KJ-0007fa-PC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:29:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so17757639wrm.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=rkDnvxvPLJLZity1Qq4JyxO6xdIo1hz4Bc7oyQ4uMOM=;
 b=dJdxfgK+sSrCJKJAfaGdZTuMdvH8epHdvbkAbfui0IIvDoa4/NVG2QWqdoVNtRPsYE
 Atk/Va1HQobxIyQd+NbfEpJ7nEIWIr3TUkrU9ILkbMye7YLO0qJtrmVQlei7s6XgthGp
 2zqf0i7WJo7CMtdJDCGPULQB7KALwJnwrdfNU1+negmYWA3Ehl4r1+v+SMXliQuQZeoc
 dFckygTCR/3Gvyhl5z0kTVhaHm11el5YxrG3zDmlniY3b4fepmshUXBMTzZbj/t/N/2z
 SvQ3PvGDdOlPVsaY+E0XgVuSdwrpmgU/x/sk/NWekaov6gsYw+K3cPIwsbtngz4mdQao
 w9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=rkDnvxvPLJLZity1Qq4JyxO6xdIo1hz4Bc7oyQ4uMOM=;
 b=dIedIBra2yLfs6Jd/skzT/7mtjZVZarhBNDTnBvqM7/GsEr8bwKVvYI7icGSBypce3
 sqUd2r2/3em3ka5H7Usv9vtdecdUBVS5VqWUPshN/yfy+UqbuWP21aVSlQnoFwIZMxuL
 4BAqkYw86FWTuSSdnZfIWXv0gPmyh+SLEJ9tEwGQOA6ZYQhp5Cr6vcW3JZo7Fo80xPS9
 zDYsAK7fMqKUoi1iu8RL5AJEunF46dpDPq2K398VNtNwIMb/fGV7V9+Vn/s5+Ui2TTh1
 5BqDzhGl+4bMh/Ei5TNkpuGnu4vxDJ/H5jB3wjHcsowGdagcGfZKbRdJA3kzU3X17/BY
 A/4g==
X-Gm-Message-State: AOAM531kFJtQDwynYbCs8etwJ+J3M68wnZqfDK32+0BzH2lnD4M4kkES
 Silks4rJ7GKXXFf2ibkfVYBo1Q==
X-Google-Smtp-Source: ABdhPJybdWZAizPpN6Zvq0krm/6B9mOoMFpEIFe8g1amH3EnJ+1fR8NHPDsBbTq3s8EuMiKL3hSVOQ==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr24748523wrs.148.1623752985833; 
 Tue, 15 Jun 2021 03:29:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m23sm15669698wmc.29.2021.06.15.03.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:29:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 240B11FF7E;
 Tue, 15 Jun 2021 11:29:42 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 8/8] configure: Remove probe for _Static_assert
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-9-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:29:42 +0100
In-Reply-To: <20210614233143.1221879-9-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:43 -0700")
Message-ID: <87bl87ifop.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> _Static_assert is part of C11, which is now required.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

