Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43926E9C00
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:51:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZNM-0007QF-Ia; Thu, 20 Apr 2023 14:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppZN4-0007Nt-JE
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppZMu-0004E1-8A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682016654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OJHUgc63X/BOsrDoGbjfMfEgmHKe9KBNGMuZ8ZfLQrk=;
 b=Gcr/6m8Xf8KdRd9Z9cKN/fB70l46ITowwd7LL1JkL9ZDviHoS4TKq23fnGxC83EJvdP0Zv
 6riQKj3oipyYpSglfLbmefrSfvDmvupgN2nRL5qcgziCGrjCFwzo5achcTp6kHxYepqSEc
 pxZY6W1JSxTIoqjAg+pkAxzqqZu5D54=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-S6WFNzR4NlKlBlQc0JdnRg-1; Thu, 20 Apr 2023 14:50:52 -0400
X-MC-Unique: S6WFNzR4NlKlBlQc0JdnRg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ed767b30easo2489631cf.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 11:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682016652; x=1684608652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJHUgc63X/BOsrDoGbjfMfEgmHKe9KBNGMuZ8ZfLQrk=;
 b=IYZtuLdufouxSnZl9gv73M8gAWATrNDG/m//0YmZ1cCN01WxmLfEpU6sIOjkdjobUu
 h7Z5xiQPeohKbcWklsNv8GnmEvyhE2qGAPE/7NaKka3KQYz2krHAdsn9E9GkiAkWDasP
 j+GtCyWRgP7kKIBscG+pYN6YKxjI1Ew7s+2iYXPFYtbecwt4T/0a0p/+zhrVZvb6jIAe
 jEfJqHKi3ZZa/U4+owc1dIjHNLT1qqMO3EKuG7jGxttojzfJ4rtxjRpeAyuiSmsGHiWq
 jAzNA7Kqtp8AvwugcieN+WVp5tprAdJlamxHMqGbxpvtuXqYM4t4Qiq5NMRx263v6Rft
 5Wpg==
X-Gm-Message-State: AAQBX9c0H0/slCOtmUAG9TzId09+uaZzWUSn+MgZaZzW3c8vVyvBs11m
 Xw8Q9wxGvW94l//ScjJrtEw+FJDLSPZfQHeGYMz85wv4JpsXNKVokR70UJoLIpzLOJPAdjtfr4A
 eHySUKgmxJ/ycuMg=
X-Received: by 2002:ac8:5a84:0:b0:3ea:ef5:5b8c with SMTP id
 c4-20020ac85a84000000b003ea0ef55b8cmr4115517qtc.3.1682016652402; 
 Thu, 20 Apr 2023 11:50:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZGBW1kED7WGQcpEhJQwzccg7W5G3oTwR7HpiVaLKjkxxEHMS7t+ybABRQOCuXqBnSfTxxYBg==
X-Received: by 2002:ac8:5a84:0:b0:3ea:ef5:5b8c with SMTP id
 c4-20020ac85a84000000b003ea0ef55b8cmr4115494qtc.3.1682016652168; 
 Thu, 20 Apr 2023 11:50:52 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05620a228800b00746aa080eefsm646759qkh.6.2023.04.20.11.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 11:50:51 -0700 (PDT)
Date: Thu, 20 Apr 2023 14:50:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3] migration: move migration_global_dump() to
 migration-hmp-cmds.c
Message-ID: <ZEGJihWJjYiTeQiN@x1n>
References: <20230420121038.25167-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230420121038.25167-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 02:10:38PM +0200, Juan Quintela wrote:
> It is only used there, so we can make it static.
> Once there, remove spice.h that it is not used.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


