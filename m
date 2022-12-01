Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A763EBA1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fIw-0001WO-U4; Thu, 01 Dec 2022 03:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fIb-0001T2-Oh
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fIZ-0001yp-Qs
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=BIdMOWBo2gnB1gbHtu6vJruadN7VdMNXSYppleBi3AG/LtTQaP7Kz4jHDVET3FBVjQdyTn
 QpWnzmK0VONM4CV4q4W0thApDKlAHAReDn2V487UInH+TQ51jOkNNfgZoHed5h0R35eSXQ
 DrnbDThAqnAnpyhtrTysoqaTHB1jNjo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-PXNXsfJIM-eCHamqjnIVyw-1; Thu, 01 Dec 2022 03:51:58 -0500
X-MC-Unique: PXNXsfJIM-eCHamqjnIVyw-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb1-20020a1709071c8100b007ae4083d6f5so899540ejc.15
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=wFk43lAhkgZsrDDQ9Bhyq8/Z6CrbaKMaD1xlaoRb4WNcbCzlZz7fFQxrrMhlzlN/Wb
 4SOV7LsdFqiwKvLzFZXGK42QVlWqnnJDO+tM/hbHfFCZ5SGHxpqrOyawCN7useIVkm8i
 iBRwWYA9pFKRXhC33fRxCk9GT2kg0Msb88JFK4AcFiy2Bl6W2VgIRSfvzEH+7whbP00w
 ggi6gs4MK5FDivHzHDnSSoIKR8/2KHsFTudc3J3pqE+b8cdjiNmzzy58bu6sG+LF90QW
 U/I/x/brKbfPVWngLaJ7etzXbLuJtnIDM/wkObjfa/rI3KKwx3qA1Mutb2JLKxPVBBYb
 wQzw==
X-Gm-Message-State: ANoB5pl+WRYGUTbgtEGrHJvlSmRReQlCIQomO4AzUstgKZqZeDbGYSSW
 sIybaTBmB7bCAYKnIqBG01bZzD0RAQbS414KBsRrc8CHheNbeYswe+0UcX21Th5zo8fANFC77PZ
 GIEPqqEwgaQvoe0A=
X-Received: by 2002:a17:906:a1cb:b0:781:fcf6:e73a with SMTP id
 bx11-20020a170906a1cb00b00781fcf6e73amr53926571ejb.352.1669884717618; 
 Thu, 01 Dec 2022 00:51:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7sXs5t3aQyRTPJjznJnd6wHHMzj6RfLUse8myoDaQsFgf7of6rFMf0FBwFYglpAPoRmpBjzw==
X-Received: by 2002:a17:906:a1cb:b0:781:fcf6:e73a with SMTP id
 bx11-20020a170906a1cb00b00781fcf6e73amr53926561ejb.352.1669884717409; 
 Thu, 01 Dec 2022 00:51:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906118b00b007be696512ecsm1491804eja.187.2022.12.01.00.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:51:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Hoffman <dhoff749@gmail.com>
Subject: Re: [PATCH for-7.2] target/i386: Always completely initialize
 TranslateFault
Date: Thu,  1 Dec 2022 09:51:53 +0100
Message-Id: <20221201085153.146317-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201074522.178498-1-richard.henderson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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


