Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E41C55FDCF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:52:49 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6VJO-0008GW-Na
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6VHK-00079N-RV
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6VHI-00076S-EP
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656499835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WTe7tfLhfsMG3d4omE6OuugeSVHtZ+pvVgaSZdOsNB4=;
 b=VtKM7WlXEoocZmBZtmCiskDhZiv2TxObvqUSCTrmt+chLC+7df28GOQwDAWnt9E0hDopG8
 qew0I9mAFTZ1A9uUIHQw6XucdLTG+Mq0k14w69R9imxam+fZDRYO8OwXbDSG+6KdbfecE6
 bA3zvcjf1yFidOVlSyXBy28MuDctfMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-OZY-Fiw_N8m8QNeYIK7znA-1; Wed, 29 Jun 2022 06:50:34 -0400
X-MC-Unique: OZY-Fiw_N8m8QNeYIK7znA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB0B981D9CA
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 10:50:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C665E40F06D;
 Wed, 29 Jun 2022 10:50:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7E3F21E690D; Wed, 29 Jun 2022 12:50:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v5 03/12] net: simplify net_client_parse() error management
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-4-lvivier@redhat.com>
Date: Wed, 29 Jun 2022 12:50:31 +0200
In-Reply-To: <20220627154749.871943-4-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 27 Jun 2022 17:47:40 +0200")
Message-ID: <875ykjoia0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

> All net_client_parse() callers exit in case of error.
>
> Move exit(1) to net_client_parse() and remove error checking from
> the callers.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


