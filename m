Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D743DD6F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 11:09:33 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg1Pg-0002PY-FF
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 05:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg1LG-0006X4-1h
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg1LD-0004ui-VW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635411894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtnkLriKihRqUgqZNvADfXkKqpWkcvCnZK0WviHsSQc=;
 b=d05kRkEb2CdLM02UmHFPggVuK6eEwlq/K+fZ5UFPL3oHNNaSEBl452ErUOQ8TTv+8L96IR
 kdBtmBz+TF7efYalXPiGlAH7AhIH8505BSdXVw8elGPKWmEhczkR4ybnJlXxZgRpcndGy4
 UV7QvWElc4AjBSCdpxKT//bXds5rfT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-2Rw0es4-MB29lwccD0-v9w-1; Thu, 28 Oct 2021 05:04:52 -0400
X-MC-Unique: 2Rw0es4-MB29lwccD0-v9w-1
Received: by mail-wm1-f71.google.com with SMTP id
 a21-20020a1c7f15000000b0032cd93a2bd7so1224164wmd.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 02:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZtnkLriKihRqUgqZNvADfXkKqpWkcvCnZK0WviHsSQc=;
 b=chQfYH36Fhy/MDiIYu6M1aZzyXOhgKZ20oB8dsa2OVU5dVtTD+Nq+gT2qxQ5NyPAax
 Wm48Osdo+MKJeJ+8wduLVs0HVDST/QdKBWN6+DZLt9ONPrrQzhKi9e/9tESEHGGElVl0
 gc7aaeI7gksdXt106fbgGOm0ZuEFWm90FOsGtJmEmI1/niWJz92AqFK2/qW0EooyRI+p
 yobT9HHY/c51yGJr6uGiSTHSzaF4M4ro/DzL9DNVZQqdadCfNvMIzjw1Ca7Z2LkrC/eA
 BqGqJm/KS862JhneOMfgkUcyJHobCgB8qU048L+EhyE+33c7j9wPcUkYK7iCVc3PTzf+
 cLqg==
X-Gm-Message-State: AOAM530Jej8QNXZXUqhkcH4wCxRrQ+4nM4edRhvw+ml9JlzQovOzuaSe
 oIisCrM5MO2NkPhE1IvtrMr/YWN8MAJUbI/8P83qiSO51Mq2zkX/riHFDv0BpqmcDRsW11eOSlE
 hfRjtyn28ARarKoU=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr3120979wmq.59.1635411891347; 
 Thu, 28 Oct 2021 02:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/qDyysy7yxbf809fA/9trxTX8e1xxi5BvP6MnsMI6BRyruAmv0OcbciB4B89BmSr0dQpC7Q==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr3120932wmq.59.1635411891106; 
 Thu, 28 Oct 2021 02:04:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m20sm6385780wmq.5.2021.10.28.02.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 02:04:50 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:04:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v8 0/8] hmp, qmp: Add commands to introspect virtio devices
Message-ID: <YXpnrxnAdK9oEcLm@work-vm>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <YXk+JvPuOglFoerz@redhat.com>
 <4ee63834-cc75-ca3a-6333-ebbfc77f445a@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4ee63834-cc75-ca3a-6333-ebbfc77f445a@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jonah Palmer (jonah.palmer@oracle.com) wrote:
> 
> On 10/27/21 07:55, Daniel P. Berrangé wrote:
> > On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
> > > This series introduces new QMP/HMP commands to dump the status of a
> > > virtio device at different levels.
> > > 
> > > [Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
> > >   are from Laurent Vivier from May 2020.
> > > 
> > >   Rebase from v7 to v8 includes an additional assert to make sure
> > >   we're not returning NULL in virtio_id_to_name(). Rebase also
> > >   includes minor additions/edits to qapi/virtio.json.]
> > > 
> > > 1. Main command
> > > 
> > > HMP Only:
> > > 
> > >      virtio [subcommand]
> > > 
> > >      Example:
> > > 
> > >          List all sub-commands:
> > > 
> > >          (qemu) virtio
> > >          virtio query  -- List all available virtio devices
> > >          virtio status path -- Display status of a given virtio device
> > >          virtio queue-status path queue -- Display status of a given virtio queue
> > >          virtio vhost-queue-status path queue -- Display status of a given vhost queue
> > >          virtio queue-element path queue [index] -- Display element of a given virtio queue
> > I don't see a compelling reason why these are setup as sub-commands
> > under a new "virtio" top level. This HMP approach and the QMP 'x-debug-query'
> > naming just feels needlessly different from the current QEMU practices.
> > 
> > IMHO they should just be "info" subcommands for HMP. ie
> > 
> >           info virtio  -- List all available virtio devices
> >           info virtio-status path -- Display status of a given virtio device
> >           info virtio-queue-status path queue -- Display status of a given virtio queue
> >           info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
> >           info virtio-queue-element path queue [index] -- Display element of a given virtio queue
> > 
> > While the corresponding QMP commands ought to be
> > 
> >           x-query-virtio
> >           x-query-virtio-status
> >           x-query-virtio-queue-status
> >           x-query-virtio-vhost-queue-status
> >           x-query-virtio-queue-element
> > 
> > 
> > Regards,
> > Daniel
> 
> Sure, I don't mind changing it to this if this is what others would prefer.
> If there aren't any objections, I'll switch it to this in the next revision.

I agree with Dan that there's no need for the extra level; however
you could do it all in one HMP command I think:

  info virtio -- list all available virtio devices
  info virtio path  -- Display status of a given virtio device
  info virtio path queue -- Display status of a given virtio queue
  info virtio -h path queue -- Display status of a given vhost queue
  info virtio -e path queue [index] -- Display element of a given virtio
queue

It wouldn't need to change the qmp commands underneath unless it made
sense.

Dave

> Jonah
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


