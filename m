Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FA6EA637
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmRK-0005Ya-Ao; Fri, 21 Apr 2023 04:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmRH-0005YQ-Av
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmRF-0003I5-Vi
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682066897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FFQuBKljqQbYkr55/CvwsBYdH8HYTI/Jh3t60Pt6SGYKeba3DW2h/yrY3cy2x1RysHA6n4
 Zp3COHlsy/nAExeMptk9dh4thbazUixRdm64mncYyOtw6iWB+XFQrxQpLWN+RTsqhS1cKU
 va2s5QTp8B3Oka2GsxaJpFKy8RmqJIQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-6ca0OO8_PEGWmvxsy_Lm5Q-1; Fri, 21 Apr 2023 04:48:15 -0400
X-MC-Unique: 6ca0OO8_PEGWmvxsy_Lm5Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34a0b75eso117827166b.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682066894; x=1684658894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=mGtcMPlNvPlZcjmxat19E4sS4z3bSIJBLravx3LIL+dGo7jvakKdFQoGb/6boOJERf
 kIQKRkQfJzepgI6jLchi6zsIpOJroe1Zp+BLHXXVNsfNQLnkaWPnQEt9+i3SEzH16p8r
 gS+VmA7cZ41nvIfXivL5RlaGXaSzInqptEqcKseaW6UeRMztULIqIhHDI1AQjlt/G6cE
 cgIyHVTE1WltflCPvYp6mUh+JpTf4nPeIj3KRkgm0d9hKNCHR83Tnuhi4j01ThS/N/Jx
 LxU4wkrL570QhzHB3pZ8lF8MJDknV6r5IqwGTlw0MvEeVGhnE4HG/seKVWyhceTpcU0+
 0F3g==
X-Gm-Message-State: AAQBX9fRGqU9bwYq2hFcbAQaS0DR6Rxe/pFhrKdSkh/vCn8H8FeX69f7
 oAo8lVkvVl3eDaio9/hwBoSpAH/UPa3hwe2E+msXwGXtC5DST1Ho89F96Vg5uS9eL40X3J3we+j
 6AawWzqwJaijozag=
X-Received: by 2002:a17:906:f295:b0:94f:1c1e:4222 with SMTP id
 gu21-20020a170906f29500b0094f1c1e4222mr1519205ejb.63.1682066894065; 
 Fri, 21 Apr 2023 01:48:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWWKuqvbOSrEETU5zSp0fBzI+nEuxYfq95fqAzazQbqcwDmQO09E32WhoCfdXpX16ZYLYARA==
X-Received: by 2002:a17:906:f295:b0:94f:1c1e:4222 with SMTP id
 gu21-20020a170906f29500b0094f1c1e4222mr1519187ejb.63.1682066893730; 
 Fri, 21 Apr 2023 01:48:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a170906361b00b0094e1026bc66sm1812245ejb.140.2023.04.21.01.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:48:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 0/4] Qemu SEV reduced-phys-bits fixes
Date: Fri, 21 Apr 2023 10:48:12 +0200
Message-Id: <20230421084812.10215-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1664550870.git.thomas.lendacky@amd.com>
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


