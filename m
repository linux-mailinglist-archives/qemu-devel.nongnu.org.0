Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32537470069
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:04:57 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvedz-0007ZY-Oq
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:04:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveb4-0005qq-Fi
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:01:54 -0500
Received: from [2a00:1450:4864:20::329] (port=39848
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mveay-0008SM-B0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:01:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso8822730wmr.4
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vbZH3ye7pmVONinLGjexgoIkFDuWe+VnfXOwkOSuVSM=;
 b=jRULCHw5pA1Z+nBN5NyNi2aUuGOVKx9NJrYkN6NDT0jfUqh1a+ladzgG4vMjqEFGRQ
 YwrvMjyBapC166lqLL0nbsVmCwEJezjTeeOVMXSA9qiW9sTukjeMOzUjLCdBLPVIDvNj
 3mTs9Rd1t6QLS28xLdJ1zeX1dwDG6a+/pZ/lu1SuVtDRYPmRPAYN4J4gtjGq64hLFWG9
 sX9INlNCRX0B/Nh22JU5T0y163nJknQRmiOgcx4kZWeO8ZsAE2D5I/aqhd3lPXA5niHN
 a1DWot1KFvHl8Tr6JnVcia3KuFYR3ruOGY0UukGZnGs+3R4xsPX72Vwlvhjtf9LfcG7l
 t0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vbZH3ye7pmVONinLGjexgoIkFDuWe+VnfXOwkOSuVSM=;
 b=hO1LlYZIzQD4eBuoBloPsSWeK/1ZUu3g7WMdBZFiD3Td+z1qkhkugXMU78uvXxZAC+
 wR7n/Sdcd6S9Qo/Aw/yeZ+p4mqf0gduJiFnfMhYpKPiiyTfKWAx0yMIQ4yk5zoelA5SP
 o6Je3D+Q8njpdOxgScoo996yDNZdHEg9fMBK4RnFDuzkBrZ2eQ5fCZ3J1J21qfCnkY0R
 NrzfCybRHg49CfcPbv07EUAy6DF8CYaBJt5YpapY90UL4/AqincDjTGR27b8NspxCTpn
 DklNG7yVTtjqXRt+IvATPN7AbVPsUY627y5TzzRpgM05P2Zx/UWV6KMCJTlhTDgPHXfp
 q75A==
X-Gm-Message-State: AOAM531Nq8yEuWtf46a28Td3h80ve9ybjeKtNlCRFJVaMUp8EJcSxSa8
 LfCc4zkdh2ZfRvi4YEIozi/0zxh/4cDI4A==
X-Google-Smtp-Source: ABdhPJwCzS+5W3GKmSUggJzIG6go9jA0+tIFGbJPdqg0Hr0efR6lVSmIeosgrUsLNN665UzyGKKL7g==
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr16332755wmf.192.1639137699218; 
 Fri, 10 Dec 2021 04:01:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a1sm3125472wri.89.2021.12.10.04.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 04:01:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3C3A1FF96;
 Fri, 10 Dec 2021 12:01:37 +0000 (GMT)
References: <20211210085206.25811-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: remove DIRS
Date: Fri, 10 Dec 2021 11:59:17 +0000
In-reply-to: <20211210085206.25811-1-pbonzini@redhat.com>
Message-ID: <87lf0sk6se.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> DIRS is used to create the directory in which the LINKS symbolic links
> reside, or to create directories for object files.  The former can
> be done directly in the symlinking loop, while the latter is done
> by Meson already, so DIRS is not necessary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

