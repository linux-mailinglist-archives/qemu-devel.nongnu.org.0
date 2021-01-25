Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D282A3028A9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 18:21:00 +0100 (CET)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l45Xv-0001JR-EJ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 12:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l45VO-0000kX-1S
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l45VF-0000GW-4y
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611595089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLIxCnn81M3/DesWlce7NSNdKn1gzQY3YbZNZdxK+K0=;
 b=MkGufTfAIaUy4pz+9hJj/yOAd4dTEz/DNWZ1qz0T0p3M01Y6Z72UL0sUttc/FdsywAjJGx
 Ys2AtKCTQh88dIRLweOOsfr+5ei+4O5gZCLle1BtWt6bwWWxXAm6IjX9QFaA+AGuaJLfC4
 wrqYCqwIyg5wujC1i5CXgbnKY7cXMPk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-0s8-802eNrKqf55MSXi4ow-1; Mon, 25 Jan 2021 12:18:07 -0500
X-MC-Unique: 0s8-802eNrKqf55MSXi4ow-1
Received: by mail-qt1-f197.google.com with SMTP id b8so7669603qtr.18
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kLIxCnn81M3/DesWlce7NSNdKn1gzQY3YbZNZdxK+K0=;
 b=E6cCiD82NNrJ3tKgSeg4k5xCPXpgcRZkDsaS79Yz2KEuuWeFEPwH67QaT2ifImX8K0
 uGDDlI0lJFXCEWdl94lnOOk7kqReXpQqmI3AUTuDka/Lxb7+VhZaHxXyIIZlcgOu3RCm
 zFfib18K2ui5Sds8amge76n1YN50FUUmqUhs7InBCiVAGQ7aYVs9p97xV3W7ewJH6vYf
 u865dt/Gs8OrsKaKHEpyeLHTxmk/1VhjW28pUKOt+HBFGm+wbah+8f7pP63mbCw4TY1c
 H003UZ3NNn5/Wmk0O841LWDKDxzcNCLPDECQjdjJE5AtzQEcZcmA2M3AocUBx3n5aJnX
 gp6g==
X-Gm-Message-State: AOAM532Gj15mWapnzyHuC+QqJeDgE3w0MqPtjUt9mXIAzcfP/744PQmk
 z8XeoG8QiVE7BasldzZPBl9WDMiE0BRZ08I3AnB8icVYvHZKHeMOI3j1P2iCNFcuqGyd3ULVT7w
 85T4xhrN8j0AIBOk=
X-Received: by 2002:a05:620a:544:: with SMTP id
 o4mr1808146qko.285.1611595087030; 
 Mon, 25 Jan 2021 09:18:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD4yGr6Jcdu++qmN6mn8j+zUHvHjGyQaLv4Fvep05MYbQEJoCIRWD4Ik2KSuR0CEY5CB089A==
X-Received: by 2002:a05:620a:544:: with SMTP id
 o4mr1808116qko.285.1611595086724; 
 Mon, 25 Jan 2021 09:18:06 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id k42sm12220813qtk.17.2021.01.25.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 09:18:06 -0800 (PST)
Date: Mon, 25 Jan 2021 12:18:04 -0500
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
Message-ID: <20210125171804.GL260413@xz-x1>
References: <20210122200851.345259-1-eperezma@redhat.com>
 <65ea6f69-538f-7f2e-b2d9-bb0a110f004b@redhat.com>
 <CAJaqyWdYQH8O-WvLm4raWtWbhwz6BiC3ucGyi584BWALyy+UUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdYQH8O-WvLm4raWtWbhwz6BiC3ucGyi584BWALyy+UUA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 05:55:35PM +0100, Eugenio Perez Martin wrote:
> On Mon, Jan 25, 2021 at 4:15 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > On 2021/1/23 上午4:08, Eugenio Pérez wrote:
> > > Cannot destroy address spaces of IOMMU-aware virtio devices without it,
> > > since they can contain memory listeners.
> >
> >
> > It's better to explain why the one in finalize doesn't work here.
> >
> 
> Hi Jason! Good point. The other call is at virtio_device_instance_finalize.
> 
> Function virtio_device_instance_finalize is called after
> address_space_destroy if we follow steps of buglink.
> 
> Address_space_destroy is called by
> pci_qdev_unrealize/do_pci_unregister_device, after call to
> virtio_device_unrealize. After that call,
> virtio_device_instance_finalize is called through object_deinit,
> freeing the bus.
> 
> Also, memory_listener_unregister can be called again because it checks
> for listener->address_space != NULL at start, and sets it to NULL at
> end.
> 
> In regular shutdown, nothing of this is called, so maybe we could
> safely delete the call to memory_listener_unregister at
> virtio_device_instance_finalize?

I didn't notice this; if so we'd better remove that call if it's destined to be
a noop after all.

> 
> If not, should I send again the patch with a new commit message?

Maybe attach the full backtrace too along with above?  The assertion itself
could be a very good explanation of what's happened.

Thanks,

-- 
Peter Xu


