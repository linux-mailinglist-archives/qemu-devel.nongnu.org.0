Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD04A6EC7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:34:47 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCy6-0003VZ-9P
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFCsU-0002Z6-FK
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFCsP-0008TD-PE
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643797716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=txBz586yMEc/UeL7VfgrrVEPuCoLkUSjRn73MgpTE6Y=;
 b=U8uWZ7B1KerLSeQl9P1xY5QFHvxpNQ50mRpNCtXic/cA7G5qZrf4XMSFa1Oz5Qikc4y2V5
 Rqc+DtrFlxIv6JHoaa+9eLBhrT69dDS4nhryFxxp/OiQENn4phP4K+FHhyY6bwBah5foPb
 i0+ArTTLX5CN6lOr99YCyaoM27JvCJU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-70hXoGKWMMK-6QSJBLCykg-1; Wed, 02 Feb 2022 05:28:35 -0500
X-MC-Unique: 70hXoGKWMMK-6QSJBLCykg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so3592040wmb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 02:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=txBz586yMEc/UeL7VfgrrVEPuCoLkUSjRn73MgpTE6Y=;
 b=ezny461BH2P/xciL3noBdS5D17/efZbJutjilLeB7rGv9F80dWqEy1CcP4OmEvUnbw
 g/5tGvPJ8jz4a89K15byqJr65qMzJZCFnOCzUgCK9jodv1Ae7fRLVMOqDEkGb8SwPb9N
 +9CFbRDRjpgX9NizPvWn5WTwu1E7LSpMazEcuy2YLE9No8nRKV65hurawSCOjUl5L5Bf
 TiAX9wxHdXFzeAG2ccfiJTQljlT4q8p0mlXzdeaQrQr48tflDFoh55J+StGxM8UII88v
 njCCw/wiohLHLb309vRelZe7GjNLNBK+P2ZRG3R1UQl7M8f+1Jw2ViBX9uZVWJ2csrXo
 k+Rg==
X-Gm-Message-State: AOAM531orJetwa07sUVAB2phDKTLLTM/nYG50opel0TCCFRzL8AmDIb1
 8hOauNgYQZ8XFfQTydl0usjJJqXxkSE7ToNUZebqOZ6wFlEpQP3omxD8DfYmd+KrY8fdkwW1uzj
 j1P48H8VqOpPbntf6mUIk5Bl3taKTTclcn91Z4xl2WURQp6hFDVBswFbAkKjQkwRGDw==
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr25069050wrz.659.1643797714597; 
 Wed, 02 Feb 2022 02:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUUyxTv+flWNR2ut4OSQ3b7pnFLNsLIby8rqtK1GL3DMpg+Q+ZxAmHP+m6EkY5jfYKAy54Ng==
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr25069027wrz.659.1643797714223; 
 Wed, 02 Feb 2022 02:28:34 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id l10sm16789040wrz.20.2022.02.02.02.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 02:28:33 -0800 (PST)
Date: Wed, 2 Feb 2022 11:28:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: arm: singlestep bug
Message-ID: <20220202102832.lwiyc5huddau4i6a@gator>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, ricarkol@google.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello TCG developers,

We have new debug test cases in kvm-unit-tests thanks to Ricardo Koller.
The singlestep test cases are failing with TCG. Enabling TCG debug outputs
the error

  TCG hflags mismatch (current:(0x000004a1,0x0000000000004000) rebuilt:(0x000004a3,0x0000000000004000)

I noticed that the test passed on an older QEMU, so I bisected it and
found commit e979972a6a17 ("target/arm: Rely on hflags correct in
cpu_get_tb_cpu_state"), which unfortunately doesn't tell us anything
that the above error message didn't say already (apparently we can't
currently depend on hflags being correct wrt singlestep at this point).

Thanks,
drew


