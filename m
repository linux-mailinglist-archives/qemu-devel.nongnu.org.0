Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50CC583E20
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 13:56:18 +0200 (CEST)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH27l-0006gN-GP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 07:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH231-0003MD-SM
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH22z-0007a8-6g
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=P3BhwKGbrIMWCjKKr0cQztkoZ1y0w9ppRddpygPYtg6fN8bb7L/IggU8Itdsb4l83dJ1rz
 9YURBtqL77pAcSbVN7c+FgBmPW0kRn6+hs48ghs1pJIyC1d3xKUq6m9IXr8DAKQYZnE/7f
 6TJ4V/KHmKA+X2XDbZR59QzzxOInaao=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-7O9xijTQMASm8pD0G-wHsQ-1; Thu, 28 Jul 2022 07:51:18 -0400
X-MC-Unique: 7O9xijTQMASm8pD0G-wHsQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc23-20020a1709071c1700b0072b94109144so536044ejc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 04:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NTvC9b4i09MuZslJ6uTrJbjrbMkPaCuVwr8zcvFmoqop2eU2Ukypqn8fOgFpJcHZhI
 XVK+jrFKtR4jQMR2SPHCE/W0/qAGx4gedfXcOgtKun0vFdGpdhf3aO6earI7Xas27i3k
 STifrVSDHlZTj7CjKDkXk5dBUFVE9KInFl1leTGN1yPY/nFKeJglccyw8DhKyX8VdqAZ
 jWdQy6nVH9TNA6jmUN2U5Pys5ZTEjKyc/2lZMnTjj6ErFJFkCKcKGrcXIQZg7lTSucgW
 hLMYlqbhkm+QIAiLwFYuqvc+/4nxphPJRKG6QpsCsIuoHlso9kUQcy2ylczVq7hJ/sc8
 MV4g==
X-Gm-Message-State: AJIora/UqgToUXd45HMKnTa+WryVeiA1Z2dCxAmsKUY6OcvSAHMlZHv2
 Q/MuSUdW/ThCSdhVMUsa5C5lGZtWEgw7KiUVc2zbLUIL1sDqvWvLmaFfKS0ax1JJK/k4FLSy5r7
 q83v0lSWOnpBKBtM=
X-Received: by 2002:a17:907:6d01:b0:72f:53f:7a25 with SMTP id
 sa1-20020a1709076d0100b0072f053f7a25mr20500743ejc.126.1659009077427; 
 Thu, 28 Jul 2022 04:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzpM+ZgOSeGJsm9sFU3sT8DHuWRNQEw2g2tVskrwVY6evarKL3j4AXhb37U0xrpo+P+go+bA==
X-Received: by 2002:a17:907:6d01:b0:72f:53f:7a25 with SMTP id
 sa1-20020a1709076d0100b0072f053f7a25mr20500724ejc.126.1659009077042; 
 Thu, 28 Jul 2022 04:51:17 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056402160500b0043cd06bef33sm529500edv.97.2022.07.28.04.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:51:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] stubs: update replay-tools to match replay.h types
Date: Thu, 28 Jul 2022 13:51:15 +0200
Message-Id: <20220728115115.251077-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704075832.31537-1-cfontana@suse.de>
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



