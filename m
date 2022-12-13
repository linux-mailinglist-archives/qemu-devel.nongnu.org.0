Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF564BE01
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 21:39:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5C2A-0006SQ-Ay; Tue, 13 Dec 2022 15:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5C27-0006Rw-Im
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 15:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5C25-00076p-Dq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 15:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670963862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILcb08j17IBBfRXdn6iqNatgyx65Fp8i2FDTfmKShb0=;
 b=Y3QlrHSyqUaReOYzwzDz9A/IJHJETEnJP5xgc8XOdP7aTDr88hIpLhpbtrwqw3OjGngGyJ
 uH1jq4/o7JacRfQc7ftFdXFtUEYeWa6J+wcro8Naaqqti8hVTPusK2gvE5iSjxknmzN/ZV
 3ydE/i8spFebAnnivVV+BqiC7HVk4t0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-1gZqfVKNO9C4k2WWlUtR1Q-1; Tue, 13 Dec 2022 15:37:40 -0500
X-MC-Unique: 1gZqfVKNO9C4k2WWlUtR1Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso15555190qvr.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 12:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILcb08j17IBBfRXdn6iqNatgyx65Fp8i2FDTfmKShb0=;
 b=6rSiUKDGYkaf3sTKJCGnQE+0+ajtFdWR2U35Hk6evCwOr71FLbwYWT3kF5VmZyOrn1
 Zc4QfDhYX49EHajOQ93M59IyEHRJiaJe0xE7pSXCcSm+nGtUF8HCi7XKitnvceBUn9Ft
 BNikN7PXxuRptLhT9BZuee9cxp0n7WzEMaacV6rZVdhur1RyPwOzplHtQ+VO5Ge40Kwv
 WbLq0YcXyruMxd/Wm8kA0uVGNfqghy56F+Vk+xjbzor2jma7SJ7xE/FjAClCJg40WmBm
 NywgqP4zAiyp2jtQqIMs58cBkiYN26U5Tn5SpV7RuWl6ywaUU5MVpTJ+9i3YJnp7u/Ci
 fjBA==
X-Gm-Message-State: ANoB5ploZXsQZ1Gsd3GeIc/p8jKCiS1Eydond5nxKaeY3LGbM2njktff
 HefwVkTcuc2o9CU2Op09AKw9aRdnCYTp7wm0zTE8Mo+Z0Sod78hYDQ1X9nezNT0RFzCeN1sJ023
 TcthNtFmm+K6+DfI=
X-Received: by 2002:ad4:4f27:0:b0:4c7:5b:75ba with SMTP id
 fc7-20020ad44f27000000b004c7005b75bamr32104259qvb.31.1670963860065; 
 Tue, 13 Dec 2022 12:37:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44ukQXx1DpDfZdAPUxpurrIWUqQUGTzypZ+IQh7f2UpQ5Qf5Nr2LczpuA+2lD5lzGfTPsegA==
X-Received: by 2002:ad4:4f27:0:b0:4c7:5b:75ba with SMTP id
 fc7-20020ad44f27000000b004c7005b75bamr32104236qvb.31.1670963859870; 
 Tue, 13 Dec 2022 12:37:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05620a24d100b006fa12a74c53sm8606808qkn.61.2022.12.13.12.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 12:37:39 -0800 (PST)
Date: Tue, 13 Dec 2022 15:37:38 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y5jiko1n+EIANbEN@x1n>
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
 <20221123172735.25181-2-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123172735.25181-2-manish.mishra@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Nov 23, 2022 at 05:27:34PM +0000, manish.mishra wrote:
> MSG_PEEK reads from the peek of channel, The data is treated as
> unread and the next read shall still return this data. This
> support is currently added only for socket class. Extra parameter
> 'flags' is added to io_readv calls to pass extra read flags like
> MSG_PEEK.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

This patch may need below squashed in or it breaks rdma builds:

===8<===
diff --git a/migration/rdma.c b/migration/rdma.c
index 94a55dd95b..d8b4632094 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2854,6 +2854,7 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
===8<===

-- 
Peter Xu


