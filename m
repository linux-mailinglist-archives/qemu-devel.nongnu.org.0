Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E46F4BB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:58:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptx4R-0005CV-Ii; Tue, 02 May 2023 16:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx4P-00059D-HW
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx4N-00058P-5s
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683061074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bF26v6sOCWASN6XbA1Fcm3Qcx/KHqBR1zVdTLqWLKZQ=;
 b=Wk+DT+KQUGE59sJCk+5Hg2VzOhLBUSPYq2s+9Rru0WXP8G6QdbYWexoxorvfgrKT/FaD90
 HCZTn9RlQ5m4PRaGgzfdQzevfDxL+n/AeB1jUJDasu2imMpOqT0IDzwPNbdboDs8Y9iPtf
 fBXL8+THj73KpKvdSu9S8w657XmcPk4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-OSdUC8s3NcKRM4DtHCTXGg-1; Tue, 02 May 2023 16:57:52 -0400
X-MC-Unique: OSdUC8s3NcKRM4DtHCTXGg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-61b6f717b6eso787046d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683061072; x=1685653072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bF26v6sOCWASN6XbA1Fcm3Qcx/KHqBR1zVdTLqWLKZQ=;
 b=BNCfAc3Pa/Q5J0JldwI4Y7IpuRFZTdfx1LXyztB0oLBjHSrCPY9DaHZ4t3VfZyRTpP
 iZd9CIbu5GDPkqksMulctlfI3WAfWjzUgZoSMxIxCRpI5dugFr/OYDzAyjZtY/na+fwp
 k3BqxXylcbb/s+nMO+Gs6gwIOjhu9wTdMZssGyveOPVZ11HDV7D9eemrFCpI4STzzOi9
 I3oQdq/jIDB+q2fM4XT945owSL23AmZHXTuqgtjZzvjsJSF47ZxEufJ2xhbTx1CRh0Uz
 MIRf8rZ2xgTLEwkIK4uoGO0rRr+DSWVIeIk83adS7cj/m0TUhql0S5QfAY3rfiwFAL/v
 8AdQ==
X-Gm-Message-State: AC+VfDydzvCteZgWo0zU04o8NgcJJ0LIcswGddJK0lavKk86pvcldIi5
 5kfAuhlE3aQRkAuvlWEAXh6c6sCp7pphNomAtwgL5OHq/HTlGneR+q0MI6uYHuJoHWgpH3edCpX
 MuQllSJNV8sikulg=
X-Received: by 2002:a05:6214:4104:b0:5ad:cd4b:3765 with SMTP id
 kc4-20020a056214410400b005adcd4b3765mr5892023qvb.1.1683061072495; 
 Tue, 02 May 2023 13:57:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Vis9miH3PXIsGiYl78dO5tiFFJieMYOKV+K8dIvWIkk8YIo5rhsMKqzpRqzg51QQuYIgXTQ==
X-Received: by 2002:a05:6214:4104:b0:5ad:cd4b:3765 with SMTP id
 kc4-20020a056214410400b005adcd4b3765mr5892010qvb.1.1683061072274; 
 Tue, 02 May 2023 13:57:52 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 cc18-20020a05622a411200b003b9b8ec742csm8529768qtb.14.2023.05.02.13.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:57:51 -0700 (PDT)
Date: Tue, 2 May 2023 16:57:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Message-ID: <ZFF5TtFvEq8vL7qS@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-11-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Apr 28, 2023 at 10:49:28PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We generally require same set of capabilities on source and target.
> Let's require x-colo capability to use COLO on target.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


