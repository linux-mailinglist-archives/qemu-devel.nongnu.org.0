Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04031A579
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:34:29 +0100 (CET)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeCx-0005k6-Qr
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAe4i-0006pN-G5
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAe4f-0006jg-99
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613157950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSholl52219bRi86Qoowf4VGQkFA8d10X7P0pvdSYiA=;
 b=Fy4KGXIuBuZ715Ylxz3PPOluvuCTQFmhoikz2UWsGinrpEeMbs7BRGXQjU7e4MHYpJH3dy
 L1vbCWrQzQtOTUCBrzPGQU4E0mtWk66HfHN/Na98Jvlg/c9+KY402JQWuDw1DcpsykIGIt
 2+qVjrhheLgVB3+oovitHz8Yg0n/qS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-pIdAO07KNv-6r34uFPmHBA-1; Fri, 12 Feb 2021 14:25:48 -0500
X-MC-Unique: pIdAO07KNv-6r34uFPmHBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB071007B07;
 Fri, 12 Feb 2021 19:25:47 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC571B5F6;
 Fri, 12 Feb 2021 19:25:47 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] migration: dirty-bitmap: Allow control of bitmap
 persistence
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1613150869.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <29505b73-c00c-b108-e8b6-3a3235f2c98b@redhat.com>
Date: Fri, 12 Feb 2021 13:25:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1613150869.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 11:34 AM, Peter Krempa wrote:
> See 2/2 for explanation.
> 
> Peter Krempa (3):
>   migration: dirty-bitmap: Convert alias map inner members to
>     BitmapMigrationBitmapAlias
>   migration: dirty-bitmap: Allow control of bitmap persistence
>   qemu-iotests: 300: Add test case for modifying persistence of bitmap
> 

Queuing this through my dirty-bitmap tree

>  migration/block-dirty-bitmap.c | 60 ++++++++++++++++------
>  qapi/migration.json            | 19 ++++++-
>  tests/qemu-iotests/300         | 91 ++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/300.out     |  4 +-
>  4 files changed, 157 insertions(+), 17 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


