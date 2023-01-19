Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774A67440C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcBq-0005BQ-LT; Thu, 19 Jan 2023 16:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIcBl-0005A8-Rt; Thu, 19 Jan 2023 16:11:16 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIcBi-0005ev-LG; Thu, 19 Jan 2023 16:11:13 -0500
Received: by mail-yb1-xb33.google.com with SMTP id e202so4233076ybh.11;
 Thu, 19 Jan 2023 13:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hr0dgoHtifo6ZQFNT3To4gYl+dOd8XLgJ/IYxFEIioU=;
 b=qtFqlB+tQeKxodDHLAijKZa/B3cCWoTCN9zXLg1zxYwyYWsz51Ck/XH1nTvUC424AB
 owSiPmPVf946LNLRgFuxkSqtxSEf2PCL4n/aMOAwa+pHeic9XzKPJwtIE3vSdok6k+aT
 SXDk4kkd+gq/ot8SVU7kZeFmc3ifGC0NJJcidUTx9EDJCJdOgylyKLVT5AY4xcCXoATu
 K29XKRcVrYrP/7TD4IxJlYYJftzXKJy3yJue3UXxU2Q79bj2VXY67Hh3drFBgAIm6knh
 vTEKLKDm5LzDP3+9inUTZQpfg3LKhyGgBEM17CZ9MlsDnDjSMbYYo113Pn8nqLHThSC6
 8+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hr0dgoHtifo6ZQFNT3To4gYl+dOd8XLgJ/IYxFEIioU=;
 b=fHHq0zcA6XgwPUrwNrn8pQRIMKYenBaG4bLnuEf/oq8kwJYxz15GteWGimEW1pFj7M
 g7zO+9HZeVL+w8KRSd7VErdA5zzbheoeHTZScOnRMbP4MLu8pVVY6WADN5xHaz/iL+vu
 2ywO9dQsjxpmQCUuFwDjJFbdK0NOwRbenrDFyHWNPweHKqzUZ6q5TZzGgWT/az87+/J7
 o8m23/frUEDuSwGLc7+gFe3YgEHolfKIUzpxSw3oYYoNM+hFFvkTK8a5Max18OcFn/c7
 1vFqGx3PblyBhTfkAyYOzrk9ItIxyCooeJW2YmIHPYHLM1UjuNEFXdjltBvKbtcx7+TL
 tdtw==
X-Gm-Message-State: AFqh2kpzoxUE6NBFjNTZ445qap27fk5vnKOO2dd8y0343JN+aLivryWD
 A3vLkP70EDAjixxGnFXA/iVuu+wsc6QKxsdwRZc=
X-Google-Smtp-Source: AMrXdXtg5m8SizmStPn58PCP5pnEnPapgQlNh2p/LW84nBZl8SWXWMBkd0Ho82/4KmiMzy1WWpGUdhn1olQjJHvTMO0=
X-Received: by 2002:a05:6902:1806:b0:7d1:801c:d6d8 with SMTP id
 cf6-20020a056902180600b007d1801cd6d8mr1177487ybb.366.1674162668923; Thu, 19
 Jan 2023 13:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20230119172424.478268-1-groug@kaod.org>
 <20230119172424.478268-2-groug@kaod.org>
In-Reply-To: <20230119172424.478268-2-groug@kaod.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Jan 2023 16:10:56 -0500
Message-ID: <CAJSP0QUEh7m_0_zowEfkZSjJdJntpWvhzUVBtb49C+ze7Sw3pg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "vhost-user: Monitor slave channel in
 vhost_user_read()"
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Parav Pandit <parav@nvidia.com>,
 qemu-stable@nongnu.org, Yanghang Liu <yanghliu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

