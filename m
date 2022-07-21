Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE457C821
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:52:01 +0200 (CEST)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESqe-0006tC-3r
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oESkQ-0002tJ-5B
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oESkJ-0001eH-DK
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658396726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EjiGxNuoXwZMsnE5o87wdusAuMpudF+NUXSQspa+AK2sOkvjyDyy5BGvEUgZo30ICdgoLg
 /Szni2GmUpeeznsq1Ur3e/KjsXvk8hiOWJU7cEhkqJf2LSIZFhA4fRSq7NpuU4XqfesjJy
 a2s5g4cepAJDu7FDS1Mj5HJ96U+JJyU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-ARBUxqhpMBusk2VVkRW7Aw-1; Thu, 21 Jul 2022 05:45:24 -0400
X-MC-Unique: ARBUxqhpMBusk2VVkRW7Aw-1
Received: by mail-ed1-f71.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so794839edc.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 02:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=lmz/YIGPc/r//A2668KIGGh5e2tLSwQH5OQsEN30g7hT7eERwhuYwIKBJbdYveM4nI
 acVUH6ZNJslNut8nAz0lsk1lZxXNIVtiijHwnRO/2jzPUqLxkgbUaAZKvniQTtpXE8dS
 8AByVZboFbDhETWJIafXHfzHAt02idLXcyU6OccgGTntmZNP8ogo+0axYgh+/c3+zgqu
 EeDO3o+C1OeWySMhD3x4AQSRJs1qOs8CVgF/0vprWv2KJ8Q5gEEyEoHXppBVNjbH5qyl
 zuZv1J9Is2MUM/YHou1gDpHLY9/x4HyVz5BUvHHbcd6lc6i6agAd39YuRoVHvlea9/S7
 Gmdg==
X-Gm-Message-State: AJIora/vSIVNzamA35JSyCnZD/o4seuEJIhz2XVhb2ocHNbIbG9bnbhA
 AQL+Cjs/XrErr/k9iy4ZcM32MUWqXgvs01BohACbOENXO1jVnaMa97dBXqVc5N+shWD+89cxCYJ
 WcyKnCv5yBAPXtK8=
X-Received: by 2002:a17:907:1b12:b0:72f:9b44:f9e with SMTP id
 mp18-20020a1709071b1200b0072f9b440f9emr1403143ejc.653.1658396723722; 
 Thu, 21 Jul 2022 02:45:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0TDuKKVWLbbyaObGXf1xoVNra0yfMHlw+ttuf/nO4KvALuDwsEsnsyub9pFf/rxFkdwAzxQ==
X-Received: by 2002:a17:907:1b12:b0:72f:9b44:f9e with SMTP id
 mp18-20020a1709071b1200b0072f9b440f9emr1403127ejc.653.1658396723481; 
 Thu, 21 Jul 2022 02:45:23 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170906151500b007030c97ae62sm620381ejd.191.2022.07.21.02.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 02:45:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] oss-fuzz: ensure base_copy is a generic-fuzzer
Date: Thu, 21 Jul 2022 11:45:18 +0200
Message-Id: <20220721094518.695595-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720180946.2264253-1-alxndr@bu.edu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



