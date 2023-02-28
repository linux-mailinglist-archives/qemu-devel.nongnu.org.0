Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF546A5AC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0rH-0004nL-Ug; Tue, 28 Feb 2023 09:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX0rC-0004il-Su
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX0r9-00035H-90
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677594086;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CU9LDpJyQtxG+g3zhfogJUqXVLUroBmJJeMmoGU/csg=;
 b=W4xbNiPP/IOj5nqXQ4jzKEYhpVPzHOyKb9nrx1IASSisq6qp5iOBkrbzG861I60VXGehvT
 uuL+FCtGMfayIU/XqHRWlPhMTYs2721qzCCYdnyzSrk/a4XM50h03juGEPWxntl2+bLmup
 9itJGuG6qxZKawYQynTQLi7ZLsbepGw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-MOeisCixMWelHE8rFLiSZw-1; Tue, 28 Feb 2023 09:21:22 -0500
X-MC-Unique: MOeisCixMWelHE8rFLiSZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8255D1C04343;
 Tue, 28 Feb 2023 14:21:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A17240C6EC4;
 Tue, 28 Feb 2023 14:21:20 +0000 (UTC)
Date: Tue, 28 Feb 2023 14:21:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Message-ID: <Y/4N3br1nEAl4X9Q@redhat.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
 <20230228075511-mutt-send-email-mst@kernel.org>
 <Y/3/AJqXD4aDdtrP@redhat.com>
 <20230228091303-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228091303-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
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

On Tue, Feb 28, 2023 at 09:13:30AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 01:17:52PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Feb 28, 2023 at 07:56:14AM -0500, Michael S. Tsirkin wrote:
> > > On Sun, Jan 29, 2023 at 10:57:46AM +0800, zhenwei pi wrote:
> > > > Now we can use "query-stats" QMP command to query statistics of
> > > > crypto devices. (Originally this was designed to show statistics
> > > > by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
> > > > querying configuration info by "query-cryptodev", and querying
> > > > runtime performance info by "query-stats". This makes sense!)
> > > > 
> > > > Example:
> > > > ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
> > > >    "arguments": {"target": "cryptodev"} }' | jq
> > > > {
> > > >   "return": [
> > > >     {
> > > >       "provider": "cryptodev",
> > > >       "stats": [
> > > >         {
> > > >           "name": "asym-verify-bytes",
> > > >           "value": 7680
> > > >         },
> > > >         ...
> > > >         {
> > > >           "name": "asym-decrypt-ops",
> > > >           "value": 32
> > > >         },
> > > >         {
> > > >           "name": "asym-encrypt-ops",
> > > >           "value": 48
> > > >         }
> > > >       ],
> > > >       "qom-path": "/objects/cryptodev0" # support asym only
> > > >     },
> > > >     {
> > > >       "provider": "cryptodev",
> > > >       "stats": [
> > > >         {
> > > >           "name": "asym-verify-bytes",
> > > >           "value": 0
> > > >         },
> > > >         ...
> > > >         {
> > > >           "name": "sym-decrypt-bytes",
> > > >           "value": 5376
> > > >         },
> > > >         ...
> > > >       ],
> > > >       "qom-path": "/objects/cryptodev1" # support asym/sym
> > > >     }
> > > >   ],
> > > >   "id": "libvirt-422"
> > > > }
> > > > 
> > > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > 
> > > I assume since this has been out a long time and no
> > > comments by maintainers it's ok from QAPI POV.
> > 
> > I'm not the QAPI maintainer, but I think this worked out
> > pretty nicely compared to the previous versions of the
> > series which didn't use query-stats.. just a minor point
> > below.
> 
> Hmm applied already ... is this ok to fix with patch on top
> or do I have to revert?

Not a big deal. It'd be fine as a followup improvement if
zhenwei wants to submit a later cleanup.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


