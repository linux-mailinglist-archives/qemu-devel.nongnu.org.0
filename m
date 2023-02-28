Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30FC6A5B30
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:58:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1Qz-0007lw-1k; Tue, 28 Feb 2023 09:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX1Qw-0007k2-7T
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX1Qu-0002g3-GC
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677596303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1upPB8cu6Sxg4OEs1R8fP2K3OBE37CH5OYZwMFgkmE=;
 b=c8ks9mmkkISCZkaaJZTuEbfrNk5mo3hLTkY7SdrIys+syrYgyVRJ36mUwgbGvRO74QNOwk
 OIcoaTIKwxHJ1tkHPXkDc5SBwF2nPznnjvnf+caoFMhI12Yn3XreO5WUsbLv5Cu8hcLhOX
 7sv7M3IYSf44BekvjETsvDb3ysdbtZw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-OQdiJILFP92rDY_kBcPueg-1; Tue, 28 Feb 2023 09:58:21 -0500
X-MC-Unique: OQdiJILFP92rDY_kBcPueg-1
Received: by mail-wr1-f69.google.com with SMTP id
 k6-20020adfc706000000b002c716981a1fso1634864wrg.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677596300;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1upPB8cu6Sxg4OEs1R8fP2K3OBE37CH5OYZwMFgkmE=;
 b=SBaQaIS5leEAu57EJ5VZMILgoGnHLK9TKcs8mkQ+ITWwjoYT7cY4rHU6aJsuXEUvg1
 wchfrj9lGkUOTi08RUMoxCG6w+fXLrwv31JKB0hH+7qwdppgFPHdHzH5WgeDM9UeAXji
 JY9AkXJYiemZXPoOM4CUudh6FKJNwNg3vgNJDGYqOmMFOMfK+GUY5rurvy4fa+cHv0jm
 1u23qXqjWX36m8IkPkQhLsPbRKUlRyPX+TRnMfUMv+AywOdseXCOWFRQtCNGWZXjRElp
 EuMOh64zz8E4rI1lHVInNajUiFNYyIY6QsFhTOkF+Kv2drKjCPWDuUc9hqyKn/P8C6lO
 CIgQ==
X-Gm-Message-State: AO0yUKUByJzi8YiWMGf3DOGCk4kbqZUq2D0SvYJAJdN8wZcBYBAiCDjr
 o6gBz3Gw14SAlO0LEA2pf5P7mUl9BM2wibL1PpaKtCXAGLtOrrZsKzNj63dpghw13dXGJtO1mhQ
 NI3PUqOnj1UlGLTc=
X-Received: by 2002:a05:600c:3506:b0:3ea:d620:579b with SMTP id
 h6-20020a05600c350600b003ead620579bmr2445998wmq.0.1677596300508; 
 Tue, 28 Feb 2023 06:58:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9nbIa2XfKCcvd1HjvldqK+iepKXEKEs4GCbxYOTNGTNR87ANjO4Z4z/2/ey7gbmiFhUbkrFw==
X-Received: by 2002:a05:600c:3506:b0:3ea:d620:579b with SMTP id
 h6-20020a05600c350600b003ead620579bmr2445987wmq.0.1677596300297; 
 Tue, 28 Feb 2023 06:58:20 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4521000000b002c573cff730sm10023222wra.68.2023.02.28.06.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 06:58:19 -0800 (PST)
Date: Tue, 28 Feb 2023 09:58:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Message-ID: <20230228095807-mutt-send-email-mst@kernel.org>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
 <20230228075511-mutt-send-email-mst@kernel.org>
 <Y/3/AJqXD4aDdtrP@redhat.com>
 <20230228091303-mutt-send-email-mst@kernel.org>
 <Y/4N3br1nEAl4X9Q@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/4N3br1nEAl4X9Q@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 02:21:17PM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 09:13:30AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 01:17:52PM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Feb 28, 2023 at 07:56:14AM -0500, Michael S. Tsirkin wrote:
> > > > On Sun, Jan 29, 2023 at 10:57:46AM +0800, zhenwei pi wrote:
> > > > > Now we can use "query-stats" QMP command to query statistics of
> > > > > crypto devices. (Originally this was designed to show statistics
> > > > > by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
> > > > > querying configuration info by "query-cryptodev", and querying
> > > > > runtime performance info by "query-stats". This makes sense!)
> > > > > 
> > > > > Example:
> > > > > ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
> > > > >    "arguments": {"target": "cryptodev"} }' | jq
> > > > > {
> > > > >   "return": [
> > > > >     {
> > > > >       "provider": "cryptodev",
> > > > >       "stats": [
> > > > >         {
> > > > >           "name": "asym-verify-bytes",
> > > > >           "value": 7680
> > > > >         },
> > > > >         ...
> > > > >         {
> > > > >           "name": "asym-decrypt-ops",
> > > > >           "value": 32
> > > > >         },
> > > > >         {
> > > > >           "name": "asym-encrypt-ops",
> > > > >           "value": 48
> > > > >         }
> > > > >       ],
> > > > >       "qom-path": "/objects/cryptodev0" # support asym only
> > > > >     },
> > > > >     {
> > > > >       "provider": "cryptodev",
> > > > >       "stats": [
> > > > >         {
> > > > >           "name": "asym-verify-bytes",
> > > > >           "value": 0
> > > > >         },
> > > > >         ...
> > > > >         {
> > > > >           "name": "sym-decrypt-bytes",
> > > > >           "value": 5376
> > > > >         },
> > > > >         ...
> > > > >       ],
> > > > >       "qom-path": "/objects/cryptodev1" # support asym/sym
> > > > >     }
> > > > >   ],
> > > > >   "id": "libvirt-422"
> > > > > }
> > > > > 
> > > > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > 
> > > > I assume since this has been out a long time and no
> > > > comments by maintainers it's ok from QAPI POV.
> > > 
> > > I'm not the QAPI maintainer, but I think this worked out
> > > pretty nicely compared to the previous versions of the
> > > series which didn't use query-stats.. just a minor point
> > > below.
> > 
> > Hmm applied already ... is this ok to fix with patch on top
> > or do I have to revert?
> 
> Not a big deal. It'd be fine as a followup improvement if
> zhenwei wants to submit a later cleanup.
> 
> With regards,
> Daniel

zhenwei can you confirm pls?

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


