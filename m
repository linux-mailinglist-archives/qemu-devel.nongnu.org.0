Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430E6D49F2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:42:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLN9-0001LF-RF; Mon, 03 Apr 2023 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pjLN8-0001L6-8W
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:41:26 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pjLN6-0000Ey-Bw
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:41:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB92E21E09;
 Mon,  3 Apr 2023 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680532881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvmpSRbYqVm/pFxZ04J3g3ft05Ip+L0bQ85+8lXUMqY=;
 b=iXylfkO9D/GDVQXpZACzHtyPR3KPYBtrIRrC9IWbYMz9bb31P8p1aOQF82u9DAKOj3PJ62
 Ic2VLjWoecsanU8ARp5wjx16rP08Ehg0C89dc1XyS1A495gEPVtkFHPVujh62WPmtdqI3O
 +rmodnQ88OUzaZSFyT+2W7PHXyVvCVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680532881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvmpSRbYqVm/pFxZ04J3g3ft05Ip+L0bQ85+8lXUMqY=;
 b=NVNlflGDV9DtcJuVO0wIvC2gVn2BHjOX/972SdmLwKbNEN1I2s7/ugKsbTXCLywFEM3Z1j
 XqAe60aoMXw2aqCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 655651331A;
 Mon,  3 Apr 2023 14:41:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tw5HC5HlKmRmIAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 03 Apr 2023 14:41:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com, =?utf-8?Q?Daniel_P_=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
In-Reply-To: <733d9f6b-476c-a401-bc0b-e01fd2206a2a@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de>
 <733d9f6b-476c-a401-bc0b-e01fd2206a2a@redhat.com>
Date: Mon, 03 Apr 2023 11:41:18 -0300
Message-ID: <87355hf2pd.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> writes:

> On 30.03.23 20:03, Fabiano Rosas wrote:
>> Hi folks,
>> 
>> I'm continuing the work done last year to add a new format of
>> migration stream that can be used to migrate large guests to a single
>> file in a performant way.
>> 
>> This is an early RFC with the previous code + my additions to support
>> multifd and direct IO. Let me know what you think!
>> 
>> Here are the reference links for previous discussions:
>> 
>> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html
>> 
>> The series has 4 main parts:
>> 
>> 1) File migration: A new "file:" migration URI. So "file:mig" does the
>>     same as "exec:cat > mig". Patches 1-4 implement this;
>> 
>> 2) Fixed-ram format: A new format for the migration stream. Puts guest
>>     pages at their relative offsets in the migration file. This saves
>>     space on the worst case of RAM utilization because every page has a
>>     fixed offset in the migration file and (potentially) saves us time
>>     because we could write pages independently in parallel. It also
>>     gives alignment guarantees so we could use O_DIRECT. Patches 5-13
>>     implement this;
>> 
>> With patches 1-13 these two^ can be used with:
>> 
>> (qemu) migrate_set_capability fixed-ram on
>> (qemu) migrate[_incoming] file:mig
>
> There are some use cases (especially virtio-mem, but also virtio-balloon 
> with free-page-hinting) where we end up having very sparse guest RAM. We 
> don't want to have such "memory without meaning" in the migration stream 
> nor restore it on the destination.
>

Is that what is currently defined by ramblock_page_is_discarded ->
virtio_mem_rdm_is_populated ?

> Would that still be supported with the new format? For example, have a 
> sparse VM savefile and remember which ranges actually contain reasonable 
> data?

We do ignore zero pages, so I don't think it would be an issue to have
another criteria for ignoring pages. It seems if we do enable postcopy
load w/ fixed-ram that would be already handled in postcopy_request_page.

