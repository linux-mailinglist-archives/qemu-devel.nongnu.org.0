Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDB6A6EFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXO1S-0002QB-SH; Wed, 01 Mar 2023 10:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXO1M-0002Ps-Nu
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXO1K-0004JN-QG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677683130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAEN78H3UibrrHw4ahTTMOH+/Jvwvico4n92gQf4pW4=;
 b=hGvSOrwK1vC2GCOIDdtIrPgt0bajytOFSh2InkYu+PK2hxqAfbKl7vEDzCQXrXR/fhj1MP
 uB1SeTKrPU1wA8v1Lqb0EMyl9uvnJr9Fx1qrcSdH3TJi8XgZX5PiCSmOmUwZL/lhNzMTFa
 Ab2jQWRYiUHLOX8Mu824GV4PshxkCsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-9UjMKNmhPw6jRA6wawTHTA-1; Wed, 01 Mar 2023 10:05:27 -0500
X-MC-Unique: 9UjMKNmhPw6jRA6wawTHTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B34985D060;
 Wed,  1 Mar 2023 15:05:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 120E540CF8EC;
 Wed,  1 Mar 2023 15:05:20 +0000 (UTC)
Date: Wed, 1 Mar 2023 15:05:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, philmd@linaro.org, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org, mprivozn@redhat.com,
 yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
Message-ID: <Y/9prSBDTQoL7yn5@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com> <87ttz5h1mj.fsf@toke.dk>
 <Y/8bQjj8VZ/7qal1@redhat.com> <871qm8h69w.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qm8h69w.fsf@toke.dk>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Mar 01, 2023 at 03:53:47PM +0100, Toke Høiland-Jørgensen wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Feb 28, 2023 at 11:21:56PM +0100, Toke Høiland-Jørgensen wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >> > On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke Høiland-Jørgensen wrote:
> >> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> >> 
> >> >> Just to interject a note on this here: the skeleton code is mostly a
> >> >> convenience feature used to embed BPF programs into the calling binary.
> >> >> It is perfectly possible to just have the BPF object file itself reside
> >> >> directly in the file system and just use the regular libbpf APIs to load
> >> >> it. Some things get a bit more cumbersome (mostly setting values of
> >> >> global variables, if the BPF program uses those).
> >> >> 
> >> >> So the JSON example above could just be a regular compiled-from-clang
> >> >> BPF object file, and the management program can load that, inspect its
> >> >> contents using the libbpf APIs and pass the file descriptors on to Qemu.
> >> >> It's even possible to embed version information into this so that Qemu
> >> >> can check if it understands the format and bail out if it doesn't - just
> >> >> stick a version field in the configuration map as the first entry :)
> >> >
> >> > If all you have is the BPF object file is it possible to interrogate
> >> > it to get a list of all the maps, and get FDs associated for them ?
> >> > I had a look at the libbpf API and wasn't sure about that, it seemed
> >> > like you had to know the required maps upfront ?  If it is possible
> >> > to auto-discover everything you need, soley from the BPF object file
> >> > as input, then just dealing with that in isolation would feel simpler.
> >> 
> >> It is. You load the object file, and bpf_object__for_each_map() lets you
> >> discover which maps it contains, with the different bpf_map__*() APIs
> >> telling you the properties of that map (and you can modify them too
> >> before loading the object if needed).
> >> 
> >> The only thing that's not in the object file is any initial data you
> >> want to put into the map(s). But except for read-only maps that can be
> >> added by userspace after loading the maps, so you could just let Qemu do
> >> that...
> >> 
> >> > It occurrs to me that exposing the BPF program as data rather than
> >> > via binary will make more practical to integrate this into KubeVirt's
> >> > architecture. In their deployment setup both QEMU and libvirt are
> >> > running unprivileged inside a container. For any advanced nmetworking
> >> > a completely separate component creates the TAP device and passes it
> >> > into the container running QEMU. I don't think that the separate
> >> > precisely matched helper binary would be something they can use, but
> >> > it might be possible to expose a data file providing the BPF program
> >> > blob and describing its maps.
> >> 
> >> Well, "a data file providing the BPF program blob and describing its
> >> maps" is basically what a BPF .o file is. It just happens to be encoded
> >> in ELF format :)
> >> 
> >> You can embed it into some other data structure and have libbpf load it
> >> from a blob in memory as well as from the filesystem, though; that is
> >> basically what the skeleton file does (notice the big character string
> >> at the end, that's just the original .o file contents).
> >
> > Ok, in that case I'm really wondering why any of this helper program
> > stuff was proposed. I recall the rationale was that it was impossible
> > for an external program to load the BPF object on behalf of QEMU,
> > because it would not know how todo that without QEMU specific
> > knowledge.
> 
> I'm not sure either. Was there some bits that initially needed to be set
> before the program was loaded (read-only maps or something)? Also,
> upstream does encourage the use of skeletons for embedding into
> applications, so it's not an unreasonable thing to start with if you
> don't have the kind of deployment constraints that Qemu does in this
> case.
> 
> > It looks like we can simply expose the BPF object blob to mgmt apps
> > directly and get rid of this helper program entirely.
> 
> I believe so, yes. You'd still need to be sure that the BPF object file
> itself comes from a trusted place, but hopefully it should be enough to
> load it from a known filesystem path? (Sorry if this is a stupid
> question, I only have a fuzzy idea of how all the pieces fit together
> here).

It could be from a well known location on the filesystem, but might
be better to make it possible to query it from QMP, which is mostly
safe *provided* you've not yet started guest CPUs running. It could
be queried at startup and then cached for future use.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


