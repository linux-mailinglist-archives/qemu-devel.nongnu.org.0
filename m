Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A655179F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:44:39 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Fpe-0003iW-0t
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Fko-0001t8-UB
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Fkm-0007Gm-06
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655725174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IeSPDJ56PgAsOWSYflegb61XvzgTgfwlOdVMY+e80lk=;
 b=hNmWX8zk2w8yC6njQUh3voMJvr10VKJdyeU/A6Bij1ZIHCtJ7UumPpsFoycRoWtF1r/ran
 vVDTAQeqcGNBNbS6G5Pi+OP8HAvCIBRTrst3OdCCWvtEQFCM45wdJvFBrh4ZJfzelwvGZS
 G8OAa2UBkIhIWzYn4f9UkhCcBiJL3tI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-XF7rcQR4OzOdLNsiVjUwTQ-1; Mon, 20 Jun 2022 07:39:33 -0400
X-MC-Unique: XF7rcQR4OzOdLNsiVjUwTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6F601C01B24
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 11:39:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C365840D282F;
 Mon, 20 Jun 2022 11:39:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C7A921E688E; Mon, 20 Jun 2022 13:39:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>
Subject: Re: [RFC PATCH v3 02/11] net: remove the @errp argument of
 net_client_inits()
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-3-lvivier@redhat.com>
Date: Mon, 20 Jun 2022 13:39:31 +0200
In-Reply-To: <20220620101828.518865-3-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 20 Jun 2022 12:18:19 +0200")
Message-ID: <87pmj31s3w.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Laurent Vivier <lvivier@redhat.com> writes:

> The only caller passes &error_fatal, so use this directly in the function.
>
> It's what we do for -blockdev, -device, and -object.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


