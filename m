Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EDA6AFBF9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiND-0000zT-P5; Tue, 07 Mar 2023 20:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN5-0000nq-Rj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN3-0001tV-M5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6GlQWF7RM0/vFabPNXHud7W0nOaWqrKzuNGguVzygmA=;
 b=aeo0l8UKlD+o7UoFyExpdeCSsiMZJg+e5wpedO0twlCLG1MB/3GWIJh7c+UV8s8cDkZlcF
 JuhnHBDyYeLyBzNSc3GwpnHsJe7+IDU6sabWdpTGGMUtCpoqEZ4SccsHsw9jAk05kqa2Ga
 pizZTrZY5j/XPvXLXqXFFIV0+lofSzY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-i1AzUJTtPDKUiESE56mRxA-1; Tue, 07 Mar 2023 20:13:30 -0500
X-MC-Unique: i1AzUJTtPDKUiESE56mRxA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so21168692edx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GlQWF7RM0/vFabPNXHud7W0nOaWqrKzuNGguVzygmA=;
 b=WMf6DSRJdIbMJspH/kf1RPpVuKEjBTnLZsL+wKAw7nnodP6lTjOgBw3DrOMrKs6mDN
 4CVxnsyFLo3szUlYgq8KDf/idNSZLdqvEwc/KyUzIbKb0zmRNgQZCc9YLZHgKVC6AlRe
 ucrDYP5Jh5kMgLnCwB6/yy2pqpj/eQ6vTwOIkSffchZaaKip4CNhJ2B4SYPwpL+Ol0LH
 5l+T3jp1GXfLer99J5Kq1CWKbbdzVJLMGtP8S851FI2A0Tfk47CAs954VqMlTHQKasVP
 32SYxa3ndNWRUuYUhBOYMv8PAF3fOh2xD00uLAo7tjwAekdHBb1lL1LjOnNrapNVZ915
 nlmA==
X-Gm-Message-State: AO0yUKWYPc3vLhGbKtld9zjNupgQFdZ71Ux9Ferrqwij1H8YJlmCJUaq
 mX5hFEQUmE25A3vQqQelfpzmSo5QyectPMTOkcvxzE0jevWdt190qVjQ/UUmPpkCz+Iw2+/TLDd
 qbjjYn2rflhNg9vA+zCGvY/Y9tuw5Nf4bed/eZkuiyWFBuayiN92QS2rqtG8jN4WrbHco
X-Received: by 2002:a17:906:a0d8:b0:8f3:dc49:d8eb with SMTP id
 bh24-20020a170906a0d800b008f3dc49d8ebmr14881305ejb.71.1678238008781; 
 Tue, 07 Mar 2023 17:13:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+sTd7AfHn2MSJjl7vvaKXowcloy6adoBCW8+KSxZOxprS0feTy+WegvgjpHmvUXNFdeBM9xQ==
X-Received: by 2002:a17:906:a0d8:b0:8f3:dc49:d8eb with SMTP id
 bh24-20020a170906a0d800b008f3dc49d8ebmr14881294ejb.71.1678238008586; 
 Tue, 07 Mar 2023 17:13:28 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 j22-20020a1709066dd600b008e6bd130b14sm6829931ejt.64.2023.03.07.17.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:28 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 52/73] tests: acpi: whitelist DSDT before adding non-0
 function device with acpi-index to testcases
Message-ID: <a0cc02e7b6b42a64dbb4ad7285bf4568e0a1b8b8.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-27-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..ad2b429de8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.noacpihp",
-- 
MST


