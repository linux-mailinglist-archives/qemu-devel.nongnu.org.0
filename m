Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F366DB8E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjaF-0005Vn-R4; Tue, 17 Jan 2023 05:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pHjaE-0005Vd-Gd
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:52:50 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pHjaC-0003IT-TH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:52:50 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C1A568508;
 Tue, 17 Jan 2023 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673952765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOPZztS70itdocNSEx8BOAI8QdoLDpeP6qvrJuQjaIw=;
 b=BBIXl5nIBOm7wf3G+zmM5i79LUqkd1EaUx6vv29ZBPPcKo2K9bBLUaMZX4OUcWz2CInogg
 EBMzfyA95baj5U6sEK9Q2E6P+o5M6KMmAXrDnCV0+1JHTf/A3XpR4pRgBQadgMMnoFe7OZ
 eLhdZc18sVGANM0ejaW7N8S6/WU+gmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673952765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOPZztS70itdocNSEx8BOAI8QdoLDpeP6qvrJuQjaIw=;
 b=ykJx7yIliG+suV+nWEo2yzxKRnmldZKWRhV7kw0c5hRqi5SAwJDWVU9Dlh4szoaNzxChDK
 FcB0/Xp5hd0P1LCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00F8B1390C;
 Tue, 17 Jan 2023 10:52:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OkE5Ovx9xmO3KQAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 17 Jan 2023 10:52:44 +0000
Message-ID: <114351ed-2676-d2d1-d6a6-2eb3732d1c06@suse.de>
Date: Tue, 17 Jan 2023 11:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/5] migration: Modified 'migrate' QAPI command for
 migration
Content-Language: en-US
To: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com
References: <20221226053329.157905-1-het.gala@nutanix.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221226053329.157905-1-het.gala@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

On 12/26/22 06:33, Het Gala wrote:
> Current QAPI 'migrate' command design (for initiating a migration
> stream) contains information regarding different migrate transport mechanism
> (tcp / unix / exec), dest-host IP address, and binding port number in form of
> a string. Thus the design does seem to have some design issues. Some of the
> issues, stated below are:
> 
> 1. Use of string URIs is a data encoding scheme within a data encoding scheme.
>    QEMU code should directly be able to work with the results from QAPI,
>    without resorting to do a second level of parsing (eg. socket_parse()).
> 2. For features / parameters related to migration, the migration tunables needs
>    to be defined and updated upfront. For example, 'migrate-set-capability'
>    and 'migrate-set-parameter' is required to enable multifd capability and
>    multifd-number of channels respectively. Instead, 'Multifd-channels' can
>    directly be represented as a single additional parameter to 'migrate'
>    QAPI. 'migrate-set-capability' and 'migrate-set-parameter' commands could
>    be used for runtime tunables that need setting after migration has already
>    started.

Is efficient and parallel migration to file of large VMs in scope for this design?

Thanks,

Claudio

> 
> The current patchset focuses on solving the first problem of multi-level
> encoding of URIs. The patch defines 'migrate' command as a QAPI discriminated
> union for the various transport backends (like socket, exec and rdma), and on
> basis of transport backends, different migration parameters are defined.
> 
> (uri) string -->  (channel) Channel-type
>                             Transport-type
>                             Migration parameters based on transport type
> 
> -----------------------------------------------------------------------------
> 
> Author Het Gala (5):
>   migration: Updated QAPI format for 'migrate' qemu monitor command
>   migration: HMP side changes for modified 'migrate' QAPI design
>   migration: Avoid multiple parsing of uri in migration code flow
>   migration: Modified 'migrate-incoming' QAPI and HMP side changes on
>     the destination interface.
>   migration: Established connection for listener sockets on the dest
>     interface
> 
>  migration/migration.c | 133 +++++++++++++++++++++++++++++----------
>  migration/socket.c    |  31 +--------
>  migration/socket.h    |   5 +-
>  monitor/hmp-cmds.c    | 101 ++++++++++++++++++++++++++++-
>  qapi/migration.json   | 143 ++++++++++++++++++++++++++++++++++++++++--
>  softmmu/vl.c          |   2 +-
>  6 files changed, 344 insertions(+), 71 deletions(-)
> 


