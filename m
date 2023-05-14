Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81D70206F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 00:26:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyK9M-0007pB-FH; Sun, 14 May 2023 18:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pyK9G-0007of-2J
 for qemu-devel@nongnu.org; Sun, 14 May 2023 18:25:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pyK9E-0002Qr-Hb
 for qemu-devel@nongnu.org; Sun, 14 May 2023 18:25:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso50256045e9.2
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684103098; x=1686695098;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5eTRE5IecA7P9uHtqhqXt3Ln1YZxBj9QndbVr8rHTY=;
 b=NmwI4ff5TqYKjUl22LZPWzV1Oy1+OlH3YK6XRrZh2gxcbtCtEp3S4OkF4PYlDPVaTE
 Crs7gkv47w6KrRokTk8dkob9aLT0iPmHIrRm4f1oP6HknX7w+HlK3TdLdem+8iSRliZ8
 yz223Thw4Xa7oqFEDDznHypolnH2nTxp0FbrQbclta5WAhdSAg+VOurovQnQkv7nntaL
 cMhMxlCd8IsbsNu7oc09klvuhBvIlba33ANUpNDy+eVxnMsV5kdSDP/yKnQ/4Fkhew8G
 oaea1C8cBPLYWEKtvK2Psxrp2ybJCr4tM8uNIu8F45DW+Z5aOwyCghlxj9uSKzyNucae
 W8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684103098; x=1686695098;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c5eTRE5IecA7P9uHtqhqXt3Ln1YZxBj9QndbVr8rHTY=;
 b=hnQR3D492xVCa+0dUs7IamOG+pGXY1pVTx9TRPnt8AqUhWlB2zkWem27kMSVgZEExc
 +heEzFUH08Edu7BiCt0roMBDD9geh1Tyxq6sCBw7rw7nCBX2JxxyH3+kk/DkgBDeno+K
 2Al/wfJWlRL1tsJcKvsF/uKFromFoThHBq+wQL1rJcAuejKVK0fd0ZtQAAfaBNSBnt4V
 0NXGBycvvuh6mTvkOMBxiu9mCbYqCyqYLPM94djcmOyahaUmVRQOivcshLQ7qGZLb6Ko
 1++o6jygxHbxLmvuaYVcSM2QKIJw2KB7i814+hm+vgVkrkgJCC/IN5LsRA9Tk6BpEc9X
 G2Xw==
X-Gm-Message-State: AC+VfDzcY+oulwVfqQUt3SH5MBjTBhdLbwkW/8eodOWyyr2V0T19T1kR
 ijIEMcPTTm1yDTtPWfm/4IaFN4KGaB3ppuqIVd0qOg==
X-Google-Smtp-Source: ACHHUZ4BPFfIz229XD70YjeoINV9Ol6MNFzV8p4+uSvEIfQzw+rtpMopnWnowlT22Ysn3WWTAf2EbA==
X-Received: by 2002:a5d:560c:0:b0:306:3381:67fe with SMTP id
 l12-20020a5d560c000000b00306338167femr22814714wrv.27.1684103098054; 
 Sun, 14 May 2023 15:24:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003f427687ba7sm20176999wmr.41.2023.05.14.15.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 15:24:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 251371FFBB;
 Sun, 14 May 2023 23:24:57 +0100 (BST)
References: <HE1P193MB00580265AE8BA41151B8E203A37A9@HE1P193MB0058.EURP193.PROD.OUTLOOK.COM>
User-agent: mu4e 1.11.5; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Maxim Kostin <ttxinee@outlook.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio: Prepend "virtio" prefix in virtio_error
Date: Sun, 14 May 2023 23:24:52 +0100
In-reply-to: <HE1P193MB00580265AE8BA41151B8E203A37A9@HE1P193MB0058.EURP193.PROD.OUTLOOK.COM>
Message-ID: <87a5y6pn47.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Maxim Kostin <ttxinee@outlook.com> writes:

> Rename virtio_error function to virtio_error_impl and wrap it with
> virtio_error macro, it adds the "virtio" prefix to the error message.
>
> Remove redundant "virtio" prefixes in virtio_error calls.
>
> Signed-off-by: Maxim Kostin <ttxinee@outlook.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

