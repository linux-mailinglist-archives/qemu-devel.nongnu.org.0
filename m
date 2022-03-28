Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87824E9CAE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:47:10 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsWL-0000p8-Dh
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsUL-0007oc-Vl
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:45:06 -0400
Received: from [2a00:1450:4864:20::533] (port=44856
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsUK-0005g9-AQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:45:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id w25so17603788edi.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iVJWoGqLBjrO/ZunCMC26Yf+hWkdba3wvZ0OAVy8qf0=;
 b=Y2qH8caDZSzw0AuYJ0Vv4Od0Ovcp8nTMCd2q5aY3DNQ8i8bUSpo8OpYSWS0q+DSPT6
 Y1vFReb1CU38r5wD6DRQGw3imKTCibIXnyW5mWtKiHZwdkV2DXqTS6Y+GkYsSr128pkG
 vyXAGkwS+tiu3uuAzs54tLMwdxFf0wALOne++NJdaN5EKiGN6CSZTLdwe3s3LR5DxjP0
 r8qLgCzCYeaT+q7Tn0i5Ldp74Eav9sfY/9X5Ps/WTZ8FvbZOt/qE3rKa4w5VsKMLAJ7E
 zw85v4p26gTm246jvwX/b1kboxL6PVhL/WePeURqG/BdGhltdNluQpobcLV5kS0wpRO/
 tzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iVJWoGqLBjrO/ZunCMC26Yf+hWkdba3wvZ0OAVy8qf0=;
 b=fgIxEeSBf0DuECGoeH6nJkM87joX+7ZCOGQhZ+R+IlSl8WEVFfhA13u8zaxs73yLA3
 nlLXdgBlpmuB9KmJNp5W2vn117EqfjLIh/if1lyvBB5+DLVEnMVXVeE48Pzqnjwd48Zt
 DmlSuxttPBklcZsiPZmD3GFC8V/tSFTuToOYm2304XnjIbvXZDb+0vvXNQQP4evmbng9
 cQVAWr4fGEJHMdKmn/bA5qudW4lrFAr43IpuRayeMex4LbYizd64IN3Asp3sKD0WCsvF
 W1WVJ9fTVMed2iimxy8GaKH62JaQgBllhxB/RGBxvbslDb36peJlf7lN4eJgQgBkeccR
 yy3A==
X-Gm-Message-State: AOAM532qNhDMuU6QA+7F+D+rEky15Re9Wm3a6f4oInwCwFMAzq5gz3lB
 oNvOodormAQEelOGaps2ZUL2K/S1Lr8UhQ==
X-Google-Smtp-Source: ABdhPJysSHe4evvK3fK2yKFkEHa8rHpSN5Ug28glNfY7Bnu8sddldNNx/DdHv3xPmRlKeZDk+NkdLA==
X-Received: by 2002:aa7:cd7a:0:b0:419:48ce:3a10 with SMTP id
 ca26-20020aa7cd7a000000b0041948ce3a10mr17120131edb.312.1648485901946; 
 Mon, 28 Mar 2022 09:45:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170906125300b006ceb043c8e1sm6114810eja.91.2022.03.28.09.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:45:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A50C41FFB7;
 Mon, 28 Mar 2022 17:44:59 +0100 (BST)
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-3-pbonzini@redhat.com>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/15] tests/docker: remove test targets
Date: Mon, 28 Mar 2022 17:44:25 +0100
In-reply-to: <20220328140240.40798-3-pbonzini@redhat.com>
Message-ID: <87czi6xbzo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/docker/Makefile.include | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index a6a5a20949..8248cfdb4f 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -99,24 +99,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debi=
an-bootstrap.docker
>  			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
>  			"CHECK", "debian-$* exists"))
>=20=20
> -# These are test targets
> -USER_TCG_TARGETS=3D$(patsubst %-linux-user,qemu-%,$(filter %-linux-user,=
$(TARGET_DIRS)))
> -EXEC_COPY_TESTS=3D$(patsubst %,docker-exec-copy-test-%, $(USER_TCG_TARGE=
TS))
> -
> -$(EXEC_COPY_TESTS): docker-exec-copy-test-%:
> $(DOCKER_FILES_DIR)/empty.docker

Should probably clean-up the empty.docker while you are at it. It's a
niche command but I wonder how we would copy new tests now?

> -	$(call quiet-command,							\
> -		$(DOCKER_SCRIPT) build -t qemu/exec-copy-test-$* -f $< 		\
> -			$(if $V,,--quiet) --no-cache 				\
> -			--include-executable=3D$*					\
> -			--skip-binfmt,						\
> -			"TEST","copy $* to container")
> -	$(call quiet-command,							\
> -		$(DOCKER_SCRIPT) run qemu/exec-copy-test-$* 			\
> -			/$* -version > tests/docker-exec-copy-test-$*.out,	\
> -			"TEST","check $* works in container")
> -
> -docker-exec-copy-test: $(EXEC_COPY_TESTS)
> -
>  endif
>=20=20
>  # Enforce dependencies for composite images


--=20
Alex Benn=C3=A9e

