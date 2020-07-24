Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75022C75D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 16:09:47 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyyOQ-0003Di-Ts
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 10:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyyNh-0002nJ-Fg
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 10:09:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47835
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyyNf-0000s5-TF
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 10:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595599739;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIalgTijsHyMbL1xXY0SZuLrrITDWYv8Ikn5ZBgfDY0=;
 b=hHl+csbAyeeE9egtQjMyzFMaURDYmML2gaZZqaVxlcvv+JWt2WWC/pmm0Ov9l6I2oCPvnR
 agBhNK97dMOAAAa4b1APWFXNtJwVCkktOmhTLwkevuaBYF4pEp9WNfIDVHvQjFarQ/lSZI
 yZ8Je/cckov9LARwgQNPaNBsWyAahNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-5lwxFsQBMMiTXiVt7fffIQ-1; Fri, 24 Jul 2020 10:08:43 -0400
X-MC-Unique: 5lwxFsQBMMiTXiVt7fffIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7917107B7EC;
 Fri, 24 Jul 2020 14:08:41 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B7CA10013C4;
 Fri, 24 Jul 2020 14:08:40 +0000 (UTC)
Date: Fri, 24 Jul 2020 15:08:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 4/4] qapi/error: Check format string argument in
 error_*prepend()
Message-ID: <20200724140837.GD3146350@redhat.com>
References: <20200724134704.2248335-1-armbru@redhat.com>
 <20200724134704.2248335-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200724134704.2248335-5-armbru@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 00:00:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 24, 2020 at 03:47:04PM +0200, Markus Armbruster wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> error_propagate_prepend() "behaves like error_prepend()", and
> error_prepend() uses "formatting @fmt, ... like printf()".
> error_prepend() checks its format string argument, but
> error_propagate_prepend() does not. Fix by addint the format
> attribute to error_propagate_prepend() and error_vprepend().
> 
> This would have caught the bug fixed in the previous commit.
> 
> Missed in commit 4b5766488f "error: Fix use of error_prepend() with
> &error_fatal, &error_abort".

FWIW, I'd suggest a followup patch that adds -Wsuggest-attribute=format
to CFLAGS, as after a quick hack to try a build, I think all the things
it reports are valid cases needing the format attribute.

qemu/util/error.c:62:5: warning: function ‘error_setv’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/util/error.c:133:5: warning: function ‘error_vprepend’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/util/qemu-error.c:236:5: warning: function ‘vreport’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/contrib/libvhost-user/libvhost-user.c:161:5: warning: function ‘vu_panic’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/tools/virtiofsd/fuse_log.c:20:5: warning: function ‘default_log_func’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/tools/virtiofsd/passthrough_ll.c:2752:9: warning: function ‘log_func’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/tools/virtiofsd/passthrough_ll.c:2754:9: warning: function ‘log_func’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
qemu/hw/xen/xen-bus-helper.c:124:9: warning: function ‘xs_node_vscanf’ might be a candidate for ‘gnu_scanf’ format attribute [-Wsuggest-attribute=format]
qemu/disas.c:497:5: warning: function ‘plugin_printf’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


