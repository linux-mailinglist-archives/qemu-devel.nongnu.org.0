Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09726FF027
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:52:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3tl-0003Ld-2S; Thu, 11 May 2023 06:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3th-0003LA-27
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:51:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3tf-0002ck-4d
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:51:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso18490205e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683802301; x=1686394301;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6HDgHoPvvlBjidXTq0V/1wpqF0S7o6eAVwOhZXFepg=;
 b=NPpSzrvI5pESRB3TxAD8/cSJkJNK13aboIhxmlf7PdNWhRMKCYenX3flga+OAnGWnn
 offyerDExGJH6q9xNC23KyHgje7brMC++v3XoWqPS6/6xz2+CxwRIXH64wXHZ+dvR+je
 XLHCqTkmCKK9pngrOrqODp4EBv9t6Mmxt+deXrER0+JvkgGdJVrrN6iX9+UhoASWT+Qx
 HdpKfZMT+Y2TFIEYrIgeuhjWsSo8fbeSwtd3ztTWKnCnKpSGnuYeQ5MiUN23OsVvvA1Y
 hgZXNKTla3BAyHbsryBwwU+1IH+fQjbRJVGXecanX3xia1XyLmUu+uXdhDsYe4CYjyBX
 alSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802301; x=1686394301;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u6HDgHoPvvlBjidXTq0V/1wpqF0S7o6eAVwOhZXFepg=;
 b=LT7tBBtBkOVl4M0ho7VgoHwXVSXoY7dgln1eeeE2hF5sP1Hx433XkUyJ5YYqepS1k3
 5UdA6ffiS7CC4M06mOIwaaUaUFcbaDBR9KjWF+oXWkqGqw/4EO+oCdkpuSDnjr8LV0kD
 lgS4IUq06BXmlnn4vRr4Y85PSzl2QQZhtlRNAc5/zJgGObfIFFLuZtR5lUhL6yXkssuT
 A8gwvWLK/eOY90Xn3nbMJtL2FFknoLauO/ydoRUawGp+LAmbYLM7aJRTFgsigRGqtNFg
 P3yccW65jxiLxxQDIFPHKHzPV9pKRiZI/agv2+ywds+z1e9sHib+0/YJ38gspCXXiAsx
 Zb+A==
X-Gm-Message-State: AC+VfDyh4+bDO0uHG5p5I1opk6v6tm6bfYVD1rwXgt9CsXIeISLW+qMx
 kVRj5t6cuXNJ0ht3qfRsISFcaA==
X-Google-Smtp-Source: ACHHUZ70Ss958ayP4TCuxUNPPYT6Zu6JVPDhBR0CYx4ku+pAmsXcqopo9v7DJNW0IpVqp8zgh7as0A==
X-Received: by 2002:a05:600c:2055:b0:3f1:9b85:e305 with SMTP id
 p21-20020a05600c205500b003f19b85e305mr15219083wmg.34.1683802301542; 
 Thu, 11 May 2023 03:51:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b003f4b6bcbd8bsm4062061wmi.31.2023.05.11.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:51:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2C281FFBB;
 Thu, 11 May 2023 11:51:40 +0100 (BST)
References: <20230510230213.330134-1-iii@linux.ibm.com>
 <20230510230213.330134-3-iii@linux.ibm.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Test single-stepping SVC
Date: Thu, 11 May 2023 11:51:35 +0100
In-reply-to: <20230510230213.330134-3-iii@linux.ibm.com>
Message-ID: <877ctf3zur.fsf@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Add a small test to prevent regressions.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

