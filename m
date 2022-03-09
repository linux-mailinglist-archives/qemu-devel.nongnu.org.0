Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BE4D2EE3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:16:17 +0100 (CET)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvEm-0005m5-QE
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:16:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRv9q-0001WT-AP
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:11:10 -0500
Received: from [2a00:1450:4864:20::630] (port=38819
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRv9n-000815-Ax
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:11:09 -0500
Received: by mail-ej1-x630.google.com with SMTP id r13so4511277ejd.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yNKdr3IablKOqtq/9XUkE5D7YN31zvRB4Z1AoksxRTY=;
 b=AfnhCru/8nZweCT6W6eGLkjm3AyWujpBFCx219d31oYp9BoZbRf/C2ucDPLNfo+NIm
 5NQ5uwurxvL+URgJ+zOLw8a/F3JGBcCOmuJN3y9l/ewYXDv/6vYXfLdWlK5QPp6yBe0H
 7dJ8RcutIECDN5SdcBbVQoebChFWK1Tttgt1UXeHZMoQAVZaBQPxC2eW52SUMl9zKhEU
 tRnz+N+rwnMEJHn7HHj98SobdsC8s1Kv7o6Baf4jY6oQ9DYtFziWAuCbHQgYVwbQPokt
 vrDEysGJuNGrSCWNnZ1EMEnh1aV9fItjzyRRXhQ/SGn8KBiFpHhmD7owfrGLoalxCfOa
 iwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yNKdr3IablKOqtq/9XUkE5D7YN31zvRB4Z1AoksxRTY=;
 b=YCqBhRJwsWs3Y7kiVXq61mn4VNn2B0UcOc9XYYBIe7BW/QW7uQzY2gIvP2bnIbrdUx
 CyTTc3OcMgZR//h8lFMLiE3G/YHS0hU09rwkY8FKk6L123lf4xZ8+vQQ1Qk0rgDALT4S
 s3579jrj3abq4wtPCHCwi/Oe8uBdFO46vj7qoQjfzKP6Nh8Pxfoe80QaXEUAjqIZEFeu
 RkA28n94I2WyEKBMw2hEuvlcVZujA5VGkdMKShg/ZSLYKZU8cjTqd3awJ1pj7dsHKe7+
 Py1i5d+j2Yd1n7PD/YinczdQwA2+h9TLJsXwbUHUs2PFIm5OsteNujJiTr7JKW4zDwVR
 U9qg==
X-Gm-Message-State: AOAM532/tOsVy2VWW9lUkMfbjc+F0gf8wV/ChE7sWxoYuEZONnu6Cgh+
 ghzx3DKXH9w5L2/aZ9WdcAiqoKYYhHJrcQ==
X-Google-Smtp-Source: ABdhPJz6KbvjuCnLvdCewn4mixbHFbnyFrnWpLdr8oddiwghoHQSPPOiw2mocuWcmhetNkkEXMlLYg==
X-Received: by 2002:a17:907:1c09:b0:6d7:cdc:9590 with SMTP id
 nc9-20020a1709071c0900b006d70cdc9590mr2683710ejc.147.1646827866011; 
 Wed, 09 Mar 2022 04:11:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05640205c900b00415fbbdabbbsm731687edx.9.2022.03.09.04.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 04:11:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FC721FFB7;
 Wed,  9 Mar 2022 12:11:04 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-11-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 10/11] edk2/docker: use ubuntu 18.04
Date: Wed, 09 Mar 2022 12:10:59 +0000
In-reply-to: <20220308145521.3106395-11-kraxel@redhat.com>
Message-ID: <87ee3b5ns7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gerd Hoffmann <kraxel@redhat.com> writes:

> Upstream CI uses ubuntu 18.04 too, so pick
> that version (instead of something newer).
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

