Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0363663F03
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:10:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFC4j-0000AH-Um; Tue, 10 Jan 2023 05:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFC4g-00009g-V9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:41:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFC4b-0001m1-TX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:41:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so777675wml.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKd+qcCQSxN4biwz/pq8+SB4qocQ+FudbavmKCKAgB0=;
 b=HcGfg9GzFL5FM1ROullY2ilY+XkSE67EJVnecoOGrtkR2UbWUja+z9U2/q/bIDs3Hs
 YOW6dPYWhc2ZcNqUJCsb61R37bSaUo8D/4o3P31+TllkblmM1ZTG9NUPj91qCQEONly2
 gvA7FXq7tMxHy0eo7rBM6YrenOexUBI0bynxblTwm1Or3OxSKO7Cq1bUwulVzyHI2Sch
 7d0gYpE6QPoPG5ZsBqEA6KFUMHb0EyFRd3iFj+5b+HKui5wYS70SGPhavzsgtLqs8n/h
 fkAk9Za69+uTXz00Fq8Y7Vf1eC6EEvrSjiihjIQJMI9UYkVtabpxkPJ/hzgiwu3tLrmg
 8mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CKd+qcCQSxN4biwz/pq8+SB4qocQ+FudbavmKCKAgB0=;
 b=yOCU0Sg55vsKYjfXWL1EOt81I3F/QurTsidqGTYv+SqaU/aSc/47h2E+GmFz/IRzUu
 h/tLLOgNm4s1ZooQ1vJGsWYHByLCDMytyWzLNN7zX2MCnVy/s1yaONnb1FmWoabFkudx
 35OkH9Tg3PtE7ApSe/+ujKhSPpjMZHnGQws82p3Pi+wEQBnNI9/M2hYBZaiJjBgTpnWd
 PQ7jQY70Ukdu0spCsaagkqN2/GKNZsZqL1ztjePy69Bpjx52iva1RomTfeDqZynJo0XX
 xNJwBYcuZlRXkAr0Szu0hll4+1BN+YJiTNcf0uxENJ8YtkpdkQPukn7mDoWbflpcQnWm
 +P4Q==
X-Gm-Message-State: AFqh2koG+bbNOhrVli3rS7n3OIsZzo7Krk4gp9dNLFDf1Guca41eyjN1
 GhkvwzA6B45foWmgJzXP/8CPqg==
X-Google-Smtp-Source: AMrXdXtVX8FgYPycikSDhmqwo3UJA8+iJ2YJANNhUUSXh9LrEXO3sCGxPF/fx9+1gf6Nkbj64W63wQ==
X-Received: by 2002:a05:600c:19d1:b0:3d9:ea0a:19c5 with SMTP id
 u17-20020a05600c19d100b003d9ea0a19c5mr6888622wmq.38.1673347300430; 
 Tue, 10 Jan 2023 02:41:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003cfa80443a0sm16333203wms.35.2023.01.10.02.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 02:41:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 904771FFB7;
 Tue, 10 Jan 2023 10:41:39 +0000 (GMT)
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, pbonzini@redhat.com, Markus Armbruster
 <armbru@redhat.com>, qemu-s390x@nongnu.org, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 kraxel@redhat.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Michael
 Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>, John Snow
 <jsnow@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 0/8] Fix win32/msys2 shader compilation & update
 lcitool deps
Date: Tue, 10 Jan 2023 10:41:28 +0000
In-reply-to: <20230110080246.536056-1-marcandre.lureau@redhat.com>
Message-ID: <87358ioen0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Fix the shader compilation error on win32/msys2 and convert the related s=
cript
> from perl to python. Drop unneeded dependencies from lcitool project.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

