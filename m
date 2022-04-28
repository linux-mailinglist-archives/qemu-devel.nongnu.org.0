Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B59512BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 08:37:15 +0200 (CEST)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njxm2-0001lX-B5
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 02:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njxhr-0000zF-CM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:32:53 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njxhp-00027I-G9
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:32:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id y3so7483967ejo.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEfOxEwynnpbvTQfAMD2qMN/loYrFQPxjZikploAvlE=;
 b=YT42DV1Hj48KKvkZuvakzaCF9SJNkro7wtT1RUYH+72f+0m3Jx1eNa56MKtQW/bUX1
 tkUpjFFSXtNFl29ygw8qMaIS+pACN8YL72FFwBRn/NAlPPXxrVqx/2Ep9r5hcsI6KR3P
 8PVZrcdvYziMZNw/EeDUzxDht1w+BAR0khnzuH2KhtWaUbGVw5ATzPI8HxkCMnEsrrdw
 n2fp1fFJK7qEZWT/F8sit+lxwUuHuOuwJy4aEE6XR1IG8SI/uZqZpcvitytONxFxdAnn
 pdB4bBLdigzr7k1hZQppsgmNC/F/1LQjUMJK32yh3A+2XK8jqas5xCoo1YIE5h82ExsR
 kOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LEfOxEwynnpbvTQfAMD2qMN/loYrFQPxjZikploAvlE=;
 b=DL5jbHOJJ/JdAKvL1sqx426kyDmPSnbSaZBIyEzTH7XOdFgS9wzIrKNmoFTAi9v2mv
 U9tB36diVNW27a7nmWDhuotPe1rjOoKT5+rGAMbxwuHujN1PhFYAIMJ87YnMWifG/UTZ
 pD2XWe34uOFXyNVpV/J0Ppmya3CQP+4fUe/Ng7CaHYenkDJYK4bcKcVR1ESeg4NxR6Hm
 Z3HZbw1tHD0vVr+3pz25xIEAQDgzwyMd4vX2nAjIcMbJqIkVQWxY0cmxKQRceyoHj27R
 LpOgGHYgCwWAaS2OeXNwpp+OVwhxK0/CiMgQ5C/U3YK95er2yBcL7eJpx530HIhlKkRz
 43XA==
X-Gm-Message-State: AOAM530sOyZrSlpp3GB1avT51Cr7aNiUDuJD0JZHX1mmTtnLHVn7Ay6s
 FOVnjDLMN0R5yszkD4WEmI8=
X-Google-Smtp-Source: ABdhPJwLetsepTAc5T/avjU4EYyo9MDgAKcrr+zlJp/acNgoYr1aDr6tk3yHplWH+lzwr4uPnCPuhw==
X-Received: by 2002:a17:907:7ea9:b0:6f3:de9c:c6fb with SMTP id
 qb41-20020a1709077ea900b006f3de9cc6fbmr1692819ejc.304.1651127567075; 
 Wed, 27 Apr 2022 23:32:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906c18c00b006f3b99d29e0sm3506750ejz.223.2022.04.27.23.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:32:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: [PATCH v2] WHPX: support for xcr0
Date: Thu, 28 Apr 2022 08:31:45 +0200
Message-Id: <20220428063144.187619-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <MW2PR2101MB1116F07C07A26FD7A7ED8DCFC0780@MW2PR2101MB1116.namprd21.prod.outlook.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: qemu-devel@nongnu.org, ivan@sysprogs.com,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.  (It only took 30 months; thanks to Ivan Shcherbakov
for bringing it to my attention).

Paolo



