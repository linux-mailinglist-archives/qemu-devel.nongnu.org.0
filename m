Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697620CFBB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 17:38:38 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpvrh-0008Vl-HX
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 11:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jpvo2-0005DH-1l
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:34:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57372
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jpvnx-0003UB-Kn
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593444884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLjfC5kDv+kHwKw+Q0MUImkIbffICxc4ikmCbvAT5GY=;
 b=Qz7U/T3Z2RSmdMqMzyShuXYNbzouDnuHYsTe0X/pTM1u9uF5eLlvuiBW4DWPM7CeYhE/13
 d8KmfD6vH7ZbrWYxq9UhKZUVFyAiwV54OHIrU7j8CIQN+RmhObYVfQcFdm3B3w3aetJH4E
 8FS5JMFTMVuUOTLGfIeS5pXG45mzouk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-41K7fSxBMLW1vUWrytDI3w-1; Mon, 29 Jun 2020 11:34:43 -0400
X-MC-Unique: 41K7fSxBMLW1vUWrytDI3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C97EC1A0;
 Mon, 29 Jun 2020 15:34:41 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C30DA10013C1;
 Mon, 29 Jun 2020 15:34:40 +0000 (UTC)
Subject: Re: [PATCH] coverity: provide Coverity-friendly MIN_CONST and
 MAX_CONST
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200629151642.11974-1-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <aaa5f004-e500-5510-bf70-435b5c0f9383@redhat.com>
Date: Mon, 29 Jun 2020 10:34:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629151642.11974-1-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:03:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/20 10:16 AM, Paolo Bonzini wrote:
> Coverity's parser chokes on __builtin_choose_expr inside a constant
> expression.  Since it is used only to raise compilation errors for
> non-constant arguments, we can just assume there are no such errors
> in the Coverity runs, and define MIN_CONST and MAX_CONST to the
> "classic" ternary-operator-based definitions of minimum and maximum.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/qemu/osdep.h | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I wrote a variant in the meantime, and in comparing the two, the only 
major difference was that I added a line:

     Fixes: CID 1429992, CID 1429995, CID 1429997, CID 1429999

in the commit message, as well as a comment in osdep.h:

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0d26a1b9bd07..98bc7156fa9b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -250,7 +250,8 @@ extern int daemon(int, int);
   * Note that neither form is usable as an #if condition; if you truly
   * need to write conditional code that depends on a minimum or maximum
   * determined by the pre-processor instead of the compiler, you'll
- * have to open-code it.
+ * have to open-code it.  Sadly, Coverity is severely confused by the
+ * constant variants, so we have to dumb things down there.
   */
  #undef MIN
  #define MIN(a, b)                                       \


I'm fine whether or not we include that.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


