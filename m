Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36D43B14C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:39 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKj0-0006cc-IE
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKhZ-0005x2-7a
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKhH-0002qx-Qt
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635247969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=93DBcPXieqWG93XNM7GA2S+PSvcdcXVkvr1BaYChjNc=;
 b=FqkeJo5O+ig4gvrtyo+wWO2ETBS65uBMRQKoYfyp6RBQBjMjp4RLGKpII074id91v+lzCg
 6JVpCtCo84rUQ5j6uwiUgq/rbgFLmzshWYSJStBOOnD9QjtqVjLFYWEF3DxDphkIls/2Su
 LhpG3uCh4ZUq1OGO9DthShg23me9XnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-F25O9lPEOe-U7aPc-1V38A-1; Tue, 26 Oct 2021 07:32:46 -0400
X-MC-Unique: F25O9lPEOe-U7aPc-1V38A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F557107B0E0;
 Tue, 26 Oct 2021 11:32:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE294641AA;
 Tue, 26 Oct 2021 11:32:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6364611380A7; Tue, 26 Oct 2021 13:32:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87k0i6d5l5.fsf@dusky.pond.sub.org> <YXfV4vf5+YLFXYbA@work-vm>
Date: Tue, 26 Oct 2021 13:32:29 +0200
In-Reply-To: <YXfV4vf5+YLFXYbA@work-vm> (David Alan Gilbert's message of "Tue, 
 26 Oct 2021 11:18:10 +0100")
Message-ID: <87mtmwja2a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> I'm done reviewing.  David, care to have another look at the HMP part?
>
> Yep, looking good to me - is that going via qmp, hmp, or vnc ?

Either is fine with me.

David, Gerd, do you have anything queued up already?


