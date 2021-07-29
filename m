Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734F3DA7B7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:40:05 +0200 (CEST)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m988i-0007i5-5M
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m987v-0006ww-L4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m987s-0006DX-MN
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627573150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12XMFIg2C/UnCdtpl9Q0B6GLVB/8+QwuqHexm3dBDfA=;
 b=BuQ3LAceNojT3DW+lyTu5sNyG11mFfxUkyWZjOmGKhQDHmFEBMKtFTRLX2MM9b9OFsWZh2
 dFVZBQ3ms29SuqdX7YHmobYUVoXG1B9mz0yauHBjwEKcuYQV545e4/F0xdYj11dmcTX0Tn
 rsDlTiuyEULwEFx0r2XB/t1MttgtlgY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-d95sRcQ8O4yujOfqTzGNnQ-1; Thu, 29 Jul 2021 11:39:09 -0400
X-MC-Unique: d95sRcQ8O4yujOfqTzGNnQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 v19-20020ad455530000b029032620cab853so4126076qvy.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=12XMFIg2C/UnCdtpl9Q0B6GLVB/8+QwuqHexm3dBDfA=;
 b=Y0TinJpRno0PxyuaU17xWsfYo6m4MIMj0Q4ZBHow9Acfnp+l4SfCyj5kzVn4EJ3Ypr
 ULZS5PKtgwBoolA0M6TRz7VrecleSshg2wQRw9ELQrQAGkYl8wHwBQ6vPX3PQwbwtoo2
 S80rWrJr+5kvLO72iwNKF2z6dd8kiGUk8ISZRYhq9M3Kwj0XnmZF9HC1JOxTBBKC/Xqj
 9W2TqXJh9bh4nP5qpEQxK+UkkD24K6fA/0YrXJzoalj8/q2rHVk/tLp6D2vS2MicZ0rr
 qV2w4E92fYublJ1x8FZ0ejvOC8a4iuNMOCK25BEABaW54/bwvcC0rAtVV37qm28qDhYS
 CxHQ==
X-Gm-Message-State: AOAM532vOBHjoC1Zu4YPdf1Ao28gmsCj3GMizJ3xJhOxuNteUuKK+0DK
 VcwVcZnVTl/Rq92ojT3a4JZHnh+DAA35EaPpyPhSwjvKqTWgQZ+1McMehCbIjszUUVoFjKC+9Ks
 vInLbHOlhqa0yhMY=
X-Received: by 2002:a37:9a47:: with SMTP id c68mr5639630qke.37.1627573148732; 
 Thu, 29 Jul 2021 08:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGpcJSYDPcJ5J0qDhmWQkH4FnTaYcYJKqVeQcfsFSI880ETWHWc9m4SSwlIgE2N/xg0iWkvg==
X-Received: by 2002:a37:9a47:: with SMTP id c68mr5639611qke.37.1627573148520; 
 Thu, 29 Jul 2021 08:39:08 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i24sm1928660qki.61.2021.07.29.08.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 08:39:07 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:39:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
Message-ID: <YQLLmrUMYURV8tgH@t490s>
References: <20210728214128.206198-1-peterx@redhat.com>
 <145cf8c7-84f3-6743-d1cd-02eba6a613bd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <145cf8c7-84f3-6743-d1cd-02eba6a613bd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 01:48:57AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/28/21 11:41 PM, Peter Xu wrote:
> > Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> > it with __linux__ defined seems to be not working yet as it'll try to include
> > asm/kvm.h and that can be missing for archs that do not support kvm.
> > 
> > To fix this (instead of any attempt to fix linux headers..), we can mark the
> > header to be x86_64 only, because it's so far only service for adding the kvm
> > dirty ring test.
> > 
> > No need to have "Fixes" as the issue is just introduced very recently.
> 
> Personally I find it very useful to navigate in gitk without having
> to use git-blame.

Makes sense.

> 
> Fixes: 1f546b709d6 ("tests: migration-test: Add dirty ring test")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks all!

-- 
Peter Xu


