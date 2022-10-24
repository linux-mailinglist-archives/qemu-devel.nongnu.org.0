Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6F609F2C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:37:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omu1u-0000qP-0M; Mon, 24 Oct 2022 05:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omu1b-0000n6-D0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 05:45:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omu1S-0001ja-Uh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 05:45:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id y10so6244512wma.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/i5qxO2badS2CnHwdWsZfGQfbz9F81wQHMSwyPzeCAQ=;
 b=iy9yIi+w2vpPXiHzfbbEAO42yBQfQQ07lIpWp6IgKDDjjlMxejhZIt4CBP4DdZ+4dS
 NbNHnHWt/pMuW7bpdH7sLTNAIX9T+D4ZQbvOmQywzK3D+xs7/e93ox85QUnv/aGoBjow
 1k50LCTDvPZcLhxFs6oEmASQVy/I0J7mgFx5X8ixGdliOlhtBFKp5VP/zmnmxs2nBiQ7
 fhpGpAXnBmC5BbwtgHKk5ojzMewISAdYxCDqWe7n4cz8SMCvY8nWxpKn3vVFsGGfCvpR
 rdS9E6OoryaZDIRiSCavGEzih7jXZV8fte3WsQKkE57WBEzbHA9rTboQp6P3X7JlmIOH
 Uiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/i5qxO2badS2CnHwdWsZfGQfbz9F81wQHMSwyPzeCAQ=;
 b=7A3dDaGGc7VOvlDk1vJyRV+R3HWZ2Bix5Pi/iBwrF1+RHgvh87PYdDqq11oknJX+Oi
 tPyvA9Q17A2vBJ9iC41RJ2QDJHt85XaFPGdY4y/co8N5epI1k0LLRDWkMm6pPpD/SwmB
 +V/IFFpFM+kXoBGmh3Pun2A2amEDdq7zkYPR4J03sQVIJVLAlkIn4JisPIbthsR5UhLP
 L21fKTZWoqIlWOB/HE/sWgibuR33IBAMC/fJa0fj7aFDuY1yMWKWKd+oF9m2kC5HmuPO
 REfKuC1ioQ0YP48A7UBE+M73LPAgE6ZDGGo9tLIidUGFzbgaqBXncAHhJPgZezKUa3AD
 opjQ==
X-Gm-Message-State: ACrzQf2eYK1u0Djc6yzwjEuuoMTKn1ndZp9GZYITcj/JE05rAxFxWlwE
 svB3dJ9MjTspjhWhRdEW92tdJQ==
X-Google-Smtp-Source: AMsMyM4QRa+3qV79G3t4vFPMoS2AVZZjs+ld1kxdooDpXBQYfM7NLWzDKbsNxSct56Y3ETc8OtUr2A==
X-Received: by 2002:a7b:c3c4:0:b0:3c4:785a:36d7 with SMTP id
 t4-20020a7bc3c4000000b003c4785a36d7mr43436221wmj.138.1666604728583; 
 Mon, 24 Oct 2022 02:45:28 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c41cb00b003b47ff307e1sm9928354wmh.31.2022.10.24.02.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 02:45:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE26E1FFB7;
 Mon, 24 Oct 2022 10:45:24 +0100 (BST)
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
 <20221020114937.3558737e@bahia> <Y1Ebv28whPgwdaMW@redhat.com>
 <1b76bdd4-f5ca-cb0a-2593-b025d6575e9b@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Greg Kurz
 <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Date: Mon, 24 Oct 2022 10:44:11 +0100
In-reply-to: <1b76bdd4-f5ca-cb0a-2593-b025d6575e9b@redhat.com>
Message-ID: <87wn8pa72j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

<snip>
>> If we want to connect stdout/err to something when daemonized
>> then lets either have a dedicated option for that, or simply
>> tell apps not to use -daemonize and to take care of daemonzing
>> themselves, thus having full control over stdout/err. The latter
>> is what libvirt uses, because we actually want stderr/out on a
>> pipe, not a file, in order to enforce rollover.
>
> I would gladly get rid of -daemonize, unfortunately it has many users.
> Adding further complication to it is not beautiful, but overall I
> think Greg's patch does make sense.  In particular I would continue
> the refactoring by moving
>
>
>             /*
>              * If per-thread, filename contains a single %d that should be
>              * converted.
>              */
>             if (per_thread) {
>                 fname =3D g_strdup_printf(filename, getpid());
>             } else {
>                 fname =3D g_strdup(filename);
>             }
>
>             return fopen(fname, log_append ? "a" : "w");
>
> to a new function that can be used in both qemu_log_trylock() and
> qemu_set_log_internal().  (In fact this refactoring is a bugfix
> because per-thread log files do not currently obey log_append).

What is the use case for log_append. AFAICT it only ever applied if you
did a dynamic set_log. Was it ever really used or should it be dropped
as an excessive complication?

From my point of view appending to an existing per-thread log is just
going to cause confusion.

>
> Paolo


--=20
Alex Benn=C3=A9e

