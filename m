Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159FF30251B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:49:54 +0100 (CET)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41JZ-0006uM-6F
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41IN-000697-JJ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41IL-00026B-Nh
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611578916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ku1hW4sjYQ/kt2o/MeHv9F8i8xPcBROkVysovKC51+s=;
 b=FYlIVrrjQsge9IPvrumZsgnXR+23iMTydvUHg3RXBtDxDbtUTonkGh53xs0xyAyiUcVnoK
 M59LceA/K/sGLOEPPQbmM7FSp0iLQepyEwAmLUdpx3FI1r4qrGgMfMXSrNE39qEJm9N9Sl
 9cAvAQzcvIdQskXkI76NxNSP9nAWBF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-WsHe94-FOZetr9F89Htyzg-1; Mon, 25 Jan 2021 07:48:35 -0500
X-MC-Unique: WsHe94-FOZetr9F89Htyzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EC7D800FF0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 12:48:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10FE05C1C5;
 Mon, 25 Jan 2021 12:48:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D2D6113865F; Mon, 25 Jan 2021 13:48:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/25] hmp: special case help options for object_add
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-11-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 13:48:32 +0100
In-Reply-To: <20210118163113.780171-11-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:58 -0500")
Message-ID: <875z3lgp27.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Fix "object_add help" and "object_add TYPE,help".
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Standard question when I read "Fix $interface" in a commit message: how
exactly is it broken?


