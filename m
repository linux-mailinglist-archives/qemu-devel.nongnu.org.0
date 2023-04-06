Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36516D9E3F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 19:13:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkT9o-0000gK-0R; Thu, 06 Apr 2023 13:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkT9m-0000g3-Ay
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 13:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkT9e-00043P-B7
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 13:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680801128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FjHgXSwuhbl4kPEUeD3J/3U57BmhmnHPucLXovhj0rpDzLxPfm2fWCDsmEvIRlAi6VSeLF
 IsHoc5gPQYD0IBIOAYK/oSgQFB9WQj5Z8H5w/YEbsfkao1CMG8+RxKML6wTWwEhOj4UsDR
 gFn5H/T9QYSBrkHhE8+H6T3ph5qirks=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-GKi4SIZPNy-_JQl2GRoPGw-1; Thu, 06 Apr 2023 13:12:07 -0400
X-MC-Unique: GKi4SIZPNy-_JQl2GRoPGw-1
Received: by mail-ed1-f69.google.com with SMTP id
 k14-20020a508ace000000b005024a8cef5cso42370194edk.22
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 10:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680801126; x=1683393126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=WQj/6q8toqoPIos+fogMR2OpGR6hOhg2J+zPIjgAEow5PSO2VJp+Cs0llia9pG3U4p
 +kYNcM2/ZuM4odS2TYl51luA8b9yPqJ1St6eNANCLrfHHcbAvN7szQtpG0e2kuLoUDiQ
 hkmSjqV8UyC8+K5iUNEjd5W+EcAG7A7F9Pw/vwrdwWUIwyiGhXzxyOQIRzZZUx+PlIvn
 LZOxbm1/Jp7nLXZVhKFmC8uyovENpYGwSnj0aqW0OJIf/mZpU7J1t8j8GpL3N5giBt0l
 5S1nNLg+pdLtt9WsOhqf0Mhuyxx5LS51ulV3vxHfix9xdNqzunHUW+WYamXTbEfhuH45
 mn2w==
X-Gm-Message-State: AAQBX9c9Dbcxgilv6HvVuDOZOVQk+vee/Zq31h3JwzDp5jFq0T1und7I
 oqbrXuPoFWCBO1BFWgYKXfFBIeowMl4s2V6JPJsOZLPrFnr2Qat2LALemMZ7rI8Qx4Kz/X7LQw7
 cGTMWT8AHi0pKWCw=
X-Received: by 2002:a17:906:5f94:b0:878:72f7:bd99 with SMTP id
 a20-20020a1709065f9400b0087872f7bd99mr7624323eju.6.1680801126186; 
 Thu, 06 Apr 2023 10:12:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zr9n676BD6HKQwojrQmULhwRE5UX4BvvmMJvvZ6FPD7XfU9TJbgf3k847fKp/7F/yfwRhU9g==
X-Received: by 2002:a17:906:5f94:b0:878:72f7:bd99 with SMTP id
 a20-20020a1709065f9400b0087872f7bd99mr7624309eju.6.1680801125907; 
 Thu, 06 Apr 2023 10:12:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709064ac100b008e09deb6610sm1024383ejt.200.2023.04.06.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 10:12:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] target/i386: Avoid unreachable variable declaration in
 mmu_translate()
Date: Thu,  6 Apr 2023 19:12:03 +0200
Message-Id: <20230406171203.276554-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406155946.3362077-1-peter.maydell@linaro.org>
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


