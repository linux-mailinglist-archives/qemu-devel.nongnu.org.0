Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605869E4BB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUV2c-0005vQ-3c; Tue, 21 Feb 2023 10:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUV2Z-0005uz-VR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUV2Y-0006d7-4M
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676995128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u21ijLjeelZIuES8MOORs4NB0OopgnuzS0DeoRzVrLQ=;
 b=KH9zT4uhLVbRMhGp8B/xAahYFNLpoRhDd1cZYyrns6BN14RwKLaWeO4cHi8PfoR4z4xgDN
 +xLcEDEEyJIAUh0/7+6sUYKRbXlwIYQxVP6xmTNy8nuTVdVkVcYUJGHCTJXEjPoSGOsZr3
 q/eqsTAATDsLlI5Ac2Qiq23uHDZZ9LA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-F0OwgQCcMza2EhtyZycmWQ-1; Tue, 21 Feb 2023 10:58:47 -0500
X-MC-Unique: F0OwgQCcMza2EhtyZycmWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB721802314;
 Tue, 21 Feb 2023 15:58:46 +0000 (UTC)
Received: from redhat.com (dhcp-192-225.str.redhat.com [10.33.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0900E492B00;
 Tue, 21 Feb 2023 15:58:45 +0000 (UTC)
Date: Tue, 21 Feb 2023 16:58:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Questions about how block devices use snapshots
Message-ID: <Y/TqNIz9EEXaop/Q@redhat.com>
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <12bfc9a0-45e0-21f2-3d50-988ea2ad80c8@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12bfc9a0-45e0-21f2-3d50-988ea2ad80c8@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 21.02.2023 um 14:27 hat Zhiyong Ye geschrieben:
> 
> Hi Kevin,
> 
> Sorry to bother you again.
> 
> I intend to use this approach for snapshots of block devices, which, as you
> say, requires a lot of disk space to store snapshot data. So, to save disk
> space, after each successful external snapshot creation, I want to shrink
> the block device that stores the backing_file image to the size that qcow2
> data actually occupies, since it has become read-only. But there is no way
> to get the actual size of qcow2 when it is stored in a block device.
> 
> Qemu-img info can easily get the actual size of qcow2 when it is stored in a
> file using the fstat function, but this will fail and return 0 for block
> devices. Therefore, it is necessary to implement the method of getting data
> occupancy inside qcow2. I think there may be two possible ways to do this:
> 
> - Add a cluster count field @nb_clusters in the BDRVQcow2State for each new
> cluster allocated and the actual size occupied by qcow2 is: nb_clusters *
> cluster_size.
> - Iterate through the refcount block to find the value with the largest host
> offset, and this is the actual size occupied by qcow2.
> 
> Since I'm not very familiar with qcow2, may I ask if you have any advice on
> getting the actual size when using qcow2?

I think what you need is the 'image-end-offset' field from 'qemu-img
check --output=json'.

Kevin


