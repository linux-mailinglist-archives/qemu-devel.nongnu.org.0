Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAA559548
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:24:25 +0200 (CEST)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ec4-0008Uh-3o
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eXz-0005aK-LW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eXx-0004Hu-N5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656058805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Vz4btHgTpp93p/y8heRPfidoi9AFQFCt1A/LORw73YsmFIvmhdUZVVGJ2unbsz70LjnMNr
 k3gsW0DOklcBUzP+o099mN/Cg/hS92xZ1rPU7EA2evt+/zEY2SDLv1rGrGeFJEi5QNfiIf
 EGuxptJjNYYSfFpfLtU+RvLsYv7V9oE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-F7W_jFKiPbeEhqxcs379aw-1; Fri, 24 Jun 2022 04:19:56 -0400
X-MC-Unique: F7W_jFKiPbeEhqxcs379aw-1
Received: by mail-ed1-f71.google.com with SMTP id
 x8-20020a056402414800b0042d8498f50aso1327252eda.23
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=PZo8BXoLQEq8DX696SmsG4fHdHiPLAZkqhHbc5Aoe3w8NzjfKbj+z1K7OeRN9xNZb9
 PRdwfzDQXH6bVzrM1ksXOTTzlNbEAgQb+mW8YVzVW7oPoWr0ZIBdVn2wGtFD3huDXMnB
 Oh653gn7uXqv/NZyMPRJIDgXNghoV2Q1ZwNw6xD3zEOLP/IeZb3Qnl+lP0Ygn0m/jn2/
 43YpJnvqSNN5U7520wnkHBMJBOpqsQ3l1hat78eapnrYJn2BWCw4a61l11nT3JG6jnph
 stjJdTC1VDxYxMdcaE+VO5Suyae6Uiox51H2gsn+s6jl9oSLX+BIvc+v0rsHkcNIf2jg
 5wAA==
X-Gm-Message-State: AJIora/U2GVODE/BoYFVmZcTDsHiv25uzS1t6PxagDfdRZJfo1zrchRr
 1TA1kD0nJ55/AZsfyZmwUrMGcvEu5cUu9cfk+FpkYOTlUC5lNpULgwUS3EUZ3KY+0UgsJHegUVt
 POGCzEvWAtflK358=
X-Received: by 2002:a17:907:7e91:b0:721:9b87:7095 with SMTP id
 qb17-20020a1709077e9100b007219b877095mr12305418ejc.564.1656058795440; 
 Fri, 24 Jun 2022 01:19:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7+ONMYMtJ3UDi855MyEC8s7LSo/yVsYDkpyEPZmOJ91a8V5amEgrcOsA5l+NGfqWLWF1hvw==
X-Received: by 2002:a17:907:7e91:b0:721:9b87:7095 with SMTP id
 qb17-20020a1709077e9100b007219b877095mr12305409ejc.564.1656058795236; 
 Fri, 24 Jun 2022 01:19:55 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 kj20-20020a170907765400b00722dac96232sm695084ejc.126.2022.06.24.01.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:19:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: kvm@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH] accel: kvm: Fix memory leak in find_stats_descriptors
Date: Fri, 24 Jun 2022 10:19:51 +0200
Message-Id: <20220624081952.245740-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624063159.57411-1-linmq006@gmail.com>
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


