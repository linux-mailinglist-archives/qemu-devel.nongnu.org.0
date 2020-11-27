Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716232C6593
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:04 +0100 (CET)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiceV-0005ml-GN
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiccR-0004Zz-8r
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:12:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiccO-0006rZ-DQ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhxa//sH0uuV5WWwTy/CDbrPw/d4fiVM8euXuhrZRYY=;
 b=ascafPGLoCgYsqjRzYe98LPPpt9MUndUgrWDt+a5B+Jh/TFzlnpqP0bYFEuX5FH0FYRHGX
 qDOlhY2QngLpgtoOOu5DZsmet81ESr9MF8Ek9ETOuLzooCIHUa2zGRspbVq09N/2Jxax31
 gYjztuie7gxGJoTYhQd+394SHirbmmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-iCQjKfJpOQOVKyhc5Yv1NA-1; Fri, 27 Nov 2020 07:12:49 -0500
X-MC-Unique: iCQjKfJpOQOVKyhc5Yv1NA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019711005D5E
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 12:12:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26AA10023AC;
 Fri, 27 Nov 2020 12:12:47 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:12:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/36] vl: move semihosting command line fallback to
 qemu_init_board
Message-ID: <20201127131245.60702c6b@redhat.com>
In-Reply-To: <70f2f8cc-0b5c-72e4-434b-35197c70809b@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-14-pbonzini@redhat.com>
 <20201126181036.3ff5d605@redhat.com>
 <8866f216-911b-2803-4b15-0e794c4c71e1@redhat.com>
 <20201127113154.1c9ef2c6@redhat.com>
 <70f2f8cc-0b5c-72e4-434b-35197c70809b@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 12:22:51 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 27/11/20 11:31, Igor Mammedov wrote:
> >> Yes, calling it around machine initialization time is also a
> >> possibility.  I just wanted to get rid of it in code that I'm actually
> >> looking at.:)  
> > I'd prefer it being moved close to CLI parsing,
> > in a place where other _early call go.
> > 
> > We probably want qemu_init_board() being clear of not really needed clutter.
> >   
> 
> Fair enough, I'd put -semihosting-config in the same bucket as 
> -m/-boot/-smp (machine configuration that isn't in -M) so I'll move it 
> together with them.
it might be machine code, but I didn't see anything that depends
on machine in there that's why I've suggested to move it right after
we parse CLI options (i.e. as early as possible) to keep the rest of
code cleaner

> 
> Paolo
> 


