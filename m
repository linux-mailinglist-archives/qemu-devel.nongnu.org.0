Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09785652394
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ck4-0006X4-Vs; Tue, 20 Dec 2022 08:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7cjr-0006Vo-4P
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7cjp-0005FO-9J
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671543176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmds1EaWdqbCYHF1weSmzjLnm72lT0vg9j8WxBLW8IM=;
 b=fsylutBWeyiz7E/4CpI1QDicG0FLjQEIr6JDh0IvKghzQcTIFIktrk0iGpK7j9JUtnBgGD
 olc4m+A3YGctXbqejToGj/2cvm5KcFSjmUl2rRGWkL+s4naIOXIxD9Ddacz0Fj0nIcxWH9
 p+HcgGP1JrVMo8kxSu3BL+v/xL/SwgA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-GVJFxcFNO0aNCreKPJW4xg-1; Tue, 20 Dec 2022 08:32:54 -0500
X-MC-Unique: GVJFxcFNO0aNCreKPJW4xg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bq39-20020a05620a46a700b006ffd5db9fe9so9322276qkb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmds1EaWdqbCYHF1weSmzjLnm72lT0vg9j8WxBLW8IM=;
 b=RZE4n1FgMf/qDZztP5wIHI9HR3Atp63NC9hFwh4p12oIZj12NW0JF9cfRk51vta7va
 QxQLD7ihyOSOK8EJEFiIN+FzgNA0Ua+tihdxETyTaKeHlu62t/cWgNjWNXx4nX56eaR7
 s/sSOSCDKdn0tNFY18Kz3eXnTzRO0fxGS3dOmcvLziGI8WUu4YDpV4yX4BnjTcTQCA2r
 LSuAlaoozMNbzg6/i7j8RlkzAGAXdMNPlPaRSOYE0qdIiYMwgzRaA37/dlUW0/A9c2jy
 a+RyK6FgGi/xTehEGnKOYlee9wJB+WFkmBv6Lh/peL/c6XUa46/6/EslakMsZyVJVVkI
 gN+g==
X-Gm-Message-State: ANoB5pluMXygxFAABOCgy7WhWla43FV1aRPHX7E0J5V09PJekHiCIuvi
 4EPTlOxAVvmg/Me9PHKtmJPanO8tAKOEYjDBE6zX8cZ3qXit/gFKzQ7b7RMtHLNfYk6HkSsIFV5
 B55FdvkDqZYmptOc=
X-Received: by 2002:ac8:71c9:0:b0:3a8:112d:27de with SMTP id
 i9-20020ac871c9000000b003a8112d27demr49826983qtp.26.1671543174146; 
 Tue, 20 Dec 2022 05:32:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52EqjpTMdkJeAgpDDI8Cu8c3e0c3yMw1xYx2k3+YcmxJef95dSdnuCtGusHslO9HrHOaSuKg==
X-Received: by 2002:ac8:71c9:0:b0:3a8:112d:27de with SMTP id
 i9-20020ac871c9000000b003a8112d27demr49826964qtp.26.1671543173897; 
 Tue, 20 Dec 2022 05:32:53 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 n21-20020ac86755000000b0039cc944ebdasm7585440qtp.54.2022.12.20.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:32:53 -0800 (PST)
Date: Tue, 20 Dec 2022 08:32:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] vhost: configure all host notifiers in a single
 MR transaction
Message-ID: <20221220083222-mutt-send-email-mst@kernel.org>
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-2-longpeng2@huawei.com>
 <ee85dd7e-7ec0-03f2-ba17-c8e2987f200c@linaro.org>
 <1fc867d6-2c2b-36ca-1154-90ff6fc1b074@huawei.com>
 <f43a3c8e-e82d-4992-fe5b-9833688277cc@linaro.org>
 <0fbf411f-8438-f15e-5870-2e9dc46cc76e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fbf411f-8438-f15e-5870-2e9dc46cc76e@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Dec 07, 2022 at 08:22:18AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> > > And we must commit before invoking virtio_bus_cleanup_host_notifier.
> > 
> > ... but with that info on top, finally your original patch is simpler.
> 
> Yes, I'll try in next version, thanks.

OK so I'm waiting for v3.


