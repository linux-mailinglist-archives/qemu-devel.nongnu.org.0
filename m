Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3D54E021
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:39:15 +0200 (CEST)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nqE-0006ho-B0
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1nOP-0001PM-Hq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1nOL-0005EC-Lh
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655377823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QlLxCryFIpF1qb4DTCA06gOEsMSbppHmX4jXnJUUtuA=;
 b=i5uMJ85Ks7gkFEGxWpRLCRskcam1YU0209N9D8idU4MCJwoSOrjX2WHnJaj15GH/1pI0zR
 4lRXRtUS20851R5yro4pVqc3IN+doFYmIMiIg9DOZ4+BMfmyaToNdEqmCBRLPSNcsPL/Hg
 ff4z/v6y53ab27qbXgoYgRjKd1hUSXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-KtCWjdfLP_y6kjJMDoXy5w-1; Thu, 16 Jun 2022 07:10:20 -0400
X-MC-Unique: KtCWjdfLP_y6kjJMDoXy5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BAC61C06905;
 Thu, 16 Jun 2022 11:10:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 851F840CFD0A;
 Thu, 16 Jun 2022 11:10:14 +0000 (UTC)
Date: Thu, 16 Jun 2022 12:10:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 06/39] cpr: reboot mode
Message-ID: <YqsPk3EH60Ud/FP/@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-7-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1655304746-102776-7-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 07:51:53AM -0700, Steve Sistare wrote:
> Provide the cpr-save and cpr-load functions for live update.  These save and
> restore VM state, with minimal guest pause time, so that qemu may be updated
> to a new version in between.
> 
> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
> any type of guest image and block device, but the caller must not modify
> guest block devices between cpr-save and cpr-load.
> 
> cpr-save supports several modes, the first of which is reboot. In this mode
> the caller invokes cpr-save and then terminates qemu.  The caller may then
> update the host kernel and system software and reboot.  The caller resumes
> the guest by running qemu with the same arguments as the original process
> and invoking cpr-load.  To use this mode, guest ram must be mapped to a
> persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.
> 
> The reboot mode supports vfio devices if the caller first suspends the
> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
> guest drivers' suspend methods flush outstanding requests and re-initialize
> the devices, and thus there is no device state to save and restore.
> 
> cpr-load loads state from the file.  If the VM was running at cpr-save time
> then VM execution resumes.  If the VM was suspended at cpr-save time, then
> the caller must issue a system_wakeup command to resume.
> 
> cpr-save syntax:
>   { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>   { 'command': 'cpr-save', 'data': { 'filename': 'str', 'mode': 'CprMode' }}
> 
> cpr-load syntax:
>   { 'command': 'cpr-load', 'data': { 'filename': 'str', 'mode': 'CprMode' }}

I'm still a little unsure if this direction for QAPI exposure is the
best, or whether we should instead leverage the migration commands.

I particularly concerned that we might regret having an API that
is designed only around storage in local files/blockdevs. The
migration layer has flexibility to use many protocols which has
been useful in the past to be able to offload work to an external
process. For example, libvirt uses migrate-to-fd so it can use
a helper that adds O_DIRECT support such that we avoid trashing
the host I/O cache for save/restore.

At the same time though, the migrate APIs don't currently support
a plain "file" protocol. This was because historically we needed
the QEMUFile to support O_NONBLOCK and this fails with plain
files or block devices, so QEMU threads could get blocked. For
the save side this doesn't matter so much, as QEMU now has the
outgoing migrate channels in blocking mode, only the incoming
side use non-blocking.  We could add a plain "file" protocol
to migration if we clearly document its limitations, and indeed
I've suggested we do that for another unrelated bit of work
for libvirts VM save/restore functionality.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


