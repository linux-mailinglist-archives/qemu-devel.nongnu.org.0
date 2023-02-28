Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79006A5908
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWz7G-000834-TF; Tue, 28 Feb 2023 07:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWz7C-00082p-B1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:29:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWz7A-0001Aq-KN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677587390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp4y1auOSDnrXsS9ECPesbbpsk/KbHiBlrq/G97GmV0=;
 b=c/dbOyHuJByCjYB5z6fsbTebqjCur42Zfa76N4+6PR1Hnyfb38AnBg294/rY4+EnnpRxSE
 HQlyJb/qAFkPlA5DMDYf26+5lE689TFT+L5Mp+NI1GFXZL/Amq9/cwMT2EwYPBNm+6T3DA
 SrcA5TOBfb68jnrmwQKqeKflpHQCQ1s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-yI5cmkxeO8CKdO5PjVN09g-1; Tue, 28 Feb 2023 07:29:49 -0500
X-MC-Unique: yI5cmkxeO8CKdO5PjVN09g-1
Received: by mail-ed1-f72.google.com with SMTP id
 dk16-20020a0564021d9000b004aaa054d189so13836692edb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677587388;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fp4y1auOSDnrXsS9ECPesbbpsk/KbHiBlrq/G97GmV0=;
 b=mv+hLCagPyMVBTS7PiCBD8bbcK/LntrfGGb7cMKhsOopEPgscHllYvfrYetoYYYv4P
 siw8yaEtbVuB2TgpR3936HWV11C8GYKRVr68ISIg3tV4mn7y3INNohKC6hLX2jSy+X3O
 CsCFwvalQyybuG2jxKk+k5FfSGYWsFfNLzSN2cAqYrBXkYrZ1sEVi+OBtwVYbU5DDe8v
 jb1q2da82Igi2T5N9O86+yL/WbeORgXkk4iUbA8/YVS6GQfaaPUYx6gbJwBRgE68XNb8
 8DbsGWGal9plJ+kEfhB4hLiQVpycbL6xBV6GnVMhrnr/IpVF8Xy8VKxgO+G+/luKXqU9
 q0pA==
X-Gm-Message-State: AO0yUKXZ6qjKazf6oD9Kw8Z2drfXR6RjilNQGZpESHwofsP4nDMnOkXX
 PB6v92MIiW3YmyXRdnYBXOOEQi3V+U20AQjp9cFSobUogiCgDSYWtyX8RFCdFxwLdceuF77K6ZA
 rvLWjR4U5h6OXsis=
X-Received: by 2002:aa7:cb89:0:b0:4af:6c25:f04b with SMTP id
 r9-20020aa7cb89000000b004af6c25f04bmr3296279edt.13.1677587388280; 
 Tue, 28 Feb 2023 04:29:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9aqnJElSkj576dlxb7euOF8+nXi2su2ek1Dr3KapVKk4U4Ok9VQ//hruD8wVVQgGJuhsRv4g==
X-Received: by 2002:aa7:cb89:0:b0:4af:6c25:f04b with SMTP id
 r9-20020aa7cb89000000b004af6c25f04bmr3296267edt.13.1677587388041; 
 Tue, 28 Feb 2023 04:29:48 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 m3-20020a50d7c3000000b004accf3a63cbsm4280487edj.68.2023.02.28.04.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:29:47 -0800 (PST)
Date: Tue, 28 Feb 2023 07:29:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, jasowang@redhat.com,
 pbonzini@redhat.com, arei.gonglei@huawei.com, yechuan@huawei.com,
 eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <20230228072616-mutt-send-email-mst@kernel.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
 <20230228051830-mutt-send-email-mst@kernel.org>
 <Y/3gaVgDcf26vo6Y@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3gaVgDcf26vo6Y@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 11:07:21AM +0000, Daniel P. Berrangé wrote:
> IMHO it is not appropriate to criticize the writing of people
> who may not have English as a first language. 

Sorry if I offended anyone. I do want change log messages to be clear
and unambigous though since they are a permanent record. Me rewriting
them for contributors does not seem to scale. I was hoping a grammar
checker will help but if not I don't know what to suggest then.

-- 
MST


