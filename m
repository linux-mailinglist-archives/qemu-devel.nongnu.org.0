Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62756992D4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScAX-00013m-2D; Thu, 16 Feb 2023 06:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pScAD-0000xv-Db
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pScAB-0002j2-T4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytGAGQApMQBGMlqbykyXatc6W0OxxT8vz1wkfrQlq7c=;
 b=HP5H61mrr3N+6xprCMq1tEUkxy5fD5tJJhNiZiQcmC5SZUKjeUiQMsu3eC7f22+nBo21Yp
 TKhcBBccp/PFvEtxwSRhw5bOighFbRzQnv6kTH6ArpdgvxAkj6rk5aTjaBiinsWkDo6c/Y
 y8+1rb1y9BnWE0i84TzBmvetoG4djvM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-QSa1BQXbMuWNzEnAlrRdHw-1; Thu, 16 Feb 2023 06:10:54 -0500
X-MC-Unique: QSa1BQXbMuWNzEnAlrRdHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so973864wmb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytGAGQApMQBGMlqbykyXatc6W0OxxT8vz1wkfrQlq7c=;
 b=2NlbH3LFSH5qEsA1DkVO9pK4fajJX+lpoePT6mqCpy2zvgo75NjDEIdebGZVyk40pQ
 OdXna8yzl9qTh8nKVLv5J9+awZnL2V49Ksm7lXXSvcnAjxjyt9oJ4EWvQHaW1G8xNwu3
 EgFFvF84lyCDAmf+3xd9Y22D4G471XKFgwnT+ksJPfr1F84MVtR426Xo9z8qe3MAx7GR
 zb5wp6oUIle5+Ey1M9Rt64zm5nzP0Fa9mGEZoWL5SYJq0MWzKEEeAVjCkfAutYPUYbTI
 UZDZRUvvIrYwn1f86pIAsd4a8FVUgP5LgbKpQJnsfqM/EAk058BOuA9ul7oI1GH7zWD+
 Oemw==
X-Gm-Message-State: AO0yUKXdUJlo3Eb7sXlxZv2xfJjc9OTM83Ricut4eSk97GEQU0OE25wh
 7CvHpm3EIHdReZOEhcWbxkTqa0Hm7uZme4TWOmrh+LMdzasjfJYmhHEpVlWXLmdE280itUAC8cY
 yDgzD8TS5K/q5vZ4=
X-Received: by 2002:a05:600c:c10:b0:3e0:481:c897 with SMTP id
 fm16-20020a05600c0c1000b003e00481c897mr4424056wmb.37.1676545853034; 
 Thu, 16 Feb 2023 03:10:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9BhnZDQHxSDSLbJOAJDCCsIlh6WcYoawUXKkfA9pATgsP1/tyq5gvFIUhn1Rn21YaAPk/NAw==
X-Received: by 2002:a05:600c:c10:b0:3e0:481:c897 with SMTP id
 fm16-20020a05600c0c1000b003e00481c897mr4424040wmb.37.1676545852795; 
 Thu, 16 Feb 2023 03:10:52 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003e1fee8baacsm4958504wmb.25.2023.02.16.03.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:10:52 -0800 (PST)
Date: Thu, 16 Feb 2023 11:10:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Mario Smarduch <mario.smarduch@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/2] i386/sev: Support measured direct kernel boot
 on SNP
Message-ID: <Y+4POpgqcLd80Gp+@work-vm>
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
 <Y+4E5xh19PmO9BRY@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+4E5xh19PmO9BRY@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Feb 16, 2023 at 08:49:11AM +0000, Dov Murik wrote:
> > This RFC patch series is based on AMD's RFC upmv10-snpv3 tree [1].
> 
> I've seen postings of the kernel patches for SNP using the kernel
> UPM support, but I don't recall ever seeing these QEMU pieces
> posted for review. The code in that QEMU branch looks different
> from the last posting of SNP to qemu-devel years ago.
> 
> IMHO it would be very desirable if that QEMU UPM tree was submitted
> to qemu-devel for review feedback

Some of the patches in there look like they're not dependent on SNP
or the UPM interface; (eg some CPU model updates).  It's probably worth
posting those separately so that they can be reviewed and merged and out
of the way.

> before requesting review of patches
> that build on top of it.

But at the same time it seems right for Dov to send these patches for
review.

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


