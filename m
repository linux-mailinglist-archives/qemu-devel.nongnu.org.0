Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5B5FE36E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:41:47 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj51W-0006ca-Ln
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4wn-0006Y5-Qt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4wk-0002mP-TM
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665693410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EIwBG8evRwhy+KaA/Do8hcatrlipR4nJpQw7FpV0DJlIh2XCH8mtVKnBvSmS9sEzC1CSkZ
 HSXUG2YTb0D/JGtXC63sV6Pmaoia/aPEn4t8dd8zrNYAUdj/VbbXWV213uw/TVsoemXubl
 Wchxb11PiaSmkV8LELDQKMMdvKEGUdg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-cFFbbW4iOWSWGQj0qjXOrg-1; Thu, 13 Oct 2022 16:36:49 -0400
X-MC-Unique: cFFbbW4iOWSWGQj0qjXOrg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y6-20020a056402358600b0045932521633so2243565edc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SuYFWkGudR5Cvq3Ut8vz+xXMxiWKOL8CnH4/WYNF+ZFhT7LjXqrGlSkQgTe5mm639T
 fNR3ogVkm2LiM1Fj23jDG9LiV2zQ9/HaIvtWnIwA8VwuJtlYZgX6l4/cd2jGd9g2M8DA
 mDJAZaMNu/3skF9pfci9MT8s2JClnRpIKhPTU/pIM2JzCpH73H5p4RHI/zhYWuYdva0D
 VRweYXlMY37vdzi5YQnsxGrm6DWVKCDDu03qFfOT2K4P+X2EvJjCslMdlHHmJarpPtq8
 bkSg+HCtJBbKSrz0M5dNxQQPmVtY598HeCNv5r7LBgNxBRlAkIuIUt2J3y1oLRKAl1CM
 bZ+g==
X-Gm-Message-State: ACrzQf0h0xd3hYmD1nB2sxGkY+/ATzgYdMkApztJNRnsrKLQofKIQ/0N
 ZefFv2KeQ18SnD8CKogZw3rXEKioyi3MgqOXwH0/hGndjkkh31mmqeeAN0Wqsy2CYsRt1/7Axwn
 Sv2WlLbvisiAHZMU=
X-Received: by 2002:a05:6402:440a:b0:459:e2eb:9023 with SMTP id
 y10-20020a056402440a00b00459e2eb9023mr1297366eda.287.1665693407909; 
 Thu, 13 Oct 2022 13:36:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7N2x2u6kXdrYf8G6Fzn2KZwLUx4Dy065A/6rlNc0Er/HZKwV91WZ6yHH7Q6GbX46Nrh9ojiA==
X-Received: by 2002:a05:6402:440a:b0:459:e2eb:9023 with SMTP id
 y10-20020a056402440a00b00459e2eb9023mr1297350eda.287.1665693407736; 
 Thu, 13 Oct 2022 13:36:47 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm413103edq.68.2022.10.13.13.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 13:36:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 0/2] scsi: Switch to bus_cold_reset() and
 device_cold_reset()
Date: Thu, 13 Oct 2022 22:36:44 +0200
Message-Id: <20221013203644.652659-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013160623.1296109-1-peter.maydell@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


