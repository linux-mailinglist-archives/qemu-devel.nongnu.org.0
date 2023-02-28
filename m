Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9206A5869
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:36:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyHc-0005tv-Vq; Tue, 28 Feb 2023 06:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyHb-0005t9-2T
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:36:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyHZ-0005Nt-EG
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZzLABNuVUIZeLMtIhhKPE0W20Ki3sdzMvsE43xXoPA=;
 b=EopPMH/LIz81WlN7xP3L9+MnM0ZQ1Mg61Qb06nxz9DQh74owNjb5BlftX5Ujt88kl43HP2
 xaETE1YZQp4JwvBugAnSTo6zLIRqJh3XBMheeVhc+FxckrW7cpq73o/7xGWbdKpHyuVwEx
 Wt7ynAOOtngkw3RkV8IypuoXuXBMWMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-xh0Nwo3rNPGqqgzTvwZygA-1; Tue, 28 Feb 2023 06:36:31 -0500
X-MC-Unique: xh0Nwo3rNPGqqgzTvwZygA-1
Received: by mail-ed1-f69.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso13381724edb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677584190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZzLABNuVUIZeLMtIhhKPE0W20Ki3sdzMvsE43xXoPA=;
 b=lD+ML5pCaN1qv9PI63ZEejd2AdUCHX7cosMuUiJQj8pZu/ji+9LBt8B6iZO1ME4ceY
 5pcTlquR+fwxZ9zqyDA4Ga0kBqB/ospHt9eli7JpOJiFh6iL48lbpFwBbcx6wUGnEkSC
 /qLEwFJba/ZT92h3e1OZKF08j+NeSqETdwjAOLMfgOIbe2m1l9k1rdms34+a/kWOSKCL
 SOqs81j/H1VpQtWlGQGnLT6gcxZOzbYbll6X4ziNAd62Hxqd7ziB9d0bEMpGzqyjLN25
 LQ7+buPRa0uNmXH4McrccFhuJwDdDnqs5T9nFH2UcHLqXqSYoKRqOEFreEYMO1UFMItF
 o8EA==
X-Gm-Message-State: AO0yUKW2xzm0rNa304dxwC4ByI65ue3PnGAfjMGSU6pHSo8+4J2as7HF
 /NTP0wqcQf1QpZCQETxAlo2rOtUaYvzfq5U9NP6ioBdnTtldGq/EyeSCQ8GWtgRaHuvtrC1LQ91
 eGUog5ohBjal0v6Y=
X-Received: by 2002:a17:906:275b:b0:8b0:f58c:e87f with SMTP id
 a27-20020a170906275b00b008b0f58ce87fmr2025982ejd.33.1677584190380; 
 Tue, 28 Feb 2023 03:36:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8d4pCH1nP8N+6R3sAzgfgzvt9+b5YbJ2zWn/wtq0eoDJRt+U+xgsqEydyqIYC5C1vqi90JeA==
X-Received: by 2002:a17:906:275b:b0:8b0:f58c:e87f with SMTP id
 a27-20020a170906275b00b008b0f58ce87fmr2025956ejd.33.1677584190085; 
 Tue, 28 Feb 2023 03:36:30 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z27-20020a50cd1b000000b004af516b5010sm4237434edi.94.2023.02.28.03.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:36:29 -0800 (PST)
Date: Tue, 28 Feb 2023 06:36:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: jasowang@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <20230228062503-mutt-send-email-mst@kernel.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
 <20230228051830-mutt-send-email-mst@kernel.org>
 <bab5d0de-133f-54b7-a239-11b354a79dd6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab5d0de-133f-54b7-a239-11b354a79dd6@huawei.com>
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

On Tue, Feb 28, 2023 at 07:10:36PM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> Oh, I really envy you because I can not use it in my workspace. Thank you
> for your correction.

:(

I keep seeing these adverts for grammarly, try this maybe :)

-- 
MST


