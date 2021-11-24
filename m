Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56C45CB61
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:51:14 +0100 (CET)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpwQK-0002do-P6
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpwP8-0001sZ-1v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpwP4-0000q2-Hn
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637776193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZK+9Orb7fUwvKvi5uLwvORbbZi/VUhl2aMCKnlB8SPA=;
 b=e/zt+SEMdozgJ9kqM6H5RMPlF0fptamw+I5L5vyeydwsFPtpmxg3rlib0jJBktGsTP+lKu
 YJtx0Leuj10PlO0GP7bVEUrhGuFkNylsfmJ7p+mNr5RmJLraQx5jD5d7fWcnkBQuCVl5hU
 rr53MPx5ycfs5FbNQSPTBZ8Pqa2oQvI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-tf8-AdPFMdqexeM1kPSd4w-1; Wed, 24 Nov 2021 12:49:51 -0500
X-MC-Unique: tf8-AdPFMdqexeM1kPSd4w-1
Received: by mail-wr1-f69.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so676161wrn.0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 09:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZK+9Orb7fUwvKvi5uLwvORbbZi/VUhl2aMCKnlB8SPA=;
 b=fizTnF7ZVvHJy7OPrvblb8DocHIkAwnyiwaD+EmyPRzOYBh0PWtDgKLn6a9R88atY5
 m1fbSu2iteYptob6vW4NbhfLZvA8zREo+5rAsZHbAli/BD1wDbIilk3R1jF/wdqYdW6s
 4Jbm+F+7cPIxX+IjnEonL1UGjqzLjmFTD4ij/XfJRvrZIrzFNQHRyGtiqTMUNmZgVeru
 P4xhKbBvd9BaWdwxcwizEiIV2U+HwgijMGdyrZsrviVXsNR18MJ2SCYP8OVsRNkRzgLH
 L7SB7n7y6+uBYGN0RG83EDgyvTcepy6S6tP2MPnN1kGAE6ozlSUR2Wz1vTVKdGDFsC2R
 aASw==
X-Gm-Message-State: AOAM533v3nUOUSM54KSJ0ukl0yg8hLxp4xsVHdD8TcZD0jpTVBWqPFYn
 uJhzEwWHuiqHmGYg036I522kDuuMMipAeP7GcLQConIA09IcVNEUQuHiW15HWTNL9fxiR7KX86F
 wusrYF4575ciUmHs=
X-Received: by 2002:a5d:548b:: with SMTP id h11mr17696629wrv.200.1637776190650; 
 Wed, 24 Nov 2021 09:49:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoIY6kg7MBmMK2tv8ZFHPwEpj9VpEUAgy3STSPVTGcWZFxLybcQIiFtJUboAZwDh6QyMe16Q==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr17696597wrv.200.1637776190413; 
 Wed, 24 Nov 2021 09:49:50 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id y12sm461272wrn.73.2021.11.24.09.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 09:49:49 -0800 (PST)
Date: Wed, 24 Nov 2021 17:49:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>, dovmurik@linux.ibm.com
Subject: Re: SEV guest attestation
Message-ID: <YZ57O1d+0IPl3DS/@work-vm>
References: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John Ferlan <jferlan@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tyler Fanelli (tfanelli@redhat.com) wrote:
> Hi,
> 
> We recently discussed a way for remote SEV guest attestation through QEMU.
> My initial approach was to get data needed for attestation through different
> QMP commands (all of which are already available, so no changes required
> there), deriving hashes and certificate data; and collecting all of this
> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> provided, QEMU would then need to have support for attestation before a VM
> is started. Upon speaking to Dave about this proposal, he mentioned that
> this may not be the best approach, as some situations would render the
> attestation unavailable, such as the instance where a VM is running in a
> cloud, and a guest owner would like to perform attestation via QMP (a likely
> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> commands, as this could be an issue.
> 
> So I ask, does anyone involved in QEMU's SEV implementation have any input
> on a quality way to perform guest attestation? If so, I'd be interested.
> Thanks.

QMP is the right way to talk to QEMU; the question is whether something
sits between qemu and the attestation program - e.g. libvirt or possibly
subsequently something even higher level.

Can we start by you putting down what your interfaces look like at the
moment?

Dave

> 
> Tyler.
> 
> -- 
> Tyler Fanelli (tfanelli)
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


