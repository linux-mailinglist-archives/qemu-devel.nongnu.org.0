Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9876E3E77
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 06:27:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poGRs-0001lG-2l; Mon, 17 Apr 2023 00:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poGRq-0001kr-1h
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 00:26:38 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poGRo-0007GU-3L
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 00:26:37 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1a6862e47b1so7526055ad.0
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681705594; x=1684297594;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WZHQWGl6747Vai1AIq5xHpSSl1CMLCZ/BhWzL2hYS9Y=;
 b=jkKl9+uUqmdLtuzFNAw3vU82AWRpf+uSuLDfQ9tWTwtu/rBIjCjDOqvxiDedpnp66S
 pEGjkZ12qum8sBAL4ASoGUryUitJqK474t9trmC7PTNaf2t+3yhyIlcEFP7UyqguRzrU
 L9ijzIKFi564c+N6Wl/2EjwsdcTzq1xRDy0IBSA5wmYqojAUqrC3WihGTAixQ+JjxINd
 Qews5P4z5O47ar66BMeTfPkT0nLKvWArxqRRLIdHKUd8TymbvaAOQ8nJAMNrkIIZDJHF
 lKNDkwCOAH1k8xOkn0FkzKoCp3d1vs1OiFbEiAMWFnDlA+pme6sYshh616Y1mhTP/bHm
 dBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681705594; x=1684297594;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WZHQWGl6747Vai1AIq5xHpSSl1CMLCZ/BhWzL2hYS9Y=;
 b=gIZlBcgGaGExDDgyNsovRy0XONZC/nvM6dll76szTclvbHM/DyRWt2upMKWTU/bGar
 dqc3z/XYgWriUFMXn8k4v2sblk10XiueLdFkMko5c/ogEiVb+PDVwnPsCYcg4m8w6EEY
 wSNdjFekxVhzLmnlyCPSWBnUUA3zF5MNTaFPgiwzZgGWKt80hozAyn6d4vvMU1/wSeGv
 OwzbVEbFq0lfFQYoZ7xA1xCZitlm7WbAvBzbmxhrq8EOPR/DGb2kF0sH+w5O0a1ilkUN
 B+vlmdkuoUa4gF6TjC91PN9IOVEk5E72VQ8vG5BCcCJP1PG0FyhAo6glKJ9FR2NPY4iS
 8cwA==
X-Gm-Message-State: AAQBX9fi3oZuFUNt1zoXgwdwpyRgfp1i7vw7s6WhoPm22na+JBWEx95c
 actj+7P21sJ2J6Kzf+2a8d6GJQ==
X-Google-Smtp-Source: AKy350aHsgBly+8sWQPqb3TrDJYVjkbNvlVnAHmtCmJn/MwrP7jMqrWRNPhg5gW8OyYuAVTCoNQx6w==
X-Received: by 2002:a05:6a00:998:b0:63d:24d0:2c32 with SMTP id
 u24-20020a056a00099800b0063d24d02c32mr1758574pfg.33.1681705593700; 
 Sun, 16 Apr 2023 21:26:33 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 w16-20020aa78590000000b0062622ae3648sm2770117pfn.78.2023.04.16.21.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 21:26:33 -0700 (PDT)
Date: Mon, 17 Apr 2023 09:56:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 Erik Schilling <erik.schilling@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy and
 paste
Message-ID: <20230417042631.ncmvabezvzloxksl@vireshk-i7>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62e.google.com
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

On 14-04-23, 17:04, Alex Bennée wrote:
>  hw/virtio/vhost-user-device-pci.c      |  71 +++++
>  hw/virtio/vhost-user-device.c          | 359 ++++++++++++++++++++++
>  hw/virtio/vhost-user-fs.c              |   4 +-
>  hw/virtio/vhost-user-gpio.c            | 405 +------------------------
>  hw/virtio/vhost-user-rng.c             | 264 +---------------

I wonder why isn't i2c removed as well ?

-- 
viresh

