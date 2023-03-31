Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3026D1FD1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 14:14:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piDch-0006bS-0s; Fri, 31 Mar 2023 08:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1piDcf-0006bJ-8h
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 08:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1piDcd-0005T3-6i
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 08:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680264765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqgKlMDD+SagKiJmNPxZKBR44c0/A4HJYvLcGSNqvL4=;
 b=aBKqxjdQt76SaNBVLKAg5gb0zyOIuxZuwTWmz10SMXAxTOE6Io2gDw0lzDJXlAoEAwV+Co
 aO1mDhpKmcuNTV854fxZEYJIKefpXd2NReqfodoBr83s0WMiNewiFhFjsGa/8oBL6PTUxh
 aJznf9MTxf/xltzYpGTbtAeJvjcp1Kc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-IDfSH9HHNKCUJ3Fe66uEhw-1; Fri, 31 Mar 2023 08:12:40 -0400
X-MC-Unique: IDfSH9HHNKCUJ3Fe66uEhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A663101A54F;
 Fri, 31 Mar 2023 12:12:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A806492C3E;
 Fri, 31 Mar 2023 12:12:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AF16F18000A3; Fri, 31 Mar 2023 14:12:36 +0200 (CEST)
Date: Fri, 31 Mar 2023 14:12:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: maobibo <maobibo@loongson.cn>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>, 
 Song Gao <gaosong@loongson.cn>,
 =?utf-8?B?5p2o5bCP5aif?= <yangxiaojuan@loongson.cn>, 
 Chao Li <lichao@loongson.cn>
Subject: Re: On integrating LoongArch EDK2 firmware into QEMU build process
Message-ID: <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
> Xuerui,
> 
> Thanks for your mail, it is a good suggestion. Now we are planing to
> move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
> bios supporting LoongArch can be auto compiled and uploaded to qemu
> repo. Only that process is somwhat slow since lacking of hands,
> however we are doing this.

Good, so I think it makes sense for qemu to just wait for that to
happen.

Related question:  What are the requirements to build the firmware?
Fedora 38 ships cross compiler packages ...

  binutils-loongarch64-linux-gnu-2.39-3.fc38.x86_64
  gcc-loongarch64-linux-gnu-12.2.1-5.fc38.x86_64

... but when trying to use them to compile the loongarch firmware gcc
throws errors:

loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-relocs’

I suspect gcc-12 is just too old?

take care,
  Gerd


