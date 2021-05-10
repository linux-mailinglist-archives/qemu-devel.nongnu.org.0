Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA8377E99
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:50:36 +0200 (CEST)
Received: from localhost ([::1]:34936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1cZ-00034S-5z
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lg1Z0-0001fv-J3
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:46:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lg1Yy-0006Mr-7g
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620636411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CmNfSepy6orHOk2Hr7XdXesmzQVRWUXkptxljbewMM=;
 b=dMrY0R4oBPM+z12K3mcecTOXkCMR+xNHpdqvo227uvHUpjX5sRRuHjSIHa8TsHxa/Yr2NM
 //krCkQ93HcUYZTBI2MBFMqfHbGgm9zmjhln+XeHd0U/oy+D2Vzmzxa63qcawtMI3g4fdL
 S0Hkz3Z1ass0OxQactafyYyRPfVVYMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-RKg2OwkNO_So6sBozHPPTg-1; Mon, 10 May 2021 04:46:45 -0400
X-MC-Unique: RKg2OwkNO_So6sBozHPPTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F25C501E3;
 Mon, 10 May 2021 08:46:44 +0000 (UTC)
Received: from work-vm (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 898A419C44;
 Mon, 10 May 2021 08:46:39 +0000 (UTC)
Date: Mon, 10 May 2021 09:46:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [question] The source cannot recover, if the destination fails
 in the last round of live migration
Message-ID: <YJjy7AorcAExxXRP@work-vm>
References: <7d87a3b7-86c9-9248-59dc-e1612a00e7c3@huawei.com>
 <YJPpr0z+sV3lQMxZ@work-vm>
 <dd990878-fb0f-5bfc-f390-d6807b158372@huawei.com>
 <YJVVS3K3TW8RwfuS@t490s>
MIME-Version: 1.0
In-Reply-To: <YJVVS3K3TW8RwfuS@t490s>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Fri, May 07, 2021 at 05:46:44PM +0800, Kunkun Jiang wrote:
> > Hi Dave,
> > 
> > On 2021/5/6 21:05, Dr. David Alan Gilbert wrote:
> > > * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> > > > Hi all,
> > > Hi,
> > > 
> > > > Recently I am learning about the part of live migration.
> > > > I have a question about the last round.
> > > > 
> > > > When the pending_size is less than the threshold, it will enter
> > > > the last round and call migration_completion(). It will stop the
> > > > source and sent the remaining dirty pages and devices' status
> > > > information to the destination. The destination will load these
> > > > information and start the VM.
> > > > 
> > > > If there is an error at the destination at this time, it will exit
> > > > directly, and the source will not be able to detect the error
> > > > and recover. Because the source will not call
> > > > migration_detect_error().
> > > > 
> > > > Is my understanding correct?
> > > > Should the source wait the result of the last round of destination ?
> > > Try setting the 'return-path' migration capability on both the source
> > > and destination;  I think it's that option will cause the destination to
> > > send an OK/error at the end and the source to wait for it.
> > Thank you for your reply!
> > The 'return-path' migration capability solved my question. 😁
> > 
> > But why not set it as the default? In my opinion, it is a basic ability
> > of live migration. We need it to judge whether the last round of the
> > destination is successful in the way of 'precopy'.
> 
> I think it should be enabled as long as both sides support it; though may not
> be suitable as default (at least in QEMU) so as to consider old binaries.

Right, we can't break migration from old qemu's (I think libvirt will
use it if available by default).

(Maybe some day we should enable it by default and deprecate turning it
off)

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


