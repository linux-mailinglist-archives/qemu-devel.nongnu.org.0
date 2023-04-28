Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75A6F162F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLle-00025S-7p; Fri, 28 Apr 2023 06:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLlb-0001vY-PB
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLla-0004Pl-A4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Wbd+T6OHQaHpgXVVijvY0sox1mMEdPdvZy51F3yrUMwkst4kwf0o+OcWsA/0t0KPBZVbPj
 7BRHJ14yEMydPe35J5MctbuHxHVfcgyr0i+OqYEb5tCvwnqC++6dyAUdjG51S5TQit1sNH
 czHugXedLLbER6EQXiIfxuWbWdMFqtk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-N_Urew-qMumNvC9PvA1t3g-1; Fri, 28 Apr 2023 06:55:49 -0400
X-MC-Unique: N_Urew-qMumNvC9PvA1t3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f443ca3357so3591785f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682679348; x=1685271348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=CvptOdY1mDDsl4F0lhgHu+xXEtL4unG0nbeAuaEpfZwviE21XQc5xoLYX8zokbPY1n
 kmYnp0IDa4Wc/7hiil2Ojl//oVbvGdilY0uu/BepkowIFxLsJTA5lzfVMrl/ewJLX6gg
 GxXxaUXp2kAChRM1lsP/UzHICFQeK5L7u64qXHQhjyk8A4ZO2LtpeoIvOve/17AJPwMC
 l3L7H0YFMSSsHI+Thdvb2Tjg0vwTo6MpH46nUHQpB7o08f7tJVf5fvxXP2u4VkJRbqHI
 niUez9Jm1LH9cmb/s55L+FuLGmEMpb0hDiTSXnmHMLAa4CQEjPNCh+1O1PWqqYeVGCu8
 1qHw==
X-Gm-Message-State: AC+VfDz7TFwwUXlWbUaCvTk6i3K9XKuMdy/VJoAmu5zwaZXOAhpvNaqq
 +08lIZZ14iJVpKdW3zCKJadewPymmJB4Z0XVs+LwLJGCgRuy4Hk+/wDc4I4EHjlMtWHUOeyKDuf
 xYWkhU2KAa6e8Dsk=
X-Received: by 2002:a05:6000:120f:b0:2fa:3af5:bd36 with SMTP id
 e15-20020a056000120f00b002fa3af5bd36mr3815548wrx.24.1682679348345; 
 Fri, 28 Apr 2023 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Hn18ft8GJWDjm4O6wjLy5FXbo1q75rWK2DCmXJbm8VkWJAJbBmSwxG39+WDGt3PRCnHzbfw==
X-Received: by 2002:a05:6000:120f:b0:2fa:3af5:bd36 with SMTP id
 e15-20020a056000120f00b002fa3af5bd36mr3815529wrx.24.1682679347968; 
 Fri, 28 Apr 2023 03:55:47 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm20852053wrj.77.2023.04.28.03.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:55:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Date: Fri, 28 Apr 2023 12:55:45 +0200
Message-Id: <20230428105545.139318-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


