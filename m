Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7045F25B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:46:41 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeMy-0001vk-CT
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:46:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqeLK-0000kW-P5
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:44:58 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqeLJ-0004pE-7Z
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:44:58 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2199A1FC9E;
 Fri, 26 Nov 2021 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637945096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQQHVgjEH2UODq9WpKKJOd2hvQMyujKF6kDj42lvqJM=;
 b=ZqbS7GvdrtTNlXWSHNMPH8hwPK6v2MGanfxa/M7osoCgcvn/D585MW+avGHitha+1pKWpu
 rRlwDr+fP6yQ0MK2QLrUT+EBmoXp4oY5MYHvR8VQodV+iRYaIIuQcxFeaaFT2iqzKhSLnD
 SrhF3jtanGS3rNL3RYU1gE+JKrc09vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637945096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQQHVgjEH2UODq9WpKKJOd2hvQMyujKF6kDj42lvqJM=;
 b=K2sOsFOnUiMSUgg7YmX11JqdAwrRtjzmpINRSPkX1VQ2Q18YtDVWQ8TuX2UdthHYnvEd2R
 6MeoFEPb6RDLigDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9FB113C69;
 Fri, 26 Nov 2021 16:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GEniNwcPoWFLDQAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 26 Nov 2021 16:44:55 +0000
Subject: Re: [PATCH 2/2] migration: Set the socket backlog number to reduce
 the chance of live migration failure
To: quintela@redhat.com
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-3-lizhang@suse.de> <87ilweg9ms.fsf@secure.mitica>
From: Li Zhang <lizhang@suse.de>
Message-ID: <27a7740c-fdb0-5025-85c1-d75a4cf1408b@suse.de>
Date: Fri, 26 Nov 2021 17:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87ilweg9ms.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/26/21 5:32 PM, Juan Quintela wrote:
> Li Zhang <lizhang@suse.de> wrote:
>> When creating the guest on destination with -incoming ip:port in QEMU command line,
>> the source code that sets the backlog number as the same as multifd channels doesn't
>> get called. So the number of backlog is always 1. It's very easy to cause live migration
>> failure, so a bigger number is preferred to reduce the chance of the failure.
>>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
>> ---
>>   migration/socket.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 05705a32d8..398d4c10fa 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -152,7 +152,7 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>>       QIONetListener *listener = qio_net_listener_new();
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>>       size_t i;
>> -    int num = 1;
>> +    int num = 16;
>>   
>>       qio_net_listener_set_name(listener, "migration-socket-listener");
> Here, the right answer is to use -incoming defer.

Ok, thanks a lot.


>
> Later, Juan.
>
>

