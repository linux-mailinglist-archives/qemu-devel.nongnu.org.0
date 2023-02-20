Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C469D09E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU82f-0008Bg-Ip; Mon, 20 Feb 2023 10:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU82c-00083l-6d
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:25:22 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU82Z-0004RM-WF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:25:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l6so1170059wms.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cehb5WNi5MYIu4t9r/8tcHC2nDn1h35fH0tE+quanlM=;
 b=kUnNVI1DpFw0LvYX7AnkQkobzuWwm3OlCIUZJ39KJy71ustA+1ZSzINpuSoxqgzxX6
 U+yyMk8KLDB993IhfnqhV4IqwnGcHuPuNUhrdf+uVlrcHUhG0nMCcteowEXmc//q6TBH
 veSxvstOk9w8oim4S99AUHF4Ha0z5hr8HDFnfvC6XJG0pL/VKi+nApoo0ujSbDbsC5ED
 TW77qWHgf34JCCVZGkUD5JIXuvIlL9hVafiJOaEhzI4BqPh5au8MpoZLKkk8lUAFXub+
 w7DrR5BsS459eJBAhPWlzG4oe4vNHvGTYzJtdpS+7PVryoSf9bcWGdxy85LkzMD3ACNi
 RCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cehb5WNi5MYIu4t9r/8tcHC2nDn1h35fH0tE+quanlM=;
 b=6L1FyToTCF5S1iy/+NCfY+8Qoh9TuyXTV3MeESvlAxLxgfLgZT0y1Vg2LckNPRDWub
 tBItOLreScZWzbRiDGxAtB9GMdi413TlRSR8JtPuxsXiJKThrOIK20J7dNmhGHYWa7kt
 s9Vp8/Ilb3qXl4OqfZPL1W/buJqdH0HKJk8h9CEnX4OcZYkZgfIcjCAX71Nws2HsV9dr
 5JOqDL3qMiVVBMTp5psvw/3DKkMoq1j4YoJAJKbRwfVIcOLp9S18P24nSyeCFZ8xCp78
 36PhpaCxBzkk9ZSbzQ5QMnDT6JhLqZVR1Y4xUmWLKjOpKWU+Tfr9m6ItD1ZbD5u0tBhs
 SKig==
X-Gm-Message-State: AO0yUKUajYpLtbUoUgAiZBUSFp/wVc5p7c7fUkMDcRx2tqeDHCad8PQ3
 7UdqWY/UQ6u61DmWm5XCbX964Q==
X-Google-Smtp-Source: AK7set+y6LQd2mr4pAr6crrW3IAYZW67bLlXZWUwJREGV9jZ9SLUgfT/614RXpDg7Ps/2P/zcjLkBw==
X-Received: by 2002:a05:600c:2e84:b0:3dc:5e0d:4ce7 with SMTP id
 p4-20020a05600c2e8400b003dc5e0d4ce7mr813729wmn.11.1676906718283; 
 Mon, 20 Feb 2023 07:25:18 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003e6efc0f91csm82107wmk.42.2023.02.20.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:25:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 903B71FFB7;
 Mon, 20 Feb 2023 15:25:17 +0000 (GMT)
References: <20230220142942.287392-1-pbonzini@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: thuth@redhat.com, Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Dan?=
 =?utf-8?Q?iel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2] docs: build-platforms: refine requirements on
 Python build dependencies
Date: Mon, 20 Feb 2023 15:25:08 +0000
In-reply-to: <20230220142942.287392-1-pbonzini@redhat.com>
Message-ID: <87y1oss6jm.fsf@linaro.org>
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


Paolo Bonzini <pbonzini@redhat.com> writes:

<snip>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

