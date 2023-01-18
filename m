Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657FD6718EE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:27:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5dg-0006jv-S8; Wed, 18 Jan 2023 05:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pI5da-0006jZ-IL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pI5dZ-0001s1-0O
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674037543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omIK8XJQADORQJcAaboJpV7HB9CSsWDiuBcYdkC8OXY=;
 b=FC310d+7JTlni7iAQa/dmXo/SU/dzrp8vuVuIh4j2BYOlKqVUWoTwhwJTnXi3UKH+9VxBw
 h7xBczcxQTIjZ9kZlLbK+0yuzM9NRSrelEMcVDUQIzTHy/Dvc+wewgPaUUDWxGh3CgjgSd
 hKxMDYyO3x5Qx7VbZU1KslPKXQs5HSU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271--trAvc4rO_OrfR-p1Ue0DQ-1; Wed, 18 Jan 2023 05:25:42 -0500
X-MC-Unique: -trAvc4rO_OrfR-p1Ue0DQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z22-20020a05600c0a1600b003db00dc4b69so987024wmp.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omIK8XJQADORQJcAaboJpV7HB9CSsWDiuBcYdkC8OXY=;
 b=jdwc76Hs/vldI8j6r7KQWpIdFxIX7ruqFnwJ1lCKD7iFNXkTR5s5mu4mWEPZScrLC2
 TByUB1aPv6LbKjORCqzy6NdsTJMHfbYPjHKJcnWL5mSK2oJJGJ/uzkunvZnMGsRkGJsY
 0eSNCDXpKO/CgHFrHxijxelHlqxIQJckRfo9CZo4RwSiUjQoE7LBuYW0LjznxEJ9jYaM
 Mwk92k+derYdw05idf3Wpaz2Xsjc3VnE4iErOKTHSPkQsafRiMFNUs3f/VNC+7C3ICqQ
 QLEVPArM4I25rAHzUc/cCjdZfFXLRFueyDSzqxNXzRr6872OQVjKe5xVKYB/tTj7PDQM
 b6sw==
X-Gm-Message-State: AFqh2krvmpcHYr0uG975glaw71MxVMmzkgVSa2AW1nXGv7iNXJETdSGx
 LqfQviswwUIGVjiwyK9YrhGzZxDDbX33NWQQFN0ZgIvZ5Nm3cA7xM1QGk7mBTK+4cwGQPBAMsUC
 +ODbiFQeRViV7/No=
X-Received: by 2002:adf:f144:0:b0:2bd:e51b:81be with SMTP id
 y4-20020adff144000000b002bde51b81bemr5296404wro.12.1674037541405; 
 Wed, 18 Jan 2023 02:25:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJDdSmKt2Wu/bi+Fs7nx6X8P3sxveDTcKMfqnKi+PsOo2uAr43hjZ9UShKXHlilqK8o9IW+Q==
X-Received: by 2002:adf:f144:0:b0:2bd:e51b:81be with SMTP id
 y4-20020adff144000000b002bde51b81bemr5296389wro.12.1674037541186; 
 Wed, 18 Jan 2023 02:25:41 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d6747000000b002b57bae7174sm31395181wrw.5.2023.01.18.02.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:25:40 -0800 (PST)
Date: Wed, 18 Jan 2023 05:25:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, eblake@redhat.com, armbru@redhat.com,
 michael.roth@amd.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 05/11] cryptodev: Introduce 'query-cryptodev' QMP
 command
Message-ID: <20230118052127-mutt-send-email-mst@kernel.org>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-6-pizhenwei@bytedance.com>
 <Y8UyezxcEeE+TH2p@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8UyezxcEeE+TH2p@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 16, 2023 at 11:18:19AM +0000, Daniel P. Berrangé wrote:
> > +    for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
> 
> QEMU coding style doesn't declare types inside the for() control
> conditions. I'd suggest 'size_t i', and put it at top of this
> function.

It's actually kind of vague:

	Mixed declarations (interleaving statements and declarations within
	blocks) are generally not allowed; declarations should be at the beginning
	of blocks.

for loop starts a block, does it not?

It's in C99 but we use designated initializers widely so we already
depend on that.

-- 
MST


