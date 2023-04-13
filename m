Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71E6E116C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:50:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzBg-0004Qe-BX; Thu, 13 Apr 2023 11:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmzBa-0004QW-N7
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmzBZ-0005Yb-6Z
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681400912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s+SGgi3qlrO2Ap4wkt5BXS1d56XSZb0XQCV1323tmB8=;
 b=Tbke1fBCtITeKot49aDl3DDMfSQJ7nLSXpMEvW8IU4LFn2LD2BnQhg77sozfCtjRRIoEPc
 hXKDq7k89CfiR/J8qqwEeCX91pLz8qOXPBOd45aH3pQlYtdxQgVW7cOoh3fkNpB/sl1g7S
 aXRjPVGpWJWeE/SVNy8fJkUPx+t43y0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-4zXVMq9HP4qFzj2TQKnNYg-1; Thu, 13 Apr 2023 11:48:30 -0400
X-MC-Unique: 4zXVMq9HP4qFzj2TQKnNYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m4-20020a05600c3b0400b003f0968719a7so3723583wms.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681400909; x=1683992909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+SGgi3qlrO2Ap4wkt5BXS1d56XSZb0XQCV1323tmB8=;
 b=BUCcTV0xhrQcwd5xNQNbtabmvVy+cFZc8dqg5jytGPZrYq3EdTQGBkVEFOofDDZ8br
 dyEnhwN6j8I5W4/jLC3cwzz6b5J9+KUb+WcDaMz+Bv+eC5RJbLq9U67yXfZcwWPMec0h
 EIu2ln8GjQ9Ewxg2/hPnoQLSAIViHmqBjPdkcYplb0ISnMSvdPRElOhbpYtfFEkP95a6
 5Wy5rJJbViMx2dlx5j05NMtZPkNyIuIWbFnZr+VVdJlfedXQSWeKLhyRKHZbfHbAi48Q
 K+k8PD6TOGv1ZifXnm4dy4VWW/HJXDwi6yfaXCr3VkjDXViXIctsc9EFNIZMOkGLwbsB
 hAcw==
X-Gm-Message-State: AAQBX9eB8TKR80L3b1pDR+3nBsomXFmd3qnE+Sf1X760VNaV6Nocicna
 GJGenArbWXoF0oleBOuv8QGDD8ElR7VwUaQfJX9yMRi/Sclng4d0Fl1y6fmKDUNEkCpL2AlUVtE
 AJ9zntHvcUVpTLj4=
X-Received: by 2002:adf:f2ce:0:b0:2f5:ae53:f560 with SMTP id
 d14-20020adff2ce000000b002f5ae53f560mr1904643wrp.19.1681400909360; 
 Thu, 13 Apr 2023 08:48:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5shvPo/qNjBdzgzxkl8rqs8SwjIdZtKUrZH6bp+YD3e8c6tr45757SSJD1QyW66iUQKB22A==
X-Received: by 2002:adf:f2ce:0:b0:2f5:ae53:f560 with SMTP id
 d14-20020adff2ce000000b002f5ae53f560mr1904626wrp.19.1681400909056; 
 Thu, 13 Apr 2023 08:48:29 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d594b000000b002cfe687fc7asm1536073wri.67.2023.04.13.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 08:48:28 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:48:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Hanna Czenczek <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Message-ID: <20230413105448-mutt-send-email-mst@kernel.org>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
 <20230412205138.GA2813183@fedora>
 <0ca69a92-49ab-223e-b737-9d8655883f38@redhat.com>
 <CAJSP0QWOu5vW_fWc+UKfemrfhgGvJjNJmifVGCyRaP895AXocg@mail.gmail.com>
 <da5c06fe-3422-709a-9782-66e338cc7c85@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da5c06fe-3422-709a-9782-66e338cc7c85@yandex-team.ru>
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

On Thu, Apr 13, 2023 at 05:24:36PM +0300, Anton Kuchin wrote:
> But is there a valid use-case for logging some dirty memory but not all?
> I can't understand if this is a feature or a just flaw in specification.

IRC the use-case originally conceived was for shadow VQs.  If you use
shadow VQs the VQ access by backend does not change memory since shadow
VQ is not in memory. Not a practical concern right now but there you
have it.

-- 
MST


