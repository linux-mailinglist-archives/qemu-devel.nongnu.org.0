Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FD28C588
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 02:07:06 +0200 (CEST)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS7qL-0000Au-4M
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 20:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kS7pT-000877-Hr
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kS7pR-00029m-MT
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602547568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmfK21gJmyHhcIw56jG23VuuzoOr1Q+PiTuEBPloz40=;
 b=JXnHdnrFAbWOYX5XKURf0vradmU/TV0fPIB5SZKonnmrYyS2dSbU+OV2+vWHKg4T2MSRlR
 Jw3TVC5Y/9JktZgExAakagday+SjDB9bICNhdPeB0bO0ldV22xTY3/ae7tHilnE5MRbudu
 71Bj++0gXt+ESjMqZbh+nK+WXWw4Ues=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-sE76jpfMNimwELR7w1MlRg-1; Mon, 12 Oct 2020 20:06:04 -0400
X-MC-Unique: sE76jpfMNimwELR7w1MlRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2F318829D5;
 Tue, 13 Oct 2020 00:06:02 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D72FC5C22B;
 Tue, 13 Oct 2020 00:05:58 +0000 (UTC)
Subject: Re: [PULL v2 00/30] Block patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20201012182800.157697-1-stefanha@redhat.com>
 <CAFEAcA8Th3Bf8gN1eDcHMKP4FpvSHaxhV6kjYP92vLwbSwL=3A@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <59906b7d-4d89-08cf-d897-fefa6e70ec46@redhat.com>
Date: Mon, 12 Oct 2020 19:05:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Th3Bf8gN1eDcHMKP4FpvSHaxhV6kjYP92vLwbSwL=3A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 20:06:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 4:48 PM, Peter Maydell wrote:

> 
> Build failures, OSX and the BSDs:
> 

I'll let you find and fix those...

> Build failure, Windows:
> 
> ../../qemu-nbd.c:158:5: error: "CONFIG_POSIX" is not defined [-Werror=undef]
>   #if CONFIG_POSIX
>       ^
> 

but this one is easy.  In 22/30 block: move block exports to 
libblockdev, replace '#if CONFIG_POSIX' with '#ifdef CONFIG_POSIX' 
around qemu_system_killed().

> 'make check' failure, s390x and ppc64 (ie big-endian host):
> 
> ERROR:../../tests/qtest/vhost-user-blk-test.c:448:idx: assertion
> failed (capacity == TEST_IMAGE_SIZE / 512): (2199023255552 == 131072)
> ERROR qtest-i386: qos-test - Bail out!
> ERROR:../../tests/qtest/vhost-user-blk-test.c:448:idx: assertion
> failed (capacity == TEST_IMAGE_SIZE / 512): (2199023255552 == 131072)
> 
> I also got this on aarch64 host:
> 
> ERROR:../../tests/qtest/boot-sector.c:161:boot_sector_test: assertion
> failed (signature == SIGNATURE): (0x00000000 == 0x0000dead)
> ERROR qtest-s390x: cdrom-test - Bail out!
> ERROR:../../tests/qtest/boot-sector.c:161:boot_sector_test: assertion
> failed (signature == SIGNATURE): (0x00000000 == 0x0000dead)
> 
> but it might be an unrelated intermittent.
> 
> Also a hang on x86-64 host running qtest-ppc64 qos-test, ditto.
> 
> thanks
> -- PMM
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


