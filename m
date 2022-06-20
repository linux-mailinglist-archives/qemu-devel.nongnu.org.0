Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F65520AB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:25:49 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JHg-0007gs-Vu
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JCN-0007g0-NH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JCM-0001N1-4S
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRNpNgwiqu2t41DQ7o3bZIt/llbRi3p0cnrPM0o82Ks=;
 b=I+wY8ezThn3bhml10Ldthv6wd81PtsJMF6PRiIwOZFFod9ZKeqo2tDIvU8Jz6P2NnOZNKY
 7Z6J/J7cY35F2TRwmSxhT5dVpLSvmD4FPsw2oVXukOxoZExQyRiTD8bAh9zwUuJjmUdq2i
 b4S5/ZWoaPFX+0e1Ky6Y5+o6B1IpaDw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-GrdcjMdkMzakkHMri_USuw-1; Mon, 20 Jun 2022 11:20:09 -0400
X-MC-Unique: GrdcjMdkMzakkHMri_USuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so5129113wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pRNpNgwiqu2t41DQ7o3bZIt/llbRi3p0cnrPM0o82Ks=;
 b=1Pi2aw9vI7z+c4pDyg4PIQCqTlNVu1WyqOupAUXjNfBHg62JwwH5g7kVpMZeanDuAE
 LFxx0b+Hni7/ZW6EbmIfcgiL1jBKFTmK6aG0Yx9PUszKw8yRD++kHseFJuMTvqC0ZLXU
 9e7Nbuzgwama4irH2ffQoxynMHuV9m3MGIKGIzN+dmmafiwgHAsfIZNNyikrK64O+8cE
 rd8OL0Byh5suEnYmL4RKBIkE8sv45fUzx70tTf4kHPrEySl0RHHFKCXhz4JybXX/OFwK
 +fRmSpisavcESTxVguUORjOnEjPi+cqXh6XQFEm2yrXTSeom9RxudmHUpny/TG3n/DE3
 TiUg==
X-Gm-Message-State: AJIora8jlHKqreHAWngrVkBnZFezuAB9leYYaBFyOSSzFxJ5j/yGlzGE
 QXGQv1hdGcQZxRgs+DguisLqwhsBk9VpauL5hNLp7lenxxQ/oi91VDo0TUwyycOBixf5b9jtclc
 Ma7daagmnwZRFk1Y=
X-Received: by 2002:a05:600c:4f10:b0:39c:7e7d:b9de with SMTP id
 l16-20020a05600c4f1000b0039c7e7db9demr25365578wmq.94.1655738408387; 
 Mon, 20 Jun 2022 08:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1txhgxwws9Z1eTFI7QiBA6kSJbrgXUzQUy9aDfbbA3BVKHxPGJ44Ie2VkjciOQ66SybuuMIYA==
X-Received: by 2002:a05:600c:4f10:b0:39c:7e7d:b9de with SMTP id
 l16-20020a05600c4f1000b0039c7e7db9demr25365563wmq.94.1655738408212; 
 Mon, 20 Jun 2022 08:20:08 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b0021b91ec8f6esm2335253wrj.67.2022.06.20.08.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:20:07 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 11/21] migration: stop passing 'opaque' parameter to
 QEMUFile hooks
In-Reply-To: <20220620110205.1357829-12-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:55
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-12-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:20:07 +0200
Message-ID: <874k0f2wgo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The only user of the hooks is RDMA which provides a QIOChannel backed
> impl of QEMUFile. It can thus use the qemu_file_get_ioc() method.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


