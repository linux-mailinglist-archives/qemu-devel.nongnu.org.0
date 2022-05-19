Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CE52D158
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:23:01 +0200 (CEST)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreEy-0005nQ-5V
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nreC0-00054h-5s
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nreBx-0000un-Op
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652959179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=THbKjxkyg2/TfoudAuRJB62LOPqxeFYGnuR6KUQynYc=;
 b=fZhmfvJ5C7R0GuRBFQBaUS2mkogoqfuRPJShBHFFjMKSk3O9v5typ+hyJwIMdr00ZENnuu
 pAaLIo2RVNHSrZ6pJGqOwUwA8XHFUeYoUqHDzB6mT16mHweFNsfE08TQnN2qej+TfR4mk+
 vp9edY7SZr9xKKVCy7NxBlEX/PGrKHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-lovf2i4bPiOBU-E-GJ4NAw-1; Thu, 19 May 2022 07:19:38 -0400
X-MC-Unique: lovf2i4bPiOBU-E-GJ4NAw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C906185A5AA;
 Thu, 19 May 2022 11:19:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92EBB492CA2;
 Thu, 19 May 2022 11:19:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BB8218000A3; Thu, 19 May 2022 13:19:36 +0200 (CEST)
Date: Thu, 19 May 2022 13:19:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Ryan El Kochta <relkochta@gmail.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Message-ID: <20220519111936.7j2dwsfiojpx6vjx@sirius.home.kraxel.org>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
 <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
 <20220519104824.gkrkbsbs3xwuytgr@sirius.home.kraxel.org>
 <0fe4b580-af34-6147-c9f4-2f3a8ea6cd31@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe4b580-af34-6147-c9f4-2f3a8ea6cd31@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> Hmm, ok ... but maybe I should call the new enum HotKeyMod instead of
> GrabMod to make it more obvious that it is something different?

Looks good to me.

take care,
  Gerd


