Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AA182FAD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 12:57:41 +0100 (CET)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCMT6-0007eW-CQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 07:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jCMS3-0006Qq-Qd
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jCMS1-000884-6K
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:56:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53609
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jCMS1-00087h-0j
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584014191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9R8sV6T2DnDhlrALNBZBClNdJyksOrkpjdf708Tpk0=;
 b=Jqg6Kt70eC+jSyerd/94lU+n9URapYPSIoz/edKiM3jyubA6MWo9bVEUaRLWDC9tFTbAWD
 MuUpApH2O2HiQlPgLaDsc3FRxeoXZh+GY9pOqJ6OOC8SobO2WeP23Vvye9j8yf4+0IA3Pt
 t5Mmji67fQ++1C4OqiADzYTwWbqscqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-hYSmoupGOPKuef6Ud8Lsqg-1; Thu, 12 Mar 2020 07:56:30 -0400
X-MC-Unique: hYSmoupGOPKuef6Ud8Lsqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335F779F85;
 Thu, 12 Mar 2020 11:56:29 +0000 (UTC)
Received: from [10.3.116.177] (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 920B38D57F;
 Thu, 12 Mar 2020 11:56:28 +0000 (UTC)
Subject: Re: [PATCH v2 00/14] LUKS: encryption slot management using amend
 interface
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20200308151903.25941-1-mlevitsk@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bd526fff-5719-c056-e1cc-722c4e49c82b@redhat.com>
Date: Thu, 12 Mar 2020 06:56:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200308151903.25941-1-mlevitsk@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/20 10:18 AM, Maxim Levitsky wrote:
> Hi!
> Here is the updated series of my patches, incorporating all the feedback I received.
> 

> Patches are strictly divided by topic to 3 groups, and each group depends on former groups.
> 
> * Patches 1,2 implement qcrypto generic amend interface, including definition
>    of structs used in crypto.json and implement this in luks crypto driver
>    Nothing is exposed to the user at this stage
> 
> * Patches 3-9 use the code from patches 1,2 to implement qemu-img amend based encryption slot management
>    for luks and for qcow2, and add a bunch of iotests to cover that.
> 
> * Patches 10-13 add x-blockdev-amend (I'll drop the -x prefix if you like), and wire it
>    to luks and qcow2 driver to implement qmp based encryption slot management also using
>    the code from patches 1,2, and also add a bunch of iotests to cover this.

>   tests/qemu-iotests/284.out       |   6 +-
>   tests/qemu-iotests/300           | 207 ++++++++++++++++

Any reason why you skipped straight to test 300, rather than using an 
available slot like 290?  (Admittedly, our process for reserving slots 
is not very high-tech: manually scan the list for what other patches out 
there have claimed a slot, and be prepared to renumber when rebasing)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


