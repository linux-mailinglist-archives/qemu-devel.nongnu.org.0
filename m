Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710FD31719F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:46:14 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wNJ-0007X2-IK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9wHC-00055J-1B
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9wH4-0008LP-Lu
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612989584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGCbOKTbkmZdTnKdvAPBrBTXJnvVm+PHTJ7LJoUFhy4=;
 b=Z94VQW0RFf5S8D24dHt1uSH6p8xWi7ueJ33rD80n1m8jGyupiZCayZAkq7gQwGmoPjeVh7
 tyU+DQMKFrHnaETJQb+f2hBCnQ6AlJFCVUd9U2DgjTKQQOo11P/F1Gz29W3OmoN3y3RQeK
 ZUFFCzk+uRBFe8WJhzOJdqL9nY61TtA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-L0FLuQnnM9qxr2P8NOcKFg-1; Wed, 10 Feb 2021 15:39:40 -0500
X-MC-Unique: L0FLuQnnM9qxr2P8NOcKFg-1
Received: by mail-ot1-f71.google.com with SMTP id t12so1638636otj.14
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 12:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EGCbOKTbkmZdTnKdvAPBrBTXJnvVm+PHTJ7LJoUFhy4=;
 b=WQeD3QDNyxHUukUA/v1BMQcxCug7f8E+mEdoY+7vSeISDjEOhgtdQQcJh4FglKbtDU
 mf8iahX2TWzuJ3VhQGKFMeF0ZwXVCf5DutJGqHb11tXXfi9gKINCtlz5BrSLTFo6b7bc
 cyuLX3DGDp/SrrqABW4REntkli2BMlNloQW8oLrqMWeIEh2mZZ6+mElRR8C4DYEXoiZt
 GMNmyoz5HyT35u69qloGx7TyQIfLuFz5OFFZMIdP332O9DlxZk/VCuA084twuHSyxQSf
 ZawSsZw8eQmrGn4ai/awBxWn6pWF8la+T3iRlVD0/o5O6ffX6/0l2X/Z1vr6QyuCdx1Q
 L3/w==
X-Gm-Message-State: AOAM532caGNWwvZzd9m1vjYNP1okGrhJ+JSf6DApy4QLAD5DC/4gaUWI
 nrZSvz3MJb/jVlpFNqKd0mpCmGzeHLvcnctD4rNYJcY0jQLCCCro6knGwzkkAEnCRDXEN5s+MMH
 jPrn74+9rtAkQcac=
X-Received: by 2002:a05:6808:4ce:: with SMTP id
 a14mr567631oie.49.1612989579770; 
 Wed, 10 Feb 2021 12:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp+8uZnbmYhLRmSfSximwRLljykfFaM32x1/EV541VvnQSztNGB2tUEP+q4kT++BZdgC3FzA==
X-Received: by 2002:a05:6808:4ce:: with SMTP id
 a14mr567619oie.49.1612989579571; 
 Wed, 10 Feb 2021 12:39:39 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 b14sm577432ooj.26.2021.02.10.12.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 12:39:39 -0800 (PST)
Subject: Re: Interactive launch over QMP socket?
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
 <ef2db65a-f9bd-5cf7-7c1a-9ba07dd4bda0@redhat.com>
 <f46a24d33185b808801531da7d9ca6457d9a790e.camel@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a06cf1b7-85fe-caeb-67e8-1e67f828f5db@redhat.com>
Date: Wed, 10 Feb 2021 14:39:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f46a24d33185b808801531da7d9ca6457d9a790e.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: npmccallum@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 1:06 PM, James Bottomley wrote:
> On Wed, 2021-02-10 at 12:46 -0600, Connor Kuehl wrote:
>> Right, I didn't mean to include cbitpos in consideration for this.
>> I'm only interested in supplying the session, policy, and certificate
>> info over the socket.
>>
>> Shouldn't the session, policy, and certificate information only be
>> required in time for the KVM_SEV_LAUNCH_START ioctl call? This is
>> the place I'm interested in waiting for the relevant data.
> 
> Well, it could, but I see the session information as being the same as
> the image file, which is also a command line argument, so if you can do
> the image file on the command line, why not the session info as well?

It would be interesting to allow remote delivery of the initial image as 
well because for purposes of attestation I would argue that the guest 
owner should have as much of the locus of control as possible. However, 
because the guest image is unlikely to change between launches/guests, 
it's probably more helpful to deliver it to the host, let it cache it, 
and supply that via a command line argument. I'm mainly interested in 
the session blob, policy, and certificate for now though.

I don't see a similar value in caching a session blob or policy because 
it is trivial to generate these and put them in a JSON object and send 
them on demand. I think that chopping up part of the attestation 
process, setting it aside, and having to figure out how to deliver it to 
the host where the QEMU process will launch creates an impedance 
mismatch. Usability impedance mismatches tend to motivate the creation 
of one or more automation/translation layers to automate that "glue" away.

Extending QMP to allow end-to-end attestation via QEMU removes the need 
for that glue and improves interoperability with other client 
implementations who care about attestation. Providers would just need to 
point out the QMP endpoint for guest owners. It lends itself to a more 
"atomic" transaction-like attestation experience overall.

> The other problem is the session info is exchanged for a launch handle
> in kvm_init, which is machine_init in qemu terms.  That's called
> phenomenally early, so there's not much of kvm to pause before you do
> that.  So either qemu has to be rewritten to pause before processing
> command line arguments, and then any argument can be added over QMP, or
> the handle exchange has to occur later.

Ah, I see, thank you.

Connor

> James
> 
> 


