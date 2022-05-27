Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C2535E74
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 12:42:44 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuXQY-0002A1-QB
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 06:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuXJt-0007TQ-92
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:35:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuXJr-0007NJ-HM
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:35:48 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 004411F8B5;
 Fri, 27 May 2022 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653647746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xJVzWWdLYrbNAJlrhnKYf3rkOMf0OHT6YTm5hz7htg=;
 b=wyNuZnXgw4OKpTukKyWy7zhDkDHLSIGuEmOCe+mIFZMk08bHRHyAQI1BnCrIAyQ+wcKEFU
 c5hXVGxXn4swHlfvgi85pbRXytyc+T4/1IjzYRq3VFIDB78klG04kmEQLzmHKTw017xET5
 NKhHpgAh3dG32Lt2u85Qp+DJdnKd+eM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653647746;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xJVzWWdLYrbNAJlrhnKYf3rkOMf0OHT6YTm5hz7htg=;
 b=vx+N+33NQqrRzLYEQ+PEJWhpo2U8mg8KbW2i6VzKP+AKtVgkykmLl2Up2/5bmoUqR+2AAR
 4+kCqmGIIJQCl6Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6A8913A84;
 Fri, 27 May 2022 10:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NfydJoGpkGKqcAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 27 May 2022 10:35:45 +0000
Subject: Re: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
To: Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220527094758.604621-1-berrange@redhat.com>
 <YpCl9/EMwenZUxJs@angien.pipo.sk>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <94610f98-9075-83f5-3d4f-b745467171da@suse.de>
Date: Fri, 27 May 2022 12:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YpCl9/EMwenZUxJs@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/22 12:20 PM, Peter Krempa wrote:
> On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrangé wrote:
>> Libvirt provides QMP passthrough APIs for the QEMU driver and these are
>> exposed in virsh. It is not especially pleasant, however, using the raw
>> QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
>> exposes a human friendly interactive shell. It is not possible to use
>> this with libvirt managed guest, however, since only one client can
>> attach to he QMP socket at any point in time.
>>
>> The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
>> socket and listens for incoming client connections, speaking QMP on
>> the connected socket. It will forward any QMP commands received onto
>> the running libvirt QEMU guest, and forward any replies back to the
>> QMP client.
>>
>>   $ virsh start demo
>>   $ virt-qmp-proxy demo demo.qmp &
>>   $ qmp-shell demo.qmp
>>   Welcome to the QMP low-level shell!
>>   Connected to QEMU 6.2.0
>>
>>   (QEMU) query-kvm
>>   {
>>       "return": {
>>           "enabled": true,
>>           "present": true
>>       }
>>   }
>>
>> Note this tool of course has the same risks as the raw libvirt
>> QMP passthrough. It is safe to run query commands to fetch information
>> but commands which change the QEMU state risk disrupting libvirt's
>> management of QEMU, potentially resulting in data loss/corruption in
>> the worst case.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>
>> CC'ing QEMU since this is likely of interest to maintainers and users
>> who work with QEMU and libvirt
>>
>> Note this impl is fairly crude in that it assumes it is receiving
>> the QMP commands linewise one at a time. None the less it is good
>> enough to work with qmp-shell already, so I figured it was worth
>> exposing to the world. It also lacks support for forwarding events
>> back to the QMP client.
> 
> I originally wanted to teach the qemu tools to work with libvirt
> directly similarly how 'scripts/render_block_graph.py' from the qemu
> tree already does but I guess this is also an option.
> 
> This is an option too albeit a bit more complex to set up, but on the
> other hand a bit more universal.
> 
> I'll have a look at the code a bit later.
> 

Would have found it useful, at the time I wrote the multifd save series I ended up just scripting around virsh qemu-monitor-command from either bash or C.

One challenge I had to face was, when doing fd migration doing

"execute": "getfd", "arguments": {"fdname":"migrate"}

in that case we have to use the --pass-fds=N option to pass the FD.

Does the virt-qmp-proxy tool consider the passing of FDs issue?

Thanks,

Claudio

