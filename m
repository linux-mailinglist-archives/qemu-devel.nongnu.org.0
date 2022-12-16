Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81464EB37
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69YG-0001eH-QK; Fri, 16 Dec 2022 07:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69Y3-0001bN-W5
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:10:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69Y2-00040W-EV
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:10:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1594718wmp.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2VXGnvfPehgGfDATtRykwGOJajrPdz+fqzF0cQ6TIc=;
 b=eevR7eAwMIyRJ3Qlf6OFFusttmdVrcgGNJClKjADB+eMB1PHct8ciil3Lsj4IlCCEW
 ZEyh3CWVQ3lx3gDt0bqoAZVGpq2k/nPREZx7cgFGeFMOX5sZEOdZ7BPD+iAE0+pLWcg7
 H8aPz+cGLF4PjJUxSEe/qitBuJxECe8wqYHFcj/mZn/SLZD6M7v5wIH2nrGG5GYkrDHk
 IsYSqUYsGzAr/xwG6NY6lqwoVIy2m+9cvNu2Otk/ignPWc80wkruJtGug8Dm4zeZ/Oud
 2GPoM8coYyn3Jw8HKT+OMRkvbbe5MqAfBQP+SCcc6wHkGpYi6Kue3rsr8w7yzpVbSmb6
 6Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G2VXGnvfPehgGfDATtRykwGOJajrPdz+fqzF0cQ6TIc=;
 b=TxT0ZNRpdmNd/PjB1MTs71YlBm3YromGwlXv04QVLtyr+OsLiGqWHGQL3WWXu1Jc8C
 x9Du8SbQZNRJeEjs971TAQno8vZbN26WsISM56SV67swgMJ9nMeWa71uBRQI0bROuW6N
 xWf8GgGuQb9Q7p+KS7h4u6gGaW3r0GRgluyEwn9yq+yJe56GNZ6zZpTNhkcYp6V15kv9
 WCFtQB/W9s3B8cadHLTuRwXEHxcQBCOOa4g24U8ItMDD7GxUDi6JRarufU7G2Mtuj+nn
 faSDXlO5tnwDtvK4xvcfYneXad1KkgiybjUv1Vq+V8WkqFBK65bIF5eFQ427dS24c8gp
 sEDw==
X-Gm-Message-State: ANoB5pmjPlhbMHOOsaZrItSnSZ9FOZ3GA0J5IFwl8rDga5YMI/gVMV5C
 yAXNFRtmi2PybiCrIicZ5ZtO8g==
X-Google-Smtp-Source: AA0mqf5XjWmFPqSG5sBe+oHURuRUYFpLge1xbVtEZEksM1Pt5iJhIm1T+KJN1S7MuYg80WeRfUaEqg==
X-Received: by 2002:a05:600c:5388:b0:3c6:e63e:814b with SMTP id
 hg8-20020a05600c538800b003c6e63e814bmr22278875wmb.2.1671192640788; 
 Fri, 16 Dec 2022 04:10:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a1c541a000000b003c6c182bef9sm11420368wmb.36.2022.12.16.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:10:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA4B11FFB7;
 Fri, 16 Dec 2022 12:10:39 +0000 (GMT)
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-3-philmd@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH-for-8.0 2/5] accel/tcg: Remove trace events from
 trace-root.h
Date: Fri, 16 Dec 2022 12:09:04 +0000
In-reply-to: <20221209093649.43738-3-philmd@linaro.org>
Message-ID: <87sfhfh7ls.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Commit d9bb58e510 ("tcg: move tcg related files into accel/tcg/
> subdirectory") introduced accel/tcg/trace-events, so we don't
> need to use the root trace-events anymore.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

BTW I wonder how much of a hot-path cputlb really is to jump the hoops
of DEBUG_TLB and friends. They could certainly be rationalised.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

