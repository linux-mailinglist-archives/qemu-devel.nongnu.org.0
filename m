Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F57538EE8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:30:13 +0200 (CEST)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvz8c-0003F8-1Q
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvyqP-0002Dk-AQ
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvyqM-00088w-9S
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653991876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=UklHcXAxbJHA5rikI7sjFK4jRYFXXjtRAtk68iBhKIU5gP4OP26lwHxYkhR7wBh4IVo37E
 iyNVxgSOn8Cdx3i2FNSMODamPajK9AJx4ixHbAJwepIntNdD68kPDDuXqwZK+zywmvgMV7
 W5AkCRUnzsRFFdEyTSxUJra4PY+ao8o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-T1VsIaqDOAW_VuyYZ4mGtA-1; Tue, 31 May 2022 06:11:15 -0400
X-MC-Unique: T1VsIaqDOAW_VuyYZ4mGtA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o32-20020a05600c512000b0039c1c56e757so215110wms.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 03:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=XsfM7ijeRskHTUi9HmRvtU+r86Yy9C/TXkQUm4TKJRnjhyWnvrPBnQSi3dMCf93V/c
 XaGKwjM42TudtrJ8347IxgCkzQLCVRQCy8LF+wHMoXN4iSQwBOqdkiRqJg9dx1UL/SF7
 wfqXpAg5CqkIXrrs7NuQT49uAvF5J+KAu1jl4BYF6NBQg2kDJ+BuV0lo40K2N27ZA3GO
 IeUH+CeS6Y4lLsRL7imw1ESjFvGJd+3DCHerV9KjoMa+1Opoik7i1z48mroAiujWeJya
 F/v/wicWqMkoozTk1CA9ZUriIKuSzEXmhLVAVT1q2dsDM7IOIqM7Y17jULiO2XvLWu3R
 Ywjw==
X-Gm-Message-State: AOAM530zGVM5R9ZJALzwsYHRkENM8USi7HgmjdjrbtInxe83L2Ayotc8
 ykfYxCizaPOD7CVyj4ZRKyU/rjP67hkLBWA2LSuGvQyVyTK1vfjnGvv2Aiz3dD3cH/WVjSFk5Oj
 dzC8wLTb9ecBN6SA=
X-Received: by 2002:a5d:5283:0:b0:210:a6b:a9fb with SMTP id
 c3-20020a5d5283000000b002100a6ba9fbmr21259635wrv.13.1653991874020; 
 Tue, 31 May 2022 03:11:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsfOgfsw/X3BkjXZh5ik+eCxKAoAmqF4MTziT73gJVmkIemWYcq3MYz0oyDJ/H3sIf6HhLsg==
X-Received: by 2002:a5d:5283:0:b0:210:a6b:a9fb with SMTP id
 c3-20020a5d5283000000b002100a6ba9fbmr21259614wrv.13.1653991873690; 
 Tue, 31 May 2022 03:11:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 x24-20020a7bc218000000b0039787538c9csm1666797wmi.20.2022.05.31.03.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:11:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 "Jose R . Ziviani" <jziviani@suse.de>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RESEND PATCH 0/2] modules: Improve modinfo.c support
Date: Tue, 31 May 2022 12:11:10 +0200
Message-Id: <20220531101110.817249-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <165368982364.5857.13012746434823168062.stgit@work>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



