Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31502B5C0E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:46:08 +0100 (CET)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexYt-0001tq-CU
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kexXr-0001Nb-O4
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:45:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kexXo-0007Aj-NB
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605606299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RIVoQ5SK7k8X/fF+q3ttIIYhkT8VyjHvSMR/Pb4gWhc=;
 b=W4t8L4Dc266HtBWZFxCZZAyyAHCJNGwcs8Y4oRIeotIx6/51fuAsHnaQ86GypRRfc/oeHY
 SU964xNI1pcq82gvXa5tZtKRschyTtS/BSlH19egvHEIpBv7cJ0hZIxjQFoSHmqpPJ5Yns
 AeIUwzELUGRDxjsCAAZL7a0sX1cs7C0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-lPVKzOPWPYeJ-7_hnH9k6A-1; Tue, 17 Nov 2020 04:44:58 -0500
X-MC-Unique: lPVKzOPWPYeJ-7_hnH9k6A-1
Received: by mail-wm1-f69.google.com with SMTP id h9so1449826wmf.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RIVoQ5SK7k8X/fF+q3ttIIYhkT8VyjHvSMR/Pb4gWhc=;
 b=JPckkU6z08y+c0RHeHSt0tfkuVMR3w3sYZ+5K1rBjInoGpAkIVaHCmSXy0g1BiF0t/
 jMVysqBh3HH+YV5mVhCN+cnF+52MlhkUaROlD2WoLiT7wg4Dmgtj6cbI64vcTGTbXSYZ
 8vxoyt8/Gn/ygj2EkLzf3JY765MeVcsgugNkPklwkIiqzILos0oq+LQN19G3KkNyuhsN
 cmnQGwgR7ZaoBMHY3y+iQVToEJqEG+JbAVYDgGpymgOsdRuAJOw7ZArgbp3v2rVV8S22
 2547df2BVEt6PoU9hhVH6DLlKcbvRVOhZSHaXtLkF69jJK8valCfOk4VHRVnHb8m8ogO
 GS+Q==
X-Gm-Message-State: AOAM533LXa2VDJCG7kt8/b+4BjsAYLdUHH2/RrIMV8lbCXhrB+hYDsAA
 A5SJUCQpqSg5RwfX+EzlRKdeZkMKX3UYY4k4iUQYNfejY9QssrWStTsPBVrM22zokgPwYHBkR5F
 HPQuaPfdE20Iv5To=
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr24144630wrt.68.1605606296808; 
 Tue, 17 Nov 2020 01:44:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH9/znL846q8K86yr6DClQAXCroywVPFLk3p8w06EU3NcA2uJxHht4W81u0VvrMPicnlyenA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr24144601wrt.68.1605606296594; 
 Tue, 17 Nov 2020 01:44:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id c5sm17166598wrb.64.2020.11.17.01.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:44:55 -0800 (PST)
Date: Tue, 17 Nov 2020 04:44:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201117044120-mutt-send-email-mst@kernel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201111125626.GC3232@work-vm>
 <20201111153438.GD1421166@stefanha-x1.localdomain>
 <20201111154159.GG3232@work-vm>
 <20201116143812.GF96297@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201116143812.GF96297@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Yan Zhao <yan.y.zhao@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 02:38:12PM +0000, Stefan Hajnoczi wrote:
> On Wed, Nov 11, 2020 at 03:41:59PM +0000, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > On Wed, Nov 11, 2020 at 12:56:26PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > > Orchestrating Migrations
> > > > > ------------------------
> > > > > In order to migrate a device a *migration parameter list* must first be built
> > > > > on the source. Each migration parameter is added to the list if it is in
> > > > > effect. For example, the migration parameter list for a device with
> > > > > new-feature=off,num-queues=4 would be num-queues=4 if the new-feature migration
> > > > > parameter was introduced with the off value disabling its effect.
> > > > 
> > > > What component builds that list (i.e. what component needs to know the
> > > > history that new-feature=off was the default - ah I think you answer
> > > > that below).
> > > 
> > > Yep. Thanks for noting this. I'll need to reorder things so it is clear.
> > > 
> > > > > The following conditions must be met to establish migration compatibility:
> > > > > 
> > > > > 1. The source and destination device model strings match.
> > > > > 
> > > > > 2. Each migration parameter name from the migration parameter list is supported
> > > > >    by the destination. For example, the destination supports the num-queues
> > > > >    migration parameter.
> > > > > 
> > > > > 3. Each migration parameter value from the migration parameter list is
> > > > >    supported by the destination. For example, the destination supports
> > > > >    num-queues=4.
> > > > 
> > > > Hmm, are combinations of parameter checks needed - i.e. is it possible
> > > > that a destination supports    num-queues=4 and  new-feature=on/off -
> > > > but only supports new-feature=on when num-queues>2 ?
> > > 
> > > Yes, it's possible but cannot be expressed in the migration info JSON.
> > > 
> > > We need to choose a level of expressiveness that will be useful enough
> > > without being complex. In the extreme the migration info would contain
> > > Turing complete validation expressions (e.g. JavaScript) so that any
> > > relationship can be expressed, but I doubt that complexity is needed.
> > > The other extreme is just booleans and (opaque) strings for maximum
> > > simplicity.
> > > 
> > > If the syntax is not expressive enough then it's impossible to check
> > > migration compatibility without actually creating a new device instance
> > > on the destination. Daniel Berrange raised the requirement of checking
> > > migration compatibility without creating the device since this helps
> > > with selecting a migration destination.
> > 
> > Right, but my worry isn't the JSON description, it's the set of 3
> > conditions above; they need to state that only some combinations need to
> > be valid.
> 
> Yes, the proposed syntax is simply not expressive enough. The migration
> compatibility check will pass and then the destination will refuse to
> set up the device (before the device state is transferred).
> 
> Any suggestions for a syntax without full-blown arithmetic and logic
> expressions?
> 
> > > Any ideas for a better syntax?
> > 
> > I'd be happy with a --param name=value   repeatedly, but also know that
> > some option parsers don't like that.
> 
> Another wart, Sphinx considers repeated options an error so you cannot
> document options using rST option syntax. I remember having this problem
> when documenting virtiofsd's command-line options :).
> 
> If something comes to mind please let me know. I'm not set on a
> particular syntax, but I'd like to choose the one that is both
> human-friendly and compatible with option parsers while avoiding
> namespace collisions with the device implementation's own options.
> 
> Stefan


I think the simplest way is just to include and open-source tool
for figuring all this out together with qemu.
Any vendor interested in supporting migration with qemu
will then just submit a patch for that tool.

This will also help make sure this interface
is not just a way to bypass GPL, we can ask that the
supporting server is opensource.

And it will help us guide vendors towards supporting migration
correctly.

-- 
MST


