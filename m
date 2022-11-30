Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A931C63D991
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0P7d-0004Km-IV; Wed, 30 Nov 2022 10:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0P7U-0004Jp-FE
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0P7T-00066u-0q
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669822529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YpSktc1gf3luH4V+nz+I0DIXqyiKYrDKrnzuq9nbNKdWKRr5pDLFiReGVwAbN+3WkgoUjY
 e+i8RvwPCCW2uWyMvndupgQLPs6BWjGuNY35K8gEg/K5pmpeUHAcA18pPmWTVsW9/0+6C5
 +P0rGzfnvzWqfiNFhehajQMtzIdhICQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-y3nBwv20MhK88Cb48pHwNA-1; Wed, 30 Nov 2022 10:35:28 -0500
X-MC-Unique: y3nBwv20MhK88Cb48pHwNA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020a05640234c400b004631f8923baso10010428edc.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 07:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=MocNat0YaccoZsg8oYh8sYkLdjOAHIeZlRqzulr17Jk0Yjzn7nWQHALNHglZihevph
 VuD6TgMCLq5CtxrtmKrPA5GRkA7jyPw5wX0aKYqDbWk9cpuFW54khpCoyAsW3rjGODkK
 Jm8WnpuSDI1Nulf0wHBSBXHp9Yc+3zAU9PHNMSpnfAikESvciPJpTpvRzO46O4MhUSvr
 VLlQfpURuxLFovh8nyAkNjSg3GwO48m3rkqyquj9deOTJwqJELBJ1u4BmrD4HAsXTkGb
 BchO5uOC9KcGGEdTrDOMdaf3l6A0PUMP4W2U0HWY1fTeCbN2TDNQuZD/+Qejb0XBktP0
 uRzA==
X-Gm-Message-State: ANoB5pndBdLwbudAq7/FFFVojwLA1csbxX00iZe5Y6ck4Vwhq4tLPuK0
 izuH30khrDyq9Pi2KFC6TdxEpLDDVM/9lgPlcYQRMUDOk1ZtMh75P60cNebb7TtstPPQSdx8ZGC
 BZmaGfFDxLG/ix2U=
X-Received: by 2002:aa7:c9d0:0:b0:458:ed79:ed5 with SMTP id
 i16-20020aa7c9d0000000b00458ed790ed5mr40815450edt.374.1669822523896; 
 Wed, 30 Nov 2022 07:35:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6hDGtHXEUX1KH5MOUyQ3B2iU0YKXdpIUoSnfdLSvSt2/CRRCQaxbDgsA2c21IrVL1emjRq8Q==
X-Received: by 2002:aa7:c9d0:0:b0:458:ed79:ed5 with SMTP id
 i16-20020aa7c9d0000000b00458ed790ed5mr40815420edt.374.1669822523606; 
 Wed, 30 Nov 2022 07:35:23 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 km9-20020a1709079a8900b0078b83968ad4sm776860ejc.24.2022.11.30.07.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:35:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-8.0 0/5] cpu: Move target-independent code to common
 code
Date: Wed, 30 Nov 2022 16:35:19 +0100
Message-Id: <20221130153519.46190-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
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


