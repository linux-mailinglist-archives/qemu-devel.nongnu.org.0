Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48B6A5F25
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5HH-0005TP-KM; Tue, 28 Feb 2023 14:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX5Gp-0005AO-I6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX5Gm-0001iZ-Oc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677611047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjUBRkG1QIPOAaE+2lIdiScIg93u2/Fob0eR0sE4UPA=;
 b=RQ/uo99ieAipruyxHXozX22sWlgZJLJYEgsYiWGfoxE56M011Bt7R/CHwWjsPcWrYMaQtS
 efp7Q1vkqE5CYeT20u6+5uKCgqc+LoAIkdTEIYrkoAfRkHNhsSUrdksfkYqtjUYK9Gv+NJ
 rDOYwVg3eK97PAVk0CTfUcjC1KWkHjM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-VbMSbUe6OGakuDBPnALt4g-1; Tue, 28 Feb 2023 14:04:05 -0500
X-MC-Unique: VbMSbUe6OGakuDBPnALt4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51AEA101A55E;
 Tue, 28 Feb 2023 19:04:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177A9111DCEC;
 Tue, 28 Feb 2023 19:04:00 +0000 (UTC)
Date: Tue, 28 Feb 2023 19:03:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, philmd@linaro.org, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org, mprivozn@redhat.com,
 yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
Message-ID: <Y/5QHonZyB+7vzEN@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cw1ipgg.fsf@toke.dk>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke Høiland-Jørgensen wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> Just to interject a note on this here: the skeleton code is mostly a
> convenience feature used to embed BPF programs into the calling binary.
> It is perfectly possible to just have the BPF object file itself reside
> directly in the file system and just use the regular libbpf APIs to load
> it. Some things get a bit more cumbersome (mostly setting values of
> global variables, if the BPF program uses those).
> 
> So the JSON example above could just be a regular compiled-from-clang
> BPF object file, and the management program can load that, inspect its
> contents using the libbpf APIs and pass the file descriptors on to Qemu.
> It's even possible to embed version information into this so that Qemu
> can check if it understands the format and bail out if it doesn't - just
> stick a version field in the configuration map as the first entry :)

If all you have is the BPF object file is it possible to interrogate
it to get a list of all the maps, and get FDs associated for them ?
I had a look at the libbpf API and wasn't sure about that, it seemed
like you had to know the required maps upfront ?  If it is possible
to auto-discover everything you need, soley from the BPF object file
as input, then just dealing with that in isolation would feel simpler.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


