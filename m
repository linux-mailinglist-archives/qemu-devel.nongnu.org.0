Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6B5118B6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:20:41 +0200 (CEST)
Received: from localhost ([::1]:60324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiX2-0000OP-RT
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiVi-0007IG-IC; Wed, 27 Apr 2022 10:19:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiVh-0006Ji-5f; Wed, 27 Apr 2022 10:19:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dk23so3706211ejb.8;
 Wed, 27 Apr 2022 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OmEsfAlmfVi0ex7Sie/yjfgbuMcWuXTvGjt5/Cr/iZdUbjuHUJB1B8zPaXeuioosSN
 4ImtfZkImlD0VzbXrcfDA6eQ+CEUUbytKJ17aHsszXmFi0u5OEUuPFNY0ODSzRjZNXK2
 DjNY+/4NvL43bpjAVtlV/ipefo1uii0SVWJ0MPfT9lw4sVXxU3JcfASA/4cb4ey75Iev
 qmDB0dVpDr1Wnif+f5C4aEK4/sQypmAcD9e3yeGCbuZJiE2l+QBRSrddPWycNuCLASx4
 sTNlk2Ud6K5uz9lu6cSiBmJmSOfpYgnOEOWWgQQAFHfaMDBLQWY5fOZGcWyR6RPdu5kE
 1YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=wfVzz6O7s8Z9BV/mb+VTfzfEFe9U7h1wh/yuXWonm2+kdJTQrmuAqafxaGO+Yd9MaW
 6tG6nK4GSb6y5lG41Dq7Vb851mL29NgYdhBynoGyIvv255Xdm17Znt5HxAvgi5i9edup
 ra80dkuGZk46qeSXlA8Ow5NZUXOZjkuIKlj3/cH23JlmHoJjrOYshDoIS5PFOW1x6kBQ
 xX0KeWDS7f4ag2Oozkgq65UYaM4x7GjPOtnAyRJC4AcFwUtXakP/EJIJ1xL26hko+N72
 jq8UdBnL976yXY01b++1KGCmrj0eaafaHyQjWUkNffQ+MIIiVZZc+Rrzbd0Jmx/Klu4n
 R4IA==
X-Gm-Message-State: AOAM531XKNUAEr/xuQ+GHBeRmpPO0on6L41WROILnT3gN7SAE7MH5KpP
 qzY/WGGnNAwgGA0amFODch8=
X-Google-Smtp-Source: ABdhPJympO+iLbYBrlwGrJXBschXBmSKe3grIsTwIrHuUl98Iil0H39y9Qx2klJ6ROdwwxQV7Dc3Kw==
X-Received: by 2002:a17:906:7946:b0:6f0:12ee:4418 with SMTP id
 l6-20020a170906794600b006f012ee4418mr26991980ejo.156.1651069153713; 
 Wed, 27 Apr 2022 07:19:13 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b006e4a6dee49dsm6951349ejo.184.2022.04.27.07.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:19:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qemu-options: Limit the -enable-kvm option to the targets
 that support it
Date: Wed, 27 Apr 2022 16:19:10 +0200
Message-Id: <20220427141910.157004-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427134906.348118-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



