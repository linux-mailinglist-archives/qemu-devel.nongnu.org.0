Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7366D7A3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:11:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh3o-0007eR-RQ; Tue, 17 Jan 2023 03:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh3m-0007bU-KY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh3l-0000ze-1P
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673943067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OTN7tmVv5cG0s+++RTRxooZ2fZDhKQyZvpO3d4xH+YkdaOfCnZlDd5U/BHMpCPa4wFadYl
 ZsASh9168PoqNFXolJVQiH8yErVIke30bLNp++tVzKv7AGnCGCH2ehZc9/MjoqERtMI+XM
 0XDomyOE56GNlKnDHOPd/JGbVV0kf0s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-Ach53IKENYmRGNVpUXA2uA-1; Tue, 17 Jan 2023 03:11:06 -0500
X-MC-Unique: Ach53IKENYmRGNVpUXA2uA-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg2-20020a170907970200b0086ee94381fbso4269406ejc.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=F7BzkKkLqm6XiDTE+pyUgdNvwtY1UWUr1xDTchGAURon4n01AWYuG3ZXXDS5IU+Ls5
 VITAxURmbWMM4dC4qii9IvKWaeZssEJrMm/TEk3bno+8AVsb5ElIwh9/GRDNRkZJVLOb
 u0KWErbN5ByEHCfWa4HHSnYqs62zAX7k0UFtieYBT/eiXvdel4wGAsq9zu3/1lzNQ2KA
 iJRJ/8uDBVNOOefaMirXRRjJOwbTOBFTKsgFOCs0YxF9Nd5zkDhI6nd+58oJelOjekT3
 ptxGUwoKNB6mFImuAiHXkNiYCBOAdpz06JV1/zIaO91LvyOYOjm3CpQO3fUsyJO1hZCo
 Qing==
X-Gm-Message-State: AFqh2krnh0VAJjqzrBlHu++ve5jH0EyjxgQ+9D3RDTW1ZVHIPlVk6Jr+
 DSil9nO/e3gr85/TdeoKKMGA/YB3/uRkhRSQhb+5pxnrbbsLmqslB8wuUNmDp71cjaZVaAgNeu2
 MOAvnegjbMttHIu4=
X-Received: by 2002:a17:907:d606:b0:86f:b541:cd02 with SMTP id
 wd6-20020a170907d60600b0086fb541cd02mr2239624ejc.28.1673943065480; 
 Tue, 17 Jan 2023 00:11:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtArrk83hjLdcaxavYO8zgv8wDU5lP96Q0lCvvvG+xVXLXcnFiCd3U6tB9nA/SkRGsLNcfIKw==
X-Received: by 2002:a17:907:d606:b0:86f:b541:cd02 with SMTP id
 wd6-20020a170907d60600b0086fb541cd02mr2239618ejc.28.1673943065302; 
 Tue, 17 Jan 2023 00:11:05 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b007c16f120aacsm12704076ejn.121.2023.01.17.00.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:11:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] target/i386: Fix C flag for BLSI, BLSMSK, BLSR
Date: Tue, 17 Jan 2023 09:11:00 +0100
Message-Id: <20230117081100.43762-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230114180601.2993644-1-richard.henderson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo


