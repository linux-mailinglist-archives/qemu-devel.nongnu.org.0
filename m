Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817E5E643A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:51:49 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMcG-00062v-2N
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obLV1-0006cF-J5
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:40:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obLUy-0007T6-Pw
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663850408;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rffUmGkQ0R53oibE6n5ZIJgcPQc3qQQc7jhg4mZ/byc=;
 b=JKvJ5MNforj5JnubH1fNWgrDCwElqsJezXf0NjzP7LLv13nQH1LyI1UXoVF+g7vV9SCeX6
 FjC6bMOsHOzwP6bjwwiMYkEiBTjxX9UiDsaUyUzy8OslyVR5JeRZJYtyuNfOXUA7mJRFOH
 lKlUU+0PrxRTuy74vFB2mxNn+8wmCGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-iQfS3naRMeyBtKqvz5Zjug-1; Thu, 22 Sep 2022 08:40:07 -0400
X-MC-Unique: iQfS3naRMeyBtKqvz5Zjug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42DA6382578B;
 Thu, 22 Sep 2022 12:40:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3E2F47505E;
 Thu, 22 Sep 2022 12:40:05 +0000 (UTC)
Date: Thu, 22 Sep 2022 13:40:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 14/27] qapi migration: Elide redundant has_FOO in
 generated C
Message-ID: <YyxXouuYkwKKbO+w@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-15-armbru@redhat.com>
 <YyxG9xCpldunJJTw@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyxG9xCpldunJJTw@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 12:28:55PM +0100, Dr. David Alan Gilbert wrote:
> * Markus Armbruster (armbru@redhat.com) wrote:
> > The has_FOO for pointer-valued FOO are redundant, except for arrays.
> > They are also a nuisance to work with.  Recent commit "qapi: Start to
> > elide redundant has_FOO in generated C" provided the means to elide
> > them step by step.  This is the step for qapi/migration.json.
> > 
> > Said commit explains the transformation in more detail.  The invariant
> > violations mentioned there do not occur here.
> > 
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> Yeh I'm OK with that, I do hate the has_'s:
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Just cc'd in Dan though, wasn't there something special about the TLS
> options?

Yes, some of them use StrOrNull rather than just 'str', but I think
the change is OK

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


