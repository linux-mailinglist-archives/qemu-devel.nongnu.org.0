Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F628161153
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 12:46:42 +0100 (CET)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3erJ-0006i6-4q
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 06:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j3epv-0005zF-0W
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j3epu-00022Z-1A
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36498
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j3ept-00022C-T8
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581939913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xc6rvcZSmKHNjWXrqKKBbnnyg2LWox/mqjGIHrpSDvA=;
 b=cSHKPhX82EPL/ljqT8Qo7IJC65VOzBBJnA0hqeg8sWJRmUpMP3xL2cBXHW9Y3e6VtWJz05
 fd6HOWF1EjJjSxNaIvudJbP6gcIUNCkw3YLGAretfju4U6nmQNsq3zbEpbxyG/h/kiVDK7
 g5mYSf51GNsBnPIKpZo/6PBEa0isYWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-9OtIH-n9Nb-FchiMI0pI1g-1; Mon, 17 Feb 2020 06:45:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F83B8017CC;
 Mon, 17 Feb 2020 11:45:08 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F7F5DA82;
 Mon, 17 Feb 2020 11:45:02 +0000 (UTC)
Subject: Re: [PATCH 2/3] COLO: Migrate dirty pages during the gap of
 checkpointing
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
References: <20200217012049.22988-1-zhang.zhanghailiang@huawei.com>
 <20200217012049.22988-3-zhang.zhanghailiang@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <eb770a48-905a-03cd-860c-dc16f0b77f94@redhat.com>
Date: Mon, 17 Feb 2020 05:45:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217012049.22988-3-zhang.zhanghailiang@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9OtIH-n9Nb-FchiMI0pI1g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: danielcho@qnap.com, chen.zhang@intel.com, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/20 7:20 PM, Hailiang Zhang wrote:
> We can migrate some dirty pages during the gap of checkpointing,
> by this way, we can reduce the amount of ram migrated during checkpointing.
> 
> Signed-off-by: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> ---

> +++ b/qapi/migration.json
> @@ -977,12 +977,14 @@
>   #
>   # @vmstate-loaded: VM's state has been loaded by SVM.
>   #
> +# @migrate-ram-background: Send some dirty pages during the gap of COLO checkpoint
> +#

Missing a '(since 5.0)' marker.

>   # Since: 2.8
>   ##
>   { 'enum': 'COLOMessage',
>     'data': [ 'checkpoint-ready', 'checkpoint-request', 'checkpoint-reply',
>               'vmstate-send', 'vmstate-size', 'vmstate-received',
> -            'vmstate-loaded' ] }
> +            'vmstate-loaded', 'migrate-ram-background' ] }
>   
>   ##
>   # @COLOMode:
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


