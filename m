Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127A67B256
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 13:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeYc-0006If-MP; Wed, 25 Jan 2023 07:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKeYN-0006G6-Rh
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKeYL-000641-Pz
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674648416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omGGq7yf3or3TaEGx16425fzmpLs03Xxgkc7ESBESP4=;
 b=WidbKTSs8M3+gUCVP64Sxf2rD9MDUYWQtPbmxx0kSkdfiwz0GJ+Y4tjVfFIG5tS+ReDqac
 U43aoqnfZeqyQGnaZAKqd46WxbiiOHvOFHyvuyqW/RaTAtfj7T9bwvHAo5Wo69mwr9oly3
 /UMDNOiFq0FwyLozUG3w2A5kAPzyDtU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-WAGVA18NP6-upfxmSHY5KA-1; Wed, 25 Jan 2023 07:06:52 -0500
X-MC-Unique: WAGVA18NP6-upfxmSHY5KA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5361B801779;
 Wed, 25 Jan 2023 12:06:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D3D492C14;
 Wed, 25 Jan 2023 12:06:51 +0000 (UTC)
Date: Wed, 25 Jan 2023 12:06:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Message-ID: <Y9EbWeQAwTIaSq92@redhat.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
 <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
 <Y85rVoXhR5skLVOz@redhat.com>
 <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
 <Y855BSwizi0n+w7r@redhat.com>
 <a1ce59ee-98ef-eb77-7a46-21cbbe73fd07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1ce59ee-98ef-eb77-7a46-21cbbe73fd07@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Jan 25, 2023 at 12:06:40PM +0100, Thomas Huth wrote:
> On 23/01/2023 13.09, Daniel P. Berrangé wrote:
> > On Mon, Jan 23, 2023 at 01:05:45PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 23/1/23 12:11, Daniel P. Berrangé wrote:
> > > > On Mon, Jan 23, 2023 at 10:20:29AM +0100, Philippe Mathieu-Daudé wrote:
> > > > > On 23/1/23 09:39, Thomas Huth wrote:
> > > > > > From: Daniel P. Berrangé <berrange@redhat.com>
> > > > > > 
> > > > > > Way back in QEMU 4.0, the -audiodev command line option was introduced
> > > > > > for configuring audio backends. This CLI option does not use QemuOpts
> > > > > > so it is not visible for introspection in 'query-command-line-options',
> > > > > > instead using the QAPI Audiodev type.  Unfortunately there is also no
> > > > > > QMP command that uses the Audiodev type, so it is not introspectable
> > > > > > with 'query-qmp-schema' either.
> > > > > > 
> > > > > > This introduces a 'query-audiodev' command that simply reflects back
> > > > > > the list of configured -audiodev command line options. This alone is
> > > > > > maybe not very useful by itself, but it makes Audiodev introspectable
> > > > > > via 'query-qmp-schema', so that libvirt (and other upper layer tools)
> > > > > > can discover the available audiodevs.
> > > > > > 
> > > > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > > > [thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
> > > > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > > > ---
> > > > > >     qapi/audio.json | 13 +++++++++++++
> > > > > >     audio/audio.c   | 12 ++++++++++++
> > > > > >     2 files changed, 25 insertions(+)
> > > > > > 
> > > > > > diff --git a/qapi/audio.json b/qapi/audio.json
> > > > > > index 1e0a24bdfc..c7aafa2763 100644
> > > > > > --- a/qapi/audio.json
> > > > > > +++ b/qapi/audio.json
> > > > > > @@ -443,3 +443,16 @@
> > > > > >         'sndio':     'AudiodevSndioOptions',
> > > > > >         'spice':     'AudiodevGenericOptions',
> > > > > >         'wav':       'AudiodevWavOptions' } }
> > > > > > +
> > > > > > +##
> > > > > > +# @query-audiodevs:
> > > > > > +#
> > > > > > +# Returns information about audiodev configuration
> > > > > 
> > > > > Maybe clearer as 'audio backends'?
> > > > > 
> > > > > So similarly, wouldn't be clearer to name this command
> > > > > 'query-audio-backends'? Otherwise we need to go read QEMU
> > > > > source to understand what is 'audiodevs'.
> > > > 
> > > > The command line parameter is called '-audiodev' and this
> > > > query-audiodevs command reports the same data, so that
> > > > looks easy enough to understand IMHO.
> 
> Should we maybe use a "x-" prefix here if we feel not certain enough about
> this command yet? ... that would still enable the Audiodev part in the qapi
> schema, but give us the flexibility to rename or drop it later in case there
> is some better way to enable the Audiodevs in the schema?

IMHO there's no reason to add an 'x-' prefix. Even if we found a better
way to detect existance of Audiodev backend types, I think query-audiodev
is still conceptually a useful command for interogating QEMU's config.
To get to our goal of a 100% QMP based replacement for the CLI, we want
to have QMP commands for adding, removing and querying every backend
config (audiodev, device, object, chardev, netdev, etc). This command
addresses one of those gaps for audiodevs

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


