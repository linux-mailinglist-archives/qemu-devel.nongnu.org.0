Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1342DC791
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:14:22 +0100 (CET)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpdBk-0001T0-Ir
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpd9j-0000Pp-HD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpd9h-0007SH-Cx
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608149532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1Xqilo+jWBzPgBfHHfDszkEDNNBJlhxKe1dtlbxAUE=;
 b=V1Hf+QW7Onv+pFJ/49f/ArewA511hPmFHSBAKZmWVO+2un/MGH9Zn97jojikMZ4ooZ90Mi
 UakuHNS6kVI6ofErM3CsksuXDw1M0qQRCNMisU63YrbepuBOWSmT/mhm9t6JQqfdbA3kMI
 sK9cUodqFWHx3Obc6zZHh3dTEj1ZysM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-_aBPOj3xPOCNDclKLRD9Yw-1; Wed, 16 Dec 2020 15:12:11 -0500
X-MC-Unique: _aBPOj3xPOCNDclKLRD9Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63BA280400C;
 Wed, 16 Dec 2020 20:12:08 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23D9C5D722;
 Wed, 16 Dec 2020 20:12:03 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:11:57 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wenchao Wang <wenchao.wang@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v12 00/23] i386 cleanup PART 1
Message-ID: <160814940890.3729533.4692387452097837982.b4-ty@redhat.com>
References: <20201212155530.23098-1-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201212155530.23098-1-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Dario Faggioli <dfaggioli@suse.com>, Peter Xu <peterx@redhat.com>,
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 16:55:07 +0100, Claudio Fontana wrote:
> The series has been split into two separate parts,
> and this is PART 1.
> 
> v11 -> v12:
> 
> * "cpu: Move synchronize_from_tb() to tcg_ops":
>   removed review tags, as there is currently a bunch of conflicting
>   requirements (Eduardo, Richard, Philippe).
> 
> [...]

Queued the following:

[01/23] i386: move kvm accel files into kvm/
[02/23] i386: move whpx accel files into whpx/
[03/23] i386: move hax accel files into hax/
[04/23] i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
[05/23] i386: move TCG accel files into tcg/
[06/23] i386: move cpu dump out of helper.c into cpu-dump.c
[07/23] i386: move TCG cpu class initialization to tcg/
[08/23] i386: tcg: remove inline from cpu_load_eflags
[09/23] tcg: cpu_exec_{enter,exit} helpers
[10/23] tcg: make CPUClass.cpu_exec_* optional
[11/23] tcg: Make CPUClass.debug_excp_handler optional
[12/23] cpu: Remove unnecessary noop methods

Thanks!

-- 
Eduardo


