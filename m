Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D9310A65
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:39:23 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zSM-0006kB-RX
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7zQu-0005rr-Uq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7zQt-00031Z-1w
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612525070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5+pyQWVEhbZG4gVMyDBNYURu+c0frJexv4BLfC1kA0=;
 b=LyN1/QTgFBwqpJh6WXy/uVCzbvV8RP4AOeTocF4oOFnZ6s1YKUkIO+hAKoNKB5coDev9R9
 nOOvLdHiUm/reTFYuI+uj2viZAdT2vMnU/7l4P/w5becg8UTOHwFN+bk6MUUsShgvxYubs
 l+TaZ7QyiluSwdUO8GMkQiWU7oMCfVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-GCKIgA2lMqC7NNyFw_f-gw-1; Fri, 05 Feb 2021 06:37:46 -0500
X-MC-Unique: GCKIgA2lMqC7NNyFw_f-gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79741005501;
 Fri,  5 Feb 2021 11:37:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5A160BF1;
 Fri,  5 Feb 2021 11:37:41 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:37:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Message-ID: <20210205113738.GH908621@redhat.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
 <20210205095115.GB908621@redhat.com>
 <e11240d0-d325-336b-f43b-3cee6cf94b76@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e11240d0-d325-336b-f43b-3cee6cf94b76@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, James Bottomley <jejb@linux.ibm.com>, jon.grimm@amd.com,
 tobin@ibm.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, frankeh@us.ibm.com,
 Dov.Murik1@il.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 11:58:26AM +0100, Paolo Bonzini wrote:
> On 05/02/21 10:51, Daniel P. Berrangé wrote:
> > > +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> > > +            error_setg(errp, "SEV: no secret area found in OVMF,"
> > > +                       " gpa must be specified.");
> > > +            return;
> > > +        }
> > IIUC, historically QEMU has gone out of its way to avoid creating a
> > direct dependancy on specific firmware implementation details such
> > as this, so this whole approach makes me feel really uneasy.
> 
> The problem here is that this secret must be measured and therefore cannot
> be extracted by the guest out of fw_cfg.  Note that there's no reason why
> other firmware than OVMF could not adopt the same interface.

I didn't mean to store the secret in fw_cfg. Rather to use fw_cfg as a
way for OVMF to tell QEMU where to store it


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


