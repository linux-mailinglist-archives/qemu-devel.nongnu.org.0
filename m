Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22413749A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 22:48:32 +0200 (CEST)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leORb-00051d-Ls
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 16:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1leOPa-0004C8-0C
 for qemu-devel@nongnu.org; Wed, 05 May 2021 16:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1leOPT-0005ol-Vf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 16:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620247578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSrfBhpvkdvrrRx4AESBsd4TgbUNMOFyyHJnLdFY7+k=;
 b=hrVyg0v8aSC1qnNH0ASukuPbLwyJryc2vXWQWB8n3ajqHQivgeMa2UymienumnbJyuy3RN
 wdtKuQIzxqLmP9XmBY8xDygw/zfu71tlzY0I3zBE1PxhLMyJG0HlpYrBDaZ96ETlDOs5HK
 BpdYZtBXHvjEHCgrrXj75J+UBJ0Svx4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-pASlHvI4MDiAy5nl0opI0A-1; Wed, 05 May 2021 16:46:15 -0400
X-MC-Unique: pASlHvI4MDiAy5nl0opI0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 p19-20020adfc3930000b029010e10128a04so1185757wrf.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 13:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=FSrfBhpvkdvrrRx4AESBsd4TgbUNMOFyyHJnLdFY7+k=;
 b=OpbKUqW7E5+7Cb+P1O4e1VBsyh3x0tNXCBDjP+3mttPQSod7pY5pOD0NsnLuqwgF6G
 9HWRwYkiv+pSXWh+rc//mCLFfoLnX2bRztxLtqSRIFpv72anhghuAKg2l+HsS8C1d+nR
 2GSrzcqv0mgGFWfeQ6Neygpo53Nu7MInJZYLToP0t1QmNDcbSIPWHEYDrLpSNOVjVEcE
 HsFvYAHJGxc3B2mWowNHs6XyjfyjZWwq12urSpqgDa6vAPcGL0UsZ5DItHsRg6jojXCa
 itZTMh385w2OvyJNZE0lNMbUc/h58JW8ZUEZPU0AfAFibVR+lYTVfbh0kcMHSQnotfWj
 EDxQ==
X-Gm-Message-State: AOAM532fHh9q0y9kIV1OtSf4nuoANih7XqgkFnwDDlV26Qc9VuiqS/CF
 +l7xCPT0pzKVgTTUdd0YQmNoZhKvab8IDx7MoMJ2gf0B7ib5+3EtUPH8ejy71bLSlQL4qK5UYzA
 JjDD99riN+BIxICk=
X-Received: by 2002:adf:cd06:: with SMTP id w6mr934799wrm.93.1620247574337;
 Wed, 05 May 2021 13:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqU2Ji8X35VyLlBz9S36qTKGs33Rw9UrlpoZflz6pRgXLZPXkrNo35kDX3PFrXNHCe1htDOw==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr934775wrm.93.1620247574034;
 Wed, 05 May 2021 13:46:14 -0700 (PDT)
Received: from finch (cst-prg-105-69.cust.vodafone.cz. [46.135.105.69])
 by smtp.gmail.com with ESMTPSA id i3sm680005wrb.46.2021.05.05.13.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 13:46:13 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Adjustments of NVDIMM devices and future data safety
References: <87y2d0gjw6.fsf@redhat.com> <20210503160939.30047450@redhat.com>
Date: Wed, 05 May 2021 22:46:11 +0200
In-Reply-To: <20210503160939.30047450@redhat.com> (Igor Mammedov's message of
 "Mon, 3 May 2021 16:09:39 +0200")
