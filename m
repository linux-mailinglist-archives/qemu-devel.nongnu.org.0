Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BF524ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:54:55 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6T8-0001A9-SF
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np6Kv-0005Np-L0
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np6Ku-0003lf-5L
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ArEKlJOjDx8w7qUwg0jsVpsrQHu8pGS65JKnOzSL4QI=;
 b=I5IoWxygA+Nd+TX/WLl1og4Vj66c5RJjucFUmURuU98UvMEfP1KrHW6TOcyOCr7HYcOI/I
 fGXJRBuy9BrLT4UFQ+2ZaUILoDd0AYvqa+UVEmO139HeZSJke+tJmQeyD37/+m+LUvjapt
 Zg7CFtNDYpcLKgylplgrujaFKN9FaOA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-LgRaOrEqOLGs8_oeFYQdmw-1; Thu, 12 May 2022 06:46:22 -0400
X-MC-Unique: LgRaOrEqOLGs8_oeFYQdmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1208F29324A2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:46:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8441256F8BC;
 Thu, 12 May 2022 10:46:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B19121E6880; Thu, 12 May 2022 12:46:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
References: <20220511175043.27327-1-pbonzini@redhat.com>
Date: Thu, 12 May 2022 12:46:20 +0200
In-Reply-To: <20220511175043.27327-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 11 May 2022 13:50:43 -0400")
Message-ID: <87a6bn9gg3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Commit message nitpick: not sure this is "qapi:".  The commit that
introduced "Machine type ... is deprecated" (08fe68244eb) used
"hw/i386:".  We commonly use "vl:", "softmmu:", and "softmmu/vl:" for
this file.


