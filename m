Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6888516FAE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 14:40:26 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlVLk-0001H5-KR
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 08:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlVKR-0000Bb-On
 for qemu-devel@nongnu.org; Mon, 02 May 2022 08:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlVKM-0000ik-Qm
 for qemu-devel@nongnu.org; Mon, 02 May 2022 08:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651495135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vs0b3e35USBAvgASZ+0Xk38oFLYEmXClAY4saxpSo5c=;
 b=YmCO4QY847jMvTzNDoifrPAKiB5TP7ehm4xZMMfyv3mIt0Fh+wrTSXkZealWVB7G9PelGg
 g1iSISRq413GwZERVkp+6iNx3pXBqrZiY+agBB2lKl+dh0vpPJON5yKyFyYWi3S8ZuPoWl
 uqKkw7MOclxBQbG1Ko2RLIpc55irNH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-OJaDWGzlNqmBDe5emoh-tw-1; Mon, 02 May 2022 08:38:51 -0400
X-MC-Unique: OJaDWGzlNqmBDe5emoh-tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16321811E75;
 Mon,  2 May 2022 12:38:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A03E314C3B20;
 Mon,  2 May 2022 12:38:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68EEC21E66D2; Mon,  2 May 2022 14:38:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] qapi: Fix malformed "Since:" section tags
References: <20220422132807.1704411-1-armbru@redhat.com>
Date: Mon, 02 May 2022 14:38:49 +0200
In-Reply-To: <20220422132807.1704411-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 22 Apr 2022 15:28:07 +0200")
Message-ID: <877d74m7mu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: eduardo@habkost.net, berrange@redhat.com, michael.roth@amd.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> "Since X.Y" is not recognized as a tagged section, and therefore not
> formatted as such in generated documentation.  Fix by adding the
> required colon.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Queued.


