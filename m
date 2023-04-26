Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C336EFAB3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:11:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkXW-0003qC-PA; Wed, 26 Apr 2023 15:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkXU-0003lK-0A
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkXS-0003JX-9h
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682536249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YlQGHKlnlu6NQDgMPXh9OUX3ovkf+d+PEzep8HDg00OCnXxVwWElEbBJgjPPC9mtpt+ZHd
 ypOoAmgRLOklxMsgf8dclxBhzjdXXdUGv9jysWDJ59eQyvGMkiVrUCThJ2Kae60bt1JG2n
 JBEuplVVBEhDyEFrs0+JC1PcUTUCJ5Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-EKDsQSPHPYm5_Oi7Pw55tw-1; Wed, 26 Apr 2023 15:10:48 -0400
X-MC-Unique: EKDsQSPHPYm5_Oi7Pw55tw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-953759a9d18so715701466b.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682536247; x=1685128247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=aEA5qPZpZh/fAm1pZPrLMu1XMtX/0WKN1Ue2cOEImHXb/1tJ5AQJbKRwXWHXXzTBEZ
 iZIkOVGgPDqNcZSAWFP7gNRzg8OcC6G6LP9d07m3Lso+frEGrsDH9blrUuxiF3MjV5MT
 8jskEgX7PzWgUJPBFlsMVrojrVzjTpEGtM0K7UlBZJ5mQzG2XUXNND69OZVUsPUJmBpI
 O0wjqoGWsYe61kFWsqUHcObW3lIs6xd84k+2n9/nutJiMupSQ7ER0ttbYZn1zz5T2bGZ
 BVnKejIoS4Ms+uA2EpWNHBitHB5BJgy860KhGiog2PRKoPYdO2vcGrwWctFr3iey9LSU
 7G4Q==
X-Gm-Message-State: AAQBX9co43oom+WLYSw0r7SCuc2FiW028NxW5yzl6/mPP+CmAH5R18XN
 bAeTJh0iebTSFGUAxj/pkK+nxWUOAyuSbu/8tkWON4mwhiE7lsshDMNBXgj921KT/UPBeBTNMfn
 5mIkBlf5y/jUJYEs=
X-Received: by 2002:a17:907:2451:b0:94e:f7d8:9b4d with SMTP id
 yw17-20020a170907245100b0094ef7d89b4dmr17662165ejb.12.1682536246914; 
 Wed, 26 Apr 2023 12:10:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bA1Azuhf4j6NiheO5iCMQxugz7P2alziLjmXV+HGZk5Jpj6Dv6vmyiTRoYgcrzqh4lEtNvvw==
X-Received: by 2002:a17:907:2451:b0:94e:f7d8:9b4d with SMTP id
 yw17-20020a170907245100b0094ef7d89b4dmr17662147ejb.12.1682536246556; 
 Wed, 26 Apr 2023 12:10:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a170906169000b0094ec3271be5sm8623547ejd.53.2023.04.26.12.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:10:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: David 'Digit' Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Fix QEMU compilation on Debian 10
Date: Wed, 26 Apr 2023 21:10:44 +0200
Message-Id: <20230426191044.64672-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405125920.2951721-1-digit@google.com>
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