Message-ID: <87r1ikewoc.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mzamazal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "Lai, Paul C" <paul.c.lai@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Arik Hadas <ahadas@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Amnon Ilan <ailan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Fri, 30 Apr 2021 14:18:30 +0200
> Milan Zamazal <mzamazal@redhat.com> wrote:
>
>> Hi,
>> 
>> I work on NVDIMM support in oVirt/RHV, I think other virtualization
>> management software built on top of QEMU may have similar concerns.
>> 
>> When a virtual NVDIMM device size is specified, it's not necessarily the
>> eventual NVDIMM device size visible to the guest OS.  As seen in
>> https://github.com/qemu/qemu/blob/v6.0.0/hw/mem/nvdimm.c#L117, QEMU
>> makes some adjustments (other adjustments are performed by libvirt but
>> that's a topic for a different forum):
>> 
>> - NVDIMM label size is subtracted from the NVDIMM size.
>> 
>> - NVDIMM label is pointed to a certain memory region.
>> 
>> - The remaining NVDIMM size is aligned down.
>> 
>> There are some related potential problems:
>> 
>> - If the alignment rules change in a future QEMU version, it may result
>>   in a different device size visible to the guest (even if the requested
>>   size remains the same) and cause trouble there up to data loss.
>> 
>> - If the layout on the backing device changes, e.g. a label placement,
>>   then the stored data may become corrupt or inaccessible.
>
> We usually tie ABI changes to machine versions, so if in future we decide to
> change NVDIMM layout, we should preserve old layout for old machine types
> (which is accomplished using compat mechanism)

This could still be a problem if a layout change happened silently with
a machine type version change, since at least in oVirt/RHV, we update
machine types with new versions.

>> - I'm not sure about the current QEMU version, but at least in previous
>>   QEMU versions, the resulting size is important for memory hot plug.
>>   The NVDIMM alignment size is smaller than the required regular memory
>>   DIMM placement alignment.  If a VM contains an NVDIMM with the
>>   resulting size not matching the DIMM placement requirements and a
>>   memory hot plug is attempted then the hot plug fails because the DIMM
>>   is mapped next to the end of the NVDIMM region, which is not
>>   DIMM-aligned.
>
>
> I vaguely recall that, start address of any hotplugged (NV)DIMM
> is aligned on 1G boundary (only the very first versions of memory
> hotplug used unaligned address). Described above situation shouldn't happen.

I'm sure I've experienced the alignment problem, with a failing memory
hot plug.  I'll try to check it again, with a newer QEMU version.

> I'd try to fix alignment issues first if there is any before talking about
> splitting label out.
>
>
>> All this means:
>> 
>> - The requested NVDIMM size must be computed and specified carefully,
>>   with attention to QEMU internal implementation.
>> 
>> - And because it depends on QEMU internal implementation, there is a
>>   risk of malfunction or data loss when the same backing device with the
>>   same parameters is used with a future QEMU version.
>
> When making incompatible changes, we usually add a new property to enable them,
> so normally situation when NVDIMM "with the same parameters" is used
> should lead to old behaviour.

OK.

> If we change 'default' values then as long as one uses versioned machine
> type, old behaviour will be preserved with future QEMU.
> However if one uses un-versioned/another machine type or enables new behavior,
> QEMU doesn't guarantee any compatibility.

I see.  So it's best to pin each VM with NVDIMM devices to a particular
machine type version.

A question is what to do when it is desirable to update the VM to a
newer machine type version.  Is the only safe way to do it to backup
NVDIMM data and restore it from the backup after the VM restart?  I
guess incompatible NVDIMM changes are not going to be that frequent so
it looks like a bit user-unfriendly precaution.

>> As for labels, I was told NVDIMM labels might be put to regular files in
>> future to avoid some problems.  Since label placement is not visible to
>> the guest, such a change could be made transparently without disrupting
>> access to the data.  (As long as the label data is transferred to the
>> new location properly and undesirable resulting NVDIMM size changes are
>> not induced by such a change.)
>
> I think current approach resembles real nvdimm devices
> (the only problem is that one has to configure size/label size,
> where with real devices it's done by manufacturer).

Yes.

> if we add a dedicated property, It should be possible to split label out
> into a separate file.
> However I don't fancy carrying transparent migration from old format to
> the new one in QEMU, I think it should be done by separate utility. So
> that if users have access to backend + and know used label size,
> they should be able split it.

I think this would be an acceptable limitation.

> Also I'm not sure that splitting label out is fixing anything, it just
> replaces one set of rules how to set size/label (assuming there is one)
> with another + user will have to manage 1 more backend (content + label).
>  
>> The primary point is still how to ensure that data kept on a backing
>> device will remain accessible and safe in future QEMU versions and how
>> to possibly avoid reliance on QEMU implementation details.  A big
>> warning in the NVDIMM handling source code to keep backward
>> compatibility (incl. memory hot plugs) and data safety on mind before
>> making any changes there might be a reasonable minimum measure.
>> Any additional ideas?  What do you think about it all?
> we usually are trying to keep compatibility (versioned or new features
> are disabled by default and user has to explicitly enable them)
> when making breaking changes.
> (and that is done without extra warnings in the code,
> otherwise QEMU will be full of them).

Thank you for clarification.  I wonder whether an upper layer, such as
libvirt, could in theory assist with prevention of a disaster some way,
by playing with enabled features or so.  NVDIMM situation is somewhat
specific in that it contains data that can be damaged by an incompatible
change.  Which makes it more fragile than some other compatibility
problems fixable e.g. by restarting the VM with the original machine
type version or with updated parameters.

>> Thank you,
>> Milan
>> 
>> 


