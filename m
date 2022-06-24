Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7C55956C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:28:25 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4efw-000580-1v
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eXv-0005Zf-Nj
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eXs-0004Hk-UQ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656058804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Ujyo4dyxYwsdfvmRRTiHA4ODRsFh+Lh3f2SvgaRKwj9RKFl+TwCm/TXd5QDcwVQWiOwXzY
 jB6YbIf/IQDZQKtT1osjkQj+vVAjpujty4m/KOaH+5L3cKFA7tR9Co9FGeP+SsfFafrET3
 DTL9cr04dQyiJnq2itXVnOlOZafuykM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-C34YCVWpOWy9b3UgBVaLDg-1; Fri, 24 Jun 2022 04:20:02 -0400
X-MC-Unique: C34YCVWpOWy9b3UgBVaLDg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w14-20020a056402268e00b0043556edda4dso1396242edd.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=2Tl2EuJh6xEfTxUoQP3khL81nrhXivO9huU9HC0D6b1vy8bjASDjh/64vZl5zeq4fV
 WN1UglHb5EOGQW3p9Md2q7hToIrJgWWrEGTKqCAq7KsQUPBi96LIb7bNIhbYr/1vpMDa
 j5pdM19tVo0V6XV8FzyqCGMtG5rJ889g31aaLPPXQkGuJPiQNStBSt3CDkeV/Yy8qWcs
 jJuhkWITpeifvMB4DgMIQtkmMnGdLXfVr+nJStUSJEaQhRxnCRzb9gvr+4Z1C4TTbIrd
 oxzQR0CKeri/iJuyxNRlWTYWcKBuGvY1VfTP1mdDed06z4WdJS530bO2MPhiBWj1S6ZE
 CKAw==
X-Gm-Message-State: AJIora+bh9cQtgCwmSqc4xuAUH2vJmN5dWlhmvCs4r9Ep6b5prMu0vZF
 1AhcESyCKtaLKL6INnfwiJ2nxiFUB7pRpNVZQnyO+dPMMmLLNch7WNTHL5A9sMKJtSGlXYNNo7B
 Qt6keU+YsalksWMg=
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id
 f6-20020a170906738600b0071570243df7mr11959459ejl.543.1656058799341; 
 Fri, 24 Jun 2022 01:19:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+WRla4G3etl479U82MYkniMD7JPqeRRHuY04jV3stT/CSYd/bS+7jnNffsyn+WeluT75zjQ==
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id
 f6-20020a170906738600b0071570243df7mr11959309ejl.543.1656058797342; 
 Fri, 24 Jun 2022 01:19:57 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 j15-20020aa7ca4f000000b0043559d9e8b9sm1386990edt.53.2022.06.24.01.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:19:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, linmq006@gmail.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 kraxel@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH] meson.build: Require a recent version of libpng
Date: Fri, 24 Jun 2022 10:19:52 +0200
Message-Id: <20220624081952.245740-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623174941.531196-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



