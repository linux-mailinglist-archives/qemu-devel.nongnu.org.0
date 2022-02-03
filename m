Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3584A8C65
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:23:58 +0100 (CET)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhi0-0001qv-HY
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFgsq-0001g3-VP
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:31:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFgsl-0006Ou-JV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643913058;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFnwgNxSZ+kmEdyPE9Ef+WPGaNPa7BK5dd1idZLb4vo=;
 b=MSPT619dPyEpk7RSYK7UIClZWTfuNIzyZBha4B8NUU26R/RdkfVKSeWj8a7r9KTlIwvVGI
 m8ehhLae8X03yAJdSPHUPHvTbHvDCrVae3fX2yT/KtSRAXahXx3AyQ9aJGZMP2xNo6tdzn
 Zd5G1R3Tv/9MRx2/kpMJiH0qKMHvy0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-5UHEIrTPPeiOCcjBiW_-FQ-1; Thu, 03 Feb 2022 13:30:52 -0500
X-MC-Unique: 5UHEIrTPPeiOCcjBiW_-FQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BE31124C40;
 Thu,  3 Feb 2022 18:30:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9829D753E6;
 Thu,  3 Feb 2022 18:30:49 +0000 (UTC)
Date: Thu, 3 Feb 2022 18:30:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Message-ID: <YfwfVtWdEovpSSAs@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
 <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 12:12:57PM -0600, Mark Kanda wrote:
> Thanks Daniel,
> 
> On 2/1/2022 6:08 AM, Daniel P. Berrangé wrote:
> > > +#
> > > +# Since: 7.0
> > > +##
> > > +{ 'enum' : 'StatType',
> > > +  'data' : [ 'cumulative', 'instant', 'peak',
> > > +             'linear-hist', 'log-hist', 'unknown' ] }
> > IMHO 'unknown' shouldn't exist at all.
> > 
> 
> I added the 'unknown' member here (and in other enums) to handle situations
> where QEMU is behind KVM in terms of enumerating the various stat types,
> units, etc. I feel this will be a semi-common scenario (old QEMU on a new
> kernel) and with 'unknown', QEMU can at least display the raw data.
> 
> That said, I happy skip 'unknown' entries if you think that's better.

Yep, I don't think we should be including 'unknown' stuff.

An application could use this, and then we add support for the
new type and the application will now break with new QEMU because
it is presented in QMP in a different way.

The same for the 'unknown' base and unit too for that matter.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


