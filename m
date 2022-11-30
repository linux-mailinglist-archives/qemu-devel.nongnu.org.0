Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05963D737
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NVh-000341-OH; Wed, 30 Nov 2022 08:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0NVZ-0002tb-R9
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0NVU-0003Ps-FY
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669816331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=J3PrMyuLAH4ZUdTw7e9pQfjERO73No1UYUVwaqa9jHDUZUwJt8bGYA+rWjKIbcxen87lVk
 ODU7+DNsJcnL1+oN2+EC5vEcf/mTHvb+yXzMt15SXIc2Pg4vLBS7bt4oE6BUy782J3GPtg
 xgWWck290NEgEn5QgEmapDWuqZIJu3c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-ry8y_3UfPNy3aEu6KAakDw-1; Wed, 30 Nov 2022 08:52:10 -0500
X-MC-Unique: ry8y_3UfPNy3aEu6KAakDw-1
Received: by mail-ed1-f72.google.com with SMTP id
 x4-20020a05640226c400b0046bca29215eso598374edd.7
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=7KMrEo/iS1uWaYkhB9/huJLgjbSnTK90JaDNdJs5r+7hQwUk6LF9MChvq9K/IG0Czt
 /y5OCDuaHjezgIQAokQIAfAjJkQu+W1Q850fcilwYD+PI7OM8vU+AwKebUXzwBDlIX+I
 38vDrImxY2c0g2d+C82MqCoKu/EFf8b+ARknmY+B8PGCJx4aU0ZSCsqe/XRmDDzdlxOw
 L8r0XutHnUYCSQqi9s8Cz9Yly/EqVnzGhLSBhfOS5fJdhsmGaC3H1qAYC/2G0HfxXWJ6
 +jsQFAoKp02gEcDfT3hVgSgBJI9+b516OSVOYPhlQETOyxqkH6uL/V3q2+D4uabCAgOL
 9dDA==
X-Gm-Message-State: ANoB5pmI/7nFgLfi/6EvEc5Gx1NS7dLBaDRjREyIm3hNsQ34MC3U3w2x
 yDAF8WwPm9XEUK5CLi4dIEqtcQq2d8Z8rhVl+U4PEsGDBnIZbT195YvJISRHPWYR//+/o1rsaon
 WPXOi/iEs08cRQ5w=
X-Received: by 2002:a17:906:9702:b0:7aa:5e6c:4b59 with SMTP id
 k2-20020a170906970200b007aa5e6c4b59mr40087105ejx.231.1669816329415; 
 Wed, 30 Nov 2022 05:52:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6DLTqMSJ9J7jgbmHINR/vyooVs7kz34LJXFpddWElJfteIohiitBP5HrTsKLpHcIk7EbPdNw==
X-Received: by 2002:a17:906:9702:b0:7aa:5e6c:4b59 with SMTP id
 k2-20020a170906970200b007aa5e6c4b59mr40087093ejx.231.1669816329232; 
 Wed, 30 Nov 2022 05:52:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a17090609d100b007bb32e2d6f5sm648870eje.207.2022.11.30.05.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 05:52:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RESEND PATCH] ide: Add "ide-cf" driver, a CompactFlash card
Date: Wed, 30 Nov 2022 14:52:05 +0100
Message-Id: <20221130135205.17043-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130120319.706885-1-lkundrak@v3.sk>
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


