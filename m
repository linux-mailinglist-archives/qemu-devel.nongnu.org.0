Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6B368FFD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:02:54 +0200 (CEST)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZseD-0004eP-AP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZsc5-00047g-0T
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:00:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZsc3-0002Hn-AP
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:00:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r7so35755465wrm.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZhkvdD2falBWjH39aLZbaxXg6btj6yMqWm/MD6cXMQI=;
 b=dg/zdUh/pLjV5xH4ifq7GDJofu343dtVKvgUXLzTzcJdvz3W0tKGeWKRSzP+/9jZc2
 00P6tjJgcnOInF6Qw8pwqCZTpXuQs6LxwvCQkzp8ot3fov53BnSAdQGGcjSEJ+xBPsLH
 1BoU2t6deRx6x3+SkrJp5lzLtpb8sM9vCsjK9Ld3D3FKVxKBm+Cy28Hq2wtb9MucrIkg
 K70FgqParZR31rWyItf+dsxhIfzkAZ/tGERsrI8JmehQVjw5GlgljjXaydxf31N7F3Ra
 FXQt1aF6MkIvAn2J3cFv3hM7yR1LtK/kXkHKzmxWhvSQFQkfhshkocr/DkyPkO1GFksH
 KrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZhkvdD2falBWjH39aLZbaxXg6btj6yMqWm/MD6cXMQI=;
 b=rjj1EicOGTUdK/6WLXM/3JrRFsVguudOoBXCcYfCHcMqZ0MnvjhP9NXIou4MqXdC7Z
 YtUzo54WlIIM5pqW5L3FvNjAJrkXWyHIGT8deioVVdzWkQ0/l/3z3Yuu4/bVw0YjdXxp
 U/ccMT4o5DvlpeEuxYsOST4IrIhZwcrzsn3NeEVCV/QzSL9qnt3Gp+RM8DNiqE5G7Qoo
 qpur0DQVFlm3zaY484Pk2W2l7jOxDfQJeIOTzKiPIFW/9dUYgaKZGW5ilIBYvdR9+PEm
 i2wE+Z9FMSDXE2Vo8cTr26lilv3A5k1BPuC1cyP2RQAIejXu239e58uuDUwqk1DjY6eQ
 Pulg==
X-Gm-Message-State: AOAM530eh32FllBnWCVK0Gq9AZibl3yCzb9EkCtwZQOChOTYc+B+DCI3
 1BViUF8ktdt3wqwcLsn8P0A3vQ==
X-Google-Smtp-Source: ABdhPJw7QEv5Fx5jBUG89Y/dHAHjE7z6c6yxAFU3HjFb5NndW3tmp1Sl/ShBghCNnnlfNb9fnpDj7Q==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr3727416wrn.6.1619172036621;
 Fri, 23 Apr 2021 03:00:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm10239201wmg.25.2021.04.23.03.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:00:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D840A1FF7E;
 Fri, 23 Apr 2021 11:00:34 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/7] linux-user/alpha: Fix rt sigframe return
Date: Fri, 23 Apr 2021 11:00:25 +0100
In-reply-to: <20210422230227.314751-2-richard.henderson@linaro.org>
Message-ID: <87zgxp722l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We incorrectly used the offset of the non-rt sigframe.
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

