Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDEB6389C9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXpc-0004r9-8c; Fri, 25 Nov 2022 07:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oyXpU-0004ob-I9
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oyXpS-0006Z8-IF
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669379351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qT6SyCbWy7a/hX0R/0E2WM4UDD31w3dy3r18Rw5/R30=;
 b=PdM4GazaE2YYYv/YWZ56k4Eoay5xGVexO41io+G0TtuezsyEIMKOvTQXiNNL0Gi2mjDP+q
 PDiF2SyPD7dN1C5gWihywIOwPTOz7BFEICRIiE7ib18gXGUemzVFCQ0NFndYQp12eG1+rH
 sb6t6lxWJioKPFxU73sGhswFJUcS3ds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-iXDiPYp7NmK-9NKyq5mAHg-1; Fri, 25 Nov 2022 07:29:07 -0500
X-MC-Unique: iXDiPYp7NmK-9NKyq5mAHg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C6D9185A78B;
 Fri, 25 Nov 2022 12:29:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 730DC4A9254;
 Fri, 25 Nov 2022 12:29:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D1B21800631; Fri, 25 Nov 2022 13:29:03 +0100 (CET)
Date: Fri, 25 Nov 2022 13:29:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: guest Linux Kernel hangs and reports CPU lockup/stuck gitlab bug
Message-ID: <20221125122903.dwjkhwgykcrd7xqy@sirius.home.kraxel.org>
References: <7d54c218-fc66-b65f-4cc3-915d2ec23a0e@suse.de>
 <20220921104728.via2xl7dbqhhdyib@sirius.home.kraxel.org>
 <87h6yn1cdb.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6yn1cdb.fsf@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> The last thing the X11 server sends is:
> 
> 113.10: Client 1 -->   24 bytes
>          ............REQUEST: ConvertSelection
>                    requestor: WIN 03c00b9b      <--- qemu window
>                    selection: <CLIPBOARD>
>                       target: ATM 00000201
>                     property: ATM 00000185
>                         time: TIM 1b3500de
> 
> However, the clipboard owner is an entity inside the guest (due to
> ssh -X) and it can never reply because the guest is paused.
> 
> So the GTK waits until IDLE_ABORT_TIME, i.e. 30 iterations of
> gtk_selection_retrieval_timeout (1000 ms).
> 
> I'm not familiar with the gtk code, but I understand from the
> documentation that we would want to use gtk_clipboard_request_contents,
> which allows for a callback when the text is actually available (i.e.,
> the clipboard owner has eventually replied).
> 
> Naively, I'm thinking we could replace gd_clipboard_request with
> gtk_clipboard_request_contents and pass qemu_clipboard_set_data as the
> callback. But I haven't experimented with it. Let me know if any of this
> makes sense and I could give it a shot.

That goes into the right direction.  Replace the blocking calls with
callback versions.  It probably wouldn't be *that* simple though.  I
think you need additional state tracking so you can deal with corner
cases like clipboard changes happening between
gtk_clipboard_request_contents() call and the callback being called.

take care,
  Gerd


