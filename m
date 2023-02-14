Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6908695F14
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:27:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrae-0002Cv-HR; Tue, 14 Feb 2023 04:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRraR-0002AY-G1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:26:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRraP-0007yg-Kw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:26:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j23so14965203wra.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXJoCHQgIlLeLUoSUNc6+JMH1ubFo73wtR7TH5jaQ4Y=;
 b=RxfOCk71UASqdyc7ev3lF8ZzNZt0VNxQ6uw+AIDCQvOlvhCAAFLw/y7OT3UhQ2O3ya
 LfpuUYL4b2NHGuoQe0XRCjfbQZoE76V/QJLYqcOcOD7dxGTQ91Ky6jxfmk2zUzu/FaWV
 nq5ni7/iyIKmEdrZfdfgz5UzIheVcss9NoTAQ1MgqU8PBn7bQgiT6W0nVlv0ypWSVkSF
 hDyS5yD00Z/6JPEJsI7HFYVxMkUu7ZbTlN0MkCy2nHX7j0EuTJ1+//41qfxElbg+cVO0
 BTG792i5V4s3PW2M2ruExx0sTcN+kwfcrT7nXJ8ZB1YiAWzM980pUtAUXcSEt99pDZqU
 z0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JXJoCHQgIlLeLUoSUNc6+JMH1ubFo73wtR7TH5jaQ4Y=;
 b=swIb14hP9CqmFzyd9IGprYea1TJetdHbBMBcVDff2INsf3HUSHFBbP33Zy8DJQQ96I
 5b4RTcQuCFTpT9/H4Z36n9r/4/aDKEujE+9jGrt/poqb4vLY4AXAj9DWeY7e8/YD4cLH
 lmB9pIGYTJvx8IvFaY4ajYq3dYlw6yzqGzdm3knk/EyqTWWue86D3LSFljQBdlV75Qtl
 YWHkew8ldl28fW9ka5qe++6R8eTh1jNqUGFze448mH7BaSGNRoSObJIPC6UEtbxyfe/k
 pUeFJf+6DqrSOaH6fzoJW5DjaaMW60PU9d1cZBJyTVnayt1WFewrP539EwI2Yr8YNjBv
 V8jA==
X-Gm-Message-State: AO0yUKXc76aP5wFZqfO/lNYY4b6/M5p2xKwQRnBU2L7eusT17Lsn9RLR
 ZBzD8DD8PBC92zO/YZC/KLURVQ==
X-Google-Smtp-Source: AK7set+QR1duaeR3cSiSPaEhtMCkU1z4nyOhFMLAJfRQ78N7Y2TrO3UPXIycJfnBN9nsw5FoEDILGg==
X-Received: by 2002:a5d:6045:0:b0:2c5:5c00:b917 with SMTP id
 j5-20020a5d6045000000b002c55c00b917mr1645964wrt.0.1676366812147; 
 Tue, 14 Feb 2023 01:26:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b002c563b124basm1342194wrw.103.2023.02.14.01.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:26:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67F571FFB7;
 Tue, 14 Feb 2023 09:26:51 +0000 (GMT)
References: <20230213125238.331881-1-iii@linux.ibm.com>
 <20230213125238.331881-3-iii@linux.ibm.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] cpus: Make {start,end}_exclusive() recursive
Date: Tue, 14 Feb 2023 09:26:46 +0000
In-reply-to: <20230213125238.331881-3-iii@linux.ibm.com>
Message-ID: <87cz6cbns4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Currently dying to one of the core_dump_signal()s deadlocks, because
> dump_core_and_abort() calls start_exclusive() two times: first via
> stop_all_tasks(), and then via preexit_cleanup() ->
> qemu_plugin_user_exit().
>
> There are a number of ways to solve this: resume after dumping core;
> check cpu_in_exclusive_context() in qemu_plugin_user_exit(); or make
> {start,end}_exclusive() recursive. Pick the last option, since it's
> the most straightforward one.
>
> Fixes: da91c1920242 ("linux-user: Clean up when exiting due to a signal")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

