Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C580B4A5B08
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:20:55 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErDN-0004V8-Ft
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:20:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEqus-0001ay-OC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEquq-0001nW-Q5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643713300;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WhM9Ck9Q49VBT2kByx0r5VB3ERuXdr4cSRomdY6dWUY=;
 b=QBTKOwz2tE6ZYOiag9vIjND7kt2A0jc/BhKE4Q/VdGaYPgbTmupTzSulLF7jMi6Q1M3SXk
 OpmsyqNxISjEo/Tm6HkzJSoilzKPeo2krQbDCmKpZXmH9G5t7bgMZBfjWUXiQ1szwcPvjJ
 uIp/iSas5UY4KQiPseyq6Y4JEbl08/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-dkSRs4zyPGubKWJxpuNdUg-1; Tue, 01 Feb 2022 06:01:33 -0500
X-MC-Unique: dkSRs4zyPGubKWJxpuNdUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605481B18BCA;
 Tue,  1 Feb 2022 11:01:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E7A6D039;
 Tue,  1 Feb 2022 11:01:31 +0000 (UTC)
Date: Tue, 1 Feb 2022 11:01:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Message-ID: <YfkTCCFU0vg/PwgQ@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <5c635615-e5be-8c3c-6146-cac70c326cf5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5c635615-e5be-8c3c-6146-cac70c326cf5@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 11:51:26AM +0100, Paolo Bonzini wrote:
> On 1/31/22 20:43, Mark Kanda wrote:
> > 
> > { "execute": "query-stats", "arguments" : { "target": "vm" } }
> > { "return": {
> >      "list": [
> >        { "provider": "kvm",
> >          "stats": [
> >            { "name": "max_mmu_page_hash_collisions", "value": 0 },
> >            { "name": "max_mmu_rmap_size", "value": 0 },
> >            { "name": "nx_lpage_splits", "value": 131 },
> >           ...
> >          ] }
> >        { "provider": "provider XYZ",
> >        ...
> >      ],
> >      "target": "vm"
> >    }
> > }
> 
> Perhaps it's better to have a better name than "list" for clarity, like you
> already did with 'stats':
> 
> { 'struct': 'VCPUResultsEntry',
>   'data': { 'path': 'str',
>             'providers': [ 'StatsResultsEntry' ] } }
> 
> { 'struct': 'VCPUStatsResults',
>   'data': { 'objects': [ 'VCPUResultsEntry' ] } }
> 
> 
> { 'struct': 'VMStatsResults',
>   'data': { 'providers' : [ 'StatsResultsEntry' ] } }
> 
> Also, here:
> 
> > +{ 'alternate': 'StatsValue',
> > +  'data': { 'scalar': 'uint64',
> > +            'list': 'StatsValueArray' } }
> 
> is it possible to just do
> 
> { 'alternate': 'StatsValue',
>   'data': { 'scalar': 'uint64',
>             'list': ['uint64'] } }

No, the QAPI generator throws its toys out of the pram.

It claims you can have any set of data types which have a
distinct representation on the wire, so this is valid from
that POV.  Something about the parser/code generator can't
cope with this inline array though - it wants a named type
which means a built-in scalar, or a compound type, but not
an array :-(


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


