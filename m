Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C216822D1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 04:27:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMhGu-0002Sv-Jn; Mon, 30 Jan 2023 22:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pMhGs-0002SU-Sr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:25:22 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pMhGr-00016b-AI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:25:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so13103635pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 19:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WCnebSnM1rBc7nv1QjYjStRL6pT7o9IyJHGa0XN4zw0=;
 b=gRQiwufthgePVh0vt9OCfRmqrWlbpOdnsl0Zxdki+g941IG3J4LvSFSDuIwvdVj9BY
 Nuw26Q1kzkOhTUH0Gm8T46MtvBGvjTGnWwCv7efYrQcG8Mx9tsjo5mPVhIRdAwXTq+mX
 TiitdNCM1UTwULUUuFZgnEkJkbu8+K/dS7dwnNS7LK7GW4cZUXdqTUdeXghnd6VAM387
 EsQaeqNmbjep4hefUZpgzdklLiUYfYdpgvu8fw+bv+445+8gXEBHED89HT+j8zqq6TdF
 D9gYiRcwWt21ZwHxFq/llyJqqctGNEL6U1mDEKnWKUnU0IbrdHpwzD5sAagvs4fzICLM
 QOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCnebSnM1rBc7nv1QjYjStRL6pT7o9IyJHGa0XN4zw0=;
 b=EwOeWMSTGlR6m7BI1DGQitAC7eOg/vkTwD8z1U5pp5PxtwNlLeQNP+Up2BNAhCZSxT
 zh7l9ZQkN78adlIO7hQnWzOiOfAxylGgb2J3M66BzEuBR80e0KvDEKTEq9yDF+p4EB1v
 v62/lXyYZN2QhCrwrhDNedEuCh0Hn6x4Mqzxay2rTUvhKCv4aGIZDis5yx7HTaYicUMQ
 rESloX3704Rytlsys3wIaP7tCnR1pDzsvU1SfpnZx3TTYqMlX6OX3ooBB1lTt/7NdU+7
 mnvyVBv0vuEMn/L3Y3rftBWUxZ+OscSgj6Ro0z4ai8v0IZk+qTy6Wkhc5b8z7CV061l9
 6HxA==
X-Gm-Message-State: AO0yUKVHVV3r0o4ApnIiGLu5fszRzL1na/kTJJjflbgBery4YQqWPcPz
 yUzjZ0Eec2fPR0X9dmb5gypItg==
X-Google-Smtp-Source: AK7set+643yyGmW6d+Nmczx2SySSpVyN58c/nUg4FmmeJgtF+SqzrBioKZSeDetNrpnBaOHTcWdN6g==
X-Received: by 2002:a17:90b:164d:b0:225:d697:41ea with SMTP id
 il13-20020a17090b164d00b00225d69741eamr12585348pjb.23.1675135519385; 
 Mon, 30 Jan 2023 19:25:19 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 r93-20020a17090a43e600b0022c01ab2899sm7588765pjg.49.2023.01.30.19.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 19:25:18 -0800 (PST)
Date: Tue, 31 Jan 2023 08:55:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-gpio: Configure vhost_dev when connecting
Message-ID: <20230131032516.72t33x4qdqqot6s4@vireshk-i7>
References: <20230130140320.77999-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130140320.77999-1-akihiko.odaki@daynix.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102a.google.com
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

On 30-01-23, 23:03, Akihiko Odaki wrote:
> vhost_dev_cleanup(), called from vu_gpio_disconnect(), clears vhost_dev
> so vhost-user-gpio must set the members of vhost_dev each time
> connecting.
> 
> do_vhost_user_cleanup() should also acquire the pointer to vqs directly
> from VHostUserGPIO instead of referring to vhost_dev as it can be called
> after vhost_dev_cleanup().
> 
> Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/virtio/vhost-user-gpio.c         | 10 ++++++----
>  include/hw/virtio/vhost-user-gpio.h |  2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

