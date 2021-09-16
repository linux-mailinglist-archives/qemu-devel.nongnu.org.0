Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262540DB60
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:36:06 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrYb-0002tq-BQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQrSj-0006Jf-Dv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:30:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQrSg-00087r-P1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:30:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 70so1916619wme.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4KPxED5CscNILGT51FVyOB566ZycTAYVaWoeYF+MVqk=;
 b=I9EWz0zL1BcE/aWQ5oHpCh7jMOZoUwjIDpBfiLUDvBXoLPT4adUoaF4h+iP6588lqC
 rfYrS/m6fZEZ15mRtyWg8XPSxGVCTOR9/cC2LNkNV/vXR0y2W32+Ekl1iSNX93Bm7iS+
 0/CkV/6j8MD2Kc0pWse4IHgb7g7BnosQnzXZvQh26I/NANpmEfgM634gLhZ25GI5TwMN
 c8NrsrE2z4zsA8uTPsuxKZqLKvvLf1ja8mcE4sIJKwkUmj0Qiwwnsx90K9ERLmeHu3+a
 5y5FWbeImlRhH92PFiSH1vBwX9cMa2x8sBzizojPwEYfmUqU/shR38GxoCoH3VKn13BW
 jHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4KPxED5CscNILGT51FVyOB566ZycTAYVaWoeYF+MVqk=;
 b=6CimWG0dUgdUrgbrsrd2t/w/7UVDMDLw0hCYCbY9R9JwKxvZ9setRPB72kOzIQM+AY
 lt+WzWtABwBb6OM+448QBsYFgtqwmNC+JI7G/YFkmGcwev6ot65hEEfbko45KubmGelP
 pe7XhmoLeZ63FKgPgCdNm+JTbjCnCJuReQjoffGtwbX/F0xzz2cvKpcu7IqjXY9pdSwY
 gYZHkVlb9+5PmCs5YrzazcJ9z5VBUcW+WW3ivJtk39YdMst7ar3uXX7clY8mRnxvBNU7
 goRmdHQ/LDK7zEoyvh2ZxefI2+u3hBxjEfL8z3aD7PXFpd7XIeinQFyM1E4A8GKGOX5g
 m7Cw==
X-Gm-Message-State: AOAM532I4O10HuLXHumHnntTo/prhnZiu3+GM1abkDMiR4mYWnxVHAlv
 8rdUtwQRzCL9koR6EWDv9tqHPQ==
X-Google-Smtp-Source: ABdhPJxb3KihnCmvAWlNJubsmqRx0+qWblHbcuLUvNZGH3hQ0Qs3o1IpOlRRz6eis7IxoJ3DW84Ntg==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr10102600wmi.93.1631798995624; 
 Thu, 16 Sep 2021 06:29:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm3695591wrg.31.2021.09.16.06.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 06:29:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BABBE1FF96;
 Thu, 16 Sep 2021 14:29:53 +0100 (BST)
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-2-jsnow@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 01/16] python: Update for pylint 2.10
Date: Thu, 16 Sep 2021 14:28:04 +0100
In-reply-to: <20210916040955.628560-2-jsnow@redhat.com>
Message-ID: <87mtoctzqm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> A few new annoyances. Of note is the new warning for an unspecified
> encoding when opening a text file, which actually does indicate a
> potentially real problem; see
> https://www.python.org/dev/peps/pep-0597/#motivation
>
> Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> terminal output. Note that Python states: "language code and encoding
> may be None if their values cannot be determined" -- use a platform
> default as a backup.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

I've cherry-picked this one into my testing/next because it fixes a
failure but in case you get it merged elsewhere:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

