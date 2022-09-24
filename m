Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A65E8D28
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:41:55 +0200 (CEST)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc5Pm-0004Pg-K8
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oc5NJ-0002AC-CY
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oc5NG-0003Px-4R
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664026754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Hg9ceNHPMf4pPw8510EWjxndUNdlBUU3CIpKMAcFtpe1BIOnVAK88j/ObusVr0dJ6DZdcO
 ytDGGr3fixCOX6Wp0uc+R74rM7IDleEKiRHNv6wCjSq+wntE5HCf7Ib/GXnuoWuzra5zOq
 /qrw4+PrjXzMNjZvbk9qWrq5yykGSyU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-Ggv4EMlLOIiZg5RCOedW5w-1; Sat, 24 Sep 2022 09:39:09 -0400
X-MC-Unique: Ggv4EMlLOIiZg5RCOedW5w-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so1916645edd.12
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 06:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GPEQXQWqG8+lEIrLKSxmU1odA2V2rVsK1QBlYGMk4KQlS7GWLddkz0hb237vscnHXz
 fIZetKPPzRo4Xr/rQkEPldIu6wVQnzQHtCJjlTf6wOoUmiZoED8/ugBk4j165IeNCInZ
 eRvExBd1UtySIPdB71o78op5mMc9xwMuU73ehWc/MaedXcmQrblfMvXTT7X0ARtgmxt1
 bEO3vPkMsMHVqSHTEgqbsx56wvLmor8ovXurHPHjMb3rb/p9ZNgSNp7ddfmsgSDxOxWc
 R1UvZ7qZ+QQ6+piPaKflOUfcWW+kS8QfrOXOtRW3j9dpKYSv5AnyyhjW7sg2Xggt/tkE
 LLwA==
X-Gm-Message-State: ACrzQf13TBmUq7DOeccqeQSzTJ0oSlQbBu/7T6TNwRD6oSXttdvmBmFT
 ryP92fTD44JfBUYNrqhPNUkFege+txnTTUTqwGzDcn2OFARG3pbL1aK1w43iAueyAYnokN2QHzI
 TFkW8MVeEVwquxqI=
X-Received: by 2002:a17:907:3f28:b0:781:e093:d0db with SMTP id
 hq40-20020a1709073f2800b00781e093d0dbmr11045263ejc.295.1664026748848; 
 Sat, 24 Sep 2022 06:39:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6afPuGX4erJnVQebSMS8jtI9LpYS/pFWCCedK9lgp3SCaLxnQXIFiwJ/ruZer9MxfatSQRdA==
X-Received: by 2002:a17:907:3f28:b0:781:e093:d0db with SMTP id
 hq40-20020a1709073f2800b00781e093d0dbmr11045255ejc.295.1664026748642; 
 Sat, 24 Sep 2022 06:39:08 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 a11-20020aa7d74b000000b00456e4ba149esm2016217eds.23.2022.09.24.06.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 06:39:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Ray Zhang <zhanglei002@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] target/i386/kvm: fix kvmclock_current_nsec: Assertion
 `time.tsc_timestamp <= migration_tsc' failed
Date: Sat, 24 Sep 2022 15:39:05 +0200
Message-Id: <20220924133905.54088-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922100523.2362205-1-zhanglei002@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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


