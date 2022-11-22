Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26F633864
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPYX-0006ne-3h; Tue, 22 Nov 2022 04:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxPYP-0006nJ-Ps
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:26:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxPYO-00007M-3g
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669109214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5k8NwmDQPr/QBO7guK43+iPn1Tt6YESDXQ1aULjsQLE=;
 b=Br7d6uw5e1UGvKgJROFXMFW/jBv6E5qRzSZB+jnhmJwXb1eeXKXJM3ON6s+iaGtrNXwUmK
 ky5QTfY0tQhMiaxBoBMfH0RgVCZskPMoLvqqFwwMtDLb6WaQXtPSN2DQ42UUr4VaWQLm8T
 vq4taidwmdEtjgLZp7KKeSP4qc48r2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-2WbCuS9rOU2A8Mb8Ok7fBQ-1; Tue, 22 Nov 2022 04:26:53 -0500
X-MC-Unique: 2WbCuS9rOU2A8Mb8Ok7fBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 249F985A588;
 Tue, 22 Nov 2022 09:26:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522B740C6E16;
 Tue, 22 Nov 2022 09:26:51 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:26:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, prerna.saxena@nutanix.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
Message-ID: <Y3yV17Ty7bxb9UfT@redhat.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com>
 <Yt/MZiK3OuvQMRfF@redhat.com>
 <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
 <87sfmf84iy.fsf@pond.sub.org> <87r0xwtrw0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r0xwtrw0.fsf@secure.mitica>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21, 2022 at 01:26:55PM +0100, Juan Quintela wrote:
> Markus Armbruster <armbru@redhat.com> wrote:
> > Het Gala <het.gala@nutanix.com> writes:
> 
> 
> 
> Hi
> 
> >>>>   # Example:
> >>>>   #
> >>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> >>>> +# -> { "execute": "migrate",
> >>>> +#      "arguments": {
> >>>> +#          "uri": "tcp:0:4446",
> >>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
> >>>> +#                                   "destination-uri": "tcp:0:4480",
> >>>> +#                                   "multifd-channels": 4},
> >>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
> >>>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
> >>>> +#                                   "multifd-channels": 5} ] } }
> 
> Why would one put the source uri and destination uri on the command?
> It looks more complicated to me, but I guess there is a good reason.
> 
> >>>
> >>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
> >>> API wrt multifd - essentally the same data is now being set in two
> >>> different places. IMHO, we should declare the 'multifd' capability
> >>> and the 'multifd-chanels' parameter deprecated, since the information
> >>> they provide is totally redundant, if you're giving an explicit list
> >>> of channels to 'migrate'.
> >>
> >> Hi Daniel. Initially while brainstorming this idea for the first
> >> time, we also came up with the same thought of depricating the
> >> migrate
> >> API. But how will we achieve this now and how is it going to
> >> work. Is it like we will be making migate V2 APIs initially,
> >> integrate it and then
> >> depricate the old one? would be happy to get some pointers from your end.
> >
> > Migration maintainers, please advise.
> 
> I would put the old one in top of the new one, and call it a day.
> I really hate the old one, but I haven't had the time to think about a
> better one (nor I have had the time to look into this one).
> 
> The problem that I am seing here is that we are adding the number of
> multifd channels here, and we were trying to not add migration
> parameters into the migrate command.

The issue of migration parameters is a much bigger one - a lot of them
should never have existed, if QEMU had a proper migration wire protocol
that could do feature negotiation.

We need to replace the wire protocol as the priority, at which point
the QMP side becomes simpler as a result. Starting with the QMP side,
without addressing the wire protocol first will never give us a good
long term result.

I've written more about that in my reply to Het's other patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


