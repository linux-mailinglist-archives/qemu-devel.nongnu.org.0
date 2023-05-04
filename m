Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5646F70F8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:35:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpe-00029q-BQ; Thu, 04 May 2023 13:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZve-0005jQ-Ps
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZvc-0004dJ-S2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683210448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wk871L8rY/WMlmD2uHXJpyzHOzWOKL64GF0vwWPdFVs=;
 b=HGsxS7MQrywZzACPpVL/is3ohXoT0kXSIBCVYlT0PQIVX8d0EZgtg/pHQdvqv6jOq3Lrum
 EQyI1bk24Nd+mb1g0fnWHURV0xbv6f20LIfZ4oibgiyz+8OYJ1QRXeoMWkMywHCtcqLgpS
 qKnZJjtKmbkfjFbgTokIMAxUEebZ8kA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-xohOByqFMIunlF1JXTFSYg-1; Thu, 04 May 2023 10:27:23 -0400
X-MC-Unique: xohOByqFMIunlF1JXTFSYg-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-4480be32e10so12934e0c.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683210441; x=1685802441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wk871L8rY/WMlmD2uHXJpyzHOzWOKL64GF0vwWPdFVs=;
 b=Xt5+x288FHa9nNc4rQEJUo8szYUSdE21K4hrmTzIuOApts4eaJtEvolhjkA86HCI+A
 bY7jDKiJta64GL4TiTMFspltYkcO8oduMEsm7uB/HvwVedDdlkdHsFhNSY1qu5Kws1+H
 1oybIB3egLdnV4wJ2hQBjIf8ZeNLup0td8Fg2iYwNQu3ki5PZUjCjNRnb3QuZg29vtGW
 wIh+9rQY+ZD5x8ttVGhJ8xk+3840vjsT+aDmZPRPQ4ooMkwAkLxKLY3IgJ9fuabQDrNM
 6Fx9PSicKW2MBq4IyR23G8W++oK1QUWFKw7X2n4J53Dv2ww/OqlMYKmUNNAjJtBIAQAi
 PObA==
X-Gm-Message-State: AC+VfDyIKtC6cygd2CmKflO2Is6LMBzri2n79s60tJIzjZfAqRG6DQvh
 qVTWOb9T3buKc9sEdViX+Vg1/GmP0/qUH/ddwkU/OGIplKUW3RJALVUIWXIXyPwSyRRjSveG6ZG
 EAmQIGQu9yzqet98=
X-Received: by 2002:a1f:9e4b:0:b0:44f:f40b:327f with SMTP id
 h72-20020a1f9e4b000000b0044ff40b327fmr417552vke.0.1683210441070; 
 Thu, 04 May 2023 07:27:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PNn7VQD888XHFI9BEk+4Na9mzAYpLSW8TZAd+nfjrq1yxK7r6kD6kWfr5EUmIP1JS9IVLKQ==
X-Received: by 2002:a1f:9e4b:0:b0:44f:f40b:327f with SMTP id
 h72-20020a1f9e4b000000b0044ff40b327fmr417536vke.0.1683210440747; 
 Thu, 04 May 2023 07:27:20 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 ea28-20020a05620a489c00b0074ad0812747sm11538052qkb.77.2023.05.04.07.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:27:19 -0700 (PDT)
Date: Thu, 4 May 2023 10:27:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 5/9] qemu-file: No need to check for shutdown in
 qemu_file_rate_limit
Message-ID: <ZFPAxU2QwL+xKxXe@x1n>
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504113841.23130-6-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 04, 2023 at 01:38:37PM +0200, Juan Quintela wrote:
> After calling qemu_file_shutdown() we set the error as -EIO if there
> is no another previous error, so no need to check it here.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


