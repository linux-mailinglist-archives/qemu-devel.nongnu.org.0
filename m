Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E372AED9C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:26:31 +0100 (CET)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmOc-0000Of-6U
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmNe-0007sW-Ln
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:25:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmNd-0007BL-1b
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCSb1cw1wdmtySVvoONZsdRhymZc1OxqN74pTbbx+LA=;
 b=Y1S8M2WuAFWFV4xAH5W60c8Uy4TXzu6bZzPiN4b396RvzTAaHihRxyrVAVnXa8t+qz0Dge
 5APhGoDBjiiuePHNrwNTSNL1Zv34X09+CCC4wn/FX7PSJk1SJ5EhC879VnRYfKa0ezsgg8
 Pm0f1P4vK+xlMQQ1o8fpYhF7UDBTtRw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-QRxGFn6VMimM4Rv9UgM2pw-1; Wed, 11 Nov 2020 04:25:25 -0500
X-MC-Unique: QRxGFn6VMimM4Rv9UgM2pw-1
Received: by mail-wm1-f70.google.com with SMTP id y187so657399wmy.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QCSb1cw1wdmtySVvoONZsdRhymZc1OxqN74pTbbx+LA=;
 b=pRqrMUa1/SRh7h/vj8zJtf8nnj0opdOPV05WXvGSdfTb8mGDXwTuvVpFFl3LTU/CwE
 +m/jRcI2DfZ1N09jpVmjE11oVsjrOXoRaVP2HlJrpqSeY/6K31oLz475N8dXeh5y4C5t
 f0tEU7KIX6MdL5t4OvguShaSgdZreX1X1K681pmpuVGtEIvlDl2uYzQXxe1MUUGegO+H
 NsjLa76ZDiUiXhi/qjmc+sKNsFx8oo1oUmU/KPvRAbzRyqXiAf5Yz7rzmT4mR8rDU+iY
 Rmmb15B2ZDROtbHU73BUbyDVFhsEtW2wn72F5icjvIiT5Bf3mpzi96otbkt1/hJ0Tc4J
 dQwQ==
X-Gm-Message-State: AOAM531oFqyUu1SEGgCl+dsxOEsIMx8TUPqDQXXT4lCX/r9MICKyXwkV
 /UOPNZnX2E7LNq24ssSuCuN3wTzsWroLr+SkIrOLM6lGfco8GoGgThafJhDEfAwkw8NRs0FR91O
 r5aNrEgkaFVLDn8c=
X-Received: by 2002:adf:ce84:: with SMTP id r4mr27359283wrn.281.1605086724469; 
 Wed, 11 Nov 2020 01:25:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiyTzH4E4wEIyDyMaKUSeNOMC2h2ilPnmpdfrIZTxGnRpof+Xlq78XS27XB7nsSALULjS61A==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr27359255wrn.281.1605086724294; 
 Wed, 11 Nov 2020 01:25:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 35sm1862363wro.71.2020.11.11.01.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:25:23 -0800 (PST)
Subject: Re: [PATCH 2/3] vhost-user-blk-server: depend on CONFIG_VHOST_USER
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f04f74e4-ab6c-6c06-d4a9-cfa578bb16e0@redhat.com>
Date: Wed, 11 Nov 2020 10:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110171121.1265142-3-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
> I interpreted CONFIG_VHOST_USER as controlling only QEMU's vhost-user
> device frontends. However, virtiofsd and contrib/ vhost-user device
> backends are also controlled by CONFIG_VHOST_USER. Make the
> vhost-user-blk server depend on CONFIG_VHOST_USER for consistency.

Possible follow up cleanup is to rename variable including
"frontend/backend".

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Now the following error is printed when the vhost-user-blk server is
> enabled without CONFIG_VHOST_USER:
> 
>   $ ./configure --disable-vhost-user --enable-vhost-user-blk ...
>   ../meson.build:761:8: ERROR: Problem encountered: vhost_user_blk_server requires vhost-user support
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)


