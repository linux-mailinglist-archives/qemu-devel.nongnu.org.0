Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895F313A00
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:48:56 +0100 (CET)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99iZ-00086q-JG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l930Y-0000p4-F7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l930F-0000Hz-1w
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612777117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTt5ZHJe/8Fx6IWvD/+a0J4HXil8O5g6GwsRU/aZXR4=;
 b=Enle+HVcQz+scQpbEy+cgyhqtKRRGWmeqBTX6ftFYUDBLc45N90XwEx3DGRZUNbwCoQsqy
 cWiIZjruCGclcpoY8PZ2Z5Fzd2D82guWtyQzxgQQ/W96VMMSDtByYk4edo6GstPpV3zrw+
 c2YLOnb4RX6IJi6Z4qQBHMMN5oYDyc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-4s1k9CphOl-KO_hl0qx-Sw-1; Mon, 08 Feb 2021 04:38:36 -0500
X-MC-Unique: 4s1k9CphOl-KO_hl0qx-Sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B9E179EC1;
 Mon,  8 Feb 2021 09:38:34 +0000 (UTC)
Received: from work-vm (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0E770490;
 Mon,  8 Feb 2021 09:38:31 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:38:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Message-ID: <20210208093829.GB3032@work-vm>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
 <20210205095115.GB908621@redhat.com>
 <e11240d0-d325-336b-f43b-3cee6cf94b76@redhat.com>
 <20210205113738.GH908621@redhat.com>
 <263306b6-52c5-6da8-7f58-b639eb74c40d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <263306b6-52c5-6da8-7f58-b639eb74c40d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 david.kaplan@amd.com, James Bottomley <jejb@linux.ibm.com>, jon.grimm@amd.com,
 tobin@ibm.com, qemu-devel@nongnu.org, frankeh@us.ibm.com,
 Dov.Murik1@il.ibm.com, brijesh.singh@amd.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 05/02/21 12:37, Daniel P. Berrangé wrote:
> > On Fri, Feb 05, 2021 at 11:58:26AM +0100, Paolo Bonzini wrote:
> > > On 05/02/21 10:51, Daniel P. Berrangé wrote:
> > > > > +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> > > > > +            error_setg(errp, "SEV: no secret area found in OVMF,"
> > > > > +                       " gpa must be specified.");
> > > > > +            return;
> > > > > +        }
> > > > IIUC, historically QEMU has gone out of its way to avoid creating a
> > > > direct dependancy on specific firmware implementation details such
> > > > as this, so this whole approach makes me feel really uneasy.
> > > 
> > > The problem here is that this secret must be measured and therefore cannot
> > > be extracted by the guest out of fw_cfg.  Note that there's no reason why
> > > other firmware than OVMF could not adopt the same interface.
> > 
> > I didn't mean to store the secret in fw_cfg. Rather to use fw_cfg as a
> > way for OVMF to tell QEMU where to store it
> 
> I may be misunderstanding, but I think QEMU has to store it before OVMF
> runs, because the measurement is "sealed" when the VM starts.

Yes, that's correct, it's a feature of SEV and SEV-ES that the flow is:

  * measure data
  * attest
  * insert some encrypted data
  * Start execution

I would agree this code is pretty much tied to OVMF's weird GUID based
system when it's not needed; but there's no standard to follow here.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


