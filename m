Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4541C543A23
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 19:21:03 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyzMb-00055K-HG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 13:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyzL7-00045I-V5
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:19:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyzL5-0004Yz-7Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:19:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso100740wmc.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q6b8s89tcwA+JwxjhOZJ3VEsMFYSG66jvhzQ9ZYiuYk=;
 b=w3CSDM2YHoOGQMvpeTHcKIwUNZ+spByH9KvGv1f5fEBaMcPEaR38M5zQOy0OCv50ea
 Bs4NVT5jxFyFy+ae7hMxaKsyUhMR9dgLyaOvh1WeBfrhRFc76N0lHhFz8ZY+b0e+Otwx
 tYs9Y2xW665MUl9+vZTX7Jws1+tQ9e/72S6R0w+1OETvWngpGBY3oQb3CIYFvgTc7PIv
 25jNdI5jvlBinkUQsnGiD+kRMX9zQONTS60QamT9daafE/aICf2Tg2yV6E6yK7ZPbYn7
 ZM3zYNNJXj48axb/cKHzEQYjT0kmK91TQBx3m3Bmt0VX6pk9qR00vysgl30OMnq5f9IX
 wSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q6b8s89tcwA+JwxjhOZJ3VEsMFYSG66jvhzQ9ZYiuYk=;
 b=5dxDUfNFAwIG9yKyF7YeSugBZ/QBwLsXj3+FS4s3MGXZe99OzblFCyOOhs9wXwl+oK
 eC6J/tBWqsEtTJudsLxbhu2bP5pldfSj+/WVg0D0d3MQd7ctgcRxz/Eff4OVYAL25ral
 9er8N1NAGxMyrVGAdW7SH/yKUQf+6l++EnittdSu0en24WsyRnq4SZ584OhT/dG8VoB9
 4hLB6zhkLdUctu6Aa0vMXxaD76NhTsn9KHWH/15DRBsFhaZnfmli+/TYCLLxTEXA5uNi
 ghX56ho8E02YuQG7e6AXTv2gQXZAZkU8bUKyBbRIIXoDtMIVh9MqwqJYcbNjB0eIC/8m
 AEsA==
X-Gm-Message-State: AOAM531ko8lYxmuXK9V7aB0Zq2SRDG9ku/dHziki9xNrkxN7JVPLeJle
 jwSSycNOAMTvIxrPHEqlER8PNw==
X-Google-Smtp-Source: ABdhPJyQJXdSR9hYfP42BISTndgaBB8c8UUqhs4ZVrYGjReoacZra+VDHOhBfoX8Yn8SOphBzSX8xw==
X-Received: by 2002:a05:600c:4f45:b0:397:710e:4c6e with SMTP id
 m5-20020a05600c4f4500b00397710e4c6emr219814wmq.143.1654708765242; 
 Wed, 08 Jun 2022 10:19:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039c325eaff2sm21631584wmq.26.2022.06.08.10.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 10:19:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2AD1FFB7;
 Wed,  8 Jun 2022 18:19:23 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-11-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 10/53] semihosting: Adjust error checking in
 common_semi_cb
Date: Wed, 08 Jun 2022 18:19:18 +0100
In-reply-to: <20220607204557.658541-11-richard.henderson@linaro.org>
Message-ID: <871qvzt6n8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The err parameter is non-zero if and only if an error occured.
> Use this instead of ret =3D=3D -1 for determining if we need to
> update the saved errno.
>
> This fixes the errno setting of SYS_ISTTY, which returns 0 on
> error, not -1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

