Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B972B7AB9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:55:45 +0100 (CET)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKBk-0001g7-Qb
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfKAL-00018F-KY
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfKAJ-0000Xv-UV
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605693254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HkvlidDT7RuDykKbMhHuxkrrFtoJAiVcxN+jntjGpQI=;
 b=RUKigu6a6BcFBb+9KtUs2MQBtHwJr4KuXNmxYWe3NEWhjNXy9O9/VhIdeKsObMTn3qMaAs
 ANzZjrnCCDJcfAx8WLoaze2LR76rEnHJnnNrVhwJwGtLmsxTSqCv8XmkXZgJsmkR+vLtSF
 bU4wv05YcHcEz7UOZ5GdsmP2GI8hCFk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-E4dW-bGzMo2_4jJzAoVjjA-1; Wed, 18 Nov 2020 04:54:12 -0500
X-MC-Unique: E4dW-bGzMo2_4jJzAoVjjA-1
Received: by mail-wr1-f72.google.com with SMTP id p16so717461wrx.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 01:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HkvlidDT7RuDykKbMhHuxkrrFtoJAiVcxN+jntjGpQI=;
 b=OvHr0/Jkw5YHFrbNvoy/O2CZCRhzPZK3/NKmjxLYxTZvn/bTYiXcf/K7Uu/Zb7qL3+
 uuFEgLDD/nXxDTM8TMcPcK6SQCduSoSxIwpnCyooyusUsAFTegQENkBivVPcXGZzSnUA
 2AkxfVelQOodIZpP2V7+OTnrsUtbbHzz8AxD8VDsHOONYTgkIhQNw3MO/yyMCm+jxRLn
 EP8M8HhME7lotz6UFXsVki3DJKZ6RAPC//leVFvA42ci6pFNzAfh/e8cOcRnZsOdr+I+
 pCnv/XXusxdWgJ8lfVPWeJzHRqzfEFFtAjpzShUpyDLss/fhe1/0erSDhfch4VeXCI0r
 ODAQ==
X-Gm-Message-State: AOAM532DsGTJxAqK+J4BEyQXC+GVGOBo9LdCy4WYNO8SIGUsy47afigs
 pzC5wVazCeO9EiGBEJ8YQSRopcS5VYnQrNdY5ziZor3sBk2HAAVcpHoMfU3Ttnz4pXrRNESgD5d
 q6kpjT0TkiATDYxM=
X-Received: by 2002:a7b:c255:: with SMTP id b21mr3661701wmj.72.1605693251698; 
 Wed, 18 Nov 2020 01:54:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbXLTxAGOnZyxxbLSLJq6x1VIfry0wChmfEQrkgNC9lF4UHuYFsROS0Onu2BcX6Xl3sE+plg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr3661670wmj.72.1605693251346; 
 Wed, 18 Nov 2020 01:54:11 -0800 (PST)
Received: from redhat.com (bzq-109-67-54-78.red.bezeqint.net. [109.67.54.78])
 by smtp.gmail.com with ESMTPSA id
 o13sm2811565wmc.44.2020.11.18.01.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 01:54:10 -0800 (PST)
Date: Wed, 18 Nov 2020 04:54:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201118044620-mutt-send-email-mst@kernel.org>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 01:13:14PM -0600, Mike Christie wrote:
> On 11/17/20 10:40 AM, Stefan Hajnoczi wrote:
> > On Thu, Nov 12, 2020 at 05:18:59PM -0600, Mike Christie wrote:
> >> The following kernel patches were made over Michael's vhost branch:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=vhost
> >>
> >> and the vhost-scsi bug fix patchset:
> >>
> >> https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha-x1.localdomain/T/#t
> >>
> >> And the qemu patch was made over the qemu master branch.
> >>
> >> vhost-scsi currently supports multiple queues with the num_queues
> >> setting, but we end up with a setup where the guest's scsi/block
> >> layer can do a queue per vCPU and the layers below vhost can do
> >> a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
> >> but all IO gets set on and completed on a single vhost-scsi thread.
> >> After 2 - 4 vqs this becomes a bottleneck.
> >>
> >> This patchset allows us to create a worker thread per IO vq, so we
> >> can better utilize multiple CPUs with the multiple queues. It
> >> implments Jason's suggestion to create the initial worker like
> >> normal, then create the extra workers for IO vqs with the
> >> VHOST_SET_VRING_ENABLE ioctl command added in this patchset.
> > 
> > How does userspace find out the tids and set their CPU affinity?
> > 
> 
> When we create the worker thread we add it to the device owner's cgroup,
> so we end up inheriting those settings like affinity.
> 
> However, are you more asking about finer control like if the guest is
> doing mq, and the mq hw queue is bound to cpu0, it would perform
> better if we could bind vhost vq's worker thread to cpu0? I think the
> problem might is if you are in the cgroup then we can't set a specific
> threads CPU affinity to just one specific CPU. So you can either do
> cgroups or not.

Something we wanted to try for a while is to allow userspace
to create threads for us, then specify which vqs it processes.

That would address this set of concerns ...

-- 
MST


