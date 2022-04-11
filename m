Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1654FB8DD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 12:03:38 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndqtT-00088I-7B
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 06:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndqq7-0007Dn-DT
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:00:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndqq5-00020L-Mm
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:00:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b15so17686850edn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q6xtie+EQBV2jS+EXEIevhPk8LBSGvggkhfmEKipc34=;
 b=kCM/b0kxhy991HNFOopvJrU6NJTIaVt/6Tg+abi2Ob95qn//NQrilQZHyzPKVPftcz
 ZhyQZuW60XYvhgDy9+ybuM7doFqYDY0hj8KOOs9xrjjDWMMpAQV0tvBDZgtGFlfuCIvw
 j/khnsJZBuSHPxMNczHyPQHuLxCHJ6N7aFTKnOmb6hraF1XmYjnm3Txkts/2o4YuqT7h
 6Lr26JwV6fBmsMZuM/NUqhBsU3mTHWJdNOoivXd4kTi3qM5HVWtGdi5EDVjlyIaRcTPe
 M57ZfS5UPLjTGqN44z3uhGQPiiqlxWcaB3RG+msLvLYlDpuPz4xn/2mVdh4x4IF5ao4x
 8MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q6xtie+EQBV2jS+EXEIevhPk8LBSGvggkhfmEKipc34=;
 b=b0XS+xZ7dqQwp/ep0pLhbHCCvlAR6W1fPZJ1U+EDqsh2rOwe9EgwrE2OuIkydyJk2f
 N1mes5fDRB4Bf4HJxrHOhQzwqI4ST6JaUtvnbyMge/79gobComzrgh7Dk1Lf7wNjYQDK
 MGVaSwIgvV0pfY0bmxmDbmhArzBJ0pocbln4CoLv5iaMiyKFpaGeVsjmwO53BkB2psMn
 x6Trm/sJg5yJLAYZu7E5TQpOKdMcIeQGURsKh4cXAZav22L/20JoaMztWxzcA+s7m3iC
 W+z3qEFBpJr0yEjKtwMGTldLobeqMMiMN9QhWyzcfnGuB9xCdjYpmIKJ9G/Zaw2jeZDt
 q7FA==
X-Gm-Message-State: AOAM530Xnov5ro4gLiOgqrRsip0YxlyCQv+L7I2mMS6LfwOTQ9ssgCu5
 WzlYXjMYsyAAqt+NeJ42bsScDQ==
X-Google-Smtp-Source: ABdhPJxgRQ8+mCag5PWeac2aHE0ga8xRTk6MieFlPytYwudEeFdiPnbrJBCGTG1mF/7Z5+3yow3eJA==
X-Received: by 2002:a50:d90f:0:b0:418:8a5a:14b2 with SMTP id
 t15-20020a50d90f000000b004188a5a14b2mr31773584edj.241.1649671203639; 
 Mon, 11 Apr 2022 03:00:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056402431400b00419315cc3e2sm14924420edc.61.2022.04.11.03.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:00:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DB0E1FFB7;
 Mon, 11 Apr 2022 11:00:02 +0100 (BST)
References: <20220401141326.1244422-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/17] tests/docker and tests/tcg cleanup and diet
Date: Mon, 11 Apr 2022 10:59:56 +0100
In-reply-to: <20220401141326.1244422-1-pbonzini@redhat.com>
Message-ID: <87ilrg0wkd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> The first eight patches simplify and clean up a bit the
> tests/docker/Makefile.include file.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

