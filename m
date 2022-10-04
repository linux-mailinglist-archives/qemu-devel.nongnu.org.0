Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858055F47DC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:46:46 +0200 (CEST)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofl47-0002lP-Md
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofk9b-0003Bk-08
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:48:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofk9Y-0003EG-G4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:48:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id ay36so9181086wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=HVEEwgOVukU6+VWonSXIYJ5MWJZpVJgJEBn4iEE1s+Y=;
 b=cRERYKKTh8C5oDnZXX28icyJNjnTbmXwm6EbLzQTDyd8OSo16s4trY864lG7s/W2er
 GMN731Y8sIZVDdfK9Q8GNxzes8mYcKQVakvXilU92ONRwXXz0oTD8uf2MvQM4VcKpRnn
 nJLH1bqWACsPVbaMZdHyV+3uh8f46fu0RMhjD6hNqEJh1tE8KbticpZqwjjGDxjZF//u
 OCuy/qlDKvD0ZGciBoMg8HccZnXkeHNrbZN2JHySXs+sMuJGcNl92W2ew2fQlbc1O5zB
 ihCiF5rBHRGJCXLwHIQb0yus8jsNLcw7YUKuqnxB/x+Tk++H3nXbaS6OQBHp/gcZJxfC
 cufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=HVEEwgOVukU6+VWonSXIYJ5MWJZpVJgJEBn4iEE1s+Y=;
 b=y7r94uEgTcYeT0fGEf2xvIqaKlNxFISExbrtdhzHhNmB3I8+pOiSMo+zMQ1nate9xg
 zaCpsUMvJLNVHsRY6sMOLWjs2MnpqMqLf5VRBqak4coQgwaQ24VXQxAjneVtO9LR+Ftn
 O3leefdgX92Sx87FoKYcPQ0WCEEZFwz9YLhl8rJpONEkcK4bxvrXcWS0YOk2QLtdgY0Y
 LYxLCw1KS7rvDWlvePidLxsi7bBEG+HajhhVawkTpJDtJR27YyT9HeRUa09eZAy1LyNs
 QBnnJHu3OQk1BuW5Z4cr6HTovRiagtv0afPk2+oo5+oVAeowUegjQ1wh6fEJY1NBG3+G
 HtxQ==
X-Gm-Message-State: ACrzQf3b3N4hpD8iz/8uVrw+mFbjD7wBU9PTHmDpXSHg8vdGOfl9jZPg
 JAxXYVafnbtMCR4NEX/zMU7tSw==
X-Google-Smtp-Source: AMsMyM4y+/D3gmdPEhVOCeDjmkfD8vvVUnDUW9Hr9/39HOiDmPPLynwSBqVGLRqic78vAQx0cqA8Wg==
X-Received: by 2002:a05:600c:154d:b0:3b4:aae6:4bd7 with SMTP id
 f13-20020a05600c154d00b003b4aae64bd7mr281633wmg.63.1664898494705; 
 Tue, 04 Oct 2022 08:48:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k25-20020adfd239000000b0022af865810esm12452127wrh.75.2022.10.04.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 08:48:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7FF6E1FFB7;
 Tue,  4 Oct 2022 16:48:13 +0100 (BST)
References: <20221004141051.110653-1-richard.henderson@linaro.org>
 <20221004141051.110653-19-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v7 18/18] accel/tcg: Introduce TARGET_TB_PCREL
Date: Tue, 04 Oct 2022 16:48:08 +0100
In-reply-to: <20221004141051.110653-19-richard.henderson@linaro.org>
Message-ID: <87wn9fk2te.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Prepare for targets to be able to produce TBs that can
> run in more than one virtual context.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

