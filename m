Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9909492797
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:53:49 +0100 (CET)
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ovj-0003ow-QW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9nyU-0001x6-P7
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9nyQ-000607-Ly
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642510340;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fGgRcR2dP41lO3T/gn8Vl5+NcZFGm2zYTrmD1qaq16A=;
 b=QjTQAxfVNH9LAEGWpE8QJ2/05W80YTL/sYr30wybKPkVRE9GcLmOHY5IUFPJeyFKZi8Gd2
 A/KknF3jX5maQr5LlBLVswtn3j13PZHWUgbfmXObDTI2qRllEPQEhtV4p4yt3K86A9zB57
 WYlt2vgV0JSAdQllk0OxQY+haJ+lP9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-RYRwSFwtM6SIz1yAZB9hHw-1; Tue, 18 Jan 2022 07:52:19 -0500
X-MC-Unique: RYRwSFwtM6SIz1yAZB9hHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6F31006AA5;
 Tue, 18 Jan 2022 12:52:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA1C3105B1EC;
 Tue, 18 Jan 2022 12:52:13 +0000 (UTC)
Date: Tue, 18 Jan 2022 12:52:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Message-ID: <Yea3+t4qtk4iB9jr@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com>
 <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jan 18, 2022 at 01:26:32PM +0100, Paolo Bonzini wrote:
> On 1/17/22 16:17, Mark Kanda wrote:
> > > 
> > > I agree except that I think this and StatsResults should be unions,
> > > even if it means running multiple query-stats commands.
> > 
> > IIUC, making StatsResults a union implies the filter is a required
> > argument (currently it is optional - omitting it dumps all VM and VCPU
> > stats). Just to confirm - we want the filter to be required?
> 
> Yeah, I think at least the "kind" (vcpu, vm, perhaps in the future block or
> net) should be mandatory.  If the caller doesn't know of a "kind", chances
> are it won't be able to understand what object the stats refer to, for
> example the vcpu "id" here:
> 
> { 'union': 'StatsResults',
>    'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
>    'discriminator': 'target',
>    'data': { 'vcpu': ['id': 'int'] }
> }
> 
> (which is another different between Daniel's proposal and mine; his just
> placed all vcpus into an array with no explicit id, if I understand
> correctly).

An explicit ID isn't strictly required, since the caller can assume
the results are ordered on CPU ID, so even if they gave a request
for a sparse subset of CPUs, the results can be interpreted.  None
the less having a vCPU id included is more friendly, so worth
having.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


