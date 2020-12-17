Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8B2DCE8F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:41:35 +0100 (CET)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppmw-0004T6-9e
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kppkp-00038h-A8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kppka-00070d-9p
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608197947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBJPP5YsxFKWgvOFibcAhFcIDi/GO8YWObtqiBGK0cw=;
 b=QO4wlQfSOUoGJwpunEPQ0OKYCMUOmImz57yI/svbNyblaODG3cuU6YvGL49gnU0oYt7TZj
 myIc2VrWCsK3IWUrBSvRQIVJtGFoWMdqmr+r5rWztw3nmPI6gbzHq0+PKm4sssaBnCAfeb
 zI9FvqAekoNedf5VdsnprQqdjOXOPsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-7GIP32o1NkaorDxvanu7GA-1; Thu, 17 Dec 2020 04:39:03 -0500
X-MC-Unique: 7GIP32o1NkaorDxvanu7GA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D69251005513;
 Thu, 17 Dec 2020 09:39:01 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A30B60CDE;
 Thu, 17 Dec 2020 09:38:56 +0000 (UTC)
Date: Thu, 17 Dec 2020 09:38:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 16/20] migration: Replace migration's JSON writer by the
 general one
Message-ID: <20201217093839.GA4117@work-vm>
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-17-armbru@redhat.com>
 <20201216194615.GG3008@work-vm> <873604nc14.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <873604nc14.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: mdroth@linux.vnet.ibm.com, agraf@csgraf.de, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> Commit 8118f0950f "migration: Append JSON description of migration
> >> stream" needs a JSON writer.  The existing qobject_to_json() wasn't a
> >> good fit, because it requires building a QObject to convert.  Instead,
> >> migration got its very own JSON writer, in commit 190c882ce2 "QJSON:
> >> Add JSON writer".  It tacitly limits numbers to int64_t, and strings
> >> contents to characters that don't need escaping, unlike
> >> qobject_to_json().
> >> 
> >> The previous commit factored the JSON writer out of qobject_to_json().
> >> Replace migration's JSON writer by it.
> >> 
> >> Cc: Juan Quintela <quintela@redhat.com>
> >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >
> > (Copying in Alex)
> >
> > This looks OK to me, so:
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > but, can I just check, have you checked scripts/analyze-migration.py is
> > still happy with the output?
> 
> Good point.  I just did, following instructions in
> docs/devel/migration.rst.  It prints stuff and succeeds.  Anything else
> you'd like me to try?

If it's happy, I'm happy.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


