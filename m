Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB267195C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5sZ-0006rD-M6; Wed, 18 Jan 2023 05:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pI5sW-0006qv-BB
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:41:12 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pI5sU-0008Mg-KE
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:41:12 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97F971FF02;
 Wed, 18 Jan 2023 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674038468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXc+TczWCaTKd/I6m0h8IfUacEq6XiIlvO+ii6st4B8=;
 b=aupxdRaSYxE1cUdlK84zLUT/5e40OpIiiFoCf01dr9ZaXzbSNLSMQCFUOJFZLf0+EJ4EiP
 jwRJB4zSFnNLyJD8/lWk/z5AtZNbB3wwNeJ8axdl+VT0uU6Zk7dyQ5GpaWxt1mOqCsp85e
 JB4FH8AIMJdgT174cVPEssmQYmMMkWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674038468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXc+TczWCaTKd/I6m0h8IfUacEq6XiIlvO+ii6st4B8=;
 b=iNbeaXb/XNg6BwpSKItFEDIRdVJxn3SRbe/kJTdX/x1UkaRt2iwKdDfXA9dG/cD3V9X+/q
 9KSiRNWphI58ZCAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28059138FE;
 Wed, 18 Jan 2023 10:41:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LIN0BsTMx2PnXgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 18 Jan 2023 10:41:08 +0000
Message-ID: <f52167d2-953d-4413-e570-8922998f3924@suse.de>
Date: Wed, 18 Jan 2023 11:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/5] migration: Modified 'migrate' QAPI command for
 migration
Content-Language: en-US
To: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <114351ed-2676-d2d1-d6a6-2eb3732d1c06@suse.de>
 <787a413f-605a-6ca8-ee92-d1ab93a7531d@nutanix.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <787a413f-605a-6ca8-ee92-d1ab93a7531d@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/18/23 06:52, Het Gala wrote:
> 
> On 17/01/23 4:22 pm, Claudio Fontana wrote:
>> Hi,
>>
>> On 12/26/22 06:33, Het Gala wrote:
>>> Current QAPI 'migrate' command design (for initiating a migration
>>> stream) contains information regarding different migrate transport mechanism
>>> (tcp / unix / exec), dest-host IP address, and binding port number in form of
>>> a string. Thus the design does seem to have some design issues. Some of the
>>> issues, stated below are:
>>>
>>> 1. Use of string URIs is a data encoding scheme within a data encoding scheme.
>>>     QEMU code should directly be able to work with the results from QAPI,
>>>     without resorting to do a second level of parsing (eg. socket_parse()).
>>> 2. For features / parameters related to migration, the migration tunables needs
>>>     to be defined and updated upfront. For example, 'migrate-set-capability'
>>>     and 'migrate-set-parameter' is required to enable multifd capability and
>>>     multifd-number of channels respectively. Instead, 'Multifd-channels' can
>>>     directly be represented as a single additional parameter to 'migrate'
>>>     QAPI. 'migrate-set-capability' and 'migrate-set-parameter' commands could
>>>     be used for runtime tunables that need setting after migration has already
>>>     started.
>> Is efficient and parallel migration to file of large VMs in scope for this design?
>>
>> Thanks,
>>
>> Claudio
> 
> This patch's design right now mainly focuses on revamping the design for 
> 'migrate' command.
> 
> In the upcomig patchset series in future, it will try to accomodate 
> multifd as a feature in the same QAPI command and try to build multiple 
> interface support on top of multifd feature. Main aim is to increase 
> network bandwidth for migration with help of multiple interface and multifd.
> 
> Regards,
> Het Gala.


Understand, hopefully we can make sure that we can have a design that allows also increasing disk bandwidth for direct migration to disk.

Currently upstream migration to fast disks of medium to large size VMs is badly bottlenecked by qemu/libvirt interfaces.

Just FYI for existing work if interested see:

https://www.mail-archive.com/libvir-list@redhat.com/msg230248.html (not upstreamable, but dramatically improves VM save/restore performance)

https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02870.html (attempt to address the issue in QEMU project itself via migrating to file:///).

Ciao,

C

