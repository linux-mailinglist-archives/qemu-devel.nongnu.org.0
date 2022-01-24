Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF85497D82
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:59:10 +0100 (CET)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBx41-0006ke-De
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nBx1V-0005SW-2h
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:56:34 -0500
Received: from [2a00:1450:4864:20::431] (port=39812
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nBx1T-0004gk-Dj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:56:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id r14so2197929wrc.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CPELNrshwCAU/KT3/pQM0on9CTBjMsA8P0rzuesNCsA=;
 b=OXNHngVDLJFhUpupHhW2Dy5lbiaZwod2zPEvTHndJEu/YvipZHeW5N7cxJp1S62Zar
 erqPSgXjq3WfXgxJ6DsWZ4H9VENpZ9/c0KA3roziRaEBOrQIspWvE1awcryRZkVVu0z1
 Wu6XMB3C12mP4eLiX4IncgzeUcBNj4WebD4hcyjTv92DjA1vF8tTwBB4D70rQ8DyZzJB
 txvM4HgvKVS9BaclMA8w8235EYj5WCLjuqe/ZmW6rNfDTO9L5jDNnSNWRqZSCCWsm2+x
 9zJCDzdkPo9anqgjYPudGPedYp8ep/JrYuOG6YEnD8v8cWUBxLx1ltAZn5gQez6pxKEh
 RCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CPELNrshwCAU/KT3/pQM0on9CTBjMsA8P0rzuesNCsA=;
 b=aQEnBhWy7Iz/lED/41YT9agxyzrkgmP9W99UHIVfXFHvK6ipWrufIjnKoCt5wG4TZ8
 gN7OrdJR+f4WvrMhjJZ1JzMm2xCX9vbpFz9OaSZmUTocajty2Flk3o1nAl/KRs+9Y2En
 Ytlg+xqoMjYS0TXAP/NVm4UEoDwlq+sZBcADHwpaRJ0SQKGI3Z/d6wfuaqxba7y3t94Q
 8zv4Rh1z/6u5mUBylt+b3l74xdWk3+O2QWnglbZpgUJhmOE4BMQJSjj9WmPRuOHws8yN
 g7AuH4FeRpfD1Oh9J78fmu/aM/KrTy/ocy++3pltMTx8PaTLCQ+hy+VZ9Rg1mWBa5WxH
 kTgg==
X-Gm-Message-State: AOAM531eoa7QRxV53SB/QfX21bLvozXD3F5l4n7QHbyvbo94/rFOCgi7
 kcg8DMmEh27WJ1fi3gQRoWWfiQ==
X-Google-Smtp-Source: ABdhPJyff0Mai/AQRAafgUvVas3CKqbMFBHsNdYjCKjgUpFxfAt7Fb3X0nyVxvGBhrGe0NM8sRbK2w==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr2030068wrq.146.1643021789056; 
 Mon, 24 Jan 2022 02:56:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 8sm3833410wmg.0.2022.01.24.02.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:56:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C4E61FFB7;
 Mon, 24 Jan 2022 10:56:27 +0000 (GMT)
References: <20220121154134.315047-1-f4bug@amsat.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Mon, 24 Jan 2022 10:55:12 +0000
In-reply-to: <20220121154134.315047-1-f4bug@amsat.org>
Message-ID: <87mtjle71g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?utf-8?Q?Daniel_P?= =?utf-8?Q?_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This is my last respin on this series which is fully reviewed.
>
<snip>

Just to note the "b4" application of this broke the From addresses. If
you see the lore copy:

  https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat.or=
g/

all your From's are via qemu-devel. Have you changed anything about your
submission process?

--=20
Alex Benn=C3=A9e

