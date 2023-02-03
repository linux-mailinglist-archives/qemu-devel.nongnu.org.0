Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A883689F21
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyrZ-0007HM-Pq; Fri, 03 Feb 2023 11:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNyrX-0007Gn-Q6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:24:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNyrV-0005hn-Qu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:24:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4284646wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/hvb2wOJ5SU0tLM0dKef3gdlO1CJYHZlcTjtsw/SQA=;
 b=j9FAVAzZEdC597pnvg0WA+ciM8cA55EiKZKVtr4OhWmQvNBxQtbe5ZYhMuc/F0QtGU
 6qneag/ZIJVw/jNpDU5bcLYHcTpBZawayrpYBqy4tvyIltvRJGkpHBD7wqtlo5Vl2F1s
 934jAroLkNL5oRwEZY4TPdWECmR3sU5rh25M0DD9HiapQRDSNEwwi3NVa45vZ9q+MGoh
 /W/JPaJsUxo0ERiDFAj5ZPNeKod3C3udTAIawoFYb5gUWwzlVBXIIofq36NA593CLEUv
 Nnc8NPl9LbeyH69plUdhrRO4SgzZENCL3L2om3BTcYRJg5QROyd4O4+X+RB0Ormn0/e2
 Ribw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p/hvb2wOJ5SU0tLM0dKef3gdlO1CJYHZlcTjtsw/SQA=;
 b=x+ToOyzNsDk8yhgo2OZmpwk7YCvr2ocEN7p/5Y5dVuWskEKVxyO5gCmEs48la2oHGW
 L8fodK5GxNh8Xp9/WPmvWTkHz425wVWCKvr7MyllYRdvDSbfcV0LKNjXJUZS0UChA3pG
 o4HRG3Ilb8MHe+hcSJx8VOt3R1Ai6qtUeSqd0JGjjaFhScO9khJdMUmbXvIRpWM10/7r
 hkq+AKlbG1intatcDBp021wuDFtQ7H3d2eziE46HvtGmLiSXTKUdlSj0P7uzSCe3QHdn
 IZvIl6yPbYstl0no7iXbhXEn0aOMslRyU4Gvg/eDQQ2kqqQIidpKR5EDvlY6VTdz8UMQ
 YXkw==
X-Gm-Message-State: AO0yUKWsKczgneHUTFaJDdz20LwJZzBhPxR3Z1NpY3VuS96BKljNueOA
 GwKFLz4J5YxTCbx0i9aMM6Bb1g==
X-Google-Smtp-Source: AK7set8bEw3MpKCp584OLCX4COtKo63Ss+2FNFkexBuaKH2rfPEUMh66XvFUwY6xKjVLNWmzMbQDXQ==
X-Received: by 2002:a05:600c:198b:b0:3df:3bd6:63e5 with SMTP id
 t11-20020a05600c198b00b003df3bd663e5mr8404947wmq.12.1675441468033; 
 Fri, 03 Feb 2023 08:24:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003db01178b62sm9509159wmb.40.2023.02.03.08.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 08:24:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34A0E1FFB7;
 Fri,  3 Feb 2023 16:24:27 +0000 (GMT)
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
 <875ycjlwo8.fsf@linaro.org>
 <478e4940-ba22-6b70-119a-b7416680db97@linaro.org>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Date: Fri, 03 Feb 2023 16:23:54 +0000
In-reply-to: <478e4940-ba22-6b70-119a-b7416680db97@linaro.org>
Message-ID: <87k00yk98k.fsf@linaro.org>
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/2/23 08:59, Alex Benn=C3=A9e wrote:
>>> +    - env NINJA_STATUS=3D"[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>>>       - if test -n "$MAKE_CHECK_ARGS";
>>>         then
>>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>> This is too much for gitlab as it trips up on no output at all. What
>> we
>> really need is something that filters ninja output, counts the lines and
>> outputs a dot every 10? 20? lines to keep gitlab happy.
>> Shonky shell script? Very clever sed?
>
> NINJA_STATUS=3D'ninja %f: ' ninja | grep 'ninja.*[02468]0:'

NINJA_STATUS=3D"[ninja][%f/%t] " ninja | grep -v "\[ninja\]\[.*[123456789]/"

but I guess I need to include it from the Makefile invocation

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

