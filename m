Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD97404870
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:29:49 +0200 (CEST)
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHJU-0007e0-8X
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHIc-0006pv-RM
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHIW-00072P-TD
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183327;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cc/jxy7+//DCARbQzXLT+htA7O/y961unhjav93Y0yg=;
 b=f/d71zON4AgF0n4d6eL94pXkj2ClwgFiBf03+13WJ6f9sqDTMr3DuZpptHXGMOaa6k0kKk
 a9ZP1BITbYK+0BfI1s16YeIEsZJk/GBxBg+SSq8hCQymGUqhkmZkqrEYKfaiWBxG54IVxz
 +cofLom+1XuiWWcaFhpTjBs+mLDMdiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-TWYTzTWWOT6YTQ70pewE1g-1; Thu, 09 Sep 2021 06:28:36 -0400
X-MC-Unique: TWYTzTWWOT6YTQ70pewE1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F751006AAA;
 Thu,  9 Sep 2021 10:28:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2815B826;
 Thu,  9 Sep 2021 10:28:29 +0000 (UTC)
Date: Thu, 9 Sep 2021 11:28:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
Message-ID: <YTnhy/Wo5M1qVs1k@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:14AM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is experimental! The goal is to better limit the
> boundary of what code is considerated security critical, and
> what is less critical (but still important!).
> 
> This approach was quickly discussed few months ago with Markus
> then Daniel. Instead of classifying the code on a file path
> basis (see [1]), we insert (runtime) hints into the code
> (which survive code movement). Offending unsafe code can
> taint the global security policy. By default this policy
> is 'none': the current behavior. It can be changed on the
> command line to 'warn' to display warnings, and to 'strict'
> to prohibit QEMU running with a tainted policy.

Ok, so I infer that you based this idea on the "--compat-policy"
arg used to control behaviour wrt to deprecations.

With the deprecation support, the QAPI introspection data can
report deprecations for machines / CPUs (and in theory devices
later).  Libvirt records this deprecation info and can report
it to the user before even starting a guest, so they can avoid
using a deprecated device in the first place.  We also use this
info to mark a guest as tainted + deprecation at the libvirt
level and let mgmt apps query this status.

The --compat-policy support has been integrated into libvirt
but it is not something we expect real world deployments to
use - rather it is targeted as a testing framework.

Essentially I see the security reporting as needing to operate
in a pretty similar manner.

IOW, the reporting via QAPI introspetion is much more important
for libvirt and mgmt apps, than any custom cli arg / printfs
at the QEMU level.


In terms of QAPI design we currently have

   'deprecated': 'bool'

field against MachineInfo and CpuDefinitionInfo types.

it feels like we need

   'secure': 'bool'

field against the relevant types here too, though I think
maybe we might need to make it an optional field  to let
us distinguish lack of information, since it will take a
long time to annotate all areas. eg

   '*secure': 'bool'

 - not set  => no info available on security characteristics
 - true => device is considered secure wrt malicious guest
 - false => device is not considered secure wrt malicious guest


> As examples I started implementing unsafe code taint from
> 3 different pieces of code:
> - accelerators (KVM and Xen in allow-list)
> - block drivers (vvfat and parcial null-co in deny-list)
> - qdev (hobbyist devices regularly hit by fuzzer)
> 
> I don't want the security researchers to not fuzz QEMU unsafe
> areas, but I'd like to make it clearer what the community
> priority is (currently 47 opened issues on [3]).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


