Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDC266173
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 16:45:02 +0200 (CEST)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGkIO-0002TH-Vs
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 10:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kGkH6-0001xK-Kp
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:43:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21898
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kGkH4-0006Z7-Pa
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599835417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8aKHl/atPnj0egRNLG62BWpdHmSA92QkHp8EVAmiLo=;
 b=NuEHQoYb0DsdcKN9WWRfqopCSx6f80FQTmgadI/WxtWqOYNdFpJMU9ab4wFlj4f5Ehgggq
 e2hXZXeE+2gHbJxOj9CxgqQNeEB/DRFGFGlQWTjmu3P2V41riJMXQYnLHxHV9PGCVRHdoC
 tAwGfH7rBe8ptqT1aYr31eLDUV8WkVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-s1jUkcK9N-WQ1EvFshN0xA-1; Fri, 11 Sep 2020 10:43:34 -0400
X-MC-Unique: s1jUkcK9N-WQ1EvFshN0xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8991D8064BF;
 Fri, 11 Sep 2020 14:43:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B863D5C1BD;
 Fri, 11 Sep 2020 14:43:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1664A113865F; Fri, 11 Sep 2020 16:43:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 07/14] block/blklogwrites: drop error propagation
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
 <20200909185930.26524-8-vsementsov@virtuozzo.com>
 <20200910192440.695b8e81@bahia.lan>
 <878sdghoox.fsf@dusky.pond.sub.org>
 <87r1r8g9s2.fsf@dusky.pond.sub.org>
 <20200911081932.666d246f@bahia.lan>
Date: Fri, 11 Sep 2020 16:43:27 +0200
In-Reply-To: <20200911081932.666d246f@bahia.lan> (Greg Kurz's message of "Fri, 
 11 Sep 2020 08:19:32 +0200")
Message-ID: <87wo10cr1s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 09:43:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 berto@igalia.com, pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> On Fri, 11 Sep 2020 07:30:37 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
[...]
>> No, the patch is okay as is.
>> 
>> Dumbing it down to keep it simple would also be okay.
>> 
>
> What about Ari's proposal to add ERRP_GUARD() and check errors
> with "if (*errp)" like we do for void functions ?

Up to the maintainer.  I prefer this patch.

>> Regarding the proposed assertion: do we protect similar conversions from
>> over-wide negative errno int elsewhere?
>> 
>
> We do protect int64_t->int conversions in a few places, eg.
> qcow2_write_snapshots() or qemu_spice_create_host_primary(),
> but I couldn't find one about a negarive errno.

Then I'd not protect it here, either.

>> >>>                  goto fail_log;
>> >>>              }
>> >>>  
>> >>> +            s->cur_log_sector = cur_log_sector;
>> >>>              s->nr_entries = le64_to_cpu(log_sb.nr_entries);
>> >>>          }
>> >>>      } else {
>> 


