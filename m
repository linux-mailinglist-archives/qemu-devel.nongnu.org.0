Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA75FC532
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:21:28 +0200 (CEST)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiajn-0006u1-QC
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaac-0006SL-2Q
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:11:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaaZ-0006T2-F4
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:11:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j7so25951137wrr.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YIKTSQo9vqoiNR2WTvrlD/KRTURGJeDxvhaE9E/hNac=;
 b=Fbc0rLh6OYTRyBTsDt4NTayHguHtwVGvepn2sjVKOt3NtpilB9GF50YEjrrmXENyD7
 04W1ER4Q42o/ILq6zdrzt4LQtkAskgRKLOmDYWjDkoyhj0oXPziBsb9je6wYUeyo7dz2
 vnI0m9i62rOK1OKmX6bU4nSVMHRCkf1TtGhs8udrVn1S0r760e3xD5h8XRk27H+ni3l3
 yE3VisiqgJHU65bWJRlJd55n3TsbGmv7eOyWxg0JeaasSFl02IuHRIxdXJus/l1nKpzD
 KAweMy9JjABUe5Hx2xGVlws/5f2msZRnd9h4DemGKcP0NRG9aFH3pWypnwgaDBkmIeDS
 xtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIKTSQo9vqoiNR2WTvrlD/KRTURGJeDxvhaE9E/hNac=;
 b=mNJz1EG5oSMUAnHi4+fuFZUIf5Dts7nd3pTxNtzgcSF2lTSGwi0FN8J+4dPIGt53b3
 tR9iS9zTkJesYcIBePopBZx+n/qdd+rsJoAsoZAitaXptlmlzkQU1xsky7HvPmwnm1yF
 rDX3ZcrkJ25MGaYOVSjOPU5neU3uQWID3oOz/G2vYOE8YE1lhcd25sRbnwS9R3ecLr6j
 +Ez9o49om1lLRqkZsn4GZepF0Mq6Sfwb97ligytt/ovPPzSvsuIIyiUAF6jof828p6wV
 yizUV4uX0iUaxfaEbSvsdujjzRoAdLftvXxVzSvAZ3OHVZ6pSj8a88E1cps1gJKN7IzA
 /vyw==
X-Gm-Message-State: ACrzQf311jKGc3iMxfZxtlMSXANdOF99jhrycToawP31+Mc3JEHqBDAr
 ymEiKzZO5qhtU6j4CO91338kpg==
X-Google-Smtp-Source: AMsMyM6xyHVQpwGiSD8PVJrixOw8FdzQ85z3qD6X6STaBBI9FL9EYrSA71wmnepTwI9dbOEeW1wtCQ==
X-Received: by 2002:adf:f345:0:b0:22e:3c6a:7797 with SMTP id
 e5-20020adff345000000b0022e3c6a7797mr18118258wrp.374.1665576713795; 
 Wed, 12 Oct 2022 05:11:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b0022cdeba3f83sm13486339wro.84.2022.10.12.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:11:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85E571FFB7;
 Wed, 12 Oct 2022 13:11:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  0/4] docs/devel suggestions for discussion
Date: Wed, 12 Oct 2022 13:11:48 +0100
Message-Id: <20221012121152.1179051-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Hi,

This is an attempt to improve our processes documentation by:

 - adding an explicit section on maintainers
 - reducing the up-front verbiage in patch submission
 - emphasising the importance to respectful reviews

I'm sure the language could be improved further so I humbly submit
this RFC for discussion.

Alex Bennée (4):
  docs/devel: add a maintainers section to development process
  docs/devel: make language a little less code centric
  docs/devel: simplify the minimal checklist
  docs/devel: try and improve the language around patch review

 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               |  84 +++++++++++++++++++
 docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
 docs/devel/submitting-a-pull-request.rst |  12 +--
 roms/qboot                               |   2 +-
 6 files changed, 157 insertions(+), 45 deletions(-)
 create mode 100644 docs/devel/maintainers.rst

-- 
2.34.1


