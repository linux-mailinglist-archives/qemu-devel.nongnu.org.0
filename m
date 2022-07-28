Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6238584812
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 00:16:48 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHBoE-0005j1-RY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 18:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBkM-00038Z-02
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBkJ-00009i-ND
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659046363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NIc9RyXU4FglcShv+3T/xvm/sUPdc4gZk+6S7zzHoYxhnby0oOEtKqs8YA026ptZDtNA01
 6uQo5vgkdL7x1ZYsv8wJzAuHQKJIVYtcYnhgDiKQdPm00LNsfeHpUqbXm0+pgOW7AuQrJg
 s4sOrsWKpXL9VFkSvcXSbAFuZFzqXT8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-tbe6U8r7M_u6TLUtdvVung-1; Thu, 28 Jul 2022 18:12:41 -0400
X-MC-Unique: tbe6U8r7M_u6TLUtdvVung-1
Received: by mail-wm1-f72.google.com with SMTP id
 az39-20020a05600c602700b003a321d33238so1493152wmb.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 15:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=fjCUEWZ3PLcJMdV3z0b+uLmtckqDCA/XwOs7+C93A2N8uIvMCnhTEe93e5gB0fqoTD
 oXdZWalFaCEIO9HQGZsUoMyuQtx+rUSVSGRbuAUFIJWF/q+jG6iSVHdqn0U8k3w/12Ta
 e0c1J+MlXW5WCL4NyPRKJecC+Osw4afU6J9ba62Fcg4UjDWNMjxeOutbLK2vs0S4fAqw
 GHGzX2mM7//8j+hcgq81rmHT7Y34LwlnXeebc7NhWTTcD7VujPFRnI4XbHuIMtyNqLMI
 7D62qaVuKBshnaWHO7x+QbpbH9/y5zUIw8Fw+CHeRXUX3m8Uw9vvXi5AsPsvl3HCmDe+
 gTIw==
X-Gm-Message-State: AJIora+aFJPSKteC+uQVkwdCR0AN0kA4EVVYf/uHvip26htkKx4TZr3u
 eJLQfjQ7GjXM5uBkQDXGIoTGer+dLXUrQUSuJvpya9Xu1s3Pc03LG3YKO5pYy5Io0zc/t09TOI1
 v3+5PKlKm5Ky5f9A=
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr516079wms.63.1659046360361; 
 Thu, 28 Jul 2022 15:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhpYf+kC3KBUzEGcbtcDweoYflUI477bY8i6rh/DCnjOMEa5fj7bzGM/Rsm1I0MqwNxIAtVw==
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr516066wms.63.1659046359949; 
 Thu, 28 Jul 2022 15:12:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003a0323463absm2641254wms.45.2022.07.28.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:12:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Date: Fri, 29 Jul 2022 00:12:38 +0200
Message-Id: <20220728221238.305080-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728142446.438177-1-cohuck@redhat.com>
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



