Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB86ED3D3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:44:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0De-0002vk-1f; Mon, 24 Apr 2023 13:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pr0Db-0002ui-Tz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:43:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pr0Da-0005Re-7m
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:43:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso54784315e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682358192; x=1684950192;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3Y5UjlOpv4m6zXgw7cp2Mg2/mHN5p86vd+eLbD9skI=;
 b=cSlD0E5dt2Hw/JOz+0vZgb7aRnU08sYWPqnHk6+W2wly2W69uwKSf+KxMaHwYxcBoM
 BGRWGZzttGW2tjJ+1OboGiNcfa577LxNoTA2fxbr5MKGwq8KwSE08SkX6Qgg7WiHT+m9
 qWgRPH1qM7/DZwmgrHkMeMqibA8a7bHaQrQlGHT1bf1siI9EKaj21jwPNB01KpoLZ903
 +Ivu65H/KObubVjFqJpOVGA3uDow4sajJLzGcsBqPlpcg/BjUUU5WwDQEQ+l5d8lrO1U
 DI+Zu0ar2fFS0SanF+pV8zAL71vAhuFn+rW4PqTpZLdTLisVMhsNQxVi3g4XspTq3jdQ
 ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682358192; x=1684950192;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p3Y5UjlOpv4m6zXgw7cp2Mg2/mHN5p86vd+eLbD9skI=;
 b=NV2nL58trIAwKCd7+TuO3gekOu8mbYDkqwrIgVoKtifESRobmcCNhp1nQehs6yBoMW
 0mJKa2CON8fEiORQAcxddMQGw2Zyc7+6rTDRyJbKi/0GEjvNBdmouhtiMEFed2/ifET8
 3FZfedVZRclLrs2xz/ntElY9FdXYpPtjdixs2FAo/wSZdsIMHMpqcM57fqNmIxeoLqsu
 6qcRugZfq/O9c3RcoKejx73Zds/AU5r3IV+VgCsuVSBPo49S6BrRS6/vF4RgXtchuWZq
 zUhGZkLfSZNKV0K5mSwTFQQLFsVCaHQGDqSNaaYy0XqD1ldFlqqtRmsxvL7AweLw5MLn
 E/JA==
X-Gm-Message-State: AAQBX9cMDaiLmdZtltFVi1Uz1D9vKibMgpdRrsEIk0pztpqyb21IXYe0
 ceaXlYE434xTNASUBq3OSuYoTw==
X-Google-Smtp-Source: AKy350YUIyXQNasQC4St1ElGBik78b8dcqxOx/U+RFkPDnc5+gm7qenyB/h81/0RQC5khRHJQgxc7g==
X-Received: by 2002:a5d:5051:0:b0:2fe:e455:666c with SMTP id
 h17-20020a5d5051000000b002fee455666cmr14107921wrt.33.1682358192607; 
 Mon, 24 Apr 2023 10:43:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adff008000000b002f6176cc6desm11213010wro.110.2023.04.24.10.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 10:43:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D08641FFB7;
 Mon, 24 Apr 2023 18:43:11 +0100 (BST)
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-2-peter.maydell@linaro.org>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap
 descriptor fields
Date: Mon, 24 Apr 2023 18:42:27 +0100
In-reply-to: <20230424165053.1428857-2-peter.maydell@linaro.org>
Message-ID: <87bkjd9nww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> In allwinner_sdhost_process_desc() we just read directly from
> guest memory into a host TransferDescriptor struct and back.
> This only works on little-endian hosts. Abstract the reading
> and writing of descriptors into functions that handle the
> byte-swapping so that TransferDescriptor structs as seen by
> the rest of the code are always in host-order.

I couldn't find any datasheets on the sdhost hardware but the kernel
certainly explicitly sets the endianess of the descriptors so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

