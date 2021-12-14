Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F73474C82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:13:16 +0100 (CET)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxEAl-00061d-5r
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE8M-0004Ye-Fk
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:10:47 -0500
Received: from [2a00:1450:4864:20::432] (port=42826
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE8K-0002GT-SC
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:10:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so34355927wrd.9
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 12:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=64VoCnKZLnNmDIKREt2490DJeAX7XCt5aSyhw7Pg16Q=;
 b=Xha61il2iUCEu7cbw3Up7xqzeP2TkZ58JLnR3bZsRHODOmWeaRbwCuSwS/fwj2HY0v
 fnfafAlrsFjuv2vYWaMFpSaT3y5HlU9NxIwvD5cBNIK1+VjRbVquVjE+rPXw9wriIkZh
 /UXKV2tbK1lCWiKJqzpi+Xwdktoa3HpYsF38zbK0O9NaiMu2XoZ8cntbzVGUtKEiZoAg
 jA7WS2oyJQN/I7EQGxGhezFrAC7UMcej6GT8rSJFDkYvfTXDUTmCL/uqOsRzDwSwvaT5
 EYUFKpJSPGxWg9RVkxPXbUDbdfQsE/icGXrepnVvTIJu0VuWGWBKCH/JtKp0fPnI7tjS
 LaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=64VoCnKZLnNmDIKREt2490DJeAX7XCt5aSyhw7Pg16Q=;
 b=vIkRsX3KbeS0mgI9+Cexb+KeB+wh238P+2THZLmMa1F+GckJMd6oDGNGMqiYdYETY+
 VKIyagbFmKfjIIwC342McY78POgczOmqC7+WwCg6hv2EoutRlQkcIK96urocV7ni8Psz
 4FCQKgcs2yqCfth5YQQNDWzHrE8Io39bbECMfX1jcBv0/mXe66RbokheS5oET3cpR895
 fKrlfd8NAAqpGKVmIU1SuapYBprK9J1NvJ60V9A8iOYSAqxI8AORCn3dDHn0v92Oa9aM
 0RlcKXxtUzJ1xqKQiQE5tsvrYoLo0Raokua1uqbgLhadLz2bJ8KQF1kXPbM3A0IEDRbA
 QduA==
X-Gm-Message-State: AOAM532eStvxBmvsElgHfzVEXOeNLv20SNxF5LcAJkPHxO5mCWtm4pEF
 lgFUTL/dvtmTr292ww3GC/CLeg==
X-Google-Smtp-Source: ABdhPJyJ1lTpaixiMwHibL5h9UBZkwXt5OuKI+kqMPFvs2VHOaRFnGKh+ijTX9jBvhyQSf+bd5fAkg==
X-Received: by 2002:adf:9cd1:: with SMTP id h17mr1263093wre.43.1639512642240; 
 Tue, 14 Dec 2021 12:10:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm1309653wrd.57.2021.12.14.12.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 12:10:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC7A71FF96;
 Tue, 14 Dec 2021 20:10:40 +0000 (GMT)
References: <20211209194532.1502920-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
Date: Tue, 14 Dec 2021 20:10:36 +0000
In-reply-to: <20211209194532.1502920-1-peter.maydell@linaro.org>
Message-ID: <87h7bbgd6n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

