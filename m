Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00B3BBDA0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:43:00 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OsF-00041Y-Mz
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oqc-0001yr-GP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OqU-0001Xd-IJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n33so3964364wms.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=xzABcvS560i42gKDnZV5vedeDIyEzKX9FREirnA0rlP9v+4fmmCMKYXCdJRYgdu48Z
 fACQC5Bnni5lI++WF3fPrrcwlW3UaARnm7cQcYyVxVxi7kj13yLjWAThKNfuzvBR9N+R
 J/g7a52WLhp8+zk6A7kAUbqMx75NlJBvIuA18SID2cP2f2aKUxffo77O1btAVaNk0UmA
 Y/S9RsLuv2C/jCg0yQMKtu0qS60qGWIqd0Riz2pqRxueiaEOlPIE4acU07P1rY9JN70e
 gsJ2+EXpLq37CWPmXwgQ1woqzdJXMP/7oST6zgwpQt2SmcWTT8R7Fug7s5BlSxHMZ0PN
 ekJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=L9wB2Dml6tQ3RBgyfuT6tQWRLxyb7H3qhkOGpEF+eoIPC6p1+FBnZcQ5rdlNHUl6AA
 8L5Kweeeha+sm8sSUhEfgQPWl221t9SZ2WoJvy7dNK9JK4YgpWW+m2bitbavIY9QJAXO
 WjDaVM3zFmoSAl9NyA5QnnafS2n8dn6ulpNgbmszfZMMwjEb7Ux/BDz2QGPoEv7dD3yP
 x2EG0cUv/BZrCi9hk8pzKlolqGpFHXgobjQBsk0jEVUMYeivtUeKgatFmLVI8Fo4F91C
 hPVmBqJCVuakrDhYSnVWef4q1BnLflumTADesWac1wsatqLNUW/0kPztgTjWXcJ+n8E5
 Ehbw==
X-Gm-Message-State: AOAM532lBCXv4+G/AWYL0+aVrVLW9vSH3U6e1NRjyYvd1tH+fkzwqCaj
 jAvSIAfZ1lkNc00KSQ1ON2u8/A==
X-Google-Smtp-Source: ABdhPJxlGJeAHwVnlqDa1ss4eMeqEbi+DuCxdPTOLJ4hTOXpWBJexA2X/149Ehjx6PidS5ZcF6tnHw==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr15152892wmj.187.1625492469225; 
 Mon, 05 Jul 2021 06:41:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u18sm12317755wmj.15.2021.07.05.06.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:41:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A550F1FF7E;
 Mon,  5 Jul 2021 14:41:07 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-13-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 12/22] tests/docker: expand fedora package list
Date: Mon, 05 Jul 2021 14:41:02 +0100
In-reply-to: <20210623142245.307776-13-berrange@redhat.com>
Message-ID: <878s2k5158.fsf@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

