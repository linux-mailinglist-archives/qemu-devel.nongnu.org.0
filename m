Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EA5F791E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:39:00 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognYz-0004Uo-Uz
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ogluh-0001Pu-EL
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 07:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oglud-0005Cu-Bc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 07:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665143585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aEuLaa6AXf+N/Edz4nJ5VwKTM7LDQ3CRO8fLTrHaJSE=;
 b=IfZZIf7ve6BAQcrRcgOEon0fBz6W8eXA2B/OuFQG88msmcowhTGKOx77rR/HN71Z8Q8dOC
 U4elQPFtBo3m3EZHSgwF/NjOMrFXvF9anZkyfyXVsHJcHtb1WGwxCfNDdabBcdA+2ZaliC
 v7FE3BOetIgwD2nhZxgw/9Nhh57oW0E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-2JAmJ4raNLy7IHL-santUA-1; Fri, 07 Oct 2022 07:53:04 -0400
X-MC-Unique: 2JAmJ4raNLy7IHL-santUA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020a05640235d000b0045485e4a5e0so3700725edc.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 04:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aEuLaa6AXf+N/Edz4nJ5VwKTM7LDQ3CRO8fLTrHaJSE=;
 b=XK1N3BVywW93H5dAW2V0am7nKo8ZM6IB7OsYI2PJv4Nkaw/QSCec+7zdz8W9PDmP17
 RKd8RSH8iO235Bih9enOglY/VQ94gxvcSpXaVrX5qD3Hw1zwTOGwI19GjVnrB7iq2RiN
 Fbp0DKi1bKvkYjqHakmThZHFEY9vcLDIw6tV7Gh9XUXyauY6Nywa0R6+0l/wm3EQJhGK
 ik08N+CPUTXPcSP5FKvmXOG++FdUT7CKsCrJJy+d+C/9UjAuxQ2tJJpAEWBHyLEg4koG
 Wh+5KKWP13Ae+qPGbQaVirIjhns7mSZJBKWzYRHk52vkvXyt/hk1DPgN+Gy87LYgxY7Z
 BLxg==
X-Gm-Message-State: ACrzQf3gXlNCWBDVYxBVsUujsE8jh5uFWuyiVCIM+7tCZht935Afd54j
 o74pCtfNPAXYRKGlyolJSZ2Hu+Drjb2Zsl+ruXIy9Dgk6xIBbi8I6bFAb4SlxZAn32xBGUDieQo
 f05sSp+G3hvs7ajg=
X-Received: by 2002:a17:906:9b8b:b0:78d:8276:ff47 with SMTP id
 dd11-20020a1709069b8b00b0078d8276ff47mr1545438ejc.430.1665143583028; 
 Fri, 07 Oct 2022 04:53:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qeJm5R/KWNdYTxpubR6bLmWsAZt6oWTQ2I4cyERPt9CTdR4DKIOvBO8Oemh9GUOmfQxjx1w==
X-Received: by 2002:a17:906:9b8b:b0:78d:8276:ff47 with SMTP id
 dd11-20020a1709069b8b00b0078d8276ff47mr1545425ejc.430.1665143582822; 
 Fri, 07 Oct 2022 04:53:02 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a1709063ca100b0078175601630sm1091672ejh.79.2022.10.07.04.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 04:53:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Marcelo Tosatti
 <mtosatti@redhat.com>, Oliver Upton <oupton@google.com>, Maxim Levitsky
 <mlevitsk@redhat.com>
Subject: Re: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
In-Reply-To: <CABgObfaAFnnJDmgtsF69qUrayYf9+yg6GTX7wfCTkk1r1DkCdQ@mail.gmail.com>
References: <20220920144024.3559708-1-vkuznets@redhat.com>
 <87wn9pkv6e.fsf@redhat.com> <87sfk07znt.fsf@redhat.com>
 <CABgObfaAFnnJDmgtsF69qUrayYf9+yg6GTX7wfCTkk1r1DkCdQ@mail.gmail.com>
Date: Fri, 07 Oct 2022 13:53:01 +0200
Message-ID: <87pmf397fm.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Hi, a similar patch is now in.
>

Indeed,

commit c4ef867f2949bf2a2ae18a4e27cf1a34bbc8aecb
Author: Ray Zhang <zhanglei002@gmail.com>
Date:   Thu Sep 22 18:05:23 2022 +0800

    target/i386/kvm: fix kvmclock_current_nsec: Assertion `time.tsc_timestamp <= migration_tsc' failed
    
solves the problem as well.

-- 
Vitaly


